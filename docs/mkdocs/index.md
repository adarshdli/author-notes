# Install 

## Clone the repository
TBD

## Install
``` python 
python -m pip install --upgrade pip
pip install pymdown-extensions
pip install mkdocs
pip install mkdocs-awesome-pages-plugin
pip install mkdocs-material==5.0.1
```

## Serve command
``` python 
mkdocs serve
```

## Build command
``` python 
mkdocs build --clean
```
## Publish to Github
``` python 
mkdocs gh-deploy --force
```

## Datatables

``` py title="scripts/site.js"
$(document).ready( function () {
    $('#myTable').DataTable();
} );
```

``` py title="mkdocs.yml"
extra_css:
  - https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css

extra_javascript:
  - https://code.jquery.com/jquery-3.6.0.slim.min.js
  - https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js
  - scripts/site.js
```

``` py title="Markdown"
<table id="myTable" class="display" style="width:100%">
  <thead><tr><th>Name</th><th>Offices</th></tr></thead>
  <tbody>
    <tr><td>Tiger Nixon</td><td>Edinburgh</td></tr>
    <tr><td>Garrett Winters</td><td>Tokyo</td></tr>
    <tr><td>Ashton Cox</td><td>San Francisco</td></tr>
    <tr><td>Cedric Kelly</td><td>Edinburgh</td></tr>
    <tr><td>Airi Satou</td><td>Tokyo</td></tr>
  </tbody>
</table>
```


``` py title="bubble_sort.py"
def bubble_sort(items):
    for i in range(len(items)):
        for j in range(len(items) - 1 - i):
            if items[j] > items[j + 1]:
                items[j], items[j + 1] = items[j + 1], items[j]
```


