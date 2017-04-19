From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC 2/2] mux: mmio-based syscon mux controller
Date: Wed, 19 Apr 2017 13:50:13 +0200
Message-ID: <1492602613.2970.92.camel@pengutronix.de>
References: <20170413154812.19597-1-p.zabel@pengutronix.de>
         <20170413154812.19597-2-p.zabel@pengutronix.de>
         <58fd5844-f24a-37cc-be81-26a716251860@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <58fd5844-f24a-37cc-be81-26a716251860-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Steve Longerbeam <slongerbeam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, 2017-04-13 at 18:09 -0700, Steve Longerbeam wrote:
> 
> On 04/13/2017 08:48 AM, Philipp Zabel wrote:
> > This adds a driver for mmio-based syscon multiplexers controlled by a
> > single bitfield in a syscon register range.
> >
> > Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> >   drivers/mux/Kconfig      |  13 +++++
> >   drivers/mux/Makefile     |   1 +
> >   drivers/mux/mux-syscon.c | 130 +++++++++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 144 insertions(+)
> >   create mode 100644 drivers/mux/mux-syscon.c
> >
> > diff --git a/drivers/mux/Kconfig b/drivers/mux/Kconfig
> > index 86668b4d2fc52..a5e6a3b01ac24 100644
> > --- a/drivers/mux/Kconfig
> > +++ b/drivers/mux/Kconfig
> > @@ -43,4 +43,17 @@ config MUX_GPIO
> >   	  To compile the driver as a module, choose M here: the module will
> >   	  be called mux-gpio.
> >   
> > +config MUX_SYSCON
> 
> my preference would be CONFIG_MUX_MMIO.
> 
> > +	tristate "MMIO bitfield-controlled Multiplexer"
> 
> "MMIO register bitfield-controlled Multiplexer"
> 
> The rest looks good to me.

I'll change those. mux-syscon.c should probably be renamed to
mux-mmio.c, too.

regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
