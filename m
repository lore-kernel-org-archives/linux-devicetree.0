From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 2/5] ARM: dts: imx6dl: Remove unnecessary node
Date: Mon, 13 Jan 2014 16:06:27 +0800
Message-ID: <20140113080625.GQ23525@S2101-09.ap.freescale.net>
References: <1389592718-9999-1-git-send-email-b20788@freescale.com>
 <1389592718-9999-2-git-send-email-b20788@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1389592718-9999-2-git-send-email-b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jan 13, 2014 at 01:58:35PM +0800, Anson Huang wrote:
> IOMUXC node is included in i.mx6qdl.dtsi, so no need
> to overwrite it, as it is a reused module from i.mx6q.
> 
> Signed-off-by: Anson Huang <b20788-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6dl.dtsi |    4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6dl.dtsi b/arch/arm/boot/dts/imx6dl.dtsi
> index e2ec0fb..d590d8d 100644
> --- a/arch/arm/boot/dts/imx6dl.dtsi
> +++ b/arch/arm/boot/dts/imx6dl.dtsi
> @@ -61,10 +61,6 @@
>  		};
>  
>  		aips1: aips-bus@02000000 {
> -			iomuxc: iomuxc@020e0000 {
> -				compatible = "fsl,imx6dl-iomuxc";
> -			};
> -

No.  drivers/pinctrl/pinctrl-imx6dl.c needs it.

Shawn

>  			pxp: pxp@020f0000 {
>  				reg = <0x020f0000 0x4000>;
>  				interrupts = <0 98 IRQ_TYPE_LEVEL_HIGH>;
> -- 
> 1.7.9.5
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
