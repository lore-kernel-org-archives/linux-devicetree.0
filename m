From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: DTS: kirkwood-openrd: fix pin names for UART/SD
 selection
Date: Sun, 24 Jan 2016 18:30:51 +0100
Message-ID: <20160124173051.GT3880@lunn.ch>
References: <1452629253-21748-1-git-send-email-aaro.koskinen@iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1452629253-21748-1-git-send-email-aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 12, 2016 at 10:07:32PM +0200, Aaro Koskinen wrote:
> The UART/SD pin names are swapped, fix that.
> 
> Signed-off-by: Aaro Koskinen <aaro.koskinen-X3B1VOXEql0@public.gmane.org>

This, and 2/2:

Reviewed-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>

Thanks
	Andrew

> ---
>  arch/arm/boot/dts/kirkwood-openrd.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-openrd.dtsi b/arch/arm/boot/dts/kirkwood-openrd.dtsi
> index d3330da..2a3dafd 100644
> --- a/arch/arm/boot/dts/kirkwood-openrd.dtsi
> +++ b/arch/arm/boot/dts/kirkwood-openrd.dtsi
> @@ -40,7 +40,7 @@
>  			pinctrl-0 = <&pmx_select28 &pmx_sdio_cd &pmx_select34>;
>  			pinctrl-names = "default";
>  
> -			pmx_select28: pmx-select-uart-sd {
> +			pmx_select28: pmx-select-rs232-rs484 {
>  				marvell,pins = "mpp28";
>  				marvell,function = "gpio";
>  			};
> @@ -48,7 +48,7 @@
>  				marvell,pins = "mpp29";
>  				marvell,function = "gpio";
>  			};
> -			pmx_select34: pmx-select-rs232-rs484 {
> +			pmx_select34: pmx-select-uart-sd {
>  				marvell,pins = "mpp34";
>  				marvell,function = "gpio";
>  			};
> -- 
> 2.4.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
