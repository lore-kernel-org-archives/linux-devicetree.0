From: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 3/4] extcon: usb-gpio: make debounce value configurable
 in devicetree
Date: Tue, 31 Mar 2015 12:30:14 +0300
Message-ID: <551A6926.8030101@ti.com>
References: <1427787963-23562-1-git-send-email-r.baldyga@samsung.com> <1427787963-23562-4-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1427787963-23562-4-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Baldyga <r.baldyga@samsung.com>, cw00.choi@samsung.com
Cc: myungjoo.ham@samsung.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

On 31/03/15 10:46, Robert Baldyga wrote:
> This patch adds devicetree property for setting debounce value. It allows
> to set debounce time shorter or longer depending on the needs of given
> platform.
> 
> Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
> ---
>  drivers/extcon/extcon-usb-gpio.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index 02ff40e..86e3ece 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -130,6 +130,7 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
>  	struct usb_extcon_info *info;
> +	u32 debounce;
>  	int ret;
>  
>  	if (!np)
> @@ -140,6 +141,11 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	info->dev = dev;
> +
> +	ret = of_property_read_u32(np, "debounce", &debounce);
> +	if (ret < 0)
> +		debounce = USB_GPIO_DEBOUNCE_MS;
> +

Should we sanity check debounce value provided by device tree?
e.g. if it is greater than USB_GPIO_DEBOUNCE_MAX then we error out.
MAX could be 100 or 250ms.

>  	info->id_gpiod = devm_gpiod_get_optional(&pdev->dev, "id");
>  	info->vbus_gpiod = devm_gpiod_get_optional(&pdev->dev, "vbus");
>  
> @@ -161,16 +167,14 @@ static int usb_extcon_probe(struct platform_device *pdev)
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

cheers,
-roger
