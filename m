From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: Aw: Re: [PATCH 3/3] add driver and MAINTAINERS for poweroff
Date: Wed, 3 Jul 2019 13:54:41 +0200
Message-ID: <61f579d7-f415-481f-6f34-1534f0805dc1@gmail.com>
References: <20190702094045.3652-1-frank-w@public-files.de>
 <20190702094045.3652-4-frank-w@public-files.de>
 <c1358da0-60a4-49dd-71a8-77e90178c9c9@gmail.com>
 <trinity-ca99ab22-eda4-42dd-b6eb-8e4bb5c99165-1562143878858@3c-app-gmx-bs07>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <trinity-ca99ab22-eda4-42dd-b6eb-8e4bb5c99165-1562143878858@3c-app-gmx-bs07>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>, Sean Wang <sean.wang@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
List-Id: devicetree@vger.kernel.org



On 03/07/2019 10:51, Frank Wunderlich wrote:
> Hi Mathias
> 
> thank you for first look on this. Patchseries is originally from Josef Friedl i got some time ago for getting poweroff working on bananapi r2. There it works and maybe on another devices too.
> 
> drivers/rtc/rtc-mt6397.c and drivers/rtc/rtc-mt7622.c look very differently on a diff (you've commented in part 1/3)
> 
> maybe code is compatible but i have not the knowledge to compare this...maybe sean (sorry, that i missed you) or ryder can say a word about the compatibility.
> 

My fault, I didn't got that right. So you are just improving the code of the RTC
driver. Which is great, but as already said, do this in a separate patch. :)

Regards,
Matthias

>> Fix the commit message. MAINTAINERS get normally send a independent patch.
>> Split patches between RTC and PWRC.
>> If not a new patch it should be stated in the commit message at least.
> 
> i will try to split this
> 
>>> + * Author: Tianping.Fang <tianping.fang@mediatek.com>
>>> + *        Sean Wang <sean.wang@mediatek.com>
>>
>> You are the author of this file, aren't you?
> 
> no, afaik these is code taken from rtc-mt6397.c and put in a separate header-file to use it in multiple c-files.
> 
> sidenote on encoding/word-wrap. i use only "git sendemail" which afaik calls sendmail (no other mta like thunderbird or similar) on ubuntu 18.4....curently have no idea how to fix this...have searched before, but not yet found anything. if you have an idea please give me a hint.
> 
> regards Frank
> 
