From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: add binding for i.MX8MQ IOMUXC
Date: Wed, 7 Feb 2018 10:09:20 +0100
Message-ID: <CACRpkdYy43E5H=tRAf+YDvAY1RDTJ34nHSmqCXEn9xaknbLKZQ@mail.gmail.com>
References: <20180201174923.7385-1-l.stach@pengutronix.de> <20180205060918.vm3q6ludepvqcuxm@rob-hp-laptop>
 <1517825351.3175.3.camel@pengutronix.de> <CACRpkdanb3XocUpmTaFTh-vsApucX0PzuqRg_fA2ORUFtrVGJA@mail.gmail.com>
 <1517914394.3175.21.camel@pengutronix.de> <CACRpkdbuGOrm=y=yPpsrkckk8+uKGxv6J9WGw9y=yiGcmbqn+w@mail.gmail.com>
 <1517932068.3175.27.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1517932068.3175.27.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "A . s . Dong" <aisheng.dong-3arQi8VN3Tc@public.gmane.org>, linux-imx-3arQi8VN3Tc@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, patchwork-lst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Feb 6, 2018 at 4:47 PM, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:

> To be fully honest I'm a bit annoyed with the pinctrl framework making
> things (IMHO) unnecessarily complex, for what is basically a pretty
> easy task.

My ambition is to make things readable, understandable and
maintainable. In generic terms, incorporating a bunch of knowledge
of the electronics that really happen into the stuff we encode in
the kernel.

I guess it varies a bit on what goal one has.

If the goal is "ship product with upstream kernel really fast now"
then things like pinctrl-single.c where we just hammer magic values
into registers, make sense. OMAP developers had no idea whatsoever
what their ASIC people or cell library authors were doing so they
just threw in the towel. HiSilicon also use this. Intels ambition was
to use ACPI BIOS to handle all pin control and route around the kernel
altogether, but that is not working out so well for them I think.

All of them are approaches to avoid putting the hairy details into the
kernel, just poke some magic values into some magic registers
and be happy.

So i.MX could have been like that, but then I guess you need to take
legacy into account and discuss with the other i.MX driver authors
about how they really wanted and want to do things.

Their current silence wrt this mailchain is actually becoming a
problem, and the problem is that discussing with you falls upwards
to me as subsystem maintainer. Which sucks. I prefer that people
who know this hardware discuss amongst themselves how they
want things to work.

Surely Sascha must have an opinion? It means much to me
what he wants to do. I take it you guys are colleagues?

> Pengutronix is mostly contracted by customers of NXP to enable
> stuff in mainline. So I'm not working on this in my spare time, but I
> still have to deal with the fact that I can only get the information
> from the reference manual, NXP downstream BSPs and the occasional
> helpful NXP employee.

Hm I see, this seems like a bit of crappy position to be in when
you just want to ask someone in hardware how things really work.

But we have Freescale i.MX maintainers on the inside of the company
now NXP (soon Qualcomm? soon Broadcom?).

Hell this mail is even going to linux-imx-3arQi8VN3Tc@public.gmane.org, what do they do
with it? Put it in a mailbox and never read it?

Surely someone on the inside must be able to provide some details.

> Also even if we were inside of NXP, pad cells are usually something
> that chip makers buy or get from the Fab design library. So probably
> even they don't know what's inside exactly.

Yeah that is what I call "throw over the wall engineering".
It's not good, if NXP works with information brick walls like that it is
not any good for them, because it is not any good for their customers.

Not something you or I can fix though...

> What usually happens is that hardware (I'm talking about board/system
> here) designers start by reading the reference manual and hardware
> design guide and work with that. They come up with all the necessary
> configuration in the terms of the manual.

Sometimes half-guessing and a bit of trial-and-error right?

> After that they or someone else has to translate this into DT. Things
> get confusing when the reference manual and the DT binding disagree
> about the used terms.

I see.

>> If you want something to match the specific hardware
>> manual from NXP and you don't want it to be translated
>> into the units of the DT binding, then I think it is better
>> to use something prefixed "nxp,*".
>
>> That clearly indicates that this is some NXP oddity that
>> we don't really understand.
>
> I'm not keen on using the common padctrl stuff, which already bloats
> the DT description compared to i.MX6,

This you need to discuss with the generic i.MX driver maintainers.
They are the maintainers of drivers/pinctrl/freescale/* after all.

They never put an entry in MAINTAINERS though, but I
always regarded these as the pinctrl maintainers for i.MX:

ARM/FREESCALE IMX / MXC ARM ARCHITECTURE
M:      Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
M:      Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
R:      Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>

On top of this, Dong Aisheng, Gary Bisson and
Vladimir Zapolskiy has made major contributions.

It's a little ecosystem on its own, not really to be discussed
by just you and me. I wonder where the rest of the voices are,
I hope not silenced by organizational stress after the NXP
merger...

> and then again need to introduce
> custom properties. That's just worst of both worlds, verbose DT to use
> the common stuff, mixed with special properties, only valid on this
> single controller.

No matter how much you dislike it, it is what e.g. Qualcomm is
doing. (Who might soon be one and the same as NXP I hear.)

> If you insist I guess I'm fine with compromising on an "output-
> impedance" common property, but then this just makes things harder for
> everyone involved, as the impedance even seems to vary slightly with
> the used pad voltage. So to not get into a combinatorial explosion, we
> would need to describe this property as somethings like "output
> impedance at 3.3v)", at least on this specific hardware.

Hm, should it me "nxp,drive-strength" then, as it is just some
magic value? I guess "nxp,magic-drive-strength" is not going to
cut it :D

Also maybe we should use the old "freescale,*" notation for legacy
reasons... I don't know. This Vendor prefix seems less stable
than the chipsets.

> Or we could agree that drive-strength property could be described in
> some unit that makes sense on each controller. mA for hardware
> described with some fabled ideal load matching, Ohms for hardware that
> models it this way with maximum drive strength at the point of best
> load matching.

I am not like stubbornly against. I just want some discussion here,
it would be nice to know the opinion of the i.MX maintainers.

> In the end this is about mapping 3 hardware bits to a DT description...

Pleas don't think about it like "can't we just do this real simple
thing now, just merge this and stop being an ass".

Things just poking three bits can look very simple, like in so
many BSPs:

volatile unsigned long *foo;

foo = (unsigned long *) 0xfec0be00;
*foo &= ~0x700;
*foo |= 0x200; /* do the magic */

But this is not helpful for developers or maintainers. That is IMHO
why we have the frameworks and all the DT standardization in
the first place, exactly so we understand what we are doing.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
