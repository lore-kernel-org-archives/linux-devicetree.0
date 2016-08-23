From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 5/7] arm64: dts: add Allwinner A64 SoC .dtsi
Date: Tue, 23 Aug 2016 22:03:49 +0200
Message-ID: <20160823200349.GR2598@lukather>
References: <20160808172149.30861-1-andre.przywara@arm.com>
 <20160808172149.30861-6-andre.przywara@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MRBOAUz+O/XNC2GI"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBNOY6K6QKGQEPQVYXRQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160808172149.30861-6-andre.przywara-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Andre Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--MRBOAUz+O/XNC2GI
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Mon, Aug 08, 2016 at 06:21:47PM +0100, Andre Przywara wrote:
> +	pmu {
> +			compatible = "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
> +			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-affinity = <&cpu0>,
> +					     <&cpu1>,
> +					     <&cpu2>,
> +					     <&cpu3>;
> +	};

The indentation looks off.

> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	memory {
> +		device_type = "memory";
> +		reg = <0x40000000 0>;
> +	};
> +
> +	gic: interrupt-controller@1c81000 {
> +		compatible = "arm,gic-400";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +
> +		reg = <0x01c81000 0x1000>,
> +		      <0x01c82000 0x2000>,
> +		      <0x01c84000 0x2000>,
> +		      <0x01c86000 0x2000>;
> +		interrupts = <GIC_PPI 9
> +		      (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 14
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 11
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 10
> +			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	/include/ "sun50i-a64-clocks.dtsi"
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		pio: pinctrl@1c20800 {
> +			compatible = "allwinner,sun50i-a64-pinctrl";
> +			reg = <0x01c20800 0x400>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&bus_gates 69>;
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +
> +			uart0_pins_a: uart0@0 {
> +				allwinner,pins = "PB8", "PB9";
> +				allwinner,function = "uart0";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart0_pins_b: uart0@1 {
> +				allwinner,pins = "PF2", "PF3";
> +				allwinner,function = "uart0";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart1_2pins: uart1_2@0 {
> +				allwinner,pins = "PG6", "PG7";
> +				allwinner,function = "uart1";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart1_4pins: uart1_4@0 {
> +				allwinner,pins = "PG6", "PG7", "PG8", "PG9";
> +				allwinner,function = "uart1";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart2_2pins: uart2_2@0 {
> +				allwinner,pins = "PB0", "PB1";
> +				allwinner,function = "uart2";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart2_4pins: uart2_4@0 {
> +				allwinner,pins = "PB0", "PB1", "PB2", "PB3";
> +				allwinner,function = "uart2";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart3_pins_a: uart3@0 {
> +				allwinner,pins = "PD0", "PD1";
> +				allwinner,function = "uart3";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart3_2pins_b: uart3_2@1 {
> +				allwinner,pins = "PH4", "PH5";
> +				allwinner,function = "uart3";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart3_4pins_b: uart3_4@1 {
> +				allwinner,pins = "PH4", "PH5", "PH6", "PH7";
> +				allwinner,function = "uart3";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart4_2pins: uart4_2@0 {
> +				allwinner,pins = "PD2", "PD3";
> +				allwinner,function = "uart4";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart4_4pins: uart4_4@0 {
> +				allwinner,pins = "PD2", "PD3", "PD4", "PD5";
> +				allwinner,function = "uart4";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			mmc0_pins: mmc0@0 {
> +				allwinner,pins = "PF0", "PF1", "PF2", "PF3",
> +						 "PF4", "PF5";
> +				allwinner,function = "mmc0";
> +				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			mmc0_default_cd_pin: mmc0_cd_pin@0 {
> +				allwinner,pins = "PF6";
> +				allwinner,function = "gpio_in";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_PULL_UP>;
> +			};
> +
> +			mmc1_pins: mmc1@0 {
> +				allwinner,pins = "PG0", "PG1", "PG2", "PG3",
> +						 "PG4", "PG5";
> +				allwinner,function = "mmc1";
> +				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			mmc2_pins: mmc2@0 {
> +				allwinner,pins = "PC1", "PC5", "PC6", "PC8",
> +						 "PC9", "PC10", "PC11", "PC12",
> +						 "PC13", "PC14", "PC15", "PC16";
> +				allwinner,function = "mmc2";
> +				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			i2c0_pins: i2c0_pins {
> +				allwinner,pins = "PH0", "PH1";
> +				allwinner,function = "i2c0";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			i2c1_pins: i2c1_pins {
> +				allwinner,pins = "PH2", "PH3";
> +				allwinner,function = "i2c1";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			i2c2_pins: i2c2_pins {
> +				allwinner,pins = "PE14", "PE15";
> +				allwinner,function = "i2c2";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +		};

Our policy is that we only add the pinctrl nodes that we actually use
in boards to avoid bloating the DT with unused nodes.

Thanks,
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
--MRBOAUz+O/XNC2GI--
