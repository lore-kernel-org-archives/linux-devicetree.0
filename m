From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v2 2/2] extcon: add optional debounce-timeout-ms
 attribute
Date: Thu, 19 Oct 2017 13:59:11 +0900
Message-ID: <59E8311F.5010103@samsung.com>
References: <1508383560-15567-1-git-send-email-raveendra.padasalagi@broadcom.com>
        <CGME20171019032619epcas2p2408b6d42002c826d2af71f619250c0cf@epcas2p2.samsung.com>
        <1508383560-15567-2-git-send-email-raveendra.padasalagi@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1508383560-15567-2-git-send-email-raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2017년 10월 19일 12:26, Raveendra Padasalagi wrote:
> Add changes to capture optional dt attribute "debounce-timeout-ms"
> provided in extcon node and used the same value if provided otherwise
> default value of 20ms is used for id and vbus gpios debounce time.
> 
> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
> 
> Changes in v2:
>  Rename gpio_debounce_timeout_ms to debounce_usecs
> 
>  drivers/extcon/extcon-usb-gpio.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index 9c925b0..76ef1da 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -41,6 +41,7 @@ struct usb_extcon_info {
>  
>  	unsigned long debounce_jiffies;
>  	struct delayed_work wq_detcable;
> +	unsigned int debounce_usecs;
>  };
>  
>  static const unsigned int usb_extcon_cable[] = {
> @@ -133,6 +134,11 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  	if (IS_ERR(info->vbus_gpiod))
>  		return PTR_ERR(info->vbus_gpiod);
>  
> +	ret = of_property_read_u32(np, "input-debounce",
> +			     &info->debounce_usecs);
> +	if (ret)
> +		info->debounce_usecs = USB_GPIO_DEBOUNCE_MS;

The USB_GPIO_DEBOUNCE_MS indicates 20 millisecond.
You need to redefine it as following:
	-#define USB_GPIO_DEBOUNCE_MS   20      /* ms */
	+#define USB_GPIO_DEBOUNCE_USEC 20000

	info->debounce_usecs = USB_GPIO_DEBOUNCE_USEC;

or
	info->debounce_usecs = USB_GPIO_DEBOUNCE_MS * 1000;


> +
>  	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
>  	if (IS_ERR(info->edev)) {
>  		dev_err(dev, "failed to allocate extcon device\n");
> @@ -147,13 +153,13 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  
>  	if (info->id_gpiod)
>  		ret = gpiod_set_debounce(info->id_gpiod,
> -					 USB_GPIO_DEBOUNCE_MS * 1000);
> +					 info->debounce_usecs * 1000);

The debounce_usecs is already microsecond, You don't need to mutiply with 1000.


>  	if (!ret && info->vbus_gpiod)
>  		ret = gpiod_set_debounce(info->vbus_gpiod,
> -					 USB_GPIO_DEBOUNCE_MS * 1000);
> +					 info->debounce_usecs * 1000);
>  
>  	if (ret < 0)
> -		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEBOUNCE_MS);
> +		info->debounce_jiffies = msecs_to_jiffies(info->debounce_usecs);

ditto.

>  
>  	INIT_DELAYED_WORK(&info->wq_detcable, usb_extcon_detect_cable);
>  
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
