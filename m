From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH V2 2/4] extcon: palmas: enable ID_GND and ID_FLOAT
 detection always
Date: Wed, 10 Jul 2013 16:02:31 +0900
Message-ID: <51DD0707.8010400@samsung.com>
References: <1373436959-32444-1-git-send-email-ldewangan@nvidia.com>
 <1373436959-32444-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1373436959-32444-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: myungjoo.ham@samsung.com, devicetree-discuss@lists.ozlabs.org, rob@landley.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, gg@slimlogic.co.uk
List-Id: devicetree@vger.kernel.org

Hi Laxman,

> @@ -84,28 +86,23 @@ static irqreturn_t palmas_id_irq_handler(int irq, void *_palmas_usb)
>  
>  	if (set & PALMAS_USB_ID_INT_SRC_ID_GND) {
>  		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
> -			PALMAS_USB_ID_INT_EN_HI_SET,
> -			PALMAS_USB_ID_INT_EN_HI_SET_ID_FLOAT);
> -		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
> -			PALMAS_USB_ID_INT_EN_HI_CLR,
> -			PALMAS_USB_ID_INT_EN_HI_CLR_ID_GND);
> -		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
>  			PALMAS_USB_ID_INT_LATCH_CLR,
>  			PALMAS_USB_ID_INT_EN_HI_CLR_ID_GND);
>  		palmas_usb->linkstat = PALMAS_USB_STATE_ID;
>  		extcon_set_cable_state(&palmas_usb->edev, "USB-HOST", true);
> +		dev_info(palmas_usb->dev, "HOST cable is attached\n");
>  	} else if (set & PALMAS_USB_ID_INT_SRC_ID_FLOAT) {
>  		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
> -			PALMAS_USB_ID_INT_EN_HI_SET,
> -			PALMAS_USB_ID_INT_EN_HI_SET_ID_GND);
> -		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
> -			PALMAS_USB_ID_INT_EN_HI_CLR,
> -			PALMAS_USB_ID_INT_EN_HI_CLR_ID_FLOAT);
> -		palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
>  			PALMAS_USB_ID_INT_LATCH_CLR,
>  			PALMAS_USB_ID_INT_EN_HI_CLR_ID_FLOAT);
>  		palmas_usb->linkstat = PALMAS_USB_STATE_DISCONNECT;
>  		extcon_set_cable_state(&palmas_usb->edev, "USB-HOST", false);
> +		dev_info(palmas_usb->dev, "HOST cable is detached\n");
> +	} else if ((palmas_usb->linkstat == PALMAS_USB_STATE_ID) &&
> +				(!(set & PALMAS_USB_ID_INT_SRC_ID_GND))) {
> +		palmas_usb->linkstat = PALMAS_USB_STATE_DISCONNECT;
> +		extcon_set_cable_state(&palmas_usb->edev, "USB-HOST", false);
> +		dev_info(palmas_usb->dev, "HOST cable is detached\n");
>  	}

After I modify info message when USB-HOST cable is attached or detached
as following mesesage, I applied this patch.

"HOST cable is ..." -> "USB-HOST cable is"

Thanks,
Chanwoo Choi

