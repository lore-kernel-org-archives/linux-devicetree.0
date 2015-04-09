From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/4] extcon: usb-gpio: add support for VBUS detection
Date: Thu, 09 Apr 2015 11:12:34 +0900
Message-ID: <5525E012.5050207@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-3-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1427980385-21285-3-git-send-email-r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, rogerq-l0cyMroinI0@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Robert,

On 04/02/2015 10:13 PM, Robert Baldyga wrote:
> This patch adds VBUS pin detection support to extcon-usb-gpio driver.
> It allows to use this driver with boards which have both VBUS and ID
> pins, or only one of them.
> 
> Following table of states presents relationship between this signals
> and detected cable type:
> 
>  State              |    ID   |   VBUS
> ----------------------------------------
>  [1] USB            |    H    |    H
>  [2] none           |    H    |    L
>  [3] USB & USB-HOST |    L    |    H
>  [4] USB-HOST       |    L    |    L
> 
> In case we have only one of these signals:
> - VBUS only - we want to distinguish between [1] and [2], so ID is always 1.
> - ID only - we want to distinguish between [1] and [4], so VBUS = ID.
> 
> Signed-off-by: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  drivers/extcon/extcon-usb-gpio.c | 169 +++++++++++++++++++++++++++------------
>  1 file changed, 119 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index f6aa99d..baf7add 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -32,7 +32,9 @@ struct usb_extcon_info {
>  	struct extcon_dev *edev;
>  
>  	struct gpio_desc *id_gpiod;
> +	struct gpio_desc *vbus_gpiod;
>  	int id_irq;
> +	int vbus_irq;
>  
>  	unsigned long debounce_jiffies;
>  	struct delayed_work wq_detcable;
> @@ -52,40 +54,51 @@ static const char *usb_extcon_cable[] = {
>  	NULL,
>  };
>  
> +/*
> + * "USB" = VBUS and "USB-HOST" = !ID, so we have:
> + *
> + *  State              |    ID   |   VBUS
> + * ----------------------------------------
> + *  [1] USB            |    H    |    H
> + *  [2] none           |    H    |    L
> + *  [3] USB & USB-HOST |    L    |    H
> + *  [4] USB-HOST       |    L    |    L
> + *
> + * In case we have only one of these signals:
> + * - VBUS only - we want to distinguish between [1] and [2], so ID is always 1.
> + * - ID only - we want to distinguish between [1] and [4], so VBUS = ID.
> + */
> +
>  static void usb_extcon_detect_cable(struct work_struct *work)
>  {
>  	int id;
> +	int vbus;
>  	struct usb_extcon_info *info = container_of(to_delayed_work(work),
>  						    struct usb_extcon_info,
>  						    wq_detcable);
>  
> -	/* check ID and update cable state */
> -	id = gpiod_get_value_cansleep(info->id_gpiod);
> -	if (id) {
> -		/*
> -		 * ID = 1 means USB HOST cable detached.
> -		 * As we don't have event for USB peripheral cable attached,
> -		 * we simulate USB peripheral attach here.
> -		 */
> +	/* check ID and VBUS and update cable state */
> +
> +	id = info->id_gpiod ?
> +		gpiod_get_value_cansleep(info->id_gpiod) : 1;
> +
> +	vbus = info->vbus_gpiod ?
> +		gpiod_get_value_cansleep(info->vbus_gpiod) : id;
> +
> +	/* at first we clean states which are no longer active */
> +	if (id)
>  		extcon_set_cable_state(info->edev,
> -				       usb_extcon_cable[EXTCON_CABLE_USB_HOST],
> -				       false);
> +			usb_extcon_cable[EXTCON_CABLE_USB_HOST], false);
> +	if (!vbus)
>  		extcon_set_cable_state(info->edev,
> -				       usb_extcon_cable[EXTCON_CABLE_USB],
> -				       true);
> -	} else {
> -		/*
> -		 * ID = 0 means USB HOST cable attached.
> -		 * As we don't have event for USB peripheral cable detached,
> -		 * we simulate USB peripheral detach here.
> -		 */
> +			usb_extcon_cable[EXTCON_CABLE_USB], false);
> +
> +	if (!id)
>  		extcon_set_cable_state(info->edev,
> -				       usb_extcon_cable[EXTCON_CABLE_USB],
> -				       false);
> +				usb_extcon_cable[EXTCON_CABLE_USB_HOST], true);
> +	if (vbus)
>  		extcon_set_cable_state(info->edev,
> -				       usb_extcon_cable[EXTCON_CABLE_USB_HOST],
> -				       true);
> -	}
> +			usb_extcon_cable[EXTCON_CABLE_USB], true);
>  }

Looks good to me of this patch.

But, I have one question about case[3]

If id is low and vbus is high, this patch will update the state of both USB and USB-HOST cable as attached state.
Is it possible that two different cables (both USB and USB-HOST) are connected to one port simultaneously?


> + * "USB" = VBUS and "USB-HOST" = !ID, so we have:
> + *
> + *  State              |    ID   |   VBUS
> + * ----------------------------------------
> + *  [1] USB            |    H    |    H
> + *  [2] none           |    H    |    L
> + *  [3] USB & USB-HOST |    L    |    H
> + *  [4] USB-HOST       |    L    |    L
> + *

[snip]

Thanks,
Chanwoo Choi

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
