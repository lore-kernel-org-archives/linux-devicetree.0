From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 12/21] ARM: dts: imx6-apalis: Add touchscreens used on
 Toradex eval boards
Date: Mon, 19 Aug 2019 13:30:44 +0200
Message-ID: <20190819113042.GV5999@X250>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-13-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812142105.1995-13-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:21:33PM +0000, Philippe Schenker wrote:
> This commit adds the touchscreens from Toradex so one can enable it.
> 
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
> Acked-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> ---
> 
> Changes in v4:
> - Add Marcel Ziswiler's Ack
> 
> Changes in v3:
> - Fix commit title to "...imx6-apalis:..."
> 
> Changes in v2:
> - Deleted touchrevolution downstream stuff
> - Use generic node name
> - Put a better comment in there
> 
>  arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts  | 31 +++++++++++++++++++
>  arch/arm/boot/dts/imx6q-apalis-eval.dts       | 13 ++++++++
>  arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts | 13 ++++++++
>  arch/arm/boot/dts/imx6q-apalis-ixora.dts      | 13 ++++++++
>  4 files changed, 70 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
> index 9a5d6c94cca4..763fb5e90bd3 100644
> --- a/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
> +++ b/arch/arm/boot/dts/imx6dl-colibri-eval-v3.dts
> @@ -168,6 +168,21 @@
>  &i2c3 {
>  	status = "okay";
>  
> +	/*
> +	 * Touchscreen is using SODIMM 28/30, also used for PWM<B>, PWM<C>,
> +	 * aka pwm2, pwm3. so if you enable touchscreen, disable the pwms
> +	 */
> +	touchscreen@4a {
> +		compatible = "atmel,maxtouch";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pcap_1>;
> +		reg = <0x4a>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;		/* SODIMM 28 */
> +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>;	/* SODIMM 30 */
> +		status = "disabled";

If you have a reason to keep this disabled, please comment or state in
the commit log.

> +	};
> +
>  	/* M41T0M6 real time clock on carrier board */
>  	rtc_i2c: rtc@68 {
>  		compatible = "st,m41t0";
> @@ -175,6 +190,22 @@
>  	};
>  };
>  
> +&iomuxc {
> +	pinctrl_pcap_1: pcap-1 {

Name pinctrl node more consistently like pinctrl_xxx: xxxgrp.

Shawn

> +		fsl,pins = <
> +			MX6QDL_PAD_GPIO_9__GPIO1_IO09	0x1b0b0 /* SODIMM 28 */
> +			MX6QDL_PAD_SD4_DAT2__GPIO2_IO10	0x1b0b0 /* SODIMM 30 */
> +		>;
> +	};
> +
> +	pinctrl_mxt_ts: mxt-ts {
> +		fsl,pins = <
> +			MX6QDL_PAD_EIM_CS1__GPIO2_IO24	0x130b0 /* SODIMM 107 */
> +			MX6QDL_PAD_SD2_DAT1__GPIO1_IO14	0x130b0 /* SODIMM 106 */
> +		>;
> +	};
> +};
> +
>  &ipu1_di0_disp0 {
>  	remote-endpoint = <&lcd_display_in>;
>  };
> diff --git a/arch/arm/boot/dts/imx6q-apalis-eval.dts b/arch/arm/boot/dts/imx6q-apalis-eval.dts
> index 0edd3043d9c1..4665e15b196d 100644
> --- a/arch/arm/boot/dts/imx6q-apalis-eval.dts
> +++ b/arch/arm/boot/dts/imx6q-apalis-eval.dts
> @@ -167,6 +167,19 @@
>  &i2c1 {
>  	status = "okay";
>  
> +	/*
> +	 * Touchscreen is using SODIMM 28/30, also used for PWM<B>, PWM<C>,
> +	 * aka pwm2, pwm3. so if you enable touchscreen, disable the pwms
> +	 */
> +	touchscreen@4a {
> +		compatible = "atmel,maxtouch";
> +		reg = <0x4a>;
> +		interrupt-parent = <&gpio6>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
> +		status = "disabled";
> +	};
> +
>  	pcie-switch@58 {
>  		compatible = "plx,pex8605";
>  		reg = <0x58>;
> diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
> index b94bb687be6b..a3fa04a97d81 100644
> --- a/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
> +++ b/arch/arm/boot/dts/imx6q-apalis-ixora-v1.1.dts
> @@ -172,6 +172,19 @@
>  &i2c1 {
>  	status = "okay";
>  
> +	/*
> +	 * Touchscreen is using SODIMM 28/30, also used for PWM<B>, PWM<C>,
> +	 * aka pwm2, pwm3. so if you enable touchscreen, disable the pwms
> +	 */
> +	touchscreen@4a {
> +		compatible = "atmel,maxtouch";
> +		reg = <0x4a>;
> +		interrupt-parent = <&gpio6>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
> +		status = "disabled";
> +	};
> +
>  	/* M41T0M6 real time clock on carrier board */
>  	rtc_i2c: rtc@68 {
>  		compatible = "st,m41t0";
> diff --git a/arch/arm/boot/dts/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
> index 302fd6adc8a7..5ba49d0f4880 100644
> --- a/arch/arm/boot/dts/imx6q-apalis-ixora.dts
> +++ b/arch/arm/boot/dts/imx6q-apalis-ixora.dts
> @@ -171,6 +171,19 @@
>  &i2c1 {
>  	status = "okay";
>  
> +	/*
> +	 * Touchscreen is using SODIMM 28/30, also used for PWM<B>, PWM<C>,
> +	 * aka pwm2, pwm3. so if you enable touchscreen, disable the pwms
> +	 */
> +	touchscreen@4a {
> +		compatible = "atmel,maxtouch";
> +		reg = <0x4a>;
> +		interrupt-parent = <&gpio6>;
> +		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio6 9 GPIO_ACTIVE_HIGH>; /* SODIMM 13 */
> +		status = "disabled";
> +	};
> +
>  	eeprom@50 {
>  		compatible = "atmel,24c02";
>  		reg = <0x50>;
> -- 
> 2.22.0
> 
