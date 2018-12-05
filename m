From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: add SAMA5D2 PIOBU support
Date: Wed, 5 Dec 2018 09:22:25 -0600
Message-ID: <CAL_JsqKnw8qL2wJVCFe35bzCazoSv4j6A=o2MPdqXzV7TmvpEg@mail.gmail.com>
References: <1542701330-23466-1-git-send-email-andrei.stefanescu@microchip.com>
 <1542701330-23466-2-git-send-email-andrei.stefanescu@microchip.com>
 <20181204232237.GA16883@bogus> <2600b55c-f8fd-ab82-6372-a75f22e382f8@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2600b55c-f8fd-ab82-6372-a75f22e382f8@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicolas Ferre <Nicolas.Ferre@microchip.com>, Mark Rutland <mark.rutland@arm.com>, Ludovic Desroches <Ludovic.Desroches@microchip.com>, Cristian.Birsan@microchip.com, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wed, Dec 5, 2018 at 5:06 AM <Andrei.Stefanescu@microchip.com> wrote:
>
> Hello Rob,
>
> Thank you for your feedback.
>
> I will add a bit of context regarding the secumod. The
> "atmel,sama5d2-secumod"
> compatible string is not used for loading a driver. It is used by atmel
> securam
> driver (drivers/misc/sram.c) which has access to secumod's registers via:
>
>      syscon_regmap_lookup_by_compatible("atmel,sama5d2-secumod")
>
> So the secumod exports multiple hardware functions, eg: the securam, the
> PIOBU
> pins which can be used as GPIO pins.

Yes, I understand why you want to design it this way, but don't design
your bindings around how 1 OS happens to currently work.

>
> My initial patch had the "microchip,sama5d2-piobu" compatible appended
> to the
> secumod's compatible e.g.:
>
> secumod@fc040000 {
>      compatible = "syscon", "microchip,sama5d2-piobu";

That doesn't look appended to me. The documentation says it should
look like this:

compatible = "atmel,sama5d2-secumod", "syscon";

> ...
>
> Taking into consideration Linus Walleij's advice I arrived to the current
> version. I thought this was a good idea because it separates the secumod
> node
> from the GPIO controller node. Please notice that securam node is already
> separated from secumod node (it is a separate node in the device tree).
>
> I have a few questions because I am not sure of the best approach:
>
> 1. Is it ok to have the GPIO controller as a child node?

Is it a separate h/w block and do you have other child nodes that need
their own resources in DT (interrupts, clocks, etc.)? If these aren't
the case, then no you shouldn't. As it stands, you don't have any
other child nodes, so no you shouldn't have a child node here. Just
add to properties to the existing binding:

secumod@fc040000 {
        compatible = "atmel,sama5d2-secumod", "syscon";
        reg = <0xfc040000 0x100>;
        #gpio-cells = <2>;
        gpio-controller;
};

Now perhaps you have 10 other functions in this block like pinctrl,
clocks, phys, power domains, etc. Then child nodes would be warranted.
But if that's the case, then please write a complete binding for the
secumod block.

> 2. I used simple-mfd because it was the only way I could think of in
> order to
>     get the driver probed.

Sounds like an OS problem that has little to do with the binding. In
any case, if you change a binding which you have, then it needs to be
documented.

> 3. Should I add a register range? I thought that because the driver uses
> syscon
>     it is not necessary to add the register range. Also, the register
> range would
>     have been a subset of the secumod's register range.

If it has one, then yes you should. If it doesn't then it is probably
not a separate h/w block and shouldn't have a child node to begin
with.

Rob
