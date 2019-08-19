From: Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH v4 08/21] ARM: dts: imx7-colibri: Add touch controllers
Date: Mon, 19 Aug 2019 13:21:26 +0200
Message-ID: <20190819112124.GR5999@X250>
References: <20190812142105.1995-1-philippe.schenker@toradex.com>
 <20190812142105.1995-9-philippe.schenker@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190812142105.1995-9-philippe.schenker@toradex.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Philippe Schenker <philippe.schenker@toradex.com>
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, "stefan@agner.ch" <stefan@agner.ch>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michal =?utf-8?B?Vm9rw6HEjQ==?= <michal.vokac@ysoft.com>, Fabio Estevam <festevam@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 12, 2019 at 02:21:26PM +0000, Philippe Schenker wrote:
> Add touch controller that is connected over an I2C bus.
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
> - Fix commit message
> 
> Changes in v2:
> - Deleted touchrevolution downstream stuff
> - Use generic node name
> - Better comment
> 
>  arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi | 24 +++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> index d4dbc4fc1adf..576dec9ff81c 100644
> --- a/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> +++ b/arch/arm/boot/dts/imx7-colibri-eval-v3.dtsi
> @@ -145,6 +145,21 @@
>  &i2c4 {
>  	status = "okay";
>  
> +	/*
> +	 * Touchscreen is using SODIMM 28/30, also used for PWM<B>, PWM<C>,
> +	 * aka pwm2, pwm3. so if you enable touchscreen, disable the pwms
> +	 */
> +	touchscreen@4a {
> +		compatible = "atmel,maxtouch";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_gpiotouch>;
> +		reg = <0x4a>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;		/* SODIMM 28 */
> +		reset-gpios = <&gpio1 10 GPIO_ACTIVE_HIGH>;	/* SODIMM 30 */
> +		status = "disabled";

Why disabled?

Shawn

> +	};
> +
>  	/* M41T0M6 real time clock on carrier board */
>  	rtc: m41t0m6@68 {
>  		compatible = "st,m41t0";
> @@ -200,3 +215,12 @@
>  	vmmc-supply = <&reg_3v3>;
>  	status = "okay";
>  };
> +
> +&iomuxc {
> +	pinctrl_gpiotouch: touchgpios {
> +		fsl,pins = <
> +			MX7D_PAD_GPIO1_IO09__GPIO1_IO9		0x74
> +			MX7D_PAD_GPIO1_IO10__GPIO1_IO10		0x14
> +		>;
> +	};
> +};
> -- 
> 2.22.0
> 
