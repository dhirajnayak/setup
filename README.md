#Develop With Passion® - .Net Developer BootCamp Setup

##The following setup should take between 30-90 minutes to complete depending on your skill level and familiarity with unix based environments.

##Network Security Considerations

* Make sure that you have access to port 443 for github ssh operations (have your network admins open this up for the week if necessary, to avoid any unecessary complications) 

##Programs That Should Be Installed Prior to following these instructions

###Required
* VS2012/2013 Professional

###Optional
* [ReSharper 8](http://www.jetbrains.com/resharper/download/)

##The main programs you will be installing in this setup are:

* Git
* Ruby
* MingW
* IIS Express 7.5 (following the instructions in this doc)
* Firefox (even if you already have this installed, please uninstall and follow along with the setup outlined in this doc)

#Required Setup

The following is the setup that you WILL need to perform to configure all necessary prerequisites to be able to enjoy the week. If you have any questions, please do not hesitate to contact [me](mailto:jp@developwithpassion.com)

##Make sure that you have configured windows to show all hidden files and folders

##Create the utility folder

1. Open up windows explorer and navigate to your C:\ drive
2. Create a new folder at the root of C:\ called utils (all lowercase). All of the tools we will install for the week will go into here.

##Install Firefox

* Download the latest version of firefox from [here](https://www.mozilla.org/en-US/firefox/all/)
* Run the downloaded installer and configure according to the following screenshots:

![firefox_setup_1](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/firefox_setup_1.png)
![firefox_setup_2](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/firefox_setup_2.png)
![firefox_setup_3](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/firefox_setup_3.png)
![firefox_setup_4](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/firefox_setup_4.png)
![firefox_setup_5](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/firefox_setup_5.png)

##Get setup at [Github](http://github.com)

* [Sign up](https://github.com/signup/free) for a free account at github.com. My recommendation is to use an all lowercase username.

##Install Ruby

* Install [Ruby](http://dl.bintray.com/oneclick/rubyinstaller/rubyinstaller-2.0.0-p481.exe?direct), yes the specific version in this link, not the newest.

* Configure according to the following screenshots:

![ruby_setup_1](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/ruby_setup_1.png)

* Once the install has completed, verify your installation by opening up a command prompt and typing in: ruby -v. You should see:
  * ruby 2.0.0p481 [version and date information]

##Install Git for windows

1. Install the latest version of Git for windows from [here](http://code.google.com/p/msysgit/downloads/detail?name=Git-1.9.0-preview20140217.exe&can=2&q=)

* Configure according to the following screenshots:

![git_setup_part_1](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/git_setup_part_1.png)
![git_setup_part_2](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/git_setup_part_2.png)
![git_setup_part_3](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/git_setup_part_3.png)
![git_setup_part_4](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/git_setup_part_4.png)

##Setup your git ssh authentication key

1. Open up a git bash prompt
2. Enter the following command:

    ```bash
    ssh-keygen -t rsa -C your_email_address  
    ```
   
   Accept the defaults for the remaining prompts  (leave the passphrase blank).  
3. Navigate to the folder where your ssh key was created (by default your profile ssh folder C:\Users\your_user_name\.ssh)
4. Open the file id_rsa.pub and copy the contents to the clipboard.
5. Login to your account at [github](https://github.com/login).
6. Navigate to your [ssh settings](https://github.com/settings/ssh)
7. Click on the Add SSH Key Button
8. Give your key a title and paste the public key that is in your clipboard from step 4 into the Key text entry:

![ssh key entry](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/add_ssh_key.png)

##Create an SSH Configuration Entry for github
1. Open up a git bash prompt
2. Enter the following commands: 

   ```bash
   touch ~/.ssh/config
   notepad ~/.ssh/config
   ```
3. Copy and paste the following into the opened file:

    ```bash
    Host github
      Hostname ssh.github.com
      User git
      Port 443
      IdentityFile ~/.ssh/id_rsa
    ```
    It is important that if you named your keyfile anything other than the default when you created your ssh key, update the IdentityFile line with the path to the name of the keyfile you created.

4. Save the file

##Verify that your git ssh authentication works

1. Open up a git bash prompt
2. Enter the following command:

    ```bash
    ssh -v github
    ```
3. You may be prompted to cache the server identity (type yes)
4. If you have setup your ssh settings correctly the bottom part of the command output should look similar to the following:

![successful authentication](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/git_authentication.png)

##Clone this setup repository

1. Open up a git bash prompt and type the following commands:

```bash
cd /c
mkdir course
cd course
git clone github:philips-august-2014/setup.git [enter]
```

##Install Mingw

Open up a git bash prompt and type the following commands:

```bash
cd /c/course/setup
explorer .
```
Double click the mingw-get-inst-20111118.exe installer and install using the following screenshots:

![mingw_setup_part_1](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/mingw_setup_part_1.png)
![mingw_setup_part_2](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/mingw_setup_part_2.png)
![mingw_setup_part_3](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/mingw_setup_part_3.png)
![mingw_setup_part_4](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/mingw_setup_part_4.png)
![mingw_setup_part_5](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/mingw_setup_part_5.png)

At the completion of the last command you should have a copy of this repository on your local machine.

##Finalize setup

The following steps will ensure that you have your git and mingw environments setup correctly for the class. If you already have existing git/mingw configuration that you use on a regular basis, either make your changes manually to match the recommended settings, or create a backup of your existing configuration and restore it after the class.

Open up a git bash prompt and type in the following commands:

```bash
cd /c/course/setup 
gem uninstall bundler   # Answer yes to any prompts if you are prompted
gem install bundler
bundle install
thor setup
```

Upon running the last command you will be prompted to make changes to a settings file that has been generated based on your username. It should be in the root of this repo folder with the name [ your-logged-in-name-without-spaces-or-path-symbols-all-lowercase ].settings.

Open up your settings file in your favourite text editor and make sure all of the settings are correct. If you have followed along correctly to this point (by using the specified install paths and key generation procedure etc), the only setting you should have to change is the email address. If you deviated from the recommended setup you will have to tweak the settings as needed. Make your change(s) and save the file.

Continue to rerun the following command:

```bash
thor setup
```

This task will do the following:

* Setup a sane ~/.gitconfig that contains the email you provided and your name, along with some other aliases and a setting that is essential for our work during the week.
* Copies some basic bash dotfiles into your home folder, this correctly sets up the ssh agent to use the key you generated/provided earlier.
* Configures the mingw path

##Verify Installs

Open up a git bash prompt and type the following:

```bash
ruby -v
```
You should see a ruby version, if you don't see anything you may need to repeat the steps above as you may have missed a step.

##Fork the project repositories for the week

1. Login to your account at [github](https://github.com/login)
2. Navigate to the following url: http://github.com/philips-august-2014 
3. Click on the prep repository: ![repository](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/github_shawaugp.png)
4. Click on the fork button to create your own copy of this repository <br>![fork](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/github_fork.png)
5. Repeat steps 2-5 for the app repository.

## Checkout your local copies of the code

1. Open up a git bash prompt and type the following commands:
    ```bash
    cd /c/course 
    git clone github:[your github user name]/prep.git
    git clone github:[your github user name]/app.git
    ```
    Assuming your github username is jp the commands would look as follows:

    ```bash
    git clone github:jp/prep.git
    git clone github:jp/app.git
    ```

2. Once you have completed cloning the repositories your course folder should look as follows:

![checked out directory](https://raw.githubusercontent.com/philips-august-2014/setup/master/images/checked_out_directory.png)

##Install IIS Express 7.5

* If you already have a version of IIS Express installed (even if it is >= 7.5) please follow these steps.

Install iis_express following these steps:
  1. Download the installer from [here](http://www.microsoft.com/en-us/download/confirmation.aspx?id=1038)
  2. Run the IIS Express installer. 
  3. Copy (not cut) the folder C:\Program Files (x86)\IIS Express to the clipboard
  4. Paste the copied folder into your C:\utils folder.
  5. Rename the pasted IIS Express folder to iis_express.
  6. Your c:\utils folder should now contain a folder called iis_express.
  7. Rerun the IIS Express installer and remove the installed version of IIS Express. This will just leave your copied, registry-less version on the system.
  
##Install TestDriven .Net

* Download and install the latest student version of [TestDriven.Net](http://testdriven.net/download_release.aspx?LicenceType=Personal)

##Prepare the code bases

* Watch the [following](https://vimeo.com/102464912) to makes sure you are able to hit the ground running at the beginning of the first day!
