; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SmartPropoPlus"
#define MyAppVersion "3.3.10"
#define MyAppURL "http://www.smartpropoplus.com/"
#define MyAppExeName "SppConsole.exe"
#define AppUtilsName  "SmartPropoPlus Utilities"

#define vJoyBaseDir "C:\WinDDK\vjoy1" ; You will have to change it!!!
#define vJoyInstx86 "install\objfre_wxp_x86\i386"
#define vJoyInstx64 "install\objfre_wlh_amd64\amd64"


[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={{2E84A5A4-351E-4B00-9926-F50DBD7481E9}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=true
OutputDir=C:\Users\Shaul\Desktop
OutputBaseFilename=setup
;SetupIconFile=..\inno\Setup.ico
Compression=zip/7
SolidCompression=true
ShowLanguageDialog=no
DisableWelcomePage=true
FlatComponentsList=false
MinVersion=,5.1.2600sp1
UserInfoPage=false
SourceDir=..
OnlyBelowVersion=0,0
UninstallLogMode=append
VersionInfoVersion=3.3.10.1
VersionInfoCompany=Shaul Eizikovich
AppCopyright=Copyright (c) 2005-2011 by Shaul Eizikovich
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyMemo=yes
;UninstallFilesDir={code:GetAppFolder}

[Tasks]
;Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
;Name: "quicklaunchicon"; Description: "{cm:CreateQuickLaunchIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked; OnlyBelowVersion: 0,6.1

[Files]
; Files needed to run SPP
Source: ..\SppConsole\Release\SppConsole.exe; DestDir: {code:GetAppFolder}; Flags: recursesubdirs promptifolder createallsubdirs; BeforeInstall: OldSpp; 
Source: ..\ReleaseNotes.pdf; DestDir: {app}; Flags:  promptifolder
Source: ..\..\msvcr71.dll; DestDir: {code:GetAppFolder}; Flags:  promptifolder ;
Source: ..\..\MFC71.dll; DestDir: {code:GetAppFolder}; Flags:  promptifolder ;
Source: ..\..\filters\JsChPostProc\Release\JsChPostProc.dll; DestDir: {code:GetAppFolder}; Flags:  promptifolder ;
Source: ..\winmm\Release\winmm.dll; DestDir: {code:GetAppFolder}; Flags:  promptifolder ;  Components:  FMS
Source: ..\..\AudioStudy\Release\AudioStudy.exe; DestDir: {code:GetAppFolder}; Flags:  promptifolder ; Components:  Generic
Source: ..\winmm\Release_PPJoy\PPJoyEx.dll; DestDir: {code:GetAppFolder}; Flags:  promptifolder ; Components:  Generic

; Utilities
Source: Utilities\*; DestDir: {app}\Utilities; Flags:  promptifolder ; 
Source: .\UnInstaller.ico; DestDir: {app}; Attribs: Hidden; 

; vJoy Installer
Source: {#vJoyBaseDir}\{#vJoyInstx86}\*; DestDir: {app}\vJoy; Flags:  promptifolder ; Components:  Generic/vJoy ; Check: IsOtherArch
Source: {#vJoyBaseDir}\{#vJoyInstx64}\*; DestDir: {app}\vJoy; Flags:  promptifolder ; Components:  Generic/vJoy ; Check: IsX64


[Icons]
; System menu
Name: "{group}\{#MyAppName}"; Filename: "{code:GetAppFolder}\{#MyAppExeName}" ; WorkingDir: "{code:GetAppFolder}" ; Components:  Generic
Name: "{group}\FMS"; Filename: "{code:GetAppFolder}\FMS.exe" ; WorkingDir: "{code:GetAppFolder}" ; Components:  FMS
Name: "{group}\ReleaseNotes.pdf"; Filename: "{app}\ReleaseNotes.pdf" ; WorkingDir: "{code:GetAppFolder}"
Name: "{group}\SmartPropoPlus Web Site"; Filename: "http://www.SmartPropoPlus.com" ; WorkingDir: "{code:GetAppFolder}"
Name: "{group}\Uninstall SmartPropoPlus"; Filename: {uninstallexe}; IconFilename: {app}\UnInstaller.ico; 
Name: {group}\{#AppUtilsName}\AudPPMV; Filename: {app}\Utilities\AudPPMV.exe; WorkingDir: {code:GetAppFolder}\Utilities; 
Name: {group}\{#AppUtilsName}\RCAudio (PPM Thermometer); Filename: {app}\Utilities\RCAudio.exe; WorkingDir: {code:GetAppFolder}\Utilities; 
Name: {group}\{#AppUtilsName}\Winscope; Filename: {app}\Utilities\WINSCOPE.exe; WorkingDir: {code:GetAppFolder}\Utilities; 

; Desktop
Name: "{commondesktop}\{#MyAppName}"; Filename: "{code:GetAppFolder}\{#MyAppExeName}" ; WorkingDir: "{code:GetAppFolder}" ; Components:  Generic
;Name: "{userappdata}\Microsoft\Internet Explorer\Quick Launch\{#MyAppName}"; Filename: "{code:GetAppFolder}\{#MyAppExeName}"
;Name: ..\; Filename: ..\..\SppConsole\res\SppConsole.ico; IconFilename: {code:GetAppFolder}\SppConsole.exe;  

[Run]
; Install vJoy (if requested)
Filename: {app}\vJoy\vJoyInstall.exe; Components: Generic/vJoy; Flags: waituntilterminated runhidden; StatusMsg: "Installing vJoy device (May take up to 5 minutes)"; 
; Generic: Run SppConsole after installation
Filename: "{code:GetAppFolder}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall ; Components: Generic
; FMS: Run Simulator
Filename: "{code:GetFmsFolder}\FMS.exe"; Description: "{cm:LaunchProgram,{#StringChange('FMS', "&", "&&")}}";  Components: FMS; Flags: nowait postinstall 


[Types]
;Name: "full"; Description: "Full installation"
;Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom


[Components]
;Name: SmartPropoPlus; Description: "Top App"; Flags: dontinheritcheck; MinVersion: 0,5.1.2600; Languages: english hebrew; 
Name: FMS; Description: "SmartPropoPlus For Fms"; Flags: exclusive checkablealone; Check: isFmsInstalled; Types: custom; 
Name: Generic; Description: "Generic SmartPropoPlus"; Flags: exclusive; 
Name: Generic/vJoy; Description: vJoy; Check: isFmsInstalled; Flags: checkablealone;
Name: Generic/vJoy; Description: vJoy; Check:  ( not isFmsInstalled) ; Flags: checkablealone; Types: custom; 

[code]
var
FolderApp: String;

// Returns FMS folder if exists
// Else return ""
function GetFmsFolder(Param: String): String;
var
  RegValFms, Name, Path: String;
  Len: Integer;
  Res: Boolean;

begin
  RegValFms := 'Software\Flying-Model-Simulator';
  Name := 'InstallationPath';
  Res := RegQueryStringValue(HKEY_CURRENT_USER, RegValFms, Name, Path);
  if Res then Len := Length(Path) else Len := 0;
  if (Len > 0) then Result := Path  else    Result := '';
end;


function IsX64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paX64);
end;

function IsIA64: Boolean;
begin
  Result := Is64BitInstallMode and (ProcessorArchitecture = paIA64);
end;

function IsOtherArch: Boolean;
begin
  Result := not IsX64 and not IsIA64;
end;

function isFmsInstalled: Boolean;
var
  RegValFms, Fms: String;
  S: String;
  FmsLen: Longint;
  
begin  
  RegValFms := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\FMS';
  if RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValFms, 'DisplayName', Fms) then
   begin
    FmsLen := Length(Fms);
    if FmsLen = 0 then Result := False
    else begin
      Result := True;
      S := Format('Length of == %s== is %d', [Fms, FmsLen]); 
      //MsgBox(S, mbInformation, MB_OK);
    end;
   end
   else
    Result := False;
end;


//  If FMS flavour selected then Set FMS folder as target
//  If Generic flavour selected then Set SmartPropoPlus default folder as target
function NextButtonClick(PageID: Integer): Boolean;
begin
  if ((PageID = wpSelectComponents) and isFmsInstalled()) then 
  begin
    if IsComponentSelected('FMS') then
      FolderApp := GetFmsFolder('Dummy')
     else
      FolderApp := ExpandConstant('{app}');
  end;
    Result := TRUE 
end;

function GetAppFolder(Param: String): String;
begin
  Result := FolderApp;
end;

// Test if PPJoy is installed
// There are two types of PPJoy: Old and New
// The Old is marked here with index 1 and the new with index 2.
function IsPPJoyInstalled(): Boolean;
var
  Name, RegValPpj1, RegValPpj2, Path1, Path2: String;
  Len1, Len2: Longint;
  Res1, Res2: Boolean;

begin
  RegValPpj1 := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Parallel Port Joystick';
  RegValPpj2 := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\PPJoy Joystick Driver';
  Name := 'DisplayName';
  Res1 := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValPpj1, Name, Path1);
  Res2 := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValPpj2, Name, Path2);
  if Res1 then Len1 := Length(Path1) else Len1 := 0;
  if Res2 then Len2 := Length(Path2) else Len2 := 0;
  if ((Len1 > 0) or (Len2 > 0)) then Result := true  else    Result := false;
end;

// Test if vJoy is installed
function IsVjoyInstalled(): Boolean;
var
  Name, RegValVjoy, Path: String;
  Len: Longint;
  Res: Boolean;

begin
  RegValVjoy := 'SYSTEM\CurrentControlSet\Enum\Root\HIDCLASS\0000';
  Name := 'Service';
  Res := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValVjoy, Name, Path);
  if Res then Len := Length(Path) else Len := 0;
  if (Len > 0) then Result := true  else    Result := false;
end;

// Test if NSIS-installed SPP is already installed
function IsOldSppInstalled(): Boolean;
var
  RegValSpp, Name, Path: String;
  Len: Integer;
  Res: Boolean;

begin
   RegValSpp := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\SmartPropoPlus';
   Name := 'DisplayName';
   Res := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValSpp, Name, Path);
  if Res then Len := Length(Path) else Len := 0;
  if (Len > 0) then Result := true  else    Result := false;
end;

// Uninstall NSIS-installed SPP if already installed
// Return Value:
//  0: OK
//  1: Old SPP not found
//  2: UninstallString not found
//  3: Uninstaller file not found
//  4: Operation failed
function RemoveOldSpp(): Integer;
var
  RegValSpp, Name, Path: String;
  Len: Integer;
  Res: Boolean;
  ResultCode: Integer;
  
begin
  // Test: Old SPP exists?
  if (not IsOldSppInstalled()) then
  begin
    Result := 1;
    exit;
  end;
  
  // Get Uninstaller string
  RegValSpp := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\SmartPropoPlus';
  Name := 'UninstallString';
  Res := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValSpp, Name, Path);
  if not (Res and (Length(Path)>0)) then
  begin
    Result := 2;
    exit;
  end;
  
  // Test that the uninstaller file exists
  if not FileExists(Path) then
  begin
    Result := 3;
    exit;
  end;

  // Execute the uninstaller
  Res := Exec(Path, '', '', SW_SHOW, ewWaitUntilTerminated, ResultCode);
  if Res then
    Result := 0
  else 
    Result := 4;
  
end;

procedure OldSpp();
begin
  RemoveOldSpp();
end;
