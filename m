From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH] clk: bcm: Add driver for Northstar ILP clock
Date: Fri, 29 Jul 2016 13:49:17 -0700
Message-ID: <1e7e8319-d6d5-d952-634d-1ee9b9f2b1a3@broadcom.com>
References: <1469797120-29298-1-git-send-email-zajec5@gmail.com>
 <de0ba9d2-8b2b-b1e8-9235-1b402f0ffec0@broadcom.com>
 <CACna6rwj=ordfzTri1_iTOK162VjS+1bNVBSKo8p3AshGZun=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <CACna6rwj=ordfzTri1_iTOK162VjS+1bNVBSKo8p3AshGZun=Q@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 7/29/2016 1:46 PM, Rafa=C5=82 Mi=C5=82ecki wrote:
> On 29 July 2016 at 22:44, Ray Jui <ray.jui@broadcom.com> wrote:
>> On 7/29/2016 5:58 AM, Rafa=C5=82 Mi=C5=82ecki wrote:
>>>
>>> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>>>
>>> This clock is present on cheaper Northstar devices like BCM53573 or
>>> BCM47189 using Corex-A7. This driver uses PMU (Power Management Uni=
t)
>>> to calculate clock rate and allows using it in a generic (clk_*) wa=
y.
>>>
>>
>> I thought Northstar uses Cortex A9 instead of A7?
>
> [    0.000000] CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=
=3D10c5387d
> [    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing
> instruction cache
> [    0.000000] Machine model: Tenda AC9
>

Yeah ARMv7 instruction set but the core is Cortex A7. Both Cortex A7 an=
d=20
A9 use ARMv7 instructions.

Thanks,

Ray
