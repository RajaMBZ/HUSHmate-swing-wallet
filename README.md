# HUSHmate
## Your best mate for [Hush](https://myhush.org/)

HUSHmate Swing Wallet is a GUI destkop wallet for Hush. This fully compatible sapling release is availalbe for macOS, Windows and Linux. Download the latest release from GitHub releases.

![Screenshot](https://github.com/HUSHmate/HUSHmate-swing-wallet/raw/master/docs/hushmate.png "Main Window")

**This wallet is targeted at advanced users who understand the implications of running a full Hush node on**
**the local machine, maintaining a full local copy of the blockchain, maintaining and backing up the**
**Hush nodes' `wallet.dat` file etc! The wallet is not suitable for novice crypto-currency users!**

**SECURITY WARNING: Encryption of the wallet.dat file is an experimental feature.**
**The wallet.dat needs to be backed up regularly (not just once - e.g. after every 30-40**
**outgoing transactions) and it must also be backed up after creating a new Z address.**


#### Download HUSHmate Swing wallet at https://github.com/HUSHmate/HUSHmate-swing-wallet/releases

## Building, installing and running the HUSHmate Swing Wallet

**For security reasons it is recommended to always build the GUI wallet program from GitHub**
**[source](https://github.com/HUSHmate/HUSHmate-swing-wallet/archive/master.zip).**
The details of how to build it are described below (easy to follow). 


1. Operating system and tools

   This program supports Linux, macOS and Windows.
   The Linux tools you need to build and run the Wallet GUI are Git, Java (JDK8) and
   Ant. If using Ubuntu Linux, they may be installed via command: 
   ```
   user@ubuntu:~/build-dir$ sudo apt-get install git default-jdk ant
   ``` 
   For RedHat/CentOS/Fedora-type Linux systems the command is (like):
   ```
   user@centos:~/build-dir$ sudo yum install java-1.8.0-openjdk git ant 
   ```
   The name of the JDK package (`java-1.8.0-openjdk`) may vary depending on the Linux system, so you need to
   check it, if name `java-1.8.0-openjdk` is not accepted.
   If you have some other Linux distribution, please check your relevant documentation on installing Git, 
   JDK and Ant. The commands `git`, `java`, `javac` and `ant` need to be startable from command line 
   before proceeding with build.

2. Building from source code

   As a start you need to clone the HUSHmate-swing-wallet Git repository:
   ```
   user@ubuntu:~/build-dir$ git clone https://github.com/HUSHmate/HUSHmate-swing-wallet.git
   ```
   Change the current directory:
   ```
   user@ubuntu:~/build-dir$ cd HUSHmate-swing-wallet/
   ```
   Issue the build command:
   ```
   user@ubuntu:~/build-dir/HUSHmate-swing-wallet$ ant -buildfile ./src/build/build.xml
   ```
   This takes a few seconds and when it finishes, it builds a JAR file `./build/jars/HUSHmate.jar`. 
   You need to make this file executable:
   ```
   user@ubuntu:~/build-dir/HUSHmate-swing-wallet$ chmod u+x ./build/jars/HUSHmate.jar
   ```
   At this point the build process is finished the built GUI wallet program is the JAR 
   file `./build/jars/HUSHmate.jar`. In addition the JAR file 
   `bitcoinj-core-0.14.5.jar` is also necessary to run the wallet. 

3. Installing the built HUSHmate Swing Wallet

   3.1. If you have built Hush from source code:

     Assuming you have already built from source code [Hush](https://myhush.org/) in directory `/home/user/komodo/src` (for example) which contains the command line tools `komodo-cli` and `komodod` you need to take the created JAR files and copy them to directory `/home/user/komodo/src` (the same dir. that contains `zcash-cli` and `komodod`). Example copy command:
      ```
      user@ubuntu:~/build-dir/HUSHmate-swing-wallet$ cp -R -v ./build/jars/* /home/user/komodo/src    
      ```

4. Running the installed HUSHmate Swing Wallet

   It may be run from command line or started from another GUI tool (e.g. file manager). 
   Assuming you have already installed [Hush](https://myhush.org/) and the GUI Wallet `HUSHmate.jar` in 
   directory `/home/user/komodo/src` one way to run it from command line is:
   ```
   user@ubuntu:~/build-dir/HUSHmate-swing-wallet$ java -jar /home/user/zcash/src/HUSHmate.jar
   ```
   If you are using Ubuntu (or similar ;) Linux you may instead just use the file manager and 
   right-click on the `HUSHmate.jar` file and choose the option "Open with OpenJDK 8 Runtime". 
   This will start the Zcash GUI wallet.
   
   **Important:** the Hush configuration file `~/.komodo/HUSH3/HUSH3.conf` needs to be correctly set up for the GUI
   wallet to work. Specifically the RPC user and password need to be set in it like:
   ```
   rpcuser=username
   rpcpassword=wjQOHVDQFLwztWp1Ehs09q7gdjHAXjd4E
    
   ``` 

### Creating packages with Eclipse for Windows and macOS
Inno Setup is required for windows.
Create build folder and copy the content of EclipseExample into it and rename windowsExample.xml to build.xml 
Create a dist folder in this build folder and copy the whole folder resources from src folder into it.
Additionally in this build folder create a dist folder and copy your komodod.exe, komodo-cli.exe into it if on windows. 
If on macOS copy your komodod and komodo-cli and check their permisson is 755. on macOS a change in build.xml are needed from .exe to .dmg.

### License
This program is distributed under an [MIT License](https://github.com/HUSHmate/HUSHmate-swing-wallet/raw/master/LICENSE).

### Disclaimer

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

### Known issues and limitations

1. Issue: HUSHmate Swing Wallet is not compatible with applications that modify the HUSH3 `wallet.dat` file. The wallet should not be used
with such applications on the same PC. For instance some distributed exchange applications are known to create watch-only addresses in the
`wallet.dat` file that cause the GUI wallet to display a wrong balance and/or display addresses that do not belong to the wallet. 
1. Limitation: if two users exchange text messages via the messaging UI TAB and one of them has a system clock, substantially running slow or fast by more than 1 minute, it is possible that this user will see text messages appearing out of order. 
1. Limitation: if a messaging identity has been created (happens on first click on the messaging UI tab), then replacing the `wallet.dat` or changing the node configuration between mainnet and testnet will make the identity invalid. This will result in a wallet update error. To remove the error the directory `~/.HUSHmate/messaging` may be manually renamed or deleted (when the wallet is stopped). **CAUTION: all messaging history will be lost in this case!**
1. Limitation: The list of transactions may not show all outgoing ones (specifically outgoing Z address 
transactions). A corresponding issue [#1438](https://github.com/zcash/zcash/issues/1438) has been opened 
for the Zcash developers. 
1. Limitation: The CPU percentage shown to be taken by komodod on Linux is the average for the entire lifetime 
of the process. This is not very useful. This will be improved in future versions.
1. Limitation: When using a natively compiled wallet version (e.g. `HUSHmate.exe` for Windows) on a 
very high resolution monitor with a specifically configured DPI scaling (enlargement) factor to make GUI 
elements look larger, the GUI elements of the wallet actually do not scale as expected. To correct this on
Windows you need to right-click on `HUSHmate.exe` and choose option:
```
Properties >> Compatibility >> Override High DPI scaling behavior >> Scaling Performed by (Application)
```
