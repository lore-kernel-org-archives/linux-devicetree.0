From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/3] usb: misc: generic_onboard_hub: add generic onboard
 USB HUB driver
Date: Wed, 09 Dec 2015 09:57:40 +0100
Message-ID: <1449651460.3118.22.camel@pengutronix.de>
References: <1449538670-7954-1-git-send-email-peter.chen@freescale.com>
	 <1449538670-7954-2-git-send-email-peter.chen@freescale.com>
	 <CANLsYkwfLSQKEw1a-Y_dguu-yutnTeQv73cMxPFooMjzTv4n1A@mail.gmail.com>
	 <20151209085021.GF941@shlinux2>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151209085021.GF941@shlinux2>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Mathieu Poirier <mathieu.poirier-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, =?UTF-8?Q?Pawe=C5=82?= Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patryk-6+2coLtxvIyvnle+31E0rA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Am Mittwoch, den 09.12.2015, 16:50 +0800 schrieb Peter Chen:
> On Tue, Dec 08, 2015 at 08:36:00AM -0700, Mathieu Poirier wrote:
> > On 7 December 2015 at 18:37, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > > +
> > > +       if (dev->of_node) {
> > > +               struct device_node *node = dev->of_node;
> > > +
> > > +               hub_data->clk = devm_clk_get(dev, "external_clk");
> > > +               if (IS_ERR(hub_data->clk)) {
> > > +                       dev_dbg(dev, "Can't get external clock: %ld\n",
> > > +                                       PTR_ERR(hub_data->clk));
> > > +               }
> > 
> > Is the intended behaviour to keep going here event when there is an
> > error?  Can the "hub_data" really work without a clock?
> 
> Yes, some HUB may work with fixed 24M OSC at the board, but they need to
> reset through external IO, so the clock is not need at this case, but
> reset pin is mandatory.
> 
If the hub always requires a clock it must not be optional. If you have
a fixed 24MHz clock on board add this to the DT as a fixed-clock and use
it as an input to the hub.

> > > +       }
> > > +
> > > +       if (gpiod_reset) {
> > > +               /* Sanity check */
> > > +               if (duration_us > 1000000)
> > > +                       duration_us = 50;
> > > +               usleep_range(duration_us, duration_us + 100);
> > > +               gpiod_set_value(gpiod_reset, reset_pol ? 0 : 1);
> > 
> > What are these hard-coded values?  Shouldn't this be taken from the
> > DT?  If not then some comments explaining the values would be
> > appreciated.
> 
> Yes, I did it wrongly, thanks.
> 
> > > diff --git a/include/linux/usb/generic_onboard_hub.h b/include/linux/usb/generic_onboard_hub.h
> > > new file mode 100644
> > > index 0000000..1b70ccc
> > > --- /dev/null
> > > +++ b/include/linux/usb/generic_onboard_hub.h
> > > @@ -0,0 +1,11 @@
> > > +#ifndef __LINUX_USB_GENERIC_HUB_H
> > > +#define __LINUX_USB_GENERIC_HUB_H
> > > +
> > > +struct usb_hub_generic_platform_data {
> > > +       int gpio_reset;
> > > +       int gpio_reset_polarity;
> > > +       int gpio_reset_duration_us;
> > > +       struct clk *ext_clk;
> > > +};
> > 
> > Please document this structure in accordance with kernel documentation
> > standards.
> > 
> 
> Thanks, it should be.
> 

-- 
Pengutronix e.K.             | Lucas Stach                 |
Industrial Linux Solutions   | http://www.pengutronix.de/  |

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
