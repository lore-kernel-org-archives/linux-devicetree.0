From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 05/12] usb: chipidea: introduce ci_platform_config
Date: Thu, 19 Mar 2015 11:19:29 +0100
Message-ID: <20150319101929.GC9894@pengutronix.de>
References: <1426727963-32280-1-git-send-email-peter.chen@freescale.com>
 <1426727963-32280-6-git-send-email-peter.chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426727963-32280-6-git-send-email-peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 19, 2015 at 09:19:16AM +0800, Peter Chen wrote:
> It is used to configure controller parameters according to
> platform data, like speed, interrupt threshold, stream mode, etc.
> 
> Signed-off-by: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/chipidea/ci.h   |  2 ++
>  drivers/usb/chipidea/core.c | 57 +++++++++++++++++++++++++++++++--------------
>  drivers/usb/chipidea/host.c |  6 +----
>  3 files changed, 43 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
> index aeec5f0..888606b 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -426,4 +426,6 @@ u8 hw_port_test_get(struct ci_hdrc *ci);
>  int hw_wait_reg(struct ci_hdrc *ci, enum ci_hw_regs reg, u32 mask,
>  				u32 value, unsigned int timeout_ms);
>  
> +void ci_platform_config(struct ci_hdrc *ci, int usb_mode);
> +
>  #endif	/* __DRIVERS_USB_CHIPIDEA_CI_H */
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 4d79392..f713e32 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -403,6 +403,44 @@ static int ci_usb_phy_init(struct ci_hdrc *ci)
>  	return ret;
>  }
>  
> +
> +/**
> + * ci_platform_config: do controller configure
> + * @ci: the controller
> + * @usb_mode: the usb mode
> + *
> + */
> +void ci_platform_config(struct ci_hdrc *ci, int usb_mode)
> +{
> +	if (usb_mode == USBMODE_CM_DC) {
> +		if (ci->platdata->flags & CI_HDRC_DISABLE_DEVICE_STREAMING)
> +			hw_write(ci, OP_USBMODE, USBMODE_CI_SDIS,
> +					USBMODE_CI_SDIS);
> +
> +		/*
> +		 * Set interrupt interval for device mode
> +		 * host set ITC according to ehci-hcd module
> +		 * parameter log2_irq_thresh
> +		 */
> +		hw_write(ci, OP_USBCMD, 0xff0000,
> +			ci->platdata->gadget_itc_setting << 16);
> +	} else if (usb_mode == USBMODE_CM_HC) {
> +		if (ci->platdata->flags & CI_HDRC_DISABLE_HOST_STREAMING)
> +			hw_write(ci, OP_USBMODE, USBMODE_CI_SDIS,
> +					USBMODE_CI_SDIS);
> +	} else {
> +		dev_warn(ci->dev, "USB mode in still not set\n");
> +	}
> +
> +	if (ci->platdata->flags & CI_HDRC_FORCE_FULLSPEED) {
> +		if (ci->hw_bank.lpm)
> +			hw_write(ci, OP_DEVLC, DEVLC_PFSC, DEVLC_PFSC);
> +		else
> +			hw_write(ci, OP_PORTSC, PORTSC_PFSC, PORTSC_PFSC);
> +	}
> +
> +}
> +
>  /**
>   * hw_controller_reset: do controller reset
>   * @ci: the controller
> @@ -447,35 +485,20 @@ int hw_device_reset(struct ci_hdrc *ci)
>  		ci->platdata->notify_event(ci,
>  			CI_HDRC_CONTROLLER_RESET_EVENT);
>  
> -	if (ci->platdata->flags & CI_HDRC_DISABLE_DEVICE_STREAMING)
> -		hw_write(ci, OP_USBMODE, USBMODE_CI_SDIS, USBMODE_CI_SDIS);
> -
> -	if (ci->platdata->flags & CI_HDRC_FORCE_FULLSPEED) {
> -		if (ci->hw_bank.lpm)
> -			hw_write(ci, OP_DEVLC, DEVLC_PFSC, DEVLC_PFSC);
> -		else
> -			hw_write(ci, OP_PORTSC, PORTSC_PFSC, PORTSC_PFSC);
> -	}
> -
>  	/* USBMODE should be configured step by step */
>  	hw_write(ci, OP_USBMODE, USBMODE_CM, USBMODE_CM_IDLE);
>  	hw_write(ci, OP_USBMODE, USBMODE_CM, USBMODE_CM_DC);
>  	/* HW >= 2.3 */
>  	hw_write(ci, OP_USBMODE, USBMODE_SLOM, USBMODE_SLOM);
>  
> -	/*
> -	 * Set interrupt interval for device mode
> -	 * host set ITC according to ehci-hcd module parameter log2_irq_thresh
> -	 */
> -	hw_write(ci, OP_USBCMD, 0xff0000,
> -		ci->platdata->gadget_itc_setting << 16);
> -

This codepath was added by patch 02 "usb: chipidea: set ITC to 0 for
device mode". You should add it after this one, so this code gets added
directly to its final position.

>  	if (hw_read(ci, OP_USBMODE, USBMODE_CM) != USBMODE_CM_DC) {
>  		pr_err("cannot enter in %s device mode", ci_role(ci)->name);
>  		pr_err("lpm = %i", ci->hw_bank.lpm);
>  		return -ENODEV;
>  	}
>  
> +	ci_platform_config(ci, USBMODE_CM_DC);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> index b262c1c..c4f76b7 100644
> --- a/drivers/usb/chipidea/host.c
> +++ b/drivers/usb/chipidea/host.c
> @@ -141,11 +141,7 @@ static int host_start(struct ci_hdrc *ci)
>  		}
>  	}
>  
> -	if (ci->platdata->flags & CI_HDRC_FORCE_FULLSPEED)
> -		hw_write(ci, OP_PORTSC, PORTSC_PFSC, PORTSC_PFSC);
> -
> -	if (ci->platdata->flags & CI_HDRC_DISABLE_HOST_STREAMING)
> -		hw_write(ci, OP_USBMODE, USBMODE_CI_SDIS, USBMODE_CI_SDIS);
> +	ci_platform_config(ci, USBMODE_CM_HC);
>  
>  	return ret;
>  
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
