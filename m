From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/3] ARM: dts: sun8i: Add Allwinner A83T dtsi
Date: Sun, 25 Oct 2015 21:20:12 +0100
Message-ID: <20151025202012.GT10947@lukather>
References: <1445557577-27383-1-git-send-email-vishnupatekar0510@gmail.com>
 <1445557577-27383-3-git-send-email-vishnupatekar0510@gmail.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="q8laNvmP2d33pnUN"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRB7PSWSYQKGQELIMGUKY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1445557577-27383-3-git-send-email-vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--q8laNvmP2d33pnUN
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Fri, Oct 23, 2015 at 07:46:16AM +0800, Vishnu Patekar wrote:
> +	memory {
> +		reg = <0x40000000 0x80000000>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;

Shouldn't the number of CPUs be 8?

> +		clock-frequency = <24000000>;
> +		arm,cpu-registers-not-fw-configured;
> +	};

Is there some u-boot support for this SoC yet?

If so, both the memory node and the clock-frequency and
arm,cpu-registers-not-fw-configured properties are useless (and
harmful for the latter).

> +	soc@01c00000 {

Please remove the address. It's both wrong and useless.

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gic: interrupt-controller@01c81000 {
> +			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
> +			reg = <0x01c81000 0x1000>,
> +			      <0x01c82000 0x1000>,
> +			      <0x01c84000 0x2000>,
> +			      <0x01c86000 0x2000>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +		};
> +
> +		pio: pinctrl@01c20800 {
> +			compatible = "allwinner,sun8i-a83t-pinctrl";
> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
> +			<GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;

Please align these lines with the first one, like you did for the
GIC's reg for example.

> +			reg = <0x01c20800 0x400>;
> +			clocks = <&osc24M>;
> +			gpio-controller;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			#gpio-cells = <3>;
> +
> +			i2c0_pins_a: i2c0@0 {
> +				allwinner,pins = "PH0", "PH1";
> +				allwinner,function = "i2c0";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			i2c1_pins_a: i2c1@0 {
> +				allwinner,pins = "PH2", "PH3";
> +				allwinner,function = "i2c1";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			i2c2_pins_a: i2c2@0 {
> +				allwinner,pins = "PH4", "PH5";
> +				allwinner,function = "i2c2";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			mmc0_pins_a: mmc0@0 {
> +				allwinner,pins = "PF0", "PF1", "PF2",
> +						 "PF3", "PF4", "PF5";
> +				allwinner,function = "mmc0";
> +				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			mmc1_pins_a: mmc1@0 {
> +				allwinner,pins = "PG0", "PG1", "PG2",
> +						 "PG3", "PG4", "PG5";
> +				allwinner,function = "mmc1";
> +				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			mmc2_8bit_pins: mmc2_8bit {
> +				allwinner,pins = "PC5", "PC6", "PC8",
> +						 "PC9", "PC10", "PC11",
> +						 "PC12", "PC13", "PC14",
> +						 "PC15";
> +				allwinner,function = "mmc2";
> +				allwinner,drive = <SUN4I_PINCTRL_30_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart0_pins_a: uart0@0 {
> +				allwinner,pins = "PF2", "PF4";
> +				allwinner,function = "uart0";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};
> +
> +			uart0_pins_b: uart0@1 {
> +				allwinner,pins = "PB9", "PB10";
> +				allwinner,function = "uart0";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
> +			};

Are you going to use all these options?

Thanks!
Maxime

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--q8laNvmP2d33pnUN--
