setup:
	@echo "Copying your .plist file to the LaunchAgents folder"
	cp ./com.user.cleanupdockerimages.plist ~/Library/LaunchAgents/
	@echo "Loading the .plist file"
	launchctl load ~/Library/LaunchAgents/com.user.cleanupdockerimages.plist
	@echo "Verifying the .plist file is loaded"
	launchctl list | grep com.user.cleanupdockerimages
	@echo "Setup complete"

clean:
	@echo "Unloading the .plist file"
	launchctl unload ~/Library/LaunchAgents/com.user.cleanupdockerimages.plist
	@echo "Removing the .plist file"
	rm ~/Library/LaunchAgents/com.user.cleanupdockerimages.plist
	@echo "Clean complete"
