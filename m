From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: da850: Add missing pin muxing for the UARTs
Date: Thu, 04 Aug 2016 12:04:36 -0700
Message-ID: <m27fbwqrsr.fsf@baylibre.com>
References: <20160804110656.25318-1-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160804110656.25318-1-kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> (Karl Beldan's
	message of "Thu, 4 Aug 2016 11:06:56 +0000")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: devicetree@vger.kernel.org

+Sekhar

Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> writes:

> This adds 2 pinctrl groups (rtscts, rxtx) for each of the 3 UARTs.
>
> Signed-off-by: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850.dtsi | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/arch/arm/boot/dts/da850.dtsi b/arch/arm/boot/dts/da850.dtsi
> index 25f0f8e..bc10e7e 100644
> --- a/arch/arm/boot/dts/da850.dtsi
> +++ b/arch/arm/boot/dts/da850.dtsi
> @@ -41,6 +41,42 @@
>  			pinctrl-single,function-mask = <0xf>;
>  			status = "disabled";
>  
> +			serial0_rtscts_pins: pinmux_serial0_rtscts_pins {
> +				pinctrl-single,bits = <
> +					/* UART0_RTS UART0_CTS */
> +					0x0c 0x22000000 0xff000000
> +				>;
> +			};
> +			serial0_rxtx_pins: pinmux_serial0_rxtx_pins {
> +				pinctrl-single,bits = <
> +					/* UART0_TXD UART0_RXD */
> +					0x0c 0x00220000 0x00ff0000
> +				>;
> +			};
> +			serial1_rtscts_pins: pinmux_serial1_rtscts_pins {
> +				pinctrl-single,bits = <
> +					/* UART1_CTS UART1_RTS */
> +					0x00 0x00440000 0x00ff0000
> +				>;
> +			};
> +			serial1_rxtx_pins: pinmux_serial1_rxtx_pins {
> +				pinctrl-single,bits = <
> +					/* UART1_TXD UART1_RXD */
> +					0x10 0x22000000 0xff000000
> +				>;
> +			};
> +			serial2_rtscts_pins: pinmux_serial2_rtscts_pins {
> +				pinctrl-single,bits = <
> +					/* UART2_CTS UART2_RTS */
> +					0x00 0x44000000 0xff000000
> +				>;
> +			};
> +			serial2_rxtx_pins: pinmux_serial2_rxtx_pins {
> +				pinctrl-single,bits = <
> +					/* UART2_TXD UART2_RXD */
> +					0x10 0x00220000 0x00ff0000
> +				>;
> +			};
>  			nand_cs3_pins: pinmux_nand_pins {
>  				pinctrl-single,bits = <
>  					/* EMA_OE, EMA_WE */
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
