From: Paul Zimmerman <Paul.Zimmerman-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: RE: [PATCH] staging: dwc2: set up all module params
Date: Tue, 26 Nov 2013 19:27:47 +0000
Message-ID: <A2CA0424C0A6F04399FB9E1CD98E030458E2AD11@US01WEMBX2.internal.synopsys.com>
References: <1385442150-23561-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385442150-23561-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org" <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, November 25, 2013 9:03 PM
> 
> The DWC2 USB controller in the BCM2835 (Raspberry Pi) needs some non-
> default parameters. Select these based on the compatible value from the
> DT node. For all other HW, fall back to the default parameters currently
> in use.
> 
> The values in params_bcm2835[] were posted to the mailing list by Paul
> quite some time ago. I made a couple of minor modifications since then;
> to set ahbcfg instead of ahb_single, and to set uframe_sched.

Hi Stephen,

I don't see any code in this patch that is setting uframe_sched?

> diff --git a/drivers/staging/dwc2/platform.c b/drivers/staging/dwc2/platform.c
> index 4d9fac0..20586dc 100644
> --- a/drivers/staging/dwc2/platform.c
> +++ b/drivers/staging/dwc2/platform.c
> @@ -39,6 +39,7 @@
>  #include <linux/slab.h>
>  #include <linux/device.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/of_device.h>
>  #include <linux/platform_device.h>
> 
>  #include "core.h"
> @@ -46,6 +47,33 @@
> 
>  static const char dwc2_driver_name[] = "dwc2";
> 
> +static const struct dwc2_core_params params_bcm2835 = {
> +	.otg_cap			= 0,	/* HNP/SRP capable */
> +	.otg_ver			= 0,	/* 1.3 */
> +	.dma_enable			= 1,
> +	.dma_desc_enable		= 0,
> +	.speed				= 0,	/* High Speed */
> +	.enable_dynamic_fifo		= 1,
> +	.en_multiple_tx_fifo		= 1,
> +	.host_rx_fifo_size		= 774,	/* 774 DWORDs */
> +	.host_nperio_tx_fifo_size	= 256,	/* 256 DWORDs */
> +	.host_perio_tx_fifo_size	= 512,	/* 512 DWORDs */
> +	.max_transfer_size		= 65535,
> +	.max_packet_count		= 511,
> +	.host_channels			= 8,
> +	.phy_type			= 1,	/* UTMI */
> +	.phy_utmi_width			= 8,	/* 8 bits */
> +	.phy_ulpi_ddr			= 0,	/* Single */
> +	.phy_ulpi_ext_vbus		= 0,
> +	.i2c_enable			= 0,
> +	.ulpi_fs_ls			= 0,
> +	.host_support_fs_ls_low_power	= 0,
> +	.host_ls_low_power_phy_clk	= 0,	/* 48 MHz */
> +	.ts_dline			= 0,
> +	.reload_ctl			= 0,
> +	.ahbcfg				= 0x10,

I guess uframe_sched should be set here.

> +};

-- 
Paul

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
