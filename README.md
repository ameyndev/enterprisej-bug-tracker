# enterprisej-bug-tracker
A simple Bug Tracker made by using Enterprise Java Technologies.

**'enterprisej-bug-tracker'** is a simple bug tracker where multiplr users can login and report & resolve bugs. The primary users of this is solution are Software Developers.
Software Developers report and keep track of the bugs that they encounter in their projects using this bug tracking system.

` **This project was used for it's own development**, which means that this Bug Tracker was used to keep track of it's own bugs during development. `

All the reported and resolved bugs are tracked along with the reporters and resolvers (ie. the users) into a database which uses SQL (Apache Derby for this project). The web pages are simple and are designed using HTML and CSS.

## Features of 'enterprisej-bug-tracker'
* It is fast.
* Can create new users as per requirement.
* Is very simple and has easy to understand UI.

## Login & Registration Pages
Simple login page to log in to a users account and register page to create a register new user into the database.
<img src="/images/login-page-track.png" width="720px">
<img src="/images/register-new-user.png" width="720px">

## User Dashboard
A simple dashboard to display **unresolved** and **resolved** bugs in a tabular format (sequentially). It consists of navigation to pages where you can __report__ new bug reports and __resolve__ existing bug reports.
<img src="/images/new-dashboard.png" width="720px">

## Create Bug Report Page
This page is used to create a Bug report by simply mentioning a small title and then giving a brief description of the bug. Newly reported bugs are tagged as **unresolved** by default.

<img src="/images/bug-report-page.png" width="720px">

## Resolve Bug Report Page
On this page, all the __unresolved__ bugs will show up in a list and users can check the boxes of the required Bug Reports and submit them to be resolved by clicking the button. The **resolved** bugs will be seperated from **unresolved** bugs.
<img src="/images/resolve-bugs-page.png" width="720px">

---
