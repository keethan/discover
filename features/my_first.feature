Feature: Out of the box experience

  Scenario: Out of the box experience
	Given that I have a device with the Discover Client installed on it 
	And that the client has not yet been activated 
	And that I have a working 3g connection that is not roaming
	And the Discover Widget has been added to the homescreen

	When I click on the Discover Widget 
	Then the discover widget automatically refreshes and downloads all of the available content for that device, opco, updates version.
