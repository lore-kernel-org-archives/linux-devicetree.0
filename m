From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH 2/3] ARM: dts: msm8974-hammerhead: Add regulator nodes
 for hammerhead
Date: Mon, 18 Jul 2016 10:38:45 -0700
Message-ID: <20160718173845.GG13516@tuxbot>
References: <20160717105208.9596-1-bshah@kde.org>
 <20160717105208.9596-3-bshah@kde.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160717105208.9596-3-bshah@kde.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bhushan Shah <bshah@kde.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Sun 17 Jul 03:52 PDT 2016, Bhushan Shah wrote:

[..]
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index 88d494f..29fa0bb 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -1,6 +1,8 @@
>  #include "qcom-msm8974.dtsi"
>  #include "qcom-pm8841.dtsi"
>  #include "qcom-pm8941.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
>  / {
>  	model = "LGE MSM 8974 HAMMERHEAD";
> @@ -14,6 +16,234 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	smd {
> +		rpm {
> +			rpm_requests {
> +				pm8841-regulators {
[..]
> +				};
> +
> +				pm8941-regulators {
> +					vdd_l1_l3-supply = <&pm8941_s1>;
> +					vdd_l2_lvs1_2_3-supply = <&pm8941_s3>;
> +					vdd_l4_l11-supply = <&pm8941_s1>;
> +					vdd_l5_l7-supply = <&pm8941_s2>;
> +					vdd_l6_l12_l14_l15-supply = <&pm8941_s2>;
> +					vdd_l8_l16_l18_l19-supply = <&vph_pwr_reg>;
> +					vdd_l9_l10_l17_l22-supply = <&vreg_boost>;
> +					vdd_l13_l20_l23_l24-supply = <&vreg_boost>;
> +					vdd_l21-supply = <&vreg_boost>;
> +
[..]
> +	};
> +
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;

vreg_boost is not to be confused with the boost regulator (PM8941 S4),
this boot regulator is responsible for keeping voltage high enough for
e.g. eMMC operation during voltage drops of the battery during high
current operations. I have it listed in the Sony file as 3.15V, which
seems more reasonable (I can't find the number in the Qcom docs right
now).

As this has turned out to be part of the Qualcomm platform rather than
something Sony specific I believe you should add a patch before this one
that moves the vreg-boost node from the honami.dts to the msm8974.dtsi.

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
> +
> +	vph_pwr_reg: vph_pwr_reg {

This is also Qualcomm generic, I just skipped it in the Honami case. But
please add this to the msm8974.dtsi instead.

You are not allowed to use _ in node names (but should do so in label
names), also just to follow naming please name this:

vreg_vph_pwr: vreg-vph-pwr { ... };

> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };
>  
>  &soc {
> @@ -23,3 +253,14 @@
>  	};
>  
>  };
> +
> +&spmi_bus {
> +	pm8941@0 {
> +		gpios@c000 {
> +			boost_bypass_n_pin: boost-bypass {
> +				pins = "gpio21";
> +				function = "normal";
> +			};
> +		};

This is also part of the platform, so move it from honami.dts to
qcom-pm8941.dtsi when you move the vreg above.

> +	};
> +};

Regards,
Bjorn
