; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "SmartPropoPlus"
#define MyAppVersion "3.3.10"
#define MyAppURL "http://www.smartpropoplus.com/"
#define MyAppExeName "SppConsole.exe"
#define AppUtilsName  "SmartPropoPlus Utilities"
#define AppGUID "{{2E84A5A4-351E-4B00-9926-F50DBD7481E9}"

#define vJoyBaseDir "C:\WinDDK\vjoy1" ; You will have to change it!!!
#define vJoyInstx86 "install\objfre_wxp_x86\i386"
#define vJoyInstx64 "install\objfre_wlh_amd64\amd64"


[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppID={#AppGUID}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=true
OutputDir=.\inno
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
DisableReadyMemo=true
;UninstallFilesDir={code:GetAppFolder}
PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64
SetupLogging=true
ShowTasksTreeLines=true
DisableReadyPage=true

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
Source:  vJoyInstallerMerged.exe; DestDir: {app}\vJoy; Flags:  promptifolder ; Components:  Generic/vJoy ;


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
; Install vJoy (if requested) - first, go to testsigning mode
;Filename: {app}\vJoy\vJoyInstallerMerged.exe; Components: Generic/vJoy; Flags: waituntilterminated runhidden ; StatusMsg: "Installing vJoy device (May take up to 5 minutes)"; Parameters: " /spp=1 /VERYSILENT /NORESTART /RESTARTEXITCODE=3010 /SUPPRESSMSGBOXES" ; 
; Generic: Run SppConsole after installation
Filename: "{code:GetAppFolder}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, "&", "&&")}}"; Flags: nowait postinstall ; Components: Generic
; FMS: Run Simulator
Filename: "{code:GetFmsFolder}\FMS.exe"; Description: "{cm:LaunchProgram,{#StringChange('FMS', "&", "&&")}}";  Components: FMS; Flags: nowait postinstall 


[Types]
;Name: "full"; Description: "Full installation"
;Name: "compact"; Description: "Compact installation"
Name: "custom"; Description: "Custom installation"; Flags: iscustom;


[Components]
;Name: SmartPropoPlus; Description: "Top App"; Flags: dontinheritcheck; MinVersion: 0,5.1.2600; Languages: english hebrew; 
Name: FMS; Description: "SmartPropoPlus For Fms"; Flags: exclusive checkablealone; Check: isFmsInstalled; Types: custom
Name: Generic; Description: "Generic SmartPropoPlus"; Flags: exclusive;
;Name: Generic; Description: "Generic SmartPropoPlus";  Flags: exclusive;
Name: Generic/vJoy; Description: vJoy; Check:  ( not isFmsInstalled)  and (not IsPPJoyInstalled); Flags:  dontinheritcheck; Types: custom; 
Name: Generic/vJoy; Description: vJoy; Check:  ( not isFmsInstalled) and (IsPPJoyInstalled); Flags:  dontinheritcheck;  
Name: Generic/vJoy; Description: vJoy; Check: isFmsInstalled and (not IsPPJoyInstalled); 
Name: Generic/vJoy; Description: vJoy; Check: isFmsInstalled and IsPPJoyInstalled; Flags: dontinheritcheck;

[code]
const
  (* Constants related to registry *)
    GUID_WINDOWS_BOOTMGR      = '{9DEA862C-5CDD-4E70-ACC1-F32B344D4795}';
    DefaultObjec              = '23000003';
    AllowPrereleaseSignatures = '16000049';
    BCDRoot                   = 'BCD00000000';
    
    (* Constants related to two-phase installation *)
    RunOnceName = 'SPP Setup restart';
    RunOnceKey  = 'Software\Microsoft\Windows\CurrentVersion\RunOnce';
    Ph2Param    = ' /PH2=1';
    QuitMessageReboot = 'The installer will now set your computer to TestSigning mode. You will need to restart your computer to complete that installation.'#13#13'After restarting your computer, Setup will continue next time an administrator logs in.';
    WaitingForRestart = 'You should now restat your computer.'#13#13'Press OK then restart your computer manually'#13'Press Cancel to cancel installation';
    ErrorRunOnce      = 'Failed to update RunOnce registry entry';
    ErrorSetTestMode  = 'Failed to set computer to TestSigning Mode';
  
  	(* Result Constants *)
  	Undef				=	-1;
  	Fail				=	-2;
  	Installed		=	3009;
  	NeedRstart	=	3010;

var
FolderApp: String;
SkipToPh2: boolean; (* True is installer resumes installation after Set Test mode & restart*)
TestMode: boolean; (* True if computer was in Test mode before installation *)

(* Forward Functions *)
Function	Install_vJoy(isPh2: Boolean): Integer; Forward;

(*
  Record the original value of TestSigning in the registry for usage by uninstall
  Do NOT override original value
  Assuming that is called by the function that actually perform the operation so no testing.
  Set boolean Value:  HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{XXX}_is1\OrigTestMode
  {XXX} stands for the AppID
*)
Procedure RegWriteOrigTestMode(data: Boolean);
var
  Val, UninstKey: String;

Begin  
  UninstKey := 'Software\Microsoft\Windows\CurrentVersion\Uninstall\' + expandconstant('{#AppGUID}') + '_is1';
  Val := 'OrigTestMode';

  // Test if Value exists
  if not RegValueExists(HKEY_LOCAL_MACHINE, UninstKey, Val) then
  if data then
    RegWriteBinaryValue(HKEY_LOCAL_MACHINE, UninstKey, Val, #1)
  else
    RegWriteBinaryValue(HKEY_LOCAL_MACHINE, UninstKey, Val, #0);
End;

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


(*
  Check if computer in testsigning mode
  How: 
  Go to the BCD in the registry and look for the Boot manager entry
  Inside, get the GUID of the defoalt loader.
  Inside the default loader, get the value of the testsigning mode
  Note: If does not exist = testsigning is off
  Return:
  True if testsigning is ON
  False if testsigning is OFF
*)
function IsTestMode(): Boolean;
var
  RegValDeflt, RegValTestsig, Name, Path, msg : String;
  tmp: AnsiString;
  Res: Boolean;
begin
  Log('IsTestMode: Start');

  RegValDeflt := BCDRoot + '\Objects\' + GUID_WINDOWS_BOOTMGR + '\Elements\' + DefaultObjec;
  Name := 'Element'
  
  // Get pointer to default loader
  Res := RegQueryStringValue(HKEY_LOCAL_MACHINE, RegValDeflt, Name, Path);
  if not Res then
    begin
    (* Debug start  *)
      msg := 'IsTestMode: Cannot find value for ' + RegValDeflt + '\' + Name;
      Log(msg);
     (*Debug end*)
      Result := False;
      exit;
    end; 
  (* Debug start *)
   msg := 'IsTestMode: Got value for ' + RegValDeflt + '\' + Name +': ' + Path;
   Log(msg);
  (*  Debug end*)
   
  // Get testsigning value
  RegValTestsig := BCDRoot + '\Objects\' + Path + '\Elements\' + AllowPrereleaseSignatures;
  tmp := '#0';
  Res := RegQueryBinaryValue(HKEY_LOCAL_MACHINE, RegValTestsig, Name, tmp);
 (* Debug start   *)
 if Res then
 begin
  if tmp <> #0 then
   begin
   msg := 'IsTestMode: RegQueryBinaryValue for ' + RegValTestsig + '\' + NAME + ': Test mode ON ('+ tmp +')';
   Log(msg);
   end
  else
   begin
   msg := 'IsTestMode: RegQueryBinaryValue for ' + RegValTestsig + '\' + NAME + ': Test mode OFF ('+ tmp +')';
   Log(msg);
   end;
  end
 else
  begin
  msg := 'IsTestMode: RegQueryBinaryValue for ' + RegValTestsig + '\' + NAME + ': failed';
  Log(msg);
  end;
 
(*  Debug end *)
  if tmp = #1 then
    Result := True
  else
    Result := False;
end; // End Function IsTestMode

(*
  Set Testsigning mode On/Off acording to value of variable 'value'
  Executed only for x64 - else NOP (return FALSE)
  Return TRUE is succeeded
  Return FALSE if failed or if already was in the required state
*)
function SetTestMode(value: Boolean): Boolean;
var
  ResultCode: Integer;
  params: String;
  
Begin
   
  if not ProcessorArchitecture = paX64 then
  begin
   Result := false;
   //exit;
  end; // Not x64
  
  if (IsTestMode = value) then
  begin
   Result := false;
   exit;
  end; //  already was in the required state
   
   // Execute BCDEdit shell command 
   if value then
    Params := ' -set TESTSIGNING ON'
   else
    Params := ' -set TESTSIGNING OFF';
       
   Exec('Bcdedit.exe',Params, '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
   Result := True;
end; // End Function SetTestMode

function SetTestModeOn(): Boolean;
begin
  result := SetTestMode(True);
end;

function SetTestModeOff(): Boolean;
begin
  result := SetTestMode(False);
end;



(* 
		Called by installer just before installation.
		It either stops installation and requests restart or continues installation
		Here are the cases:
		1. 	NO vJoy to be installed: Just continue (NeedsRestart:=False)
		2. 	PH2=1: This means that this is second phase: 
				Call vJoy installer to complete instalation then just continue  (NeedsRestart:=False)
		3.	vJoy should be installed and first phase: Call vJoy Installer and get the result:
					a. If NeedRstart then set-up RunOnce entry and restart (NeedsRestart:=True)
					b. If NOT NeedRstart then Just continue (NeedsRestart:=False)
*)
function PrepareToInstall(var NeedsRestart: Boolean): String;
var
  RunOnceData: String;
  Res: Integer;
  
  
begin

	Res := Undef;
	NeedsRestart := False;
	Log('PrepareToInstall(): Start');

	// Case 1:	
	if Not IsComponentSelected('Generic/vJoy') then 
	begin	// Case 1
		Log('PrepareToInstall(): case 1 - NO vJoy to be installed');
		exit;
	end;	// Case 1
	
	// Case 2:
	if SkipToPh2 then
	begin	// Case 2
		Log('PrepareToInstall(): case 2 - PH2=1');
		Res := Install_vJoy(true);
		if Res = Installed then exit;
		Log('PrepareToInstall(): case 2 - vJoy second phase failed');
	end;	// Case 2
	
	
	if IsComponentSelected('Generic/vJoy') and (not SkipToPh2) then 
	begin	// Case 3
		Log('PrepareToInstall(): case 3 - vJoy should be installed and first phase');
		Res := Install_vJoy(false);
		if Res = Installed then
		begin	// Installed
			Log('PrepareToInstall(): case 3b - vJoy installed successfully');
			exit;
		end;	// Installed
		if Res = Fail then
		begin	// Not Installed
			Log('PrepareToInstall(): case 3b - vJoy failed to install');
			Result := 'vJoy failed to install';
			exit;
		end;	// Not Installed
	end;	// Case 3

 if Res = NeedRstart then 
 begin // Case 3b
 	/// set RunOnce registry entry
 	Log('PrepareToInstall(): Case 3b - Going to set RunOnce registry edit');
 	RunOnceData := ExpandConstant('{srcexe}') + Ph2Param;
 	if  not RegWriteStringValue(HKLM, RunOnceKey, RunOnceName, RunOnceData) then
 	begin // Failed
   	NeedsRestart := false;
   	Result := ErrorRunOnce;
   	exit;
 	end;
 
	// OK
 	Log('PrepareToInstall(): case 3a - Need restart');
 	Result := QuitMessageReboot;
 	NeedsRestart := true;
 end;  // Case 3b
end;

(*
  Called before every wizard page.
  Pages skipped if installer called with parameter PH2 
*)
function ShouldSkipPage(PageID: Integer): Boolean;
begin
  Result := SkipToPh2;
end;



(*
  Test command-line parameters
  Return true unless otherwise said 
  If parameter PH2 exists then set SkipToPh2
  If parameter PH2 does not exist then un-set SkipToPh2
  If parameter PH2 does not exist but RunOnce entry exists - issue error message and return FALSE
*)
function InitializeSetup(): Boolean;

begin
  SkipToPh2 := ExpandConstant('{param:PH2|0}') = '1';

  if SkipToPh2 then begin
   Result := True; 
   exit;
  end;
  
  Result := True;
  if  RegValueExists(HKLM, RunOnceKey, RunOnceName) then 
  begin
      Result := False;
      if IDOK <> MsgBox(WaitingForRestart , mbError, MB_OKCANCEL) then  
      begin
        RegDeleteValue(HKLM, RunOnceKey, RunOnceName);
        SetTestModeOff;
  		end;
  end;
end;


(* 
    This is called just on the way out of the wizard 
    The app Uninstall registry entry already exists
*)
procedure DeinitializeSetup();
begin
  (* 
    The original Test mode value was ON only if:
    1. It is now ON and
    2. This phase is NOT phase 2
  *)
  RegWriteOrigTestMode(IsTestMode and (not SkipToPh2));
end;

(* Install vJoy by calling the vJoy installer *)
Function	Install_vJoy(isPh2: Boolean): Integer;
var
	  ResultCode: Integer;
	  Res:				Boolean;
	  flags:			String;

Begin
	Result := Undef;
	
	if isPh2 then
		flags	 := ' /spp=1 /SILENT  /PH2=1 /SUPPRESSMSGBOXES'
	else
		flags	 := ' /spp=1  /SILENT /NORESTART /SUPPRESSMSGBOXES';
	
	Log('Install_vJoy(): Flags: ' + flags);
		
  ExtractTemporaryFile('vJoyInstallerMerged.exe');
	Res := Exec(ExpandConstant('{tmp}\vJoyInstallerMerged.exe'), flags, '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
	if Res = False then
	Begin	// Exec Failed
		Result := Fail;
		Log('Install_vJoy(): Failed');
		Exit;
	end;	// Exec Failed
	Log('Install_vJoy(): EXEC Returned '+IntToStr(ResultCode));
	if ResultCode = 0 then Result := Installed;
	if ResultCode = 8 then Result := NeedRstart;
End;



[InnoIDE_Settings]
LogFileOverwrite=true

