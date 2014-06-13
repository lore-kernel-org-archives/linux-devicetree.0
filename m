From: "jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: CPU revision IDs
Date: Fri, 13 Jun 2014 09:05:14 -0400
Message-ID: <CAKON4OxzJ7UoKnMgf+sckksjG-rx8NG1tUvPj2qaHNsda0j3jQ@mail.gmail.com>
References: <CAKON4OwNULPeQFHwRhRfri86yexMvvKfrw_dthim4_oPWvMD3g@mail.gmail.com>
	<20140613144355.20412fa6@free-electrons.com>
	<4285095.l6sVUI20tQ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4285095.l6sVUI20tQ@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jun 13, 2014 at 8:56 AM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
> On Friday 13 June 2014 14:43:55 Thomas Petazzoni wrote:
>> On Fri, 13 Jun 2014 08:29:41 -0400, jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
>> > How are CPU revision IDs encoded into the device tree? It is not
>> > reasonable to ask people to manually identify their revision and then
>> > use the right device tree. For example a heat sink may obscure the
>> > markings. The CPU ID is needed for device driver quirks.
>> >
>> > I was thinking of doing something like adding code at early boot that
>> > fixes up the root compatible string. The revision is a
>> > property of the CPU.
>> >
>> > Code changes this:
>> >  compatible = "cubietech,cubietruck", "allwinner,sun7i-a20"
>> > to:
>> >  compatible = "cubietech,cubietruck",  "allwinner,sun7i-a20a",
>> > "allwinner,sun7i-a20"
>> >
>> > Alternatively this could be done in uboot.
>> >
>> > Browsing around the kernel code there seems to be multiple solutions
>> > to this problem.  For example this Marvell code modifies the device
>> > driver compatible string.
>> >
>> > http://lxr.free-electrons.com/source/arch/arm/mach-mvebu/board-v7.c#L71
>>
>> Yes, the way we handle that on Marvell EBU platforms is that we runtime
>> detect the revision of the SoC, and use this information to adjust the
>> Device Tree information for this or that device that is known to have
>> issues/differences. For example, early revisions of Armada XP
>> processors have an issue in the I2C controller which prevents an
>> optimization feature from being used, so the code in board-v7.c detects
>> this early revision, and changes the Device Tree compatible string used
>> to probe the I2C controller, to a different compatible string that lets
>> the driver know that the feature shouldn't be used.
>
> I think the best approach always depends on the specific situation, in
> particular what the differences are between revisions and how easy to
> detect the revision is.
>
> Ideally all knowledge about different versions of an on-chip device
> are kept inside of the driver for that device. E.g. if they fixed a
> bug in the audio component, the audio driver should first try to find
> out the revision by looking at its own registers. If that doesn't work,
> the compatible strings for that device should be different for each
> revision and hardcoded in dts sources per board. This was problematic
> for the mvebu i2c controller as well, because one board was known to
> come in multiple revisions, so a hack was added in the platform code.
>
> Hanging driver specifics off the top-level compatible string however
> doesn't feel right. If the boot loader is going to fix it up, it should
> patch both the top-level strings and the devices that are actually
> different.

I was adding the CPU revision ID to the top level compatible string,
nothing specific to the device.  By knowing the CPU revision I know
which errata to apply.

If you patch the device strings, then you have to maintain knowledge
of which devices are broken in two places -- the device driver and the
machine file where you are patching the strings.

>
>         Arnd



-- 
Jon Smirl
jonsmirl-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
