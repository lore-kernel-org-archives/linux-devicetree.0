From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: hip04: add gpio pieces
Date: Sun, 4 May 2014 19:37:23 +0800
Message-ID: <53662673.7000709@hisilicon.com>
References: <5357A947.2010506@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5357A947.2010506-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2014/4/23 19:51, Zhou Wang wrote:
> Hisilicon Soc hip04 has four gpio controllers, each one has 32
> gpios and can be configured to be an interrupt controller.
> The gpio controllers are compatible with the snps,dw-apb-gpio
> driver. This patch add the corresponding device tree nodes.
> 
> Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
> ---
>  arch/arm/boot/dts/hip04.dtsi |   76 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 76 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
> index 7e909ee..c7c1f8c 100644
> --- a/arch/arm/boot/dts/hip04.dtsi
> +++ b/arch/arm/boot/dts/hip04.dtsi
> @@ -235,5 +235,81 @@
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		gpio@4003000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x4003000 0x1000>;
> +
> +			gpio3: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <32>;
> +				reg = <0>;
> +				interrupt-parent = <&gic>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <0 392 4>;
> +			};
> +		};
> +
> +		gpio@4002000 {
> + 			#address-cells = <1>;
> + 			#size-cells = <0>;
> + 			compatible = "snps,dw-apb-gpio";
> + 			reg = <0x4002000 0x1000>;
> +
> + 			gpio2: gpio-controller@0 {
> + 				compatible = "snps,dw-apb-gpio-port";
> + 				gpio-controller;
> + 				#gpio-cells = <2>;
> + 				snps,nr-gpios = <32>;
> + 				reg = <0>;
> +				interrupt-parent = <&gic>;
> + 				interrupt-controller;
> + 				#interrupt-cells = <2>;
> + 				interrupts = <0 391 4>;
> + 			};
> + 		};
> +
> +		gpio@4001000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x4001000 0x1000>;
> +
> +			gpio1: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <32>;
> +				reg = <0>;
> +				interrupt-parent = <&gic>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <0 390 4>;
> +			};
> +		};
> +
> +		gpio@4000000 {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			compatible = "snps,dw-apb-gpio";
> +			reg = <0x4000000 0x1000>;
> +
> +			gpio0: gpio-controller@0 {
> +				compatible = "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				snps,nr-gpios = <32>;
> +				reg = <0>;
> +				interrupt-parent = <&gic>;
> +				interrupt-controller;
> +				#interrupt-cells = <2>;
> +				interrupts = <0 389 4>;
> +			};
> +		};
>  	};
>  };
> -- 1.7.9.5
> 
Hi haojian

 Are the gpio nodes OK for hip04.dtsi?

Best regards
Zhou Wang

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
