From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH V3] extcon: palmas: Option to disable ID/VBUS detection
 based on platform
Date: Thu, 11 Jul 2013 11:42:33 +0900
Message-ID: <51DE1B99.6090403@samsung.com>
References: <1373448546-7531-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1373448546-7531-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: myungjoo.ham@samsung.com, devicetree-discuss@lists.ozlabs.org, rob@landley.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, gg@slimlogic.co.uk
List-Id: devicetree@vger.kernel.org

Hi Laxman,

>  static int palmas_usb_probe(struct platform_device *pdev)
> @@ -137,20 +140,26 @@ static int palmas_usb_probe(struct platform_device *pdev)
>  	struct palmas_usb *palmas_usb;
>  	int status;
>  
> -	if (node && !pdata) {
> -		pdata = devm_kzalloc(&pdev->dev, sizeof(*pdata), GFP_KERNEL);
> -
> -		if (!pdata)
> -			return -ENOMEM;
> +	palmas_usb = devm_kzalloc(&pdev->dev, sizeof(*palmas_usb), GFP_KERNEL);
> +	if (!palmas_usb)
> +		return -ENOMEM;
>  
> -		pdata->wakeup = of_property_read_bool(node, "ti,wakeup");
> +	if (node && !pdata) {
> +		palmas_usb->wakeup = of_property_read_bool(node, "ti,wakeup");
> +		palmas_usb->enable_id_detection = of_property_read_bool(node,
> +						"ti,enable-id-detection");
> +		palmas_usb->enable_vbus_detection = of_property_read_bool(node,
> +						"ti,enable-vbus-detection");
> +	} else if (pdata) {
> +		palmas_usb->wakeup = pdata->wakeup;
> +		palmas_usb->enable_id_detection = true;
> +		palmas_usb->enable_vbus_detection = true;
>  	} else if (!pdata) {
> -		return -EINVAL;
> +		palmas_usb->wakeup = true;
> +		palmas_usb->enable_id_detection = true;
> +		palmas_usb->enable_vbus_detection = true;
>  	}

I think we could modify it as following patch to remove duplicate line.
If you agree about below modification, I will apply your patch with following patch.

index 5c218d2..56909cc 100644
--- a/drivers/extcon/extcon-palmas.c
+++ b/drivers/extcon/extcon-palmas.c
@@ -150,16 +150,14 @@ static int palmas_usb_probe(struct platform_device *pdev)
                                                "ti,enable-id-detection");
                palmas_usb->enable_vbus_detection = of_property_read_bool(node,
                                                "ti,enable-vbus-detection");
-       } else if (pdata) {
-               palmas_usb->wakeup = pdata->wakeup;
-               palmas_usb->enable_id_detection = true;
-               palmas_usb->enable_vbus_detection = true;
-       } else if (!pdata) {
+       } else {
                palmas_usb->wakeup = true;
                palmas_usb->enable_id_detection = true;
                palmas_usb->enable_vbus_detection = true;
-       }
 
+               if (pdata)
+                       palmas_usb->wakeup = pdata->wakeup;
+       }
 
        palmas->usb = palmas_usb;
        palmas_usb->palmas = palmas;


Thanks,
Chanwoo Choi


