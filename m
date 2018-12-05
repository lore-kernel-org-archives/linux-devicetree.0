From: agajjar <Akash_Gajjar@mentor.com>
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: rockpro64 fix regulator gpios
Date: Wed, 5 Dec 2018 18:29:30 +0530
Message-ID: <cf83adce-85cf-2251-6e50-3c87c8a01a0c@mentor.com>
References: <20181201100817.20688-1-oskari@lemmela.net>
 <20181201100817.20688-2-oskari@lemmela.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201100817.20688-2-oskari@lemmela.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Oskari Lemmela <oskari@lemmela.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


On 12/1/2018 3:38 PM, Oskari Lemmela wrote:
> Rockpro64 is not able boot if GPIO1_C1 pin is pulled high
> before loading linux kernel.
>
> In rockpro64 GPIO1_C1 pin is connected vdd_cpu_b regulator
> VSEL pin. Pin should be pulled down in normal operation and
> pulled high in suspend.
>
> PMIC LDO_REG2 is connected to touch panel connector.
> Rename regulator and set it to correct voltage.
>
> PCIe power is controller by GPIO1_D0.
>
> Schematics can be downloaded from:
> http://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
>
> Signed-off-by: Oskari Lemmela <oskari@lemmela.net>
Acked-by: Akash Gajjar <Akash_Gajjar@mentor.com>
> ---
>   .../boot/dts/rockchip/rk3399-rockpro64.dts    | 20 +++++++++++--------
>   1 file changed, 12 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> index 1d35f5406b5e..5bd4d69914bd 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts
> @@ -97,7 +97,7 @@
>   	vcc3v3_pcie: vcc3v3-pcie-regulator {
>   		compatible = "regulator-fixed";
>   		enable-active-high;
> -		gpio = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
> +		gpio = <&gpio1 RK_PD0 GPIO_ACTIVE_HIGH>;
>   		pinctrl-names = "default";
>   		pinctrl-0 = <&pcie_pwr_en>;
>   		regulator-name = "vcc3v3_pcie";
> @@ -293,12 +293,12 @@
>   				};
>   			};
>   
> -			vcc2v8_dvp: LDO_REG2 {
> -				regulator-name = "vcc2v8_dvp";
> +			vcc3v0_touch: LDO_REG2 {
> +				regulator-name = "vcc3v0_touch";
>   				regulator-always-on;
>   				regulator-boot-on;
> -				regulator-min-microvolt = <2800000>;
> -				regulator-max-microvolt = <2800000>;
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3000000>;
>   				regulator-state-mem {
>   					regulator-off-in-suspend;
>   				};
> @@ -397,7 +397,9 @@
>   	vdd_cpu_b: regulator@40 {
>   		compatible = "silergy,syr827";
>   		reg = <0x40>;
> -		fcs,suspend-voltage-selector = <0>;
> +		fcs,suspend-voltage-selector = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vsel1_gpio>;
>   		regulator-name = "vdd_cpu_b";
>   		regulator-min-microvolt = <712500>;
>   		regulator-max-microvolt = <1500000>;
> @@ -415,6 +417,8 @@
>   		compatible = "silergy,syr828";
>   		reg = <0x41>;
>   		fcs,suspend-voltage-selector = <1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vsel2_gpio>;
>   		regulator-name = "vdd_gpu";
>   		regulator-min-microvolt = <712500>;
>   		regulator-max-microvolt = <1500000>;
> @@ -519,7 +523,7 @@
>   
>   	pcie {
>   		pcie_pwr_en: pcie-pwr-en {
> -			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
> +			rockchip,pins = <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_none>;
>   		};
>   	};
>   
> @@ -529,7 +533,7 @@
>   		};
>   
>   		vsel1_gpio: vsel1-gpio {
> -			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
> +			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_down>;
>   		};
>   
>   		vsel2_gpio: vsel2-gpio {
