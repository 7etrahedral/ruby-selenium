@logout @desktop
Feature: Logout from Twitter
  As a user, I want to logout from Twitter

  Background:
    Given user is in login page
    When user clicks login button
    And user has registered
    And user logins to Twiter

  Scenario: User logout from twitter
    Given user is in home screen and see "wibowo bullseye"
    When user clicks on account icon
    And user clicks on logout button
    Then user will be logged out and see "Download the app"
