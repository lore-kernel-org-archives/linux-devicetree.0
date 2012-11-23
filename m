From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3 6/7] usb: chipidea: usbmisc: add mx53 support
Date: Fri, 23 Nov 2012 08:39:39 +0100
Message-ID: <20121123073939.GK10369@pengutronix.de>
References: <1353506793-8354-1-git-send-email-m.grzeschik@pengutronix.de>
 <1353506793-8354-7-git-send-email-m.grzeschik@pengutronix.de>
 <20121123065340.GD22420@nchen-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20121123065340.GD22420@nchen-desktop>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 23, 2012 at 02:53:41PM +0800, Peter Chen wrote:
> On Wed, Nov 21, 2012 at 03:06:32PM +0100, Michael Grzeschik wrote:
> > This adds mx53 as the next user of the usbmisc driver and makes it
> > possible to disable the overcurrent-detection of the internal phy.
> > 
> > Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > ---
> > Changes since v2:
> > * added defines for register offsets and bitmasks
> > * fixed disable_oc option for all ports
> > 
> >  drivers/usb/chipidea/usbmisc_imx.c |   51 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> > 
> > diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
> > index e090e0f..b1811df 100644
> > --- a/drivers/usb/chipidea/usbmisc_imx.c
> > +++ b/drivers/usb/chipidea/usbmisc_imx.c
> > @@ -19,6 +19,13 @@
> >  
> >  #define USB_DEV_MAX 4
> >  
> > +#define MX53_USB_OTG_PHY_CTRL_0_OFFSET	0x08;
> > +#define MX53_USB_UH2_CTRL_OFFSET	0x14;
> > +#define MX53_USB_UH3_CTRL_OFFSET	0x18;
> > +#define MX53_BM_OVER_CUR_DIS_H1		BIT(5)
> > +#define MX53_BM_OVER_CUR_DIS_OTG	BIT(8)
> > +#define MX53_BM_OVER_CUR_DIS_UHx	BIT(30)
> > +
> >  #define MX6_BM_OVER_CUR_DIS		BIT(7)
> 
> As every SoC platform's non-core register mapping is different,
> it is better to use .h to put register bit definition

What do the different register mapping have to do with putting the
definitions in .h files or not?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
