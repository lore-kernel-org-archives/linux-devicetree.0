From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 6/8] ARM: dts: imx7d-sdb: Add GPIO expander node
Date: Fri, 14 Apr 2017 11:47:00 +0800
Message-ID: <20170414034659.GH14915@dragon>
References: <20170413133242.5068-1-andrew.smirnov@gmail.com>
 <20170413133242.5068-7-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170413133242.5068-7-andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 06:32:40AM -0700, Andrey Smirnov wrote:
> Add node for U38, a 74LV595PW serial-in shift register that acts as a
> GPIO expander on the board.
> 
> Cc: yurovsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Cc: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
> Cc: Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
> Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Signed-off-by: Andrey Smirnov <andrew.smirnov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx7d-sdb.dts | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
> index 5be01a1..e0ff276 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -52,6 +52,30 @@
>  		reg = <0x80000000 0x80000000>;
>  	};
>  
> +	spi4 {
> +		compatible = "spi-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_spi1>;
> +		status = "okay";

The 'status' is not needed in this case.

> +		gpio-sck = <&gpio1 13 0>;
> +		gpio-mosi = <&gpio1 9 0>;
> +		cs-gpios = <&gpio1 12 0>;
> +		num-chipselects = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		gpio_spi: gpio_spi@0 {

gpio-expander might be a better node name?

> +			compatible = "fairchild,74hc595";
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			reg = <0>;
> +			registers-number = <1>;
> +			 /* Enable PERI_3V3, SENSOR_RST_B and HDMI_RST*/
> +			registers-default = /bits/ 8 <0x74>;

I do not see this property is documented or supported by kernel.

> +			spi-max-frequency = <100000>;
> +		};
> +	};
> +
>  	regulators {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> @@ -642,5 +666,13 @@
>  		fsl,pins = <
>  			MX7D_PAD_LPSR_GPIO1_IO01__PWM1_OUT		0x110b0
>  		>;
> +
> +		pinctrl_spi1: spi1grp {
> +			fsl,pins = <
> +				MX7D_PAD_GPIO1_IO09__GPIO1_IO9	0x59
> +				MX7D_PAD_GPIO1_IO12__GPIO1_IO12	0x59
> +				MX7D_PAD_GPIO1_IO13__GPIO1_IO13	0x59
> +			>;
> +		};
>  	};
>  };
> -- 
> 2.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
