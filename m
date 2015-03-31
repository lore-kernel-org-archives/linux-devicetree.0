From: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/4] extcon: usb-gpio: register extcon device before IRQ
 registration
Date: Tue, 31 Mar 2015 11:37:08 +0300
Message-ID: <551A5CB4.2020302@ti.com>
References: <1427787963-23562-1-git-send-email-r.baldyga@samsung.com> <1427787963-23562-2-git-send-email-r.baldyga@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427787963-23562-2-git-send-email-r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Cc: myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 31/03/15 10:46, Robert Baldyga wrote:
> IRQ handler touches info->edev, so if interrupt occurs before extcon
> device initialization it can cause NULL pointer dereference. Doing extcon
> initialization before IRQ handler registration fixes this problem.
> 
> Signed-off-by: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Acked-by: Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>

cheers,
-roger

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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
