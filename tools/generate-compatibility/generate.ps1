#
# generates compatibility-status.md markdown page
#

param (
)

function progress {
  param ([string]$title, [array]$php , [array]$DLI)

  if (!$php) { return }

  $DLI_matched = @()
  $rows = @() #table rows

  foreach ($element in $php) {
    $matched = $false
    if ($element -match "([^\(]*)\((.*)\)") {
      # function, has parameter list
      $element_name = $Matches.1
      $element_params = $Matches.2
      foreach ($x in $DLI) {
        if ($x -match "([^\(]*)\((.*)\)" -and $element_name -eq $Matches.1) {
          $matched = $true
          $DLI_matched += $x
          $x_params = $Matches.2
          if ($element_params -eq $x_params) {
            # $rows += "$($element) | $($x)"
          }
          else {
            # $rows += "$($element_name)(<span style='color:green;'>$($element_params)</span>) | $($element_name)(<span style='font-weight:bold;text-decoration:underline;'>$($x_params)</span>)"
          }
          break
        }
      }
    }
    else {
      if ($DLI -contains $element) {
        $matched = $true
        $DLI_matched += $element
        # $rows += "$($element) | $($element)"
      }
    }
    if (-not $matched) {
      if ($element -match "\w+\s+(\w+)::" -and -not $DLI_matched.contains("class $($Matches.1)")) {
        continue; # containing class was already reported, do not report its members
      }

      $rows += "$($element) | - <span style='color:red;font-weight:bold;'>$($element)</span>"
    }
  }

  foreach ($element in $DLI) {
    if (-not $DLI_matched.contains($element)) {
      $rows += " | + <span style='color:red;font-weight:bold;'>$($element)</span>"
    }
  }

  # render progress
  $progress = $DLI_matched.count
  "??? tiny ""[=$( [int](100 * $progress / $php.count) )% ""**$title** $progress / $($php.count)""]"""

  # ""
  # "# **$title**"
  # ""
  
  if ($rows.count -ne 0) {
    "    | PHP | DLI |"
    "    | --- | ---      |"
  }

  foreach ($row in $rows) {
    "    | $row |"
  }
}

# do not show dotnet welcome text:
[System.Environment]::SetEnvironmentVariable('DOTNET_SKIP_FIRST_TIME_EXPERIENCE', '1')

# run collect features from php & DLI:
$output_php = & invoke-Expression "php -f ""$PSScriptRoot/program.php""" | Out-String
$output_DLI = & invoke-Expression "dotnet run --no-logo -p ""$PSScriptRoot""" | Out-String

$php = $output_php | ConvertFrom-Json
$DLI = $output_DLI | ConvertFrom-Json

# prolog
"!!! tip ""DLI $($DLI.version) vs. PHP $($php.version)"""
"    The table lists PHP extensions that the project aims for"
"    and compares the public functions, classes, and constants."

# ""
# "### Extensions"
# ""
# # extensions
# progress "extensions" $php.extensions $DLI.extensions

# ""
# "### Classes & Functions"
# ""

# $DLI_all = @()
# foreach ($ext in $DLI.extensions) {
#   $DLI_all = $DLI_all + $DLI."ext-$ext"
# }

foreach ($ext in $php.extensions) {
  #if ($php."ext-$ext")
  progress $ext $php."ext-$ext" $DLI."ext-$ext"
}

# TODO: overall
