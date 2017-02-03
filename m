From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v3] ARM: dts: i.MX25: add AIPS control registers
Date: Fri, 3 Feb 2017 18:27:26 +0100
Message-ID: <20170203172726.5kn5h6xkrl4zszmd@pengutronix.de>
References: <1485890402-22974-1-git-send-email-martin@kaiser.cx>
 <1486126792-28186-1-git-send-email-martin@kaiser.cx>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1486126792-28186-1-git-send-email-martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>
Cc: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Steffen Trumtrar <s.trumtrar-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Feb 03, 2017 at 01:59:52PM +0100, Martin Kaiser wrote:
> The i.MX25 contains two AHB to IP bridges (AIPS), each of which has a set of
> control registers. Add the memory regions for the control registers to
> the Device Tree.
> 
> Signed-off-by: Martin Kaiser <martin-XxZfDwE/svGeZLLa646FqQ@public.gmane.org>

Reviewed-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Sascha

> ---
> v3:
>    fixed the size of the memory regions, both are 16KBytes long
> 
> v2:
>    removed the "fsl,imx53-aipstz" property as per Sascha's request
> 
>  arch/arm/boot/dts/imx25.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx25.dtsi b/arch/arm/boot/dts/imx25.dtsi
> index e0ba550..5ae8a14 100644
> --- a/arch/arm/boot/dts/imx25.dtsi
> +++ b/arch/arm/boot/dts/imx25.dtsi
> @@ -93,6 +93,11 @@
>  			reg = <0x43f00000 0x100000>;
>  			ranges;
>  
> +			aips1: bridge@43f00000 {
> +				compatible = "fsl,imx25-aips";
> +				reg = <0x43f00000 0x4000>;
> +			};
> +
>  			i2c1: i2c@43f80000 {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
> @@ -342,6 +347,11 @@
>  			reg = <0x53f00000 0x100000>;
>  			ranges;
>  
> +			aips2: bridge@53f00000 {
> +				compatible = "fsl,imx25-aips";
> +				reg = <0x53f00000 0x4000>;
> +			};
> +
>  			clks: ccm@53f80000 {
>  				compatible = "fsl,imx25-ccm";
>  				reg = <0x53f80000 0x4000>;
> -- 
> 2.1.4
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
