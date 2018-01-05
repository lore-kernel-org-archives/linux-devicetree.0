From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: r7s72100: add USB device to device tree
Date: Fri, 5 Jan 2018 14:03:29 +0100
Message-ID: <CAMuHMdVq6FcCE0G5c3fm-GvAfORyNy9zwO5j-Ph-4oTN9+wsvQ@mail.gmail.com>
References: <20180104200150.11352-1-chris.brandt@renesas.com>
 <20180104200150.11352-4-chris.brandt@renesas.com> <CAMuHMdWmoi3D9-XGXjefCsB2SgNjAH_G6uteSaTiWAN_krXhng@mail.gmail.com>
 <SG2PR06MB11653DA8D7101215AECE3B698A1C0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <SG2PR06MB11653DA8D7101215AECE3B698A1C0-ESzmfEwOt/xoAsOJh7vwSm0DtJ1/0DrXvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, USB list <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Chris,

On Fri, Jan 5, 2018 at 1:54 PM, Chris Brandt <Chris.Brandt-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org> wrote:
> On Friday, January 05, 2018, Geert Uytterhoeven wrote:
>> > +               interrupts = <GIC_SPI (73-32) IRQ_TYPE_LEVEL_HIGH>;
>>
>> "41", all other interrupt properties already have the SPI offset
>> subtracted?
>
> The actual HW vector number in the hardware manual is '73'.
> As you know, you need to subtract 32 for the number you use in the
> device tree.
> But then...the number goes back to '73' when you look at it in
> /proc/interrupts.

Having an identical number in /proc/interrupts is a coincidence.
These numbers are virtual, and may change even across reboots.

> So it was confusing to people on what number you needed to use.
>
> Therefore in the RZ/A1 BSP, I was doing (xx-32) so at least people could
> see the relationship between what's in the hardware manual and what
> gets put into the device tree.
>
> So, if doing (73-32) looks wrong, I can change it back to '41' for the
> upstream version.
>
> Any opinions????

Not really, except that no single .dts(i) file seems to have "- 32".

Note that e.g. the R-Car Gen3 manuals do list both "interrupt ID"
and "SGI, PPI, or SPI No" in the documentation for INTC-AP.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
