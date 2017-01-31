From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v4 1/5] usb: dwc2: Add support for STM32F429/439/469 USB
 OTG HS/FS in FS mode (internal PHY)
Date: Tue, 31 Jan 2017 19:49:23 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE300772909021B410454@US01WEMBX2.internal.synopsys.com>
References: <20170129022110.54032-1-bruherrera@gmail.com>
 <20170129022110.54032-2-bruherrera@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alexandre.torgue-qxv4g6HH51o@public.gmane.org" <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, "John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org" <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 1/28/2017 6:21 PM, Bruno Herrera wrote:
> This patch introduces a new parameter to activate USB OTG HS/FS core embedded
> phy transceiver. The STM32F4x9 SoC uses the GGPIO register to enable the transceiver.
> Also add the dwc2_core_params structure for stm32f4 otg fs.
>
> Signed-off-by: Bruno Herrera <bruherrera-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/usb/dwc2/core.h   |  4 ++++
>  drivers/usb/dwc2/hcd.c    | 13 ++++++++++++-
>  drivers/usb/dwc2/hw.h     |  2 ++
>  drivers/usb/dwc2/params.c | 20 ++++++++++++++++++++
>  4 files changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index b9b62f1..ed8ce42 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -423,6 +423,9 @@ enum dwc2_ep0_state {
>   *			needed.
>   *			0 - No (default)
>   *			1 - Yes
> + * @activate_transceiver: Activate internal transceiver using GGPIO register.
> + *			0 - Deactivate the transceiver (default)
> + *			1 - Activate the transceiver
>   * @g_dma:              Enables gadget dma usage (default: autodetect).
>   * @g_dma_desc:         Enables gadget descriptor DMA (default: autodetect).
>   * @g_rx_fifo_size:	The periodic rx fifo size for the device, in
> @@ -477,6 +480,7 @@ struct dwc2_core_params {
>  	bool uframe_sched;
>  	bool external_id_pin_ctl;
>  	bool hibernation;
> +	bool activate_transceiver;

Seeing as this is very specific to the STM FS platform using a GGPIO
register bit that only exists for it, maybe call it something like:

activate_stm_fs_transceiver


>  	u16 max_packet_count;
>  	u32 max_transfer_size;
>  	u32 ahbcfg;
> diff --git a/drivers/usb/dwc2/hcd.c b/drivers/usb/dwc2/hcd.c
> index a73722e..190a441 100644
> --- a/drivers/usb/dwc2/hcd.c
> +++ b/drivers/usb/dwc2/hcd.c
> @@ -121,7 +121,7 @@ static void dwc2_init_fs_ls_pclk_sel(struct dwc2_hsotg *hsotg)
>
>  static int dwc2_fs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
>  {
> -	u32 usbcfg, i2cctl;
> +	u32 usbcfg, ggpio, i2cctl;
>  	int retval = 0;
>
>  	/*
> @@ -145,6 +145,17 @@ static int dwc2_fs_phy_init(struct dwc2_hsotg *hsotg, bool select_phy)
>  				return retval;
>  			}
>  		}
> +
> +		ggpio = dwc2_readl(hsotg->regs + GGPIO);
> +		if (!(ggpio & GGPIO_STM32_OTG_GCCFG_PWRDWN) &&
> +		    (hsotg->params.activate_transceiver > 0)) {

This is bool so no need to check > 0.

> +			dev_dbg(hsotg->dev, "Activating transceiver\n");
> +			/* STM32F4x9 uses the GGPIO register as general core

Use '/*' by itself to start multi-line comments.

> +			 * configuration register.
> +			 */
> +			ggpio |= GGPIO_STM32_OTG_GCCFG_PWRDWN;
> +			dwc2_writel(ggpio, hsotg->regs + GGPIO);
> +		}

Make this whole block conditional on the parameter.

>  	}
>
>  	/*
> diff --git a/drivers/usb/dwc2/hw.h b/drivers/usb/dwc2/hw.h
> index bde7248..9b432c1 100644
> --- a/drivers/usb/dwc2/hw.h
> +++ b/drivers/usb/dwc2/hw.h
> @@ -225,6 +225,8 @@
>
>  #define GPVNDCTL			HSOTG_REG(0x0034)
>  #define GGPIO				HSOTG_REG(0x0038)
> +#define GGPIO_STM32_OTG_GCCFG_PWRDWN	(1 << 16)
> +

Use BIT macro

>  #define GUID				HSOTG_REG(0x003c)
>  #define GSNPSID				HSOTG_REG(0x0040)
>  #define GHWCFG1				HSOTG_REG(0x0044)
> diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
> index 2990c34..a35abba 100644
> --- a/drivers/usb/dwc2/params.c
> +++ b/drivers/usb/dwc2/params.c
> @@ -120,6 +120,23 @@ static void dwc2_set_amcc_params(struct dwc2_hsotg *hsotg)
>  	p->ahbcfg = GAHBCFG_HBSTLEN_INCR16 << GAHBCFG_HBSTLEN_SHIFT;
>  }
>
> +static void dwc2_set_stm32f4x9_fsotg_params(struct dwc2_hsotg *hsotg)
> +{
> +	struct dwc2_core_params *p = &hsotg->params;
> +
> +	p->otg_cap = DWC2_CAP_PARAM_NO_HNP_SRP_CAPABLE;
> +	p->speed = DWC2_SPEED_PARAM_FULL;
> +	p->host_rx_fifo_size = 128;
> +	p->host_nperio_tx_fifo_size = 96;
> +	p->host_perio_tx_fifo_size = 96;
> +	p->max_packet_count = 256;
> +	p->phy_type = DWC2_PHY_TYPE_PARAM_FS;
> +	p->i2c_enable = false;
> +	p->uframe_sched = false;
> +	p->activate_transceiver = true;
> +

Remove newline

[snip]

Regards,
John
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
