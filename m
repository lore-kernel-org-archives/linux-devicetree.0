From: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>
Subject: Re: [PATCH 01/25] arm: artpec: dts: Remove leading 0x and 0s from
 bindings notation
Date: Fri, 15 Dec 2017 13:57:30 +0100
Message-ID: <20171215125730.GX32368@axis.com>
References: <20171215124621.29928-1-malat@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171215124621.29928-1-malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jesper Nilsson <jespern-VrBV9hrLPhE@public.gmane.org>, Lars Persson <larper-VrBV9hrLPhE@public.gmane.org>, Niklas Cassel <niklass-VrBV9hrLPhE@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-VrBV9hrLPhE@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Dec 15, 2017 at 01:46:21PM +0100, Mathieu Malaterre wrote:
> Improve the DTS files by removing all the leading "0x" and zeros to fix the
> following dtc warnings:
> 
> Warning (unit_address_format): Node /XXX unit name should not have leading "0x"
> 
> and
> 
> Warning (unit_address_format): Node /XXX unit name should not have leading 0s
> 
> Converted using the following command:
> 
> find . -type f \( -iname *.dts -o -iname *.dtsi \) -exec sed -i -e "s/@\([0-9a-fA-FxX\.;:#]+\)\s*{/@\L\1 {/g" -e "s/@0x\(.*\) {/@\1 {/g" -e "s/@0+\(.*\) {/@\1 {/g" {} +^C
> 
> For simplicity, two sed expressions were used to solve each warnings separately.
> 
> To make the regex expression more robust a few other issues were resolved,
> namely setting unit-address to lower case, and adding a whitespace before the
> the opening curly brace:
> 
> https://elinux.org/Device_Tree_Linux#Linux_conventions
> 
> This will solve as a side effect warning:
> 
> Warning (simple_bus_reg): Node /XXX@<UPPER> simple-bus unit address format error, expected "<lower>"
> 
> This is a follow up to commit 4c9847b7375a ("dt-bindings: Remove leading 0x from bindings notation")
> 
> Reported-by: David Daney <ddaney-M3mlKVOIwJVv6pq1l3V1OdBPR1lH4CV8@public.gmane.org>
> Suggested-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Mathieu Malaterre <malat-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>

Acked-by: Jesper Nilsson <jesper.nilsson-VrBV9hrLPhE@public.gmane.org>

> ---
>  arch/arm/boot/dts/artpec6.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/artpec6.dtsi b/arch/arm/boot/dts/artpec6.dtsi
> index 2ed11773048d..71e0e75e986b 100644
> --- a/arch/arm/boot/dts/artpec6.dtsi
> +++ b/arch/arm/boot/dts/artpec6.dtsi
> @@ -98,7 +98,7 @@
>  		clock-frequency = <125000000>;
>  	};
>  
> -	clkctrl: clkctrl@0xf8000000 {
> +	clkctrl: clkctrl@f8000000 {
>  		#clock-cells = <1>;
>  		compatible = "axis,artpec6-clkctrl";
>  		reg = <0xf8000000 0x48>;
> -- 
> 2.11.0

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson-VrBV9hrLPhE@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
