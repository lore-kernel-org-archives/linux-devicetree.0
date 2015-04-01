From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 3/4] extcon: usb-gpio: make debounce value configurable
 in devicetree
Date: Wed, 1 Apr 2015 14:32:32 +0300
Message-ID: <551BD750.4090901@ti.com>
References: <1427873005-24024-1-git-send-email-r.baldyga@samsung.com> <1427873005-24024-4-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427873005-24024-4-git-send-email-r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 01/04/15 10:23, Robert Baldyga wrote:
> This patch adds devicetree property for setting debounce value. It allows
> to set debounce time shorter or longer depending on the needs of given
> platform.
> 
> Signed-off-by: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Acked-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>

cheers,
-roger

> ---
>  drivers/extcon/extcon-usb-gpio.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index c842715..439ca99 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -114,6 +114,7 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct usb_extcon_info *info;
> +	u32 debounce;
>  	int ret;
>  
>  	if (!np)
> @@ -124,6 +125,11 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	info->dev = dev;
> +
> +	ret = of_property_read_u32(np, "debounce", &debounce);
> +	if (ret < 0)
> +		debounce = USB_GPIO_DEBOUNCE_MS;
> +
>  	info->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id");
>  	info->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus");
>  
> @@ -145,16 +151,14 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  	}
>  
>  	if (info->id_gpiod)
> -		ret = gpiod_set_debounce(info->id_gpiod,
> -			USB_GPIO_DEBOUNCE_MS * 1000);
> +		ret = gpiod_set_debounce(info->id_gpiod, debounce * 1000);
>  	if (!ret && info->vbus_gpiod) {
> -		ret = gpiod_set_debounce(info->vbus_gpiod,
> -			USB_GPIO_DEBOUNCE_MS * 1000);
> +		ret = gpiod_set_debounce(info->vbus_gpiod, debounce * 1000);
>  		if (ret < 0 && info->id_gpiod)
>  			gpiod_set_debounce(info->vbus_gpiod, 0);
>  	}
>  	if (ret < 0)
> -		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEBOUNCE_MS);
> +		info->debounce_jiffies = msecs_to_jiffies(debounce);
>  
>  	INIT_DELAYED_WORK(&info->wq_detcable, usb_extcon_detect_cable);
>  
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
