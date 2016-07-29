From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 2/5] ARM: dts: msm8974: Move vreg_boost node from the
 honami to msm8974
Date: Fri, 29 Jul 2016 09:21:25 -0700
Message-ID: <20160729162125.GX13516@tuxbot>
References: <20160729060910.16943-1-bshah@kde.org>
 <20160729060910.16943-3-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160729060910.16943-3-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bhushan Shah <bshah@kde.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Thu 28 Jul 23:09 PDT 2016, Bhushan Shah wrote:

> vreg_boost is Qualcomm platform specific and is also used in hammerhead
> device.
> 
> Cc: Andy Gross <andy.gross@linaro.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: David Brown <david.brown@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-soc@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Bhushan Shah <bshah@kde.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> 
> Changes since v2:
>     - Move vreg-boost node completely, along with pinctrl stuff
> 
>  .../boot/dts/qcom-msm8974-sony-xperia-honami.dts    | 21 ---------------------
>  arch/arm/boot/dts/qcom-msm8974.dtsi                 | 18 ++++++++++++++++++
>  arch/arm/boot/dts/qcom-pm8941.dtsi                  |  6 ++++++
>  3 files changed, 24 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> index a0398b6..a90e34c 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-honami.dts
> @@ -258,22 +258,6 @@
>  		};
>  	};
>  
> -	vreg_boost: vreg-boost {
> -		compatible = "regulator-fixed";
> -
> -		regulator-name = "vreg-boost";
> -		regulator-min-microvolt = <3150000>;
> -		regulator-max-microvolt = <3150000>;
> -
> -		regulator-always-on;
> -		regulator-boot-on;
> -
> -		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&boost_bypass_n_pin>;
> -     };
>  };
>  
>  &soc {
> @@ -383,11 +367,6 @@
>  		};
>  
>  		gpios@c000 {
> -			boost_bypass_n_pin: boost-bypass {
> -				pins = "gpio21";
> -				function = "normal";
> -			};
> -
>  			gpio_keys_pin_a: gpio-keys-active {
>  				pins = "gpio2", "gpio3", "gpio4", "gpio5";
>  				function = "normal";
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index dc2ce00..1f9b649 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -2,6 +2,7 @@
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8974.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include "skeleton.dtsi"
>  
>  / {
> @@ -604,4 +605,21 @@
>  			};
>  		};
>  	};
> +
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <3150000>;
> +		regulator-max-microvolt = <3150000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&boost_bypass_n_pin>;
> +	};
>  };
> diff --git a/arch/arm/boot/dts/qcom-pm8941.dtsi b/arch/arm/boot/dts/qcom-pm8941.dtsi
> index d95edb6..ae8e5cc 100644
> --- a/arch/arm/boot/dts/qcom-pm8941.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8941.dtsi
> @@ -88,6 +88,12 @@
>  				     <0 0xe1 0 IRQ_TYPE_NONE>,
>  				     <0 0xe2 0 IRQ_TYPE_NONE>,
>  				     <0 0xe3 0 IRQ_TYPE_NONE>;
> +
> +			boost_bypass_n_pin: boost-bypass {
> +				pins = "gpio21";
> +				function = "normal";
> +			};
> +
>  		};
>  
>  		pm8941_mpps: mpps@a000 {
> -- 
> 2.9.0
> 
