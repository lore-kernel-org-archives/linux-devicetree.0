From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 2/4] extcon: palmas: enable ID_GND and ID_FLOAT detection
 always
Date: Wed, 10 Jul 2013 11:15:54 +0900
Message-ID: <51DCC3DA.3060402@samsung.com>
References: <1373375064-12012-1-git-send-email-ldewangan@nvidia.com>
 <1373375064-12012-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-reply-to: <1373375064-12012-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: myungjoo.ham@samsung.com, devicetree-discuss@lists.ozlabs.org, rob@landley.net, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com, gg@slimlogic.co.uk
List-Id: devicetree@vger.kernel.org

Hi Laxman,

On 07/09/2013 10:04 PM, Laxman Dewangan wrote:
> When integrating driver with Tegra platform, it is found that
> the ID pins get detected only once after booting system and
> further removal and re-insert does not detect the ID pin.
> 
> Fixing this issue with enabling interrupt on ID_GND and ID_FLOAT
> always  and clearing the status on LATCH register which actually
> occurred.
> 
> Also if interrupt occurs with line status as zero then based on
> previous status, set the cable state.
> 
> Add debug prints to display the cable state when any cable
> insertion/removal happen.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>  drivers/extcon/extcon-palmas.c |   24 +++++++++++-------------
>  1 files changed, 11 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/extcon/extcon-palmas.c b/drivers/extcon/extcon-palmas.c
> index b752a0a..587034b 100644
> --- a/drivers/extcon/extcon-palmas.c
> +++ b/drivers/extcon/extcon-palmas.c
> @@ -57,6 +57,7 @@ static irqreturn_t palmas_vbus_irq_handler(int irq, void *_palmas_usb)
>  		if (palmas_usb->linkstat != PALMAS_USB_STATE_VBUS) {
>  			palmas_usb->linkstat = PALMAS_USB_STATE_VBUS;
>  			extcon_set_cable_state(&palmas_usb->edev, "USB", true);
> +			dev_info(palmas_usb->dev, "USB cable state: TRUE\n");

I prfer following info message when USB cable is inserted.
dev_info(palmas_usb->dev, "USB cable is attached\n");


>  		} else {
>  			dev_dbg(palmas_usb->dev,
>  				"Spurious connect event detected\n");
> @@ -65,6 +66,7 @@ static irqreturn_t palmas_vbus_irq_handler(int irq, void *_palmas_usb)
>  		if (palmas_usb->linkstat == PALMAS_USB_STATE_VBUS) {
>  			palmas_usb->linkstat = PALMAS_USB_STATE_DISCONNECT;
>  			extcon_set_cable_state(&palmas_usb->edev, "USB", false);
> +			dev_info(palmas_usb->dev, "USB cable state: FALSE\n");

ditto.
dev_info(palmas_usb->dev, "USB cable is detached\n");

>  		} else {
>  			dev_dbg(palmas_usb->dev,
>  				"Spurious disconnect event detected\n");
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
> +		dev_info(palmas_usb->dev, "HOST cable state: TRUE\n");

ditto.
dev_info(palmas_usb->dev, "USB-HOST cable is attached\n");

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
> +		dev_info(palmas_usb->dev, "HOST cable state: FALSE\n");

ditto.
dev_info(palmas_usb->dev, "USB-HOST cable is detached\n");

> +	} else if ((palmas_usb->linkstat == PALMAS_USB_STATE_ID) &&
> +				(!(set & PALMAS_USB_ID_INT_SRC_ID_GND))) {
> +		palmas_usb->linkstat = PALMAS_USB_STATE_DISCONNECT;
> +		extcon_set_cable_state(&palmas_usb->edev, "USB-HOST", false);
> +		dev_info(palmas_usb->dev, "HOST cable state: FALSE\n");

dev_info(palmas_usb->dev, "USB-HOST cable is detached\n");

>  	}
>  
>  	return IRQ_HANDLED;
> @@ -122,7 +119,8 @@ static void palmas_enable_irq(struct palmas_usb *palmas_usb)
>  
>  	palmas_write(palmas_usb->palmas, PALMAS_USB_OTG_BASE,
>  		PALMAS_USB_ID_INT_EN_HI_SET,
> -		PALMAS_USB_ID_INT_EN_HI_SET_ID_GND);
> +		PALMAS_USB_ID_INT_EN_HI_SET_ID_GND |
> +		PALMAS_USB_ID_INT_EN_HI_SET_ID_FLOAT);
>  
>  	palmas_vbus_irq_handler(palmas_usb->vbus_irq, palmas_usb);
>  
> 

I you would modify info message, anything else is good.

Thanks,
Chanwoo Choi
