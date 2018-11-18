Return-Path: <SRS0=sbJT=N5=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f54.google.com ([209.85.167.54]:32798 "EHLO
        mail-lf1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbeKSFbs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 19 Nov 2018 00:31:48 -0500
Received: by mail-lf1-f54.google.com with SMTP id i26so19806432lfc.0
        for <devicetree@vger.kernel.org>; Sun, 18 Nov 2018 11:10:42 -0800 (PST)
MIME-Version: 1.0
References: <20181118163909.9202-1-geert@linux-m68k.org>
In-Reply-To: <20181118163909.9202-1-geert@linux-m68k.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 18 Nov 2018 20:10:28 +0100
Message-ID: <CACRpkdZ58BeYQ112g90HKboesMOGtVFnVBJtnUNeuy0qsfUteg@mail.gmail.com>
Subject: Re: [RFC] C64 DTS
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Matt Porter <mporter@konsulko.com>
List-ID: <devicetree@vger.kernel.org>

On Sun, Nov 18, 2018 at 5:39 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Sometimes it's just fun to apply modern practices to old hardware.
>
> Hence below is an attempt to write a DTS for the Commodore 64.
> DT binding documentation is not yet included.
>
> Thanks for your comments ;-)

It is useful not only for nostalgic reasons but because many
people have deep understanding of this hardware and thus
it becomes a reference example that many people can
grasp when learning device tree.

>         cpus {
>                 #address-cells = <0>;
>                 #size-cells = <0>;
>
>                 cpu: cpu {
>                         device_type = "cpu";
>                         compatible = "cbm,6510", "mos,6502";
>                         clock-frequency = <985000>;
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                         interrupt-controller;
>                         #interrupt-cells = <1>;
>                 };
>         };

This looks correct.

I think the SA110/SA1100/SA1110 ARMs may need to have a
similar GPIO controller jitted with the CPU since they are
so tightly coupled. This IRQ is active low I would however
suggest having it twocell and explicitly state all clients as
active low on the flag as that gives a better understanding
of the connections.

>         basic_rom: memory@a000 {
>                 reg = <0xa000 0x2000>;
>                 // FIXME ROM, reserved
>         };
>
>         character_rom: memory@d000 {
>                 reg = <0xd000 0x1000>;
>                 // FIXME ROM, reserved
>         };

Use mtd-physmap with "mtd-rom" right?
Documentation/devicetree/bindings/mtd/mtd-physmap.txt

>         vic: video-controller@d000 {
>                 reg = <0xd000 0x400>;
>                 compatible = "cbm,6569", "cbm,vic-ii";  // PAL
>                 clocks = <&color_clock>, <&dot_clock>;
>                 clock-names = "color", "dot";
>                 interrupts = <CPU_IRQ>;
>
>                 cbm,vic-bank-gpios = <&cia2 0 GPIO_ACTIVE_HIGH>,
>                                      <&cia2 1 GPIO_ACTIVE_HIGH>;
>         };

The interrupts all need to be requested as shared as
for a generic OS all IRQ handlers would need to get
called to figure out which hardware fired it. But I guess
we see that as a OS problem altogether.

>         color_ram: memory@d800 {
>                 reg = <0xd800 0x400>;
>                 // FIXME Nibble RAM, reserved
>         };

This is an "interesting" RAM type.

The upper nibble in each byte can be successfully sampled and used
as enthropy source as it picks up radio interference from
the surrounding universe.

>         cia1: system-controller@dc00 {
>                 reg = <0xdc00 0x100>;
>                 compatible = "cbm,6526", "mos,cia";
>                 #clock-cells = <0>;                     // CNT
>                 gpio-controller;
>                 #gpio-cells = <2>;
>                 interrupt-controller;
>                 #interrupt-cells = <1>;
>                 clocks = <&phi2>, <&ps_freq>;
>                 clock-names = "phi2", "tod";
>                 interrupts = <CPU_IRQ>;
>         };

I'm going back and forth whether this should be an MFD
or not. It has a crowd of subdevices, including RTC,
clocksource, clockevent, GPIO, IRQ controller, UART
also parallel port with a shift register (IIRC).

It is also possible to let several subdriver bind to this
one node.

So I'm uncertain :/

>         keyboard {
>                 compatible = "cbm,c64-keyboard", "gpio-matrix-keypad";
>
>                 col-gpios = <&cia1 0 GPIO_ACTIVE_HIGH>,
>                             <&cia1 1 GPIO_ACTIVE_HIGH>,
>                             <&cia1 2 GPIO_ACTIVE_HIGH>,
>                             <&cia1 3 GPIO_ACTIVE_HIGH>,
>                             <&cia1 4 GPIO_ACTIVE_HIGH>,
>                             <&cia1 5 GPIO_ACTIVE_HIGH>,
>                             <&cia1 6 GPIO_ACTIVE_HIGH>,
>                             <&cia1 7 GPIO_ACTIVE_HIGH>;
>                 row-gpios = <&cia1 8 GPIO_ACTIVE_HIGH>,
>                             <&cia1 9 GPIO_ACTIVE_HIGH>,
>                             <&cia1 10 GPIO_ACTIVE_HIGH>,
>                             <&cia1 11 GPIO_ACTIVE_HIGH>,
>                             <&cia1 12 GPIO_ACTIVE_HIGH>,
>                             <&cia1 13 GPIO_ACTIVE_HIGH>,
>                             <&cia1 14 GPIO_ACTIVE_HIGH>,
>                             <&cia1 15 GPIO_ACTIVE_HIGH>;

Uncertain about active high here. Or open drain?

>                 interrupts = <CPU_NMI>;

I don't think it's advisible to use the NMI for the keyboard.

>         iec {
>                 compatible = "cbm,c64-iec-bus";
>
>                 cbm,atn-gpios = <&cia2 3 GPIO_ACTIVE_LOW>;
>                 cbm,clock-out-gpios = <&cia2 4 GPIO_ACTIVE_LOW>;
>                 cbm,data-out-gpios = <&cia2 5 GPIO_ACTIVE_LOW>;
>                 cbm,clock-in-gpios = <&cia2 6 GPIO_ACTIVE_LOW>;
>                 cbm,data-in-gpios = <&cia2 7 GPIO_ACTIVE_LOW>;
>         };

Whether it is C64 or not doesn't really matter, the
compatible should be something like "gpio-iece-bus"
in analogy with "gpio-leds" etc.

I'm not the smartest guy with the best memory but doesn't
IEC mandate that some of the lines be used as open drain?
So you need to tag on GPIO_LINE_OPEN_DRAIN where
appropriate on these lines.

The 6526 GPIO will emulate open drain output by switching
the line into output mode (which is what the Linux gpiolib
does with lines like that if it can't find a special register for
open drain). I imagine this is how it was
used but have no reference for it...

Yours,
Linus Walleij
