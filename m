From: Anilkumar Kolli <akolli-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH 10/49] ath11k: add debug.c
Date: Tue, 27 Aug 2019 14:34:23 +0530
Message-ID: <6622b83f754404ec05b9442027757c5e@codeaurora.org>
References: <1566316095-27507-1-git-send-email-kvalo@codeaurora.org>
 <2708501.D2hezO5Rnt@bentobox>
 <80bdedf3740960e0ce05b02a77d1b457@codeaurora.org>
 <4441194.D8eDD6Tzdi@bentobox>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4441194.D8eDD6Tzdi@bentobox>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sven Eckelmann <sven-KaDOiPu9UxWEi8DpZVb4nw@public.gmane.org>
Cc: ath11k-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kalle Valo <kvalo-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 2019-08-27 13:05, Sven Eckelmann wrote:
> On Tuesday, 27 August 2019 09:33:39 CEST Anilkumar Kolli wrote:
> [...]
>> >     [ 4312.884650] The reading for sensor 4 is 0x002041f7
>> >     [ 4312.891499] The reading for sensor 5 is 0x002051f4
>> >     [ 4312.896415] Couldn't get reading for sensor 6
>> >     [ 4312.901189] Couldn't get reading for sensor 7
>> >     [ 4312.905561] The reading for sensor 8 is 0x002081e0
>> >     [ 4312.909902] The reading for sensor 9 is 0x002091f7
>> >     [ 4312.914645] Couldn't get reading for sensor 10
>> >     [ 4312.919364] The reading for sensor 11 is 0x0020b1fa
>> >     [ 4312.923791] The reading for sensor 12 is 0x0020c1fa
>> >     [ 4312.928621] Couldn't get reading for sensor 13
>> >     [ 4312.933425] The reading for sensor 14 is 0x0020e1f4
>> >     [ 4312.937941] The reading for sensor 15 is 0x0020f1e7
>> >     [ 4313.942700] Rebooting in 3 seconds..
>> >
>> > Maybe can be fixed by a different kernel (for the remoteproc). But I
>> > don't
>> > have this kernel at the moment.
>> >
>> 
>> The write of an "assert", sends 'WMI_FORCE_FW_HANG_CMDID' WMI command 
>> to
>> target firmware.
>> This WMI command forces the target to assert.
> 
> Yes, but it shouldn't kill the complete system.
> 
This will not kill the whole system, This will crash target and we have 
mechanism to recover the system.

Hope u have generated the crash with below patch,
https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/019-ath11k-disable-q6-recovery-to-crash-kernel.patch?h=win_ap.1.0

Please remove this patch to see the target recover after the crash.

Thanks
Anil
