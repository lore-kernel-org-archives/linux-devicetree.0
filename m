From: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 4/9] usb: chipidea: ci13xxx-imx: add "dr_mode" property
 to device tree bindings
Date: Mon, 26 Nov 2012 17:46:27 +0800
Message-ID: <20121126094626.GB15740@nchen-desktop>
References: <1352909950-32555-1-git-send-email-m.grzeschik@pengutronix.de>
 <1352909950-32555-5-git-send-email-m.grzeschik@pengutronix.de>
 <878va17oii.fsf@ashishki-desk.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <878va17oii.fsf-qxRn5AmX6ZD9BXuAQUXR0fooFf0ArEBIu+b9c/7xato@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Nov 16, 2012 at 01:53:09PM +0200, Alexander Shishkin wrote:
> Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> writes:
> 
> > From: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> >
> > Its necessary to limit a hostonly soc to its single role, since
> > debugging has shown that reading on the "CAP_DCCPARAMS" register inside
> > a host-only port, what ci_hdrc_gadget_init does, can lead to an
> > instable behaviour of the IC.
> 
> Probably typos: should be "it's" and "unstable".
> 
> [snip]
> 
> > --- a/drivers/usb/chipidea/ci13xxx_imx.c
> > +++ b/drivers/usb/chipidea/ci13xxx_imx.c
> > @@ -237,6 +237,8 @@ static int __devinit ci13xxx_imx_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >  
> > +	ci13xxx_get_dr_mode(pdev->dev.of_node, pdata);
> > +
> >  	plat_ci = ci13xxx_add_device(&pdev->dev,
> >  				pdev->resource, pdev->num_resources,
> >  				pdata);
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index b50b77a..3e3e159 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -63,6 +63,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/slab.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/of_platform.h>
> >  #include <linux/usb/ch9.h>
> >  #include <linux/usb/gadget.h>
> >  #include <linux/usb/otg.h>
> > @@ -521,6 +522,23 @@ void ci13xxx_remove_device(struct platform_device *pdev)
> >  }
> >  EXPORT_SYMBOL_GPL(ci13xxx_remove_device);
> >  
> > +void ci13xxx_get_dr_mode(struct device_node *of_node, struct ci13xxx_platform_data *pdata)
> > +{
> > +	const unsigned char *dr_mode;
> > +
> > +	dr_mode = of_get_property(of_node, "dr_mode", NULL);
> > +	if (!dr_mode)
> > +		return;
> > +
> > +	if (!strcmp(dr_mode, "host"))
> > +		pdata->flags |= CI13XXX_DR_MODE_HOST;
> > +	else if (!strcmp(dr_mode, "peripheral"))
> > +		pdata->flags |= CI13XXX_DR_MODE_PERIPHERAL;
> > +	else if (!strcmp(dr_mode, "otg"))
> > +		pdata->flags |= CI13XXX_DR_MODE_HOST | CI13XXX_DR_MODE_PERIPHERAL;
> > +}
> > +EXPORT_SYMBOL_GPL(ci13xxx_get_dr_mode);
> > +
> 
> I'd prefer this function to live in ci13xxx_imx, since that's where it's
> used and it doesn't really need anything from core.c anyway. Or maybe it
> would make sense to make it even more generic (for other devitetree
> users), since you're saying that other drivers are using this already.
> 
> Looks good to me otherwise.

I think it supplies a way that the platform can override the usb role,
only freescale uses it, but also other platforms may use it. It is a
generic feature, other chipidea users may need it.

> 
> Regards,
> --
> Alex
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 

Best Regards,
Peter Chen

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
