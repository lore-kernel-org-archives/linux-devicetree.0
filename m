From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: Add rk808 PMIC to rk3288-evb-rk808
Date: Tue, 09 Sep 2014 13:22:57 +0200
Message-ID: <23122191.L4GLoISGbk@diego>
References: <1409074123-17449-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409074123-17449-1-git-send-email-dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Am Dienstag, 26. August 2014, 10:28:43 schrieb Doug Anderson:
> This adds initial support.  For now, regulators are always on and we
> don't specify the input supply for all of the regulators.

The basic rk808 mfd including the bindings got accepted, so

Added to v3.18-next/dts branch with the small modification described below

> 
> Signed-off-by: huang lin <hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> Signed-off-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> ---
> This patch is based on Chris's WIP rk808 series.
> 
>  arch/arm/boot/dts/rk3288-evb-rk808.dts | 131
> +++++++++++++++++++++++++++++++++ 1 file changed, 131 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk3288-evb-rk808.dts
> b/arch/arm/boot/dts/rk3288-evb-rk808.dts index 9a88b6c..513c88e 100644
> --- a/arch/arm/boot/dts/rk3288-evb-rk808.dts
> +++ b/arch/arm/boot/dts/rk3288-evb-rk808.dts
> @@ -16,3 +16,134 @@
>  / {
>  	compatible = "rockchip,rk3288-evb-rk808", "rockchip,rk3288";
>  };
> +
> +&i2c0 {
> +	status = "okay";
> +
> +	rk808: pmic@1b {
> +		compatible = "rockchip,rk808";
> +		clock-output-names = "xin32k", "rk808-clkout2";

I moved the clock-output-names below the #clock-cells and the reg from below 
to here.



> +		interrupt-parent = <&gpio0>;
> +		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>;
> +		reg = <0x1b>;
> +		rockchip,system-power-controller;
> +		wakeup-source;
> +		#clock-cells = <1>;
> +
> +		vcc8-supply = <&vcc_18>;
> +		vcc9-supply = <&vcc_io>;
> +		vcc10-supply = <&vcc_io>;
> +		vcc12-supply = <&vcc_io>;
> +		vddio-supply = <&vccio_pmu>;
> +
> +		regulators {
> +			vdd_cpu: DCDC_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <750000>;
> +				regulator-max-microvolt = <1300000>;
> +				regulator-name = "vdd_arm";
> +			};
> +
> +			vdd_gpu: DCDC_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1250000>;
> +				regulator-name = "vdd_gpu";
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vcc_ddr";
> +			};
> +
> +			vcc_io: DCDC_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc_io";
> +			};
> +
> +			vccio_pmu: LDO_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vccio_pmu";
> +			};
> +
> +			vcc_tp: LDO_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc_tp";
> +			};
> +
> +			vdd_10: LDO_REG3 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-name = "vdd_10";
> +			};
> +
> +			vcc18_lcd: LDO_REG4 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc18_lcd";
> +			};
> +
> +			vccio_sd: LDO_REG5 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vccio_sd";
> +			};
> +
> +			vdd10_lcd: LDO_REG6 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-name = "vdd10_lcd";
> +			};
> +
> +			vcc_18: LDO_REG7 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc_18";
> +			};
> +
> +			vcca_codec: LDO_REG8 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcca_codec";
> +			};
> +
> +			vcc_wl: SWITCH_REG1 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vcc_wl";
> +			};
> +
> +			vcc_lcd: SWITCH_REG2 {
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-name = "vcc_lcd";
> +			};
> +		};
> +	};
> +};

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
