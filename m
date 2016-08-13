From: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 3/4] ARM: dts: da850,da850-evm: Add an aemif node and
 use it for the NAND
Date: Sat, 13 Aug 2016 11:27:40 +0000
Message-ID: <20160813112740.GA27739@gobelin>
References: <20160810110032.29295-1-kbeldan@baylibre.com>
 <20160810110032.29295-4-kbeldan@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160810110032.29295-4-kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Santosh Shilimkar <ssantosh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Karl Beldan <karl.beldan+oss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Aug 10, 2016 at 11:00:31AM +0000, Karl Beldan wrote:
> Currently the davinci da8xx boards use the mach-davinci aemif code.
> Instantiating an aemif node into the DT allows to use the ti-aemif
> memory driver and is another step to better DT support.
> This change adds an aemif node in the dtsi while retiring the nand_cs3
> node. The NAND is now instantiated in the dts as a subnode of the aemif
> one along with its pins.
> 
> Signed-off-by: Karl Beldan <kbeldan-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/da850-evm.dts | 49 ++++++++++++++++++++++++++++++++++++-----
>  arch/arm/boot/dts/da850.dtsi    | 19 +++++++---------
>  2 files changed, 52 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
> index 1a15db8..eedcc59 100644
> --- a/arch/arm/boot/dts/da850-evm.dts
> +++ b/arch/arm/boot/dts/da850-evm.dts
> @@ -29,6 +29,20 @@
>  					0x04 0x00011000 0x000ff000
>  				>;
>  			};
> +			nand_pins: nand_pins {
> +				pinctrl-single,bits = <
> +					/* EMA_WAIT[0], EMA_OE, EMA_WE, EMA_CS[4], EMA_CS[3] */
> +					0x1c 0x10110110  0xf0ff0ff0
> +					/*
> +					 * EMA_D[0], EMA_D[1], EMA_D[2],
> +					 * EMA_D[3], EMA_D[4], EMA_D[5],
> +					 * EMA_D[6], EMA_D[7]
> +					 */
> +					0x24 0x11111111  0xffffffff
> +					/* EMA_A[1], EMA_A[2] */
> +					0x30 0x01100000  0x0ff00000
> +				>;
> +			};
>  		};
>  		serial0: serial@42000 {
>  			status = "okay";
> @@ -131,11 +145,6 @@
>  			status = "okay";
>  		};
>  	};
> -	nand_cs3@62000000 {
> -		status = "okay";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&nand_cs3_pins>;
> -	};
>  	vbat: fixedregulator@0 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vbat";

It has no functionnal impact but with this change nand_cs3_pins becomes
useless and I forgot to get rid of it, so it'll make a v3.
 
Karl
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
