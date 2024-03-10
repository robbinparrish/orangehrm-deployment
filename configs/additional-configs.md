## Additional configuration to perform after deploying the OrangeHRM server.

```Please note that followings configuration may not be accurate for every deployments. These settings allowed Admin to make sure the OrangeHRM server is configured with necessary additional configuration.```

Accessing the webui from http://IPADDR_OF_SYSTEM will leads to the installer wizard.

## Installer Setup Wizard.
- `Select` Fresh Installation.
- License Acceptance.
	- `Select` I accept the terms in the License Agreement.
- Database Configuration.
	- `Select` Existing Empty Database.
		- Database Host Name - `mariadb`
		- Database Name - `orangehrmdb`
		- OrangeHRM Database Username - `orangehrm`
		- OrangeHRM Database User Password - `YOUR_ORANGEHRM_DB_PASSWORD`
- System Check.
	- Make sure everything shows `green` and there are no error reported.
- Instance Creation.
	- `Add` organization details.
-  Admin User Creation.
	- `Add` Admin user account details.
	- `Uncheck` Register your system with OrangeHRM.
- Confirmation.
	- Review details.
- Installation.
	- Setup wizard will apply the configuration provided above. Make sure all shows `green`.
- Installation Complete.
	- Launch OrangeHRM to access the webui.
	- Accessing the webui first time will ask for password reset.

## Navigate to the `Admin Setting Panel` for modifying system-wide settings.

### Admin Settings.
- Corporate Branding.
	- Change the Theme color and Logo according to the needs.
	- `Disable` Social Media Images.
- Configuration.
	- Email Configuration.
		- Mail Sent As `Add` Email address of SMTP User.
		- `Select` Sending Method `SMTP`.
		- `Add` SMTP Host.
		- `Add` SMTP Port.
		- Use SMTP Authentication `Select` `Yes`.
		- SMTP User `Add` Email address of SMTP User.
		- `Enable` TLS.

		NOTE - validate with `Send Test Mail` to see if this configs works or not.
	- Email Subscriptions.
		- `Enable` for followings.
			- Leave Applications.
			- Leave Approvals.
			- Leave Assignments.
			- Leave Cancellations.
			- Leave Rejections.
