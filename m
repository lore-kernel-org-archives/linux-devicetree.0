From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 07/22] ARM: dts: imx: Add generic compatible string
 for I2C EEPROM
Date: Fri, 14 Apr 2017 11:14:52 +0800
Message-ID: <20170414031451.GE14915@dragon>
References: <20170413182839.25381-1-javier@osg.samsung.com>
 <20170413182839.25381-8-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170413182839.25381-8-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 03:28:24PM -0300, Javier Martinez Canillas wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
> 
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
> 
> So add this generic fallback to the device node compatible string to make
> the device to match the driver using the OF device ID table.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

I wouldn't apply it before driver and bindings change get accepted.
Ping me when that happens.

Shawn

> ---
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi | 2 +-
>  arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi   | 2 +-
>  arch/arm/boot/dts/imx28-evk.dts                   | 2 +-
>  arch/arm/boot/dts/imx53-tqma53.dtsi               | 2 +-
>  arch/arm/boot/dts/imx6q-cm-fx6.dts                | 2 +-
>  arch/arm/boot/dts/imx6q-utilite-pro.dts           | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
> index 4f3e0f473581..61e741092efa 100644
> --- a/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
> +++ b/arch/arm/boot/dts/imx27-phytec-phycard-s-som.dtsi
> @@ -40,7 +40,7 @@
>  	status = "okay";
>  
>  	at24@52 {
> -		compatible = "at,24c32";
> +		compatible = "at,24c32","atmel,24c32";
>  		pagesize = <32>;
>  		reg = <0x52>;
>  	};
> diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi b/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
> index 82fec935ce83..5b6b651af18f 100644
> --- a/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
> +++ b/arch/arm/boot/dts/imx27-phytec-phycore-som.dtsi
> @@ -193,7 +193,7 @@
>  	status = "okay";
>  
>  	at24@52 {
> -		compatible = "at,24c32";
> +		compatible = "at,24c32","atmel,24c32";
>  		pagesize = <32>;
>  		reg = <0x52>;
>  	};
> diff --git a/arch/arm/boot/dts/imx28-evk.dts b/arch/arm/boot/dts/imx28-evk.dts
> index a5ba669b4eaa..5ab990ac36b4 100644
> --- a/arch/arm/boot/dts/imx28-evk.dts
> +++ b/arch/arm/boot/dts/imx28-evk.dts
> @@ -203,7 +203,7 @@
>  				};
>  
>  				at24@51 {
> -					compatible = "at24,24c32";
> +					compatible = "at24,24c32","atmel,24c32";
>  					pagesize = <32>;
>  					reg = <0x51>;
>  				};
> diff --git a/arch/arm/boot/dts/imx53-tqma53.dtsi b/arch/arm/boot/dts/imx53-tqma53.dtsi
> index 85972f2201c2..c8bc0522a1e9 100644
> --- a/arch/arm/boot/dts/imx53-tqma53.dtsi
> +++ b/arch/arm/boot/dts/imx53-tqma53.dtsi
> @@ -272,7 +272,7 @@
>  	};
>  
>  	eeprom: 24c64@50 {
> -		compatible = "at,24c64";
> +		compatible = "at,24c64","atmel,24c64";
>  		pagesize = <32>;
>  		reg = <0x50>;
>  	};
> diff --git a/arch/arm/boot/dts/imx6q-cm-fx6.dts b/arch/arm/boot/dts/imx6q-cm-fx6.dts
> index 66cac5328b86..8cf478c67f83 100644
> --- a/arch/arm/boot/dts/imx6q-cm-fx6.dts
> +++ b/arch/arm/boot/dts/imx6q-cm-fx6.dts
> @@ -215,7 +215,7 @@
>  	clock-frequency = <100000>;
>  
>  	eeprom@50 {
> -		compatible = "at24,24c02";
> +		compatible = "at24,24c02","atmel,24c02";
>  		reg = <0x50>;
>  		pagesize = <16>;
>  	};
> diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts b/arch/arm/boot/dts/imx6q-utilite-pro.dts
> index 69bdd82ce21f..644889d813d0 100644
> --- a/arch/arm/boot/dts/imx6q-utilite-pro.dts
> +++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts
> @@ -128,7 +128,7 @@
>  			#size-cells = <0>;
>  
>  			eeprom@50 {
> -				compatible = "at24,24c02";
> +				compatible = "at24,24c02","atmel,24c02";
>  				reg = <0x50>;
>  				pagesize = <16>;
>  			};
> -- 
> 2.9.3
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
