From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 10/14] ARM: dts: sun8i: Add r_twi I2C controller
Date: Sat, 25 Jun 2016 09:16:33 +0200
Message-ID: <20160625071633.GD4000@lukather>
References: <20160625034511.7966-1-megous@megous.com>
 <20160625034511.7966-11-megous@megous.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBUW7XC5QKGQE66QMH5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20160625034511.7966-11-megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org
Cc: dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

Hi,

On Sat, Jun 25, 2016 at 05:45:07AM +0200, megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org wrote:
> From: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> 
> H3 SoC contains I2C controller optionally available
> on the PL0 and PL1 pins. This patch makes this controller
> available.
> 
> Signed-off-by: Ondrej Jirman <megous-5qf/QAjKc83QT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3.dtsi
> index 56f211e..e32f211 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -322,8 +322,9 @@
>  			reg = <0x01f01428 0x4>;
>  			#clock-cells = <1>;
>  			clocks = <&apb0>;
> -			clock-indices = <0>, <1>;
> -			clock-output-names = "apb0_pio", "apb0_ir";
> +			clock-indices = <0>, <1>, <6>;
> +			clock-output-names = "apb0_pio", "apb0_ir", "apb0_i2c";
> +

The new line is not needed, and it should be part of a separate patch.

>  		};
>  
>  		ir_clk: ir_clk@01f01454 {
> @@ -656,6 +657,20 @@
>  			status = "disabled";
>  		};
>  
> +		r_twi: i2c@01f02400 {

We call it i2c everywhere, please call it that way too.

> +			compatible = "allwinner,sun6i-a31-i2c";
> +			reg = <0x01f02400 0x400>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&r_twi_pins_a>;
> +			clocks = <&apb0_gates 6>;
> +			clock-frequency = <100000>;
> +			resets = <&apb0_reset 6>;
> +			status = "disabled";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
>  		gic: interrupt-controller@01c81000 {
>  			compatible = "arm,cortex-a7-gic", "arm,cortex-a15-gic";
>  			reg = <0x01c81000 0x1000>,
> @@ -707,6 +722,13 @@
>  				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
>  				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;
>  			};
> +
> +			r_twi_pins_a: r_twi@0 {
> +				allwinner,pins = "PL0", "PL1";
> +				allwinner,function = "s_twi";
> +				allwinner,drive = <SUN4I_PINCTRL_10_MA>;
> +				allwinner,pull = <SUN4I_PINCTRL_NO_PULL>;

Separate patch please.

Thanks!

-- 
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
--kvUQC+jR9YzypDnK--
