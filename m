Return-Path: <delicious.quinoa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20140802002301.GC11170@amd.pavel.ucw.cz>
References: <1406932118-13885-1-git-send-email-atull@opensource.altera.com>
	<1406932118-13885-3-git-send-email-atull@opensource.altera.com>
	<20140802002301.GC11170@amd.pavel.ucw.cz>
Date: Tue, 5 Aug 2014 12:11:18 -0500
Message-ID: <CANk1AXT1mfyiC0WDSBMKRYn-WFWM0DzqTUWqtuTnKWa9dTMdfQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] fpga bus driver
From: Alan Tull <delicious.quinoa@gmail.com>
Content-Type: text/plain; charset=UTF-8
To: Pavel Machek <pavel@denx.de>
Cc: atull@opensource.altera.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>, linux-kernel <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Rob Herring <robh+dt@kernel.org>, Grant Likely <grant.likely@linaro.org>, Mark Brown <broonie@kernel.org>, Philip Balister <philip@balister.org>, Alessandro Rubini <rubini@gnudd.com>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, Jason Cooper <jason@lakedaemon.net>, Kyle Teske <kyle.teske@ni.com>, Nicolas Pitre <nico@linaro.org>, Felipe Balbi <balbi@ti.com>, Mauro Carvalho Chehab <m.chehab@samsung.com>, David Brown <davidb@codeaurora.org>, Rob Landley <rob@landley.net>, "David S. Miller" <davem@davemloft.net>, Cesar Eduardo Barros <cesarb@cesarb.net>, Samuel Ortiz <sameo@linux.intel.com>, Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, dinguyen@opensource.altera.com, yvanderv@opensource.altera.com
List-ID: <devicetree@vger.kernel.org>

On Fri, Aug 1, 2014 at 7:23 PM, Pavel Machek <pavel@denx.de> wrote:
>
> Hi!
>
> > Here's a simple example. Start with:
> >   * the altera-gpio driver built in to the kernel but not in the
> >     device tree.
> >   * raw fpga image at /lib/firmware/soc_system.rbf
> >   * Load appropriate device tree overlay in configfs by doing
> >     $ mkdir /config/device-tree/overlays/1
> >     $ echo socfpga_overlay.dtbo > /config/device-tree/overlays/1/path
> >   * This results in the FPGA getting programmed and the altera
> >     gpio driver getting probed.
>
> Nice!

Thanks!

>
> > +/* Find the fpga manager that is pointed to by a phandle */
> > +struct fpga_manager *of_fpga_mgr_dev_lookup(struct device_node *node,
> > +                                         const char *mgr_property,
> > +                                         int *ret)
> > +{
> > +     struct fpga_manager *mgr;
> > +     struct device_node *mgr_node;
> > +
> > +     mgr_node = of_parse_phandle(node, mgr_property, 0);
> > +
> > +     if (!mgr_node) {
> > +             *ret = -ENODEV;
> > +             return NULL;
>
> Could IS_ERR_OR_NULL() and friends be used to get reasonable calling

Yes, that would be much simpler here.  I could get rid of the 'ret'.

> convention?
>
> Thanks,
>                                                                         Pavel
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
