MIME-Version: 1.0
In-Reply-To: <85b11902-2b2e-3c7c-3235-92e504fd00df@ti.com>
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
	<1523956215-28154-7-git-send-email-t-kristo@ti.com>
	<CAL_JsqJ7Gfy33hP3FfcWnwaR1eyEfB18SHGAUhMceOUV2xs=sQ@mail.gmail.com>
	<85b11902-2b2e-3c7c-3235-92e504fd00df@ti.com>
Date: Thu, 19 Apr 2018 20:31:32 -0500
Message-ID: <CAL_Jsq+VDgqCzkei5yLBovyS1EkEwY2n-fQLjuFrhwrhC2htNw@mail.gmail.com>
Subject: Re: [RFC 06/13] ARM: dts: am57xx-evm: add AM57xx-evm DT overlay
From: Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
To: Tero Kristo <t-kristo@ti.com>
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Mark Rutland <mark.rutland@arm.com>, "Mills, William" <wmills@ti.com>, Tony Lindgren <tony@atomide.com>, Tom Rini <trini@konsulko.com>, Russell King <linux@armlinux.org.uk>
List-ID: <devicetree@vger.kernel.org>

On Thu, Apr 19, 2018 at 1:49 AM, Tero Kristo <t-kristo@ti.com> wrote:
> On 19/04/18 03:19, Rob Herring wrote:
>>
>> On Tue, Apr 17, 2018 at 4:10 AM, Tero Kristo <t-kristo@ti.com> wrote:
>>>
>>> The AM57xx-evm is an overlay on top of beagle-x15 board. This contains
>>> a display extension macro, and a few extra peripherals. Two versions
>>> of the evm are supported, the base evm and the latest rev A3 evm. A
>>> common overlay file is used for both boards.
>>>
>>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>>> ---
>>>   arch/arm/boot/dts/ti/am57xx-evm-common.dtso | 175
>>> ++++++++++++++++++++++++++++
>>
>>
>> Why do this as an overlay? To what level is an AM57xx-evm functional
>> using a beagle-x15 dtb?
>
>
> Basically, am57xx-evm is just a beagle-x15 with an extension board
> physically plugged into it. If you don't add the am57xx-evm overlay, display
> (+ WLAN + some gpios) obviously don't work, but rest of the functionality
> does.
>
> If you have an am57xx-evm, you can also unplug the extension board to get a
> plain beagle-x15 board as I did, I don't typically care about things like
> display / WLAN in my work.

Okay, makes sense, but the naming convention doesn't really convey
these details. I guess users of the boards would understand this.

>>>   arch/arm/boot/dts/ti/am57xx-evm-reva3.dtso  |  11 ++
>>>   arch/arm/boot/dts/ti/am57xx-evm.dtso        |  11 ++
>>
>>
>> I think I'd structure this as just the A3 is an overlay. Applying it
>> will override everything in am57xx-evm.dtso, so what's the point to
>> making users of both board variations apply an overlay. Plus, you
>> could have only known the differences in the board revisions after you
>> had both boards. That wouldn't work if you developed this as new
>> boards appear.
>
>
> Well, beagle-x15 is still the base board for both, and different revisions
> of those also. The changes are relatively minor, but they are there. But
> yes, different hierarchies for these could be applied.

My point is that if you have 2 revisions of a given board, at some
point in time there was only 1 revision of that board. So you have a
dtb for that revision. Then a new revision comes out. You should not
be refactoring the existing dtbs based on what changed in the new
revision such that you have the common bits, rev 1 overlay and rev 2
overlay. Instead, make a rev 1 to rev 2 overlay.

Now if you have 2 different revisions in parallel that's a different
story. For example, if the beagle-x15 is stuffed differently for use
with the EVM vs. standalone.

Rob
