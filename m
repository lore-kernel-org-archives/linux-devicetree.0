From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/7] USB: chipidea: add PTW, PTS and STS handling
Date: Thu, 6 Jun 2013 12:54:02 +0200
Message-ID: <20130606105402.GA20751@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
 <1370025529-7414-4-git-send-email-mgr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370025529-7414-4-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

On Fri, May 31, 2013 at 08:38:45PM +0200, Michael Grzeschik wrote:
> From: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> This patch makes it possible to configure the PTW, PTS and STS bits
> inside the portsc register for host and device mode before the driver
> starts and the phy can be addressed as hardware implementation is
> designed.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> ---
>  .../devicetree/bindings/usb/ci13xxx-imx.txt        |  5 +++
>  drivers/usb/chipidea/bits.h                        | 15 ++++++-
>  drivers/usb/chipidea/core.c                        | 49 ++++++++++++++++++++++
>  include/linux/usb/chipidea.h                       |  1 +
>  4 files changed, 69 insertions(+), 1 deletion(-)
> 

[snip]

> diff --git a/drivers/usb/chipidea/bits.h b/drivers/usb/chipidea/bits.h
> index 050de85..93efe4e 100644
> --- a/drivers/usb/chipidea/bits.h
> +++ b/drivers/usb/chipidea/bits.h

[snip]

>  /**
>   * hw_device_reset: resets chip (execute without interruption)
>   * @ci: the controller
> @@ -369,6 +410,9 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	if (!dev->of_node && dev->parent)
> +		dev->of_node = dev->parent->of_node;
> +
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(base))
> @@ -408,6 +452,9 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	if (!ci->platdata->phy_mode)
> +		ci->platdata->phy_mode = of_usb_get_phy_mode(dev->of_node);
> +
>  	/* initialize role(s) before the interrupt is requested */
>  	ret = ci_hdrc_host_init(ci);
>  	if (ret)
> @@ -434,6 +481,8 @@ static int ci_hdrc_probe(struct platform_device *pdev)
>  			: CI_ROLE_GADGET;
>  	}
>  
> +	hw_phymode_configure(ci);
> +

I just realised that this call has to be moved to hw_device_reset. As
otherwise we will loose the configuration on any OTG case while changing
from Host to Device and vice versa. The datasheet says that its value
got reset on every controller reset. I will fix it in the next series.

>  	ret = ci_role_start(ci, ci->role);
>  	if (ret) {
>  		dev_err(dev, "can't start %s role\n", ci_role(ci)->name);


Michael

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
