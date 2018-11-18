Return-Path: <SRS0=sbJT=N5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:41315 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbeKSGgg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Nov 2018 01:36:36 -0500
Received: by mail-vs1-f68.google.com with SMTP id t17so16586970vsc.8
        for <devicetree@vger.kernel.org>; Sun, 18 Nov 2018 12:15:22 -0800 (PST)
MIME-Version: 1.0
References: <20181118163909.9202-1-geert@linux-m68k.org> <CACRpkdZ58BeYQ112g90HKboesMOGtVFnVBJtnUNeuy0qsfUteg@mail.gmail.com>
In-Reply-To: <CACRpkdZ58BeYQ112g90HKboesMOGtVFnVBJtnUNeuy0qsfUteg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 18 Nov 2018 21:15:08 +0100
Message-ID: <CAMuHMdVUK-aZBy0iib2Nh87nwWwQWH9RDi6wkRX5xkh9xOc2cw@mail.gmail.com>
Subject: Re: [RFC] C64 DTS
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Matt Porter <mporter@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

Hi Linus,

On Sun, Nov 18, 2018 at 8:10 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sun, Nov 18, 2018 at 5:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Sometimes it's just fun to apply modern practices to old hardware.
> >
> > Hence below is an attempt to write a DTS for the Commodore 64.
> > DT binding documentation is not yet included.
> >
> > Thanks for your comments ;-)
>
> It is useful not only for nostalgic reasons but because many
> people have deep understanding of this hardware and thus
> it becomes a reference example that many people can
> grasp when learning device tree.

True.

> >         cpus {
> >                 #address-cells = <0>;
> >                 #size-cells = <0>;
> >
> >                 cpu: cpu {
> >                         device_type = "cpu";
> >                         compatible = "cbm,6510", "mos,6502";
> >                         clock-frequency = <985000>;
> >                         gpio-controller;
> >                         #gpio-cells = <2>;
> >                         interrupt-controller;
> >                         #interrupt-cells = <1>;
> >                 };
> >         };
>
> This looks correct.
>
> I think the SA110/SA1100/SA1110 ARMs may need to have a
> similar GPIO controller jitted with the CPU since they are
> so tightly coupled. This IRQ is active low I would however
> suggest having it twocell and explicitly state all clients as
> active low on the flag as that gives a better understanding
> of the connections.

OK.

> >         basic_rom: memory@a000 {
> >                 reg = <0xa000 0x2000>;
> >                 // FIXME ROM, reserved
> >         };
> >
> >         character_rom: memory@d000 {
> >                 reg = <0xd000 0x1000>;
> >                 // FIXME ROM, reserved
> >         };
>
> Use mtd-physmap with "mtd-rom" right?
> Documentation/devicetree/bindings/mtd/mtd-physmap.txt

OK, so just e.g. rom@a000 with a compatible value of "mtd-rom"?

At first I thought mtd-physmap would be a solution for the bank switching,
but that turned out to be untrue ;-)

> >         cia1: system-controller@dc00 {
> >                 reg = <0xdc00 0x100>;
> >                 compatible = "cbm,6526", "mos,cia";
> >                 #clock-cells = <0>;                     // CNT
> >                 gpio-controller;
> >                 #gpio-cells = <2>;
> >                 interrupt-controller;
> >                 #interrupt-cells = <1>;
> >                 clocks = <&phi2>, <&ps_freq>;
> >                 clock-names = "phi2", "tod";
> >                 interrupts = <CPU_IRQ>;
> >         };
>
> I'm going back and forth whether this should be an MFD
> or not. It has a crowd of subdevices, including RTC,
> clocksource, clockevent, GPIO, IRQ controller, UART
> also parallel port with a shift register (IIRC).
>
> It is also possible to let several subdriver bind to this
> one node.
>
> So I'm uncertain :/

Personally, I don't like MFD in DT (akin "simple-mfd"), but prefer a single
node describing all of it.

BTW, the interrupts property of cia2 was not correct, as it is tied to NMI,
not IRQ.

>> >         keyboard {
> >                 compatible = "cbm,c64-keyboard", "gpio-matrix-keypad";
> >
> >                 col-gpios = <&cia1 0 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 1 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 2 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 3 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 4 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 5 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 6 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 7 GPIO_ACTIVE_HIGH>;
> >                 row-gpios = <&cia1 8 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 9 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 10 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 11 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 12 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 13 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 14 GPIO_ACTIVE_HIGH>,
> >                             <&cia1 15 GPIO_ACTIVE_HIGH>;
>
> Uncertain about active high here. Or open drain?

They're just standard totem-pole outputs.
No need for open drain on a keyboard scanning matrix (unless
it's also used for other purposes).

> >                 interrupts = <CPU_NMI>;
>
> I don't think it's advisible to use the NMI for the keyboard.

The RESTORE key is wired to the NMI line.
But it is indeed the 65th key, separate from the matrix scanning.
So it makes sense to leave it out here, and drop the "cbm,c64-keyboard"
compatible value.

BTW, how do you describe a separate button connected to an NMI line?
Or just omit it completely? Reset buttons are usually not described neither.

> >         iec {
> >                 compatible = "cbm,c64-iec-bus";
> >
> >                 cbm,atn-gpios = <&cia2 3 GPIO_ACTIVE_LOW>;
> >                 cbm,clock-out-gpios = <&cia2 4 GPIO_ACTIVE_LOW>;
> >                 cbm,data-out-gpios = <&cia2 5 GPIO_ACTIVE_LOW>;
> >                 cbm,clock-in-gpios = <&cia2 6 GPIO_ACTIVE_LOW>;
> >                 cbm,data-in-gpios = <&cia2 7 GPIO_ACTIVE_LOW>;
> >         };
>
> Whether it is C64 or not doesn't really matter, the
> compatible should be something like "gpio-iece-bus"
> in analogy with "gpio-leds" etc.

Correct.

> I'm not the smartest guy with the best memory but doesn't
> IEC mandate that some of the lines be used as open drain?
> So you need to tag on GPIO_LINE_OPEN_DRAIN where
> appropriate on these lines.
>
> The 6526 GPIO will emulate open drain output by switching
> the line into output mode (which is what the Linux gpiolib
> does with lines like that if it can't find a special register for
> open drain). I imagine this is how it was
> used but have no reference for it...

The {clock,data}-out lines are driving TTL open-collector buffers.
So combined with the {clock,data}-in lines, they're actually emulating
open-collector GPIOs.

So an IEC bus could be implemented using only 3 GPIOs, if two of
them can be configured as GPIO_LINE_OPEN_DRAIN.

Do you intend supporting the emulation of an open-collector GPIO in
gpiolib using a pair of GPIOs, so avoid implementing that in every
driver that may need it? ;-)

Thanks for the review!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
