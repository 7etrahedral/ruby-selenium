@login @desktop
Feature: Login to Twitter
  As a user, I want to login

  Background:
  Given user has registered

  Scenario: User login to Twitter
    When user is in home page
      And user clicks login button
    Then user will see log in text "Log in to Twitter"
    # When user has registered
    # And user logins to Twiter
    # Then user will see account name "wibowo bullseye"
