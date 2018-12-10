Return-Path: <SRS0=EUt7=OT=vger.kernel.org=devicetree-owner@kernel.org>
Received: from lelv0142.ext.ti.com ([198.47.23.249]:37614 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726819AbeLJPNX (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Dec 2018 10:13:23 -0500
Subject: Re: [PATCH] ARM: dts: Add am335x mcasp with l3 data port ranges
References: <20181205230356.38855-1-tony@atomide.com>
 <3f44b350-17a9-bdf7-33b4-130b6eeae5f0@ti.com>
 <48ee14e0-1361-4840-42c6-f676f2911ce6@ti.com>
 <45fc55d2-8c8c-e831-cdaa-970d382a432f@ti.com>
 <20181210145054.GA6707@atomide.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <d4511eaf-95c4-f48a-2a1b-bce53f782fd8@ti.com>
Date: Mon, 10 Dec 2018 17:12:59 +0200
MIME-Version: 1.0
In-Reply-To: <20181210145054.GA6707@atomide.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: linux-omap@vger.kernel.org, =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 10/12/2018 16:50, Tony Lindgren wrote:
> * Peter Ujfalusi <peter.ujfalusi@ti.com> [181210 13:45]:
>> On 10/12/2018 11.53, Peter Ujfalusi wrote:
>>> On 10/12/2018 9.05, Peter Ujfalusi wrote:
>>> when looking for the non booting of am335x-evm-sk (nothing printed on
>>> serial after stating kernel).
>>>
>>> However there is another issue: the kernel boots, but ethernet is not
>>> working in the kernel. That is pointing to:
>>> Author: Tero Kristo <t-kristo@ti.com>
>>> 69fd70c7ff31d3f00833c472c3994a02bb0ab287
>>> ARM: dts: am33xx: convert to use new clkctrl layout
>>>
>>> any idea what might causes these?
>>
>> Things definitely go wrong at 69fd70c7ff31d3f00833c472c3994a02bb0ab287:
>>
>> git checkout -b blah 69fd70c7ff31d3f00833c472c3994a02bb0ab287
>> # can not mount the rootfs via nfs
>>
>> git revert 69fd70c7ff31d3f00833c472c3994a02bb0ab287
>> # boots up via nfs rootfs.
>>
>> At commit 69fd70c7ff31d3f00833c472c3994a02bb0ab287 the bbb is not
>> booting via nfs rootfs either.
>>
>> Can not find where the ethernet started to work after these on bbb, but
>> it does work on top of next-20181207.
> 
> Tero do you have any ideas on this one? Maybe a missing optional clock
> somewhere?

No initial ideas, do we have any error logs for this?

Did you bisect the issue to 69fd70c7ff31d3? It is possible this is 
actually caused by something else, as there are some interesting 
dependencies between the patches that are being queued at the same point 
to the kernel now.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
