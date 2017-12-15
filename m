From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2] ARM64: dts: meson-axg: add the SPICC controller
Date: Fri, 15 Dec 2017 15:48:55 +0100
Message-ID: <19ed304f-ac35-e7a5-6722-b2cfde8f7bdd@baylibre.com>
References: <20171215144217.223593-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215144217.223593-1-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, Sunny Luo <sunny.luo-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15/12/2017 15:42, Yixun Lan wrote:
> From: Sunny Luo <sunny.luo-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> 
> Add DT info for the SPICC controller which found in
> the Amlogic's Meson-AXG SoC.
> 
> Signed-off-by: Sunny Luo <sunny.luo-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
> 
> ---
> Changes int v2 since [1]
>  - rebase to Kevin's tree, branch v4.16/dt64
>  - this patch depend on clock & pinctrl DT patch
> 
> [1]
> http://lists.infradead.org/pipermail/linux-amlogic/2017-November/005495.html
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 93 ++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index d356ce74ad89..d33721005748 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/axg-clkc.h>
>  
>  / {
>  	compatible = "amlogic,meson-axg";
> @@ -120,6 +121,28 @@
>  			#size-cells = <2>;
>  			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x25000>;
>  
> +			spicc0: spi@13000 {
> +				compatible = "amlogic,meson-axg-spicc";
> +				reg = <0x0 0x13000 0x0 0x3c>;
> +				interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&clkc CLKID_SPICC0>;
> +				clock-names = "core";
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +

[...]

> +
> +				spi1_ss0_x_pins: spi1_ss0_x {
> +					mux {
> +						groups = "spi1_ss0_x";
> +						function = "spi1";
> +					};
> +				};
>  			};
>  		};
>  
> 

Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
