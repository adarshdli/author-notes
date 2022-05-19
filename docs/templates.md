# Templates 


## Plant UML/ UML Diagrams

**Example**: The folowing Plant UML text generates the diagram that follows.

``` sql title="diagram.puml"
@startuml
!include https://raw.githubusercontent.com/plantuml-stdlib/C4-PlantUML/master/C4_Container.puml

Person(user, "Employee", "Want to perform .....")
Person(admin, "Manager", "People that manages employee submission in PMM-ESS")
Container(ESS, "ESS", "PMM", "The main interface that the employee interacts with via ESS")
Container(ESSAdmin, "Manager", "Approval Workflow", "The Manager interface that the manager interacts with via PMM")
Container(api, "API", "ess-api", "Handles all business logic (incl. PMM extensions))
ContainerDb(db, "Database", "Microsoft SQL", "Holds product, order and invoice information")
Container(final, "Final rating", "Process ends", " ", $tags="backup")

Rel(user, ESS, "Uses", "pmm")
Rel(ESS, api, "Sends", "self appraisal")
Rel_R(api, db, "Reads/Writes")
Rel(admin, ESSAdmin, "Uses", "approval-workflow")
Rel(ESSAdmin, api, "Uses", "approval-workflow")
Rel_L(api, final, "Sends", "rating", $tags="backup")

SHOW_LEGEND()
@enduml
```

![c4](diagrams/out/c4.svg#darkable)


## User stories

A user story makes the project and development goals clear, and easier for everyone to understand, implement, and test.

<!-- ---

Quick links: [Summary](#summary) | [Description](#description) | [Template](#template) | [Example](#example) | [Resources](#resources)

--- -->

<!-- ### Summary

A user story should typically have a summary structured this way:

1. **As a** [user concerned by the story]
1. **I want** [goal of the story]
1. **so that** [reason for the story]

The “so that” part is optional if more details are provided in the description.

This can then become “As a user managing my properties, I want notifications when adding or removing images.”

You can read about some reasons for this structure in this [nicely put article][1].

### Description

We’re using the following template to create user stories. 

Since we have mentioned the type of user, the user story can refer to it with “I”.
This is useful for **consistency** and to **avoid repetition** in the Acceptance criteria.
It’s also good to practice a little **empathy**.
 -->

**Example**:

``` sql
1. I click on the “Create new” button.
2. An instance form appears.
3. The instance form contains the following:
  1. [Personal info]
  2. [Dependants]
  2. [SSN details]
```

### Template (To be developed)

``` sql
[
The user story should have a reason to exist: what do I need as the user described in the summary?
This part details any detail that could not be passed by the summary.
]

-### Acceptance Criteria

1. [If I do A.]
1. [B should happen.]

[
Also, here are a few points that need to be addressed:

1. Constraint 1;
1. Constraint 2;
1. Constraint 3.
]

-### Resources:

* Mockups: [Here goes a URL to or the name of the mockup(s) in inVision];
* Testing URL: [Here goes a URL to the testing branch or IP];
* Staging URL: [Here goes a URL to the feature on staging];


-### Notes

[Some complementary notes if necessary:]

* > Here goes a quote from an email
* Here goes whatever useful information can exist…
```

### Example

``` sql
**As a** a member of [the development team](http://scrumguides.org/scrum-guide.html#team-dev),
**I want** clear context and goals **so that** I can work efficiently.

Scattering information in emails and other places makes it difficult to work collaboratively,
so I need all the relevant information within the relevant issue.


### Acceptance Criteria

1. I have clear Acceptance criteria [what a beautiful recursion].
1. I have to understand the logic of the mockups, more than the pixels used, so that we can optimize the code.

Please also note:

1. If a conversation about the issue I’m working on is happening,
the outcomes should be documented within that issue (not in the comments).


### Resources:
* [“Advantages of the “As a user, I want” user story template.”](http://www.mountaingoatsoftware.com/blog/advantages-of-the-as-a-user-i-want-user-story-template)
* [Scrum guide](http://scrumguides.org/scrum-guide.html)
```

## Issue reporting and feature template

``` sql title="Isssue-template.md"
1. Current behaviour
    ..what happens now    

2. Expected behaviour
   ..what you'd expect to happen.

3. Configuration/ System information
    Provide configuration and system specifics if applicable.

4. Versions
    ..list specific versions.

5. Steps to reproduce
    ..steps to reproduce the bug.
```

**Example**:
``` sql
**Current behaviour**
The *Manage User* page doesn't show the following fields/ buttons on page load. To view these fields, I have to scroll the page towards right after the page loads. 
* Confirm deletion
* Delete

**Expected behaviour**
The *Manage User* page has to show all available fields upon loading. I dont have to scroll the page to get the full view even at higher resolution (meaning responsive). 

**Configuration/ System information**
1. Database: `mycustomer` database.
2. Browser: % browser
3. Desktop resolution: Higher than 1080px

**Versions**
All major releases, Tested on v.Nos: SS102_2021_03, SS102_2021_03A, SS102_2021_04.

**Steps to reproduce**
1. Open the application in `% browser`.
2. Select *Admiistration >> Manage User*
```
