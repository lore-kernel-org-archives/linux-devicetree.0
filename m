From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v6 2/6] ARM: dts: imx: imx7d-sbd add iomuxc-lpsr hoggrp-2
 pads
Date: Fri, 25 Sep 2015 17:38:04 -0700
Message-ID: <20150926003803.GC3529@tiger>
References: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
 <1443215162-13716-2-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443215162-13716-2-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Adrian Alonso <aalonso@freescale.com>
Cc: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, linus.walleij@linaro.org, lznuaa@gmail.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com
List-Id: devicetree@vger.kernel.org

On Fri, Sep 25, 2015 at 04:05:58PM -0500, Adrian Alonso wrote:
> Add imx7d-sdb iomuxc-lpsr hoggrp-2 default pads settings
> 
> Signed-off-by: Adrian Alonso <aalonso@freescale.com>

Looked at this patch again, and please see comments below.

> ---
> Changes for V2: Resend
> Changes for V3: Resend
> Changes for V4: Resend
> Changes for V5: Resend
> Changes for V6:
> - Add wdog pinctrl group, add comments for hog2 group gpios
> 
>  arch/arm/boot/dts/imx7d-sdb.dts | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
> index 8059458..2da704a 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -419,3 +419,23 @@
>  
>  	};
>  };
> +
> +&iomuxc_lpsr {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog_2>;
> +
> +	imx7d-sdb {
> +		pinctrl_hog_2: hoggrp-2 {
> +			fsl,pins = <
> +				MX7D_PAD_GPIO1_IO05__GPIO1_IO5    0x14 	/* usb_otg1_pwr */

Shouldn't this be handled by a pinctrl of regulator@0 ...

> +				MX7D_PAD_GPIO1_IO07__GPIO1_IO7    0x59 	/* sensor_int_b */

... and this by a pinctrl of regulator@2?

> +			>;
> +		};
> +
> +		pinctrl_wdog: wdoggrp {
> +			fsl,pins = <
> +				MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B 0x74
> +			>;
> +		};

Add this only when you have a user for it.

Shawn

> +	};
> +};
> -- 
> 2.1.4
> 
