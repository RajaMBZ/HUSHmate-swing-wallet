;This file will be executed next to the application bundle image
;I.e. current directory will contain folder HUSHmate with application files
[Setup]
AppId={{fxApplication}}
AppName=HUSHmate
AppVersion=1.0.0
AppVerName=HUSHmate 1.0.0
AppPublisher=MyHush
AppComments=HUSHmate
AppCopyright=Copyright (C) 2019
;AppPublisherURL=http://java.com/
;AppSupportURL=http://java.com/
;AppUpdatesURL=http://java.com/
DefaultDirName={pf}\HUSHmate
DisableStartupPrompt=Yes
DisableDirPage=No
DisableProgramGroupPage=Yes
DisableReadyPage=No
DisableFinishedPage=No
DisableWelcomePage=Yes
DefaultGroupName=MyHush
;Optional License
LicenseFile=
;WinXP or above
MinVersion=0,5.1 
OutputBaseFilename=HUSHmate-1.0.0
Compression=lzma
SolidCompression=yes
PrivilegesRequired=poweruser
SetupIconFile=HUSHmate\HUSHmate.ico
UninstallDisplayIcon={app}\HUSHmate.ico
UninstallDisplayName=HUSHmate
WizardImageStretch=No
WizardSmallImageFile=HUSHmate.bmp   
ArchitecturesInstallIn64BitMode=x64
VersionInfoVersion=1.0.0


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "HUSHmate\HUSHmate.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "HUSHmate\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\HUSHmate"; Filename: "{app}\HUSHmate.exe"; IconFilename: "{app}\HUSHmate.ico"; Check: returnTrue()
Name: "{commondesktop}\HUSHmate"; Filename: "{app}\HUSHmate.exe";  IconFilename: "{app}\HUSHmate.ico"; Check: returnFalse()


[Run]
Filename: "{app}\HUSHmate.exe"; Parameters: "-Xappcds:generatecache"; Check: returnFalse()
Filename: "{app}\HUSHmate.exe"; Description: "{cm:LaunchProgram,HUSHmate}"; Flags: nowait postinstall skipifsilent; Check: returnTrue()
Filename: "{app}\HUSHmate.exe"; Parameters: "-install -svcName ""HUSHmate"" -svcDesc ""HUSHmate"" -mainExe ""HUSHmate.exe""  "; Check: returnFalse()

[UninstallRun]
Filename: "{app}\HUSHmate.exe "; Parameters: "-uninstall -svcName HUSHmate -stopOnUninstall"; Check: returnFalse()

[Code]
function returnTrue(): Boolean;
begin
  Result := True;
end;

function returnFalse(): Boolean;
begin
  Result := False;
end;

function InitializeSetup(): Boolean;
begin
// Possible future improvements:
//   if version less or same => just launch app
//   if upgrade => check if same app is running and wait for it to exit
//   Add pack200/unpack200 support? 
  Result := True;
end;  
