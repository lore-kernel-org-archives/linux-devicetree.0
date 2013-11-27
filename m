From: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 6/9] usb: gadget: s3c-hsotg: get phy bus width from
 phy subsystem
Date: Wed, 27 Nov 2013 12:16:45 -0500
Message-ID: <20131127171645.GE31091@beef>
References: <1385403367-18144-1-git-send-email-matt.porter@linaro.org>
 <1385403367-18144-7-git-send-email-matt.porter@linaro.org>
 <529477DD.8000906@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <529477DD.8000906-l0cyMroinI0@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Paul Zimmerman <paulz-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kamil Debski <k.debski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Linux USB List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux ARM Kernel List <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linaro Patches <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Nov 26, 2013 at 03:58:45PM +0530, Kishon Vijay Abraham I wrote:
> Hi,
> 
> On Monday 25 November 2013 11:46 PM, Matt Porter wrote:
> > Adds support for querying the phy bus width from the generic phy
> > subsystem. Configure UTMI bus width in GUSBCFG based on this value.
> > 
> > Signed-off-by: Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  drivers/usb/gadget/s3c-hsotg.c | 14 +++++++++++++-
> >  drivers/usb/gadget/s3c-hsotg.h |  1 +
> >  2 files changed, 14 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/gadget/s3c-hsotg.c b/drivers/usb/gadget/s3c-hsotg.c
> > index 8dfe33f..be41585 100644
> > --- a/drivers/usb/gadget/s3c-hsotg.c
> > +++ b/drivers/usb/gadget/s3c-hsotg.c
> > @@ -144,6 +144,7 @@ struct s3c_hsotg_ep {
> >   * @regs: The memory area mapped for accessing registers.
> >   * @irq: The IRQ number we are using
> >   * @supplies: Definition of USB power supplies
> > + * @phyif: PHY interface width
> >   * @dedicated_fifos: Set if the hardware has dedicated IN-EP fifos.
> >   * @num_of_eps: Number of available EPs (excluding EP0)
> >   * @debug_root: root directrory for debugfs.
> > @@ -171,6 +172,7 @@ struct s3c_hsotg {
> >  
> >  	struct regulator_bulk_data supplies[ARRAY_SIZE(s3c_hsotg_supply_names)];
> >  
> > +	u32			phyif;
> >  	unsigned int		dedicated_fifos:1;
> >  	unsigned char           num_of_eps;
> >  
> > @@ -2276,7 +2278,7 @@ static void s3c_hsotg_core_init(struct s3c_hsotg *hsotg)
> >  	 */
> >  
> >  	/* set the PLL on, remove the HNP/SRP and set the PHY */
> > -	writel(GUSBCFG_PHYIf16 | GUSBCFG_TOutCal(7) |
> > +	writel(hsotg->phyif | GUSBCFG_TOutCal(7) |
> >  	       (0x5 << 10), hsotg->regs + GUSBCFG);
> >  
> >  	s3c_hsotg_init_fifo(hsotg);
> > @@ -3622,6 +3624,16 @@ static int s3c_hsotg_probe(struct platform_device *pdev)
> >  		goto err_supplies;
> >  	}
> >  
> > +	/* Set default UTMI width */
> > +	hsotg->phyif = GUSBCFG_PHYIf16;
> > +
> > +	/*
> > +	 * If using the generic PHY framework, check if the PHY bus
> > +	 * width is 8-bit and set the phyif appropriately.
> > +	 */
> > +	if (hsotg->phy && (phy_get_bus_width(phy) == 8))
> 
> what if the phy has error value here?

I'm addressing this like the other !IS_ERR checks. In the platform data
case, we'll have an error value here, and need to use the default. Until
the platform data case is removed (those platform board files removed),
we assume (correctly) that they use a phy interface width of 16.

-Matt
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
