Return-Path: <SRS0=zYeN=HI=ti.com=t-kristo@kernel.org>
Subject: Re: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-7-git-send-email-t-kristo@ti.com>
 <CAL_JsqJ7Gfy33hP3FfcWnwaR1eyEfB18SHGAUhMceOUV2xs=sQ@mail.gmail.com>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <85b11902-2b2e-3c7c-3235-92e504fd00df@ti.com>
Date: Thu, 19 Apr 2018 09:49:58 +0300
MIME-Version: 1.0
In-Reply-To: <CAL_JsqJ7Gfy33hP3FfcWnwaR1eyEfB18SHGAUhMceOUV2xs=sQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Mills, William" <wmills@ti.com>, Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On 19/04/18 03:19, Rob Herring wrote:
> On Tue, Apr 17, 2018 at 4:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
>> The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
>> a display extension macro, and a few extra peripherals. Two versions
>> of the evm are supported, the base evm and the latest rev A3 evm. A
>> common overlay file is used for both boards.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175 ++++++++++++++++++++++++++++
> 
> Why do this as an overlay? To what level is an AM57xx-evm functional
> using a beagle-x15 dtb?

Basically, am57xx-evm is just a beagle-x15 with an extension board 
physically plugged into it. If you don't add the am57xx-evm overlay, 
display (+ WLAN + some gpios) obviously don't work, but rest of the 
functionality does.

If you have an am57xx-evm, you can also unplug the extension board to 
get a plain beagle-x15 board as I did, I don't typically care about 
things like display / WLAN in my work.

> 
>>   arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
>>   arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++
> 
> I think I'd structure this as just the A3 is an overlay. Applying it
> will override everything in am57xx-evm.dtso, so what's the point to
> making users of both board variations apply an overlay. Plus, you
> could have only known the differences in the board revisions after you
> had both boards. That wouldn't work if you developed this as new
> boards appear.

Well, beagle-x15 is still the base board for both, and different 
revisions of those also. The changes are relatively minor, but they are 
there. But yes, different hierarchies for these could be applied.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
