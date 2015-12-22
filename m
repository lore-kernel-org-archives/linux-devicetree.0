From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/2] ARM: dts: imx7d: sbc-imx7: add basic board support
Date: Tue, 22 Dec 2015 20:19:20 +0800
Message-ID: <20151222121920.GC26290@tiger>
References: <1449472479-2521-1-git-send-email-ilya@compulab.co.il>
 <1450772120-18131-1-git-send-email-ilya@compulab.co.il>
 <1450772120-18131-3-git-send-email-ilya@compulab.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1450772120-18131-3-git-send-email-ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 22, 2015 at 10:15:20AM +0200, Ilya Ledvich wrote:
> diff --git a/arch/arm/boot/dts/imx7d-sbc-imx7.dts b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
> new file mode 100644
> index 0000000..000f5b6
> --- /dev/null
> +++ b/arch/arm/boot/dts/imx7d-sbc-imx7.dts
> @@ -0,0 +1,44 @@
> +/*
> + * Support for CompuLab SBC-iMX7 Single Board Computer
> + *
> + * Copyright (C) 2015 CompuLab Ltd. - http://www.compulab.co.il/
> + * Author: Ilya Ledvich <ilya-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + */
> +
> +#include "imx7d-cl-som-imx7.dts"
> +
> +/ {
> +	model = "CompuLab SBC-iMX7";
> +	compatible = "compulab,sbc-imx7", "compulab,cl-som-imx7", "fsl,imx7d";
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	cd-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> +	wp-gpios = <&gpio5 1 GPIO_ACTIVE_HIGH>;
> +	enable-sdio-wakeup;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	cl-som-imx7 {

This container should be dropped too.  Please check my imx/dt branch for
the fixup I made.

Shawn

> +		pinctrl_usdhc1: usdhc1grp {
> +			fsl,pins = <
> +				MX7D_PAD_SD1_CMD__SD1_CMD		0x59
> +				MX7D_PAD_SD1_CLK__SD1_CLK		0x19
> +				MX7D_PAD_SD1_DATA0__SD1_DATA0		0x59
> +				MX7D_PAD_SD1_DATA1__SD1_DATA1		0x59
> +				MX7D_PAD_SD1_DATA2__SD1_DATA2		0x59
> +				MX7D_PAD_SD1_DATA3__SD1_DATA3		0x59
> +				MX7D_PAD_SD1_CD_B__GPIO5_IO0		0x59 /* CD */
> +				MX7D_PAD_SD1_WP__GPIO5_IO1		0x59 /* WP */
> +			>;
> +		};
> +	};
> +};
> -- 
> 1.9.1
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
