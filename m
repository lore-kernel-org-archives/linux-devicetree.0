From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: realview: remove eb-mp clcd IRQ
Date: Thu, 21 Dec 2017 23:08:50 +0100
Message-ID: <CACRpkdbCWZB1ZkrdGe0s0GfNVWEYY+NThy4ce-+SBtU-s=WNbQ@mail.gmail.com>
References: <20171221213146.3146805-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171221213146.3146805-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 10:31 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:

> We get a dtc warning about the CLCD interrupt being invalid:
>
> arch/arm/boot/dts/arm-realview-eb-11mp-ctrevb.dtb: Warning (interrupts_property): interrupts size is (8), expected multiple of 12 in /fpga/charlcd@10008000
>
> According to the datasheet I found and the old board file, this
> line is not connected, so I'm removing the respective properties here.
>
> Link: http://infocenter.arm.com/help/index.jsp?topic=/com.arm.doc.dui0411d/index.html
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

There is some confusion here. There is CLCD "Color LCD"
which is just a code name for PrimeCell PL111 and there is the actual
character LCD which is a hardware thin to talk to a character LCD with
some characters on.

> diff --git a/arch/arm/boot/dts/arm-realview-eb-mp.dtsi b/arch/arm/boot/dts/arm-realview-eb-mp.dtsi

So this DTS is for the ARM 11 MP core tile which is described in
DUI0318F. It doesn't even list an IRQ for the character LCD.

>  &charlcd {
> -       interrupt-parent = <&intc>;
> -       interrupts = <0  IRQ_TYPE_LEVEL_HIGH>;

This was probably me thinking to go back and fill in the right
IRQ and forgetting to actually do it. Sorry :(

> +       /* CLCD is not connected here */

Call it character LCD instead to avoid confusion please.

> +       /delete-property/interrupt-parent;
> +       /delete-property/interrupts;

I don't understand this delete-property business (first time
I see it, but the top level
DTSI (arm-realview-eb.dtsi) does not define any interrupt
so can't you just delete this whole &charlcd?

I do think the reference design has a character LCD, and I
do think it has an interrupt, it's just undocumented so
someone with this board would have to test it manually
to figure out which line it is. Whoever uses this design
will get to it if ever.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
