From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: vf610-zii-dev-rev-b: add interrupts for
 88e1545 PHY
Date: Thu, 21 Dec 2017 13:32:21 +0100
Message-ID: <CACRpkdas5JJ4KHE4g=sPXag=3vQt4TS5EcZBsy=LRfw8tqcgOw@mail.gmail.com>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk> <E1eRnWr-0006VS-1m@rmk-PC.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1eRnWr-0006VS-1m-eh5Bv4kxaXIk46pC+1QYvQNdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 12:12 AM, Russell King
<rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:

> The 88e1545 PHY has its interrupts wired to the VF610, so we might as
> well use them.
>
> Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> ---
> This is certainly not correct, as all PHYs on this device share the
> same interrupt line, but we can't specify the pinmux settings
> individually on each PHY.  How should this be handled?

I do not know the details of the Marvell switch.

Sorry for any possible misunderstandings below.

What I did with the Realtek switch I was playing around
with was to create a separate irqchip, also in the device tree,
embedded inside the DSA switch, then referenced the
IRQs from that chip as 0, 1 .. n.

The patches are here:
DTS:
https://marc.info/?l=linux-netdev&m=150992420713391&w=2
Driver:
https://marc.info/?l=linux-netdev&m=150992421113393&w=2

Note that this RFC is wrong: it assigns the IRQs to ports
instead of PHYs, but the idea with an IRQchip inside the
DSA is pretty solid IMO. (I will rewrite it using your method
of a separate mdio bus node and phy-handle references.)

Anyway I was inspired to this model from certain PCI bridges that
contain an IRQ demuxer and thus instantiate an irqchip for
this, that is then part of the bridge itself.

Then for the pin control, I guess the irqchip inside the bridge
should be the entity taking the IRQ from the GPIO-backed
irq controller and also the pin control handle.  As pin control
handles are tied to Linux devices, that requires it
to be a device proper though. I don't know if it's possible
to properly spawn a device for this irqchip from the switch,
but I guess it is what I would try.

I hope this helps.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
