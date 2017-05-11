From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls1088a: update the sata node
Date: Thu, 11 May 2017 15:35:15 +0800
Message-ID: <20170511073514.GE5833@dragon>
References: <1494213209-39673-1-git-send-email-andy.tang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1494213209-39673-1-git-send-email-andy.tang-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuantian Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 08, 2017 at 11:13:29AM +0800, Yuantian Tang wrote:
> 1. Sata ecc should be disabled due to a erratum.
> Provide the ecc register address for driver to use.

This is a bit confusing.  Are you saying that the ECC register address
is provided in DT for SATA driver to disable ECC function?

> 2. Enable dma coherence operation
> 
> Signed-off-by: Tang Yuantian <andy.tang-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> index 2946fd7..90edd76 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> @@ -265,10 +265,13 @@
>  
>  		sata: sata@3200000 {
>  			compatible = "fsl,ls1088a-ahci", "fsl,ls1043a-ahci";
> -			reg = <0x0 0x3200000 0x0 0x10000>;
> +			reg = <0x0 0x3200000 0x0 0x10000>,
> +				<0x0 0x20140520 0x0 0x4>;
> +			reg-names = "ahci", "sata-ecc";
>  			interrupts = <0 133 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&clockgen 4 3>;
>  			status = "disabled";
> +			dma-coherent;

Please add it above 'status' line, which we generally keep at the bottom
of property list.

Shawn

>  		};
>  	};
>  
> -- 
> 2.1.0.27.g96db324
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
