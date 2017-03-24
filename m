From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 05/12] ARM: dts: imx6ul-isiot-common: Add touchscreen node
Date: Fri, 24 Mar 2017 13:16:36 +0800
Message-ID: <20170324051632.GD30608@dragon>
References: <1490204897-14525-1-git-send-email-jagan@openedev.com>
 <1490204897-14525-6-git-send-email-jagan@openedev.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1490204897-14525-6-git-send-email-jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagan-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Mar 22, 2017 at 11:18:10PM +0530, Jagan Teki wrote:
> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> 
> Add touchscreen node as i2c1 slave device on Engicam Is.IoT MX6UL
> modules, the touchscreen controlled 'st,stmpe-ts' connected via
> i2c with st,stmpe811 mfb interface.

s/mfb/mfd?

> 
> Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Matteo Lisi <matteo.lisi-4s7YQHO/iPVBDgjK7y7TUQ@public.gmane.org>
> Cc: Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6ul-isiot-common.dtsi | 34 ++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6ul-isiot-common.dtsi b/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
> index 9660e20..b149b5e 100644
> --- a/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
> +++ b/arch/arm/boot/dts/imx6ul-isiot-common.dtsi
> @@ -40,6 +40,34 @@
>   *     OTHER DEALINGS IN THE SOFTWARE.
>   */
>  
> +&i2c1 {
> +	touch: stmpe811@44 {

Label a MFD device 'touch'?  Also, the node name should be generic.  Not
sure what should be used for MFD device though.

> +		compatible = "st,stmpe811";
> +		reg = <0x44>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_stmpe_ts>;

If this is for stmpe-ts, shouldn't be put into touchscreen child node?

> +		interrupt-parent = <&gpio1>;
> +		interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +
> +		stmpe_touchscreen {

'stmpe: touchscreen {' might be better.

Shawn

> +			compatible = "st,stmpe-ts";
> +			st,sample-time = <4>;
> +			st,mod-12b = <1>;
> +			st,ref-sel = <0>;
> +			st,adc-freq = <1>;
> +			st,ave-ctrl = <1>;
> +			st,touch-det-delay = <2>;
> +			st,settling = <2>;
> +			st,fraction-z = <7>;
> +			st,i-drive = <1>;
> +		};
> +	};
> +};
> +
>  &lcdif {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_lcdif_dat
> @@ -104,4 +132,10 @@
>  			MX6UL_PAD_LCD_DATA17__LCDIF_DATA17  0x79
>  		>;
>  	};
> +
> +	pinctrl_stmpe_ts:  stmpe-tsgrp  {
> +		fsl,pins = <
> +			MX6UL_PAD_UART1_CTS_B__GPIO1_IO18 0x1b0b0
> +		>;
> +	};
>  };
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
