From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: imx7d-sdb: Set VLDO4 outpt to 2.8V for MIPI
 CSI/DSI
Date: Wed, 12 Jul 2017 15:18:12 +0800
Message-ID: <20170712071811.GI3172@dragon>
References: <CAOMZO5A41QFoJsC2ST1kvpCOs3-unzHDrqXshHa=2ShWWCOyZg@mail.gmail.com>
 <20170701073911.7338-1-mindentropy@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170701073911.7338-1-mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mindentropy <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Jul 01, 2017 at 01:09:11PM +0530, mindentropy wrote:
> From: Gautam Bhat <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> 
>  * According to mx7sabresd schematics the MIPI CSI/DSI voltage rails
>    should be 2.8V but the voltage provided is a maximum of 3.3V and
>    minimum of 1.8V. Providing such a higher voltage might damage the
>    peripherals and violates the schematic settings.

For such single paragraph commit log, the bullet and indentation are not
really necessary.  I edited it a bit and apply the patch.  Thanks.

Shawn

> 
> Signed-off-by: Gautam Bhat <mindentropy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> Changes in v2:
>  - Added subject line according to convention
> 
>  arch/arm/boot/dts/imx7d-sdb.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
> index 5be01a1bf840..1da1f97ec342 100644
> --- a/arch/arm/boot/dts/imx7d-sdb.dts
> +++ b/arch/arm/boot/dts/imx7d-sdb.dts
> @@ -262,8 +262,8 @@
>  			};
>  
>  			vgen6_reg: vldo4 {
> -				regulator-min-microvolt = <1800000>;
> -				regulator-max-microvolt = <3300000>;
> +				regulator-min-microvolt = <2800000>;
> +				regulator-max-microvolt = <2800000>;
>  				regulator-always-on;
>  			};
>  		};
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
