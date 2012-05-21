From: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v2 01/12] usb: otg: add notify_connect_change callback
Date: Mon, 21 May 2012 06:05:56 -0700
Message-ID: <20120521130556.GB18926@kroah.com>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-2-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337592237-5090-2-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2012 at 05:23:46PM +0800, Richard Zhao wrote:
> This let usb phy driver has a chance to change hw settings when connect
> status change.
> 
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  include/linux/usb/otg.h |   13 +++++++++++++
>  1 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/usb/otg.h b/include/linux/usb/otg.h
> index 38ab3f4..385641d 100644
> --- a/include/linux/usb/otg.h
> +++ b/include/linux/usb/otg.h
> @@ -117,6 +117,10 @@ struct usb_phy {
>  	int	(*set_suspend)(struct usb_phy *x,
>  				int suspend);
>  
> +	/* notify phy connect status change */
> +	int	(*notify_connect_change)(struct usb_phy *x,
> +					 int port,
> +					 int connected);
>  };

No, please make this two different callbacks.  As you see in your code
when you implemented this, you really have:
	if (connected) {
		do this...
	} else {
		do that...
	}

So you there is no consolidation in the driver, so just make it 2
callbacks, especially as someone wanted to make connected -1 just for a
tristate, which would be impossible to document properly...

greg k-h


>  
>  
> @@ -252,6 +256,15 @@ usb_phy_set_suspend(struct usb_phy *x, int suspend)
>  }
>  
>  static inline int
> +usb_phy_notify_connect_change(struct usb_phy *x, int port, int connected)
> +{
> +	if (x->notify_connect_change != NULL)
> +		return x->notify_connect_change(x, port, connected);
> +	else
> +		return 0;
> +}
> +
> +static inline int
>  otg_start_srp(struct usb_otg *otg)
>  {
>  	if (otg && otg->start_srp)
> -- 
> 1.7.5.4
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
