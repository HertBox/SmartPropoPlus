#pragma once
#include "spptab.h"
class SppTabAudio :
	public SppTab
{
public:
	SppTabAudio(void);
	SppTabAudio(HINSTANCE hInstance, HWND TopDlgWnd);
	virtual ~SppTabAudio(void);

	void DisplayAudioLevels(PVOID Id, UINT Left, UINT Right);
	void AutoParams(WORD ctrl);
	void AudioChannelParams(void);
	void AudioLineSelected(void);
	void AudioChannelParams(UINT Bitrate, WCHAR Channel);
	void AddLine2AudioList(jack_info * jack);
	void CleanAudioList(void);
	void AudioAutoParams(WORD Mask, WORD Flags);
	void UpdateToolTip(LPVOID param);
	void Reset();
};

