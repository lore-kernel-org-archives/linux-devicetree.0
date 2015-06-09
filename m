From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 07/22] usb: chipidea: udc: set usb gadeget's otg
 config
Date: Tue, 9 Jun 2015 16:03:38 +0300
Message-ID: <20150609160338.252c8554@rockdesk>
References: <1433775737-9816-1-git-send-email-jun.li@freescale.com>
	<1433775737-9816-8-git-send-email-jun.li@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1433775737-9816-8-git-send-email-jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, macpaul-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org



On Mon, 8 Jun 2015 23:02:02 +0800
Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:

> Set gadget's otg features according to controller's capability and usb
> property in device tree.
> 
> Signed-off-by: Li Jun <jun.li-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  drivers/usb/chipidea/core.c  | 16 ++++++++++++++++
>  drivers/usb/chipidea/udc.c   | 20 +++++++++++++++++++-
>  include/linux/usb/chipidea.h |  4 ++++
>  3 files changed, 39 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> index 74fea4f..a8ca9d7 100644
> --- a/drivers/usb/chipidea/core.c
> +++ b/drivers/usb/chipidea/core.c
> @@ -588,6 +588,22 @@ static int ci_get_platdata(struct device *dev,
>  				of_usb_host_tpl_support(dev->of_node);
>  	}
>  
> +	if (platdata->dr_mode == USB_DR_MODE_OTG) {
> +		if (!platdata->otg_rev) {
> +			platdata->otg_rev =
> +				of_usb_otg_rev_number(dev->of_node);
> +		}
> +		if (!platdata->srp_support)
> +			platdata->srp_support =
> +				of_usb_otg_srp_support(dev->of_node);
> +		if (!platdata->hnp_support)
> +			platdata->hnp_support =
> +				of_usb_otg_hnp_support(dev->of_node);
> +		if (!platdata->adp_support)
> +			platdata->adp_support =
> +				of_usb_otg_adp_support(dev->of_node);

where do you check if the hardware really supports these features.
or is it that this hardware always supports these?

> +	}
> +
>  	if (of_usb_get_maximum_speed(dev->of_node) == USB_SPEED_FULL)
>  		platdata->flags |= CI_HDRC_FORCE_FULLSPEED;
>  
> diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
> index 764f668..5d2c6e8 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1821,6 +1821,24 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
>  }
>  
>  /**
> + * udc_update_otg_config: update gadget otg config
> + * * @ci: chipidea controller
> + */
> +static void udc_update_otg_config(struct ci_hdrc *ci)
> +{
> +	if (!ci->is_otg)
> +		return;
> +
> +	ci->gadget.otg_rev = ci->platdata->otg_rev;
> +	ci->gadget.srp_support = ci->platdata->srp_support;
> +	ci->gadget.hnp_support = ci->platdata->hnp_support;
> +	ci->gadget.adp_support = ci->platdata->adp_support;
> +	if (ci->gadget.srp_support || ci->gadget.hnp_support ||
> +					ci->gadget.adp_support)
> +		ci->gadget.is_otg = 1;
> +}
> +
> +/**
>   * udc_start: initialize gadget role
>   * @ci: chipidea controller
>   */
> @@ -1834,9 +1852,9 @@ static int udc_start(struct ci_hdrc *ci)
>  	ci->gadget.ops          = &usb_gadget_ops;
>  	ci->gadget.speed        = USB_SPEED_UNKNOWN;
>  	ci->gadget.max_speed    = USB_SPEED_HIGH;
> -	ci->gadget.is_otg       = ci->is_otg ? 1 : 0;
>  	ci->gadget.name         = ci->platdata->name;
>  
> +	udc_update_otg_config(ci);

where is this function defined?

>  	INIT_LIST_HEAD(&ci->gadget.ep_list);
>  
>  	/* alloc resources */
> diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
> index ab94f78..c6aa3a4 100644
> --- a/include/linux/usb/chipidea.h
> +++ b/include/linux/usb/chipidea.h
> @@ -34,7 +34,11 @@ struct ci_hdrc_platform_data {
>  #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
>  	void	(*notify_event) (struct ci_hdrc *ci, unsigned event);
>  	struct regulator	*reg_vbus;
> +	unsigned		otg_rev;

I think we should have a dedicated type of otg_rev instead of unsigned
because it is not plain integer but BCD.

>  	bool			tpl_support;
> +	bool			srp_support;
> +	bool			hnp_support;
> +	bool			adp_support;
>  };
>  
>  /* Default offset of capability registers */

cheers,
-roger
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
