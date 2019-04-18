From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64-oceanic-5205-5inmfd:
 Enable CAN
Date: Thu, 18 Apr 2019 16:56:41 +0200
Message-ID: <20190418145641.q23tupopz2czjzc5@flea>
References: <20190418141658.10868-1-jagan@amarulasolutions.com>
Reply-To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ubqlaoup2nr4gj7m"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBBLNA4LSQKGQE7G6XIEY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <20190418141658.10868-1-jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-amarula-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ubqlaoup2nr4gj7m
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline

On Thu, Apr 18, 2019 at 07:46:58PM +0530, Jagan Teki wrote:
> Oceanic 5205 5inMFD has MCP2515 CAN device connected via SPI1.
>
> - via SPI1 bus
> - vdd supplied by 5V supply along with PL2 enable pin
> - xceiver supply same as vdd
> - can oscillator connected at 20MHz
> - PB2 gpio as interrupt pin
> - PD6 gpio as RX_BUF1_CAN0
> - PD7 gpio as RX_BUF0_CAN0
>
> Tested-by: Tamas Papp <tamas-C8Hwo/Q/ZSIAvxtiuMwx3w@public.gmane.org>
> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
> ---
>  .../sun50i-a64-oceanic-5205-5inmfd.dts        | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
> index f0cd6587f619..22535a297f51 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-oceanic-5205-5inmfd.dts
> @@ -21,6 +21,24 @@
>  	chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
> +
> +	can_osc: can-osc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <20000000>;
> +	};
> +
> +	reg_can_v5v: reg-can-v5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg-can-v5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		enable-active-high;
> +		gpio = <&r_pio 0 2 GPIO_ACTIVE_HIGH>; /* CAN_3V3_EN: PL2 */
> +		status = "okay";

You don't need the status property here.

> +	};
> +
>  };
>
>  &ehci0 {
> @@ -77,6 +95,31 @@
>  	status = "okay";
>  };
>
> +&pio {
> +	can_pins: can-pins {
> +		pins = "PD6",			/* RX_BUF1_CAN0 */
> +		       "PD7";			/* RX_BUF0_CAN0 */
> +		function = "gpio_in";
> +	};
> +};

That isn't needed. What are they used for, you're not tying them to
anything?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
--ubqlaoup2nr4gj7m--
