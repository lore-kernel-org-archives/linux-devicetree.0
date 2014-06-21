From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: imx6sx-sdb: add gpio key support
Date: Sat, 21 Jun 2014 17:11:44 +0800
Message-ID: <20140621091143.GC18165@dragon>
References: <1403241449-31514-1-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403241449-31514-1-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jun 20, 2014 at 01:17:29PM +0800, Anson Huang wrote:
> This patch adds support for imx6sx-sdb board's gpio keys:
> 
> SW4(FUNC1): KEY_VOLUMEUP
> SW5(FUNC2): KEY_VOLUMEDOWN
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6sx-sdb.dts |   27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6sx-sdb.dts b/arch/arm/boot/dts/imx6sx-sdb.dts
> index 9906f65..e082e84 100644
> --- a/arch/arm/boot/dts/imx6sx-sdb.dts
> +++ b/arch/arm/boot/dts/imx6sx-sdb.dts
> @@ -8,6 +8,8 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
>  #include "imx6sx.dtsi"
>  
>  / {
> @@ -18,6 +20,24 @@
>  		stdout-path = &uart1;
>  	};
>  
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpio_keys>;
> +
> +		volume-up {
> +			label = "Volume Up";
> +			gpios = <&gpio1 18 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +		};
> +
> +		volume-down {
> +			label = "Volume Down";
> +			gpios = <&gpio1 19 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEDOWN>;
> +		};
> +	};
> +
>  	memory {
>  		reg = <0x80000000 0x40000000>;
>  	};

We generally have 'chosen' and 'memory' at the top of the board dts.  So
I applied the patch after switching the order between 'gpio-keys' and
'memory'.

Shawn

> @@ -114,6 +134,13 @@
>  			>;
>  		};
>  
> +		pinctrl_gpio_keys: gpio_keysgrp {
> +			fsl,pins = <
> +				MX6SX_PAD_CSI_DATA04__GPIO1_IO_18 0x17059
> +				MX6SX_PAD_CSI_DATA05__GPIO1_IO_19 0x17059
> +			>;
> +		};
> +
>  		pinctrl_vcc_sd3: vccsd3grp {
>  			fsl,pins = <
>  				MX6SX_PAD_KEY_COL1__GPIO2_IO_11		0x17059
> -- 
> 1.7.9.5
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
