# using rally and gitlab in CD

> quite likely your BA and PM love using something like https://rally.yourcompany.com/ or others like jira - the problem is withouth strong naming convention it could be a nightmare to work with from you DEv perspective 

what I think works well is

* go in rally and add a new story (usually under the right feature)

* get a unique USxyz code 

> you can use a template to enforce it

* go on https://git.yourcompany.com/ and create an issue with the same name of the USxyz

> use a **template**

```
> title should be the user story number from Rally. EX: US123445679

* [ ] add rally link [link](https://___)

# Description
> Add check boxes for the steps you are going to take to complete the story

* [ ] Analysis
* [ ] Design
* [ ] Defining tests (we use TDD here ;))
* [ ] Coding

```
* go ahead with the steps and add new issues to split it and use the nice auto link features of gitlab to breakdon and add the dependencies  and @ to tag team mates

* add discussion to eac push and when completed with the `mr` (mrged in develop/master branch) close the rally story as well :)
