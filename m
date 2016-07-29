From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH] clk: bcm: Add driver for Northstar ILP clock
Date: Fri, 29 Jul 2016 13:59:05 -0700
Message-ID: <bc2e5cc3-a4e7-fa40-1d3a-d2512b20e990@broadcom.com>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
 <de0ba9d2-8b2b-b1e8-9235-1b402f0ffec0@broadcom.com>
 <CACna6rwj=ordfzTri1_iTOK162VjS+1bNVBSKo8p3AshGZun=Q@mail.gmail.com>
 <1e7e8319-d6d5-d952-634d-1ee9b9f2b1a3@broadcom.com>
 <CACna6ryOndBTzLL_H+3S01YmWg1Te7T5t2J4tVsxoUtat2xAiw@mail.gmail.com>
 <23e2aa2f-a0ff-f72e-5e98-ea539c6fb69d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <23e2aa2f-a0ff-f72e-5e98-ea539c6fb69d@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 7/29/2016 1:55 PM, Florian Fainelli wrote:
> On 07/29/2016 01:52 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>> On 29 July 2016 at 22:49, Ray Jui <ray.jui@broadcom.com> wrote:
>>> On 7/29/2016 1:46 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>> On 29 July 2016 at 22:44, Ray Jui <ray.jui@broadcom.com> wrote:
>>>>>
>>>>> On 7/29/2016 5:58 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>>>>
>>>>>>
>>>>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>>>>>
>>>>>> This clock is present on cheaper Northstar devices like BCM53573=
 or
>>>>>> BCM47189 using Corex-A7. This driver uses PMU (Power Management =
Unit)
>>>>>> to calculate clock rate and allows using it in a generic (clk_*)=
 way.
>>>>>>
>>>>>
>>>>> I thought Northstar uses Cortex A9 instead of A7?
>>>>
>>>>
>>>> [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7),
>>>> cr=3D10c5387d
>>>> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT alias=
ing
>>>> instruction cache
>>>> [    0.000000] Machine model: Tenda AC9
>>>>
>>>
>>> Yeah ARMv7 instruction set but the core is Cortex A7. Both Cortex A=
7 and A9
>>> use ARMv7 instructions.
>>
>> OK, sorry for irrelevant part then :)
>>
>> This is from BCM4709C0:
>> bcma: bus0: Core 10 found: ARM Cortex A9 core (ihost) (manuf 0x4BF, =
id
>> 0x510, rev 0x07, class 0x0)
>>
>> This is from BCM47189B0::
>> bcma: bus0: Core 3 found: ARM CA7 (manuf 0x4BF, id 0x847, rev 0x00, =
class 0x0)
>>
>
> This is indeed a Cortex A7-based chip, not clear if putting this chip=
 in
> the Northstar family is accurate here because it really seems to have=
 a
> different architecture from the NS/NSP family here...
>

Okay I got it. Good to know! I got confused by it being called=20
"Northstar" because as far I can remember, none of the Northstar chips=20
uses Cortex A7 (or maybe even that assumption is incorrect, :))

Thanks,

Ray
