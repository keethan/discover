require 'calabash-android/operations'
include Calabash::Android::Operations
Given /^that I have a device with the Discover Client installed on it$/ do
#TODO: Implement this
	#check if device is connected
end


And /^that the client has not yet been activated$/ do
	system 'adb -s ' + ENV['ADB_DEVICE_ARG'] + ' shell pm clear com.vodafone.smhs'
	performAction('wait', 3)
end


And /^that the client has been activated$/ do
#TODO: Implement this
end


And /^that I have a working 3g connection that is not roaming$/ do
#TODO: Implement this
end

And /^that I have a working 3g connection$/ do
#TODO: Implement this
end




And /^the Discover Widget has been added to the homescreen$/ do
	performAction('wait', 1)
	
	#This will press 'back' button on the device - Press back button twice to get rid of the Change Log and Introduction screens
	performAction('wait_for_view_by_id', 'org.adw.launcher:id/adw_changelog_pager')
	system 'adb -s ' + ENV['ADB_DEVICE_ARG'] + ' shell input keyevent 4'
	performAction('wait', 2)
	performAction('wait_for_view_by_id', 'org.adw.launcher:id/adw_helper_pager')
	system 'adb -s ' + ENV['ADB_DEVICE_ARG'] + ' shell input keyevent 4'
	performAction('wait', 2)

	#screenshot_embed # Adw Launcher default home screeen


	#Go to next screen - assuming that the next screen has enough space for adding Discover widget
	#performAction('swipe', 'right') -- Sometimes this fails, too short for some of the devices
	performAction('drag', 90, 10, 50, 50, 10) # This is equivalent to swipe right. The numbers are in percent. (fromX, toX, fromY, toY, steps).
	performAction('wait', 2)
	#screenshot_embed # Adw Launcher blank home screeen
	performAction('press_menu')
	performAction('press_descendent_view', 'adw_config_indicator', 'Add')
	#screenshot_embed
	performAction('press_descendent_view', 'adw_config_pager', 'Widgets')

	performAction('wait', 2) # It takes a while to load widgets list on 4.1.1
	#screenshot_embed
	system 'monkeyrunner WidgetPickList.py  Discover ' + ENV['ADB_DEVICE_ARG']
	
	versionCommand = 'adb -s ' + ENV['ADB_DEVICE_ARG'] + ' shell getprop ro.build.version.release'
	androidVersion = `#{versionCommand}`.chomp
	if androidVersion.start_with? "4.1" then
		performAction('wait_for_view_by_id', 'appwidgetpicker_textview')
		#screenshot_embed # Widget size selection
		performAction('click_on_view_by_id', 'appwidgetpicker_textview')
	end
	sleep 4
	#screenshot_embed # discover widget added
end


When /^I click on the Discover Widget$/ do
	touch("ImageView id:'changelog_screen_width_phone'")

	performAction('wait', 2)

#TODO: This will press 'back' button on the device - Temp arrangment for getting rid of wifi related popup
	#system 'adb -s ' + ENV['ADB_DEVICE_ARG'] + ' shell input keyevent 4'
	#performAction('wait', 2)

	#wait for refresh to finish
	performAction('wait', 5)

#TODO: Check for network errors
#performAction('wait_for_text', 'Network problem')
#performAction('click_on_text', 'Ok')
	
	#screenshot_embed


#TODO: Verify that automatic refresh has happened


	#This will press 'back' button on the device - Takes us back to the screen where discover widget was added
	system 'adb -s ' + ENV['ADB_DEVICE_ARG'] + ' shell input keyevent 4'

	#screenshot_embed # back to discover widget

	#Remove the discover widget from screen
	#performAction('long_press_on_view_by_id', 'changelog_screen_width_phone')
#performAction('click_on_text', 'Tap on the refresh button to update your services')
#performAction('wait', 2)
	#performAction('press_long_on_text_and_select_with_index', 'Anleitung', 1)
	performAction('long_press_on_view_by_id', 'org.adw.launcher:dimen/changelog_screen_width_phone')
	performAction('click_on_text', 'Remove')
	performAction('wait', 2)
	#screenshot_embed
end

When /^I select the refresh button on the Discover Widget$/ do
	performAction('click_on_view_by_id', 'org.adw.launcher:dimen/changelog_screen_height_tablet_port')
	performAction('wait', 2)
end


Then /^the Discover Widget will complete a manual refresh$/ do
#TODO: Implement this
	
	#performAction('swipe', 'left')
	performAction('drag', 10, 90, 50, 50, 10)
	performAction('wait', 2)
	#screenshot_embed
end


Then /^the discover widget automatically refreshes and downloads all of the available content for that device, opco, updates version.$/ do
#TODO: Implement this
	
	#performAction('swipe', 'left')
	performAction('drag', 10, 90, 50, 50, 10)
	performAction('wait', 2)
	#screenshot_embed
end

