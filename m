From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 1/4] extcon: usb-gpio: register extcon device before IRQ
 registration
Date: Fri, 03 Apr 2015 09:09:51 +0900
Message-ID: <551DDA4F.1030705@samsung.com>
References: <1427980385-21285-1-git-send-email-r.baldyga@samsung.com>
 <1427980385-21285-2-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1427980385-21285-2-git-send-email-r.baldyga@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Baldyga <r.baldyga@samsung.com>
Cc: myungjoo.ham@samsung.com, rogerq@ti.com, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, m.szyprowski@samsung.com
List-Id: devicetree@vger.kernel.org

Hi Robert,

On 04/02/2015 10:13 PM, Robert Baldyga wrote:
> IRQ handler touches info->edev, so if interrupt occurs before extcon
> device initialization it can cause NULL pointer dereference. Doing extcon
> initialization before IRQ handler registration fixes this problem.
> 
> Signed-off-by: Robert Baldyga <r.baldyga@samsung.com>
> Acked-by: Roger Quadros <rogerq@ti.com>
> ---
>  drivers/extcon/extcon-usb-gpio.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-usb-gpio.c b/drivers/extcon/extcon-usb-gpio.c
> index 3f0bad3..f6aa99d 100644
> --- a/drivers/extcon/extcon-usb-gpio.c
> +++ b/drivers/extcon/extcon-usb-gpio.c
> @@ -119,6 +119,18 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  		return PTR_ERR(info->id_gpiod);
>  	}
>  
> +	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
> +	if (IS_ERR(info->edev)) {
> +		dev_err(dev, "failed to allocate extcon device\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = devm_extcon_dev_register(dev, info->edev);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to register extcon device\n");
> +		return ret;
> +	}
> +
>  	ret = gpiod_set_debounce(info->id_gpiod,
>  				 USB_GPIO_DEBOUNCE_MS * 1000);
>  	if (ret < 0)
> @@ -142,18 +154,6 @@ static int usb_extcon_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	info->edev = devm_extcon_dev_allocate(dev, usb_extcon_cable);
> -	if (IS_ERR(info->edev)) {
> -		dev_err(dev, "failed to allocate extcon device\n");
> -		return -ENOMEM;
> -	}
> -
> -	ret = devm_extcon_dev_register(dev, info->edev);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to register extcon device\n");
> -		return ret;
> -	}
> -
>  	platform_set_drvdata(pdev, info);
>  	device_init_wakeup(dev, 1);
>  
> 

Applied this patch for v4.1-rc.

Thanks,
Chanwoo Choi
