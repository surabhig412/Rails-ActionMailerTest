@signup
Feature: User Sign Up

  Scenario: user signs up
  Given a clear email queue
  When I go to the new user registration page
  And I fill in the new user form with email "bob@example.com", password "s3cr3t1234" and password confirmation "s3cr3t1234"
  And I submit the form
  Then "bob@example.com" should receive an email
  And I should be on the dashboard page
  And  I should see the 'dashboard' contents

  Scenario: Receives email with correct contents
  When I go to the new user registration page
  And I fill in the new user form with email "bob@example.com", password "s3cr3t1234" and password confirmation "s3cr3t1234"
  And I submit the form
  When "bob@example.com" opens the email
  Then they should see the email delivered from "surabhig@rssoftware.co.in"
  And they should see "Confirmation instructions" in the email subject
  And they should see "Welcome bob@example.com!" in the email body
  And they should see "Confirm my account" in the email body

  Scenario: Clicks on confirmation link
  When I go to the new user registration page
  And I fill in the new user form with email "bob@example.com", password "s3cr3t1234" and password confirmation "s3cr3t1234"
  And I submit the form
  And "bob@example.com" opens the email
  And I click the first link in the email
  Then I should be on login page
  And I fill in login page with email "bob@example.com" and password "s3cr3t1234"
  And I should be on the dashboard page

  Scenario: Does not click on confirmation link
  Given a clear email queue
  When I go to the new user registration page
  And I fill in the new user form with email "bob@example.com", password "s3cr3t1234" and password confirmation "s3cr3t1234"
  And I submit the form
  And I go to login page
  And I fill in login page with email "bob@example.com" and password "s3cr3t1234"
  Then I should be on login page
