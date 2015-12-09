From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: misc: generic_onboard_hub: add generic onboard USB HUB driver
Date: Wed, 09 Dec 2015 10:10:51 +0100
Message-ID: <13697561.KqG59a0ceW@wuerfel>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com> <20151209085021.GF941@shlinux2> <1449651460.3118.22.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449651460.3118.22.camel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?utf-8?B?UGF3ZcWC?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 09 December 2015 09:57:40 Lucas Stach wrote:
> Am Mittwoch, den 09.12.2015, 16:50 +0800 schrieb Peter Chen:
> > On Tue, Dec 08, 2015 at 08:36:00AM -0700, Mathieu Poirier wrote:
> > > On 7 December 2015 at 18:37, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > > +
> > > > +       if (dev->of_node) {
> > > > +               struct device_node *node = dev->of_node;
> > > > +
> > > > +               hub_data->clk = devm_clk_get(dev, "external_clk");
> > > > +               if (IS_ERR(hub_data->clk)) {
> > > > +                       dev_dbg(dev, "Can't get external clock: %ld\n",
> > > > +                                       PTR_ERR(hub_data->clk));
> > > > +               }
> > > 
> > > Is the intended behaviour to keep going here event when there is an
> > > error?  Can the "hub_data" really work without a clock?
> > 
> > Yes, some HUB may work with fixed 24M OSC at the board, but they need to
> > reset through external IO, so the clock is not need at this case, but
> > reset pin is mandatory.
> > 
> If the hub always requires a clock it must not be optional. If you have
> a fixed 24MHz clock on board add this to the DT as a fixed-clock and use
> it as an input to the hub.

I think it's fine to make the clock optional in the sense that you only
need to list non-fixed clocks that have to be enabled and or controlled.

Which reminds me, should the driver call clk_set_rate()? It currently
doesn't, but other machines might need that.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
