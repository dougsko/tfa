Feature: Sign in
	In order to get access to protected sections of the site
	A user
	Should be able to sign in

	Scenario: User is not signed up
		Given I do not exist as a user
		When I sign in with valid credentials
		Then I see an invalid login message
		And I should be signed out

	Scenario: User signs in successfully
		Given I exist as a user
		And I am not logged in
		When I sign in with valid credentials
		Then I go to the OTP page
		When I enter a valid OTP
		Then I should be signed in

	Scenario: Admin signs in successfully
		Given I exist as an admin
		And I am not logged in
		When I sign in with valid credentials
		Then I go to the OTP page
		When I enter a valid OTP
		Then I should be signed in
		And I should see the admin menu
		And I should have the admin role

	Scenario: User enters wrong email
		Given I exist as a user
		And I am not logged in
		When I sign in with a wrong email
		Then I see an invalid login message
		And I should be signed out

	Scenario: User enters wrong password
		Given I exist as a user
		And I am not logged in
		When I sign in with a wrong password
		Then I see an invalid login message
		And I should be signed out


	Scenario: User enters wrong OTP
		Given I exist as a user
		And I am not logged in
		When I sign in with valid credentials
		Then I go to the OTP page
		When I enter an invalid OTP
		Then I should see an OTP error message

