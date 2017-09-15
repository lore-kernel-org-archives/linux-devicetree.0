From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH 3/8] ARM: dts: iwg22m: Enable SDHI1 controller
Date: Fri, 15 Sep 2017 10:11:44 +0200
Message-ID: <20170915081144.GI3924@verge.net.au>
References: <1505322341-9480-1-git-send-email-chris.paterson2@renesas.com>
 <1505322341-9480-4-git-send-email-chris.paterson2@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1505322341-9480-4-git-send-email-chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 13, 2017 at 06:05:36PM +0100, Chris Paterson wrote:
> From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> 
> Enable the SDHI1 controller on iWave RZ/G1E SoM.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Signed-off-by: Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
> ---
> This patch is based on renesas-devel-20170913-v4.13.
> 
> 
>  arch/arm/boot/dts/r8a7745-iwg22m.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
> index e306e7c..f7f9cef 100644
> --- a/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
> +++ b/arch/arm/boot/dts/r8a7745-iwg22m.dtsi
> @@ -9,6 +9,7 @@
>   */
>  
>  #include "r8a7745.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	compatible = "iwave,g22m", "renesas,r8a7745";
> @@ -38,6 +39,12 @@
>  		function = "mmc";
>  	};
>  
> +	sdhi1_pins: sd1 {
> +		groups = "sdhi1_data4", "sdhi1_ctrl";
> +		function = "sdhi1";
> +		power-source = <3300>;
> +	};
> +
>  	i2c3_pins: i2c3 {
>  		groups = "i2c3_b";
>  		function = "i2c3";
> @@ -54,6 +61,16 @@
>  	status = "okay";
>  };
>  
> +&sdhi1 {
> +	pinctrl-0 = <&sdhi1_pins>;
> +	pinctrl-names = "default";
> +
> +	vmmc-supply = <&reg_3p3v>;
> +	vqmmc-supply = <&reg_3p3v>;
> +	cd-gpios = <&gpio3 31 GPIO_ACTIVE_LOW>;

No wp-gpios property means this is a µSD slot, right?

Do you have any plans to enable sdr-50 and sdr-104?
Is it not supported for some reason?

I don't mind if its not enabled in this patch but I would like to
know if it can be enabled or not and reflect that information in the wiki.

http://elinux.org/index.php?title=Renesas-MMC-Enabled-Speeds

> +	status = "okay";
> +};
> +
>  &i2c3 {
>  	pinctrl-0 = <&i2c3_pins>;
>  	pinctrl-names = "default";
> -- 
> 1.9.1
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
