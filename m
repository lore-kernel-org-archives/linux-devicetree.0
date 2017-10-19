From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v3 2/2] extcon: add optional input-debounce attribute
Date: Thu, 19 Oct 2017 19:18:03 +0900
Message-ID: <59E87BDB.2090104@samsung.com>
References: <1508406773-887-1-git-send-email-raveendra.padasalagi@broadcom.com>
        <CGME20171019095315epcas1p1da40aef7397c561c5fe970309a97b762@epcas1p1.samsung.com>
        <1508406773-887-2-git-send-email-raveendra.padasalagi@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1508406773-887-2-git-send-email-raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, MyungJoo Ham <myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 2017년 10월 19일 18:52, Raveendra Padasalagi wrote:
> Add changes to capture optional dt attribute "input-debounce"
> provided in extcon node and used the same value if provided otherwise
> default value of 20000 usecs is used for id and vbus gpios debounce time.
> 
> Signed-off-by: Raveendra Padasalagi <raveendra.padasalagi-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Ray Jui <ray.jui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> Reviewed-by: Srinath Mannam <srinath.mannam-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
> ---
> 
> Changes in v3:
>  - Changed USB_GPIO_DEBOUNCE_MS to USB_GPIO_DEBOUNCE_USEC
>  - Changed msecs_to_jiffies() to usecs_to_jiffies()
> 
> Changes in v2:
>  Rename gpio_debounce_timeout_ms to debounce_usecs
> 
>  drivers/extcon/extcon-usb-gpio.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)

Looks good to me.
Acked-by: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

After completing the review of patch1 from DT maintainer,
I'll merge these patch sets.

> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index 9c925b0..69149e2 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -28,7 +28,7 @@
>  #include <linux/workqueue.h>
>  #include <linux/pinctrl/consumer.h>
>  
> -#define USB_GPIO_DEBOUNCE_MS	20	/* ms */
> +#define USB_GPIO_DEBOUNCE_USEC	20000	/* us */
>  
>  struct usb_extcon_info {
>  	struct device *dev;
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
> +		info->debounce_usecs = USB_GPIO_DEBOUNCE_USEC;
> +
>  	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
>  	if (IS_ERR(info->edev)) {
>  		dev_err(dev, "failed to allocate extcon device\n");
> @@ -147,13 +153,13 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  
>  	if (info->id_gpiod)
>  		ret = gpiod_set_debounce(info->id_gpiod,
> -					 USB_GPIO_DEBOUNCE_MS * 1000);
> +					 info->debounce_usecs);
>  	if (!ret && info->vbus_gpiod)
>  		ret = gpiod_set_debounce(info->vbus_gpiod,
> -					 USB_GPIO_DEBOUNCE_MS * 1000);
> +					 info->debounce_usecs);
>  
>  	if (ret < 0)
> -		info->debounce_jiffies = msecs_to_jiffies(USB_GPIO_DEBOUNCE_MS);
> +		info->debounce_jiffies = usecs_to_jiffies(info->debounce_usecs);
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
