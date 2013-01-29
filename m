From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH V2] ARM: davinci: da850: add RTC DT entries
Date: Tue, 29 Jan 2013 13:31:23 +0530
Message-ID: <510781D3.4070807@ti.com>
References: <1359359268-9781-1-git-send-email-mrugesh.mk@ti.com> <5106A105.6030004@ti.com> <4232EB8829679242B82E712C3DB3149D42355C@DBDE01.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <4232EB8829679242B82E712C3DB3149D42355C@DBDE01.ent.ti.com>
Sender: linux-doc-owner@vger.kernel.org
To: "Katepallewar, Mrugesh" <mrugesh.mk@ti.com>
Cc: "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "davinci-linux-open-source@linux.davincidsp.com" <davinci-linux-open-source@linux.davincidsp.com>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "rob@landley.net" <rob@landley.net>, "hs@denx.de" <hs@denx.de>
List-Id: devicetree@vger.kernel.org

On 1/29/2013 1:05 PM, Katepallewar, Mrugesh wrote:
> On Mon, Jan 28, 2013 at 21:32:13, Nori, Sekhar wrote:
>> Hi Mrugesh,
>>
>> On 1/28/2013 1:17 PM, Mrugesh Katepallewar wrote:
>>> Add RTC DT entries in da850 dts file.
>>>
>>> Signed-off-by: Mrugesh Katepallewar <mrugesh.mk@ti.com>
>>> ---
>>> Applies on top of v3.8-rc4 of linus tree.
>>>
>>> This patch is depending on
>>> "ARM: davinci: da850: add interrupt-parent property in soc node"
>>> https://patchwork.kernel.org/patch/2044101/
>>
>>> Tested on da850-evm device.
>>>
>>> Test Procedure:
>>> date 2013.01.28-10:00:00 (usage: date[YYYY.]MM.DD-hh:mm[:ss]) hwclock 
>>> -w reset board and check system time.
>>
>> Queuing this for v3.9. The testing information above is useful and should be part of the changelog. I moved it there while committing.
>>
>> It will be nice to check the alarm functionality as well. Can you check that and let me know that works as well?
> 
> I tried to test RTC alarm using "rtcwake" command, however it is not working and returning following error 
> "rtcwake: /dev/rtc0 not enabled for wakeup events"
> This is coming because we have not registered RTC device as a wakeup source yet.

rtcwake is too much to use if the purpose is just to test the alarm
functionality.

> For checking RTC alarm interrupt, I developed one simple program which opens RTC device, set alarm and exits.
> Then by entering "cat /proc/interrupts" checked RTC interrupt count.

No need of writing your own. Simply use the one in Documentation/rtc.txt

> Using above test it confirms that RTC alarm functionality is working fine. 

Okay. Thanks for confirming.

Regards,
Sekhar
