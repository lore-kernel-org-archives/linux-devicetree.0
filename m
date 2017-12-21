From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: vf610-zii-dev-rev-b: add interrupts for
 88e1545 PHY
Date: Thu, 21 Dec 2017 14:40:58 +0100
Message-ID: <20171221134058.GA15416@lunn.ch>
References: <20171220231108.GJ10595@n2100.armlinux.org.uk>
 <E1eRnWr-0006VS-1m@rmk-PC.armlinux.org.uk>
 <CACRpkdas5JJ4KHE4g=sPXag=3vQt4TS5EcZBsy=LRfw8tqcgOw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdas5JJ4KHE4g=sPXag=3vQt4TS5EcZBsy=LRfw8tqcgOw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Dec 21, 2017 at 01:32:21PM +0100, Linus Walleij wrote:
> On Thu, Dec 21, 2017 at 12:12 AM, Russell King
> <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> 
> > The 88e1545 PHY has its interrupts wired to the VF610, so we might as
> > well use them.
> >
> > Signed-off-by: Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> > ---
> > This is certainly not correct, as all PHYs on this device share the
> > same interrupt line, but we can't specify the pinmux settings
> > individually on each PHY.  How should this be handled?
> 
> I do not know the details of the Marvell switch.

Hi Linus

The 88e1545 is a discreet quad PHY. It is connected to the switch, but
not integrated into the switch. All its interrupt handling is done
with a GPIO onto the Freescale processor, via a GPIO. There is nothing
DSA related here at all with respect to the interrupt. It is just a
normal GPIO interrupt. What is a bit odd is that it one shared
interrupt for all four PHYs.

What you described with an irqchip inside the switch is what we
actually do for the internal PHYs on Marvell devices. And it is what i
recommend for all DSA drivers. Expose standard IRQs, and let phylib
use them in its normal way.

	  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
