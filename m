From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 6/6] arm64: dts: allwinner: bananapi-m64:
 Enable S070WV20-CT16 DSI panel
Date: Fri, 15 Mar 2019 14:25:25 +0100
Message-ID: <20190315132525.te3vaiukcniavaz2@flea>
References: <20190315130825.9005-1-jagan@amarulasolutions.com>
 <20190315130825.9005-7-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dgz7eolxcwybvexh"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBSWPV3SAKGQEEOCJYEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190315130825.9005-7-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Laurent Pinchart <Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org
List-Id: devicetree@vger.kernel.org


--dgz7eolxcwybvexh
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Fri, Mar 15, 2019 at 06:38:25PM +0530, Jagan Teki wrote:
> This patch add support for Bananapi S070WV20-CT16 DSI panel to
> BPI-M64 board.
> 
> Bananapi S070WV20-CT16 is a pure RGB output panel with ICN6211 DSI/RGB
> convertor bridge, so enable bridge along with associated panel.
> 
> DSI panel connected via board DSI port with,
> - DLDO1 as VCC-DSI supply
> - PD6 gpio for reset pin
> - PD5 gpio for backlight enable pin
> - PD7 gpio for backlight vdd supply
> 
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> index 7793ebb5d2b8..f31083aa4521 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> @@ -45,6 +45,7 @@
>  #include "sun50i-a64.dtsi"
>  
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/pwm/pwm.h>
>  
>  / {
>  	model = "BananaPi-M64";
> @@ -56,6 +57,15 @@
>  		serial1 = &uart1;
>  	};
>  
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
> +		brightness-levels = <1 2 4 8 16 32 64 128 512>;
> +		default-brightness-level = <2>;
> +		enable-gpios = <&pio 3 5 GPIO_ACTIVE_HIGH>; /* LCD-BL-EN: PD5 */
> +		power-supply = <&reg_vdd_backlight>;
> +	};
> +
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> @@ -91,6 +101,26 @@
>  		};
>  	};
>  
> +	panel-connector {
> +		compatible = "bananapi,s070wv20-ct16", "simple-panel";
> +
> +		port {
> +			backlight = <&backlight>;
> +			panel_ep: endpoint {
> +				remote-endpoint = <&bridge_out_ep>;
> +			};
> +		};
> +	};
> +
> +	reg_vdd_backlight: vdd-backlight {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd-backlight";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pio 3 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PD7 */
> +		enable-active-high;
> +	};
> +
>  	wifi_pwrseq: wifi_pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
> @@ -116,6 +146,33 @@
>  	status = "okay";
>  };
>  
> +&dphy {
> +	status = "okay";
> +};
> +
> +&dsi {
> +	vcc-dsi-supply = <&reg_dldo1>;		/* VCC3V3-DSI */
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	bridge@0 {
> +		compatible = "bananapi,icn6211", "chipone, icn6211";

There's a typo in the compatible

> +		reg = <0>;
> +		reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD6 */
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			bridge_out_ep: endpoint {
> +				remote-endpoint = <&panel_ep>;
> +			};
> +		};

The port here should be under a node called ports, with two ports,
which is what you documented in your binding.

Maxime

-- 
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--dgz7eolxcwybvexh--
