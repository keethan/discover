Feature:  Manual refresh on 3G on a device

	Scenario: Manual refresh on 3G on a device
		Given that I have a device with the Discover Client installed on it 
		And that the client has been activated 
		And that I have a working 3g connection 
		And the Discover Widget has been added to the homescreen
		Then I take a screenshot

		When I select the refresh button on the Discover Widget
		Then the Discover Widget will complete a manual refresh
		Then I take a screenshot
