From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v12 4/6] arm/dts/ls1021a: Add DCU dts node
Date: Sat, 25 Jul 2015 11:27:47 +0800
Message-ID: <20150725032747.GH12927@tiger>
References: <1437734054-36163-1-git-send-email-jianwei.wang.chn@gmail.com>
 <1437734054-36163-5-git-send-email-jianwei.wang.chn@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1437734054-36163-5-git-send-email-jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>, airlied-cv59FeDIM0c@public.gmane.org, daniel.vetter-/w4YWyX8dFk@public.gmane.org, Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, scottwood-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mark.yao-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 24, 2015 at 06:34:12PM +0800, Jianwei Wang wrote:
> Add DCU node, DCU is a display controller of Freescale
> named 2D-ACE.
> 
> Signed-off-by: Alison Wang <b18965-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Xiubo Li <lixiubo-0p4V/sDNsUmm0O/7XYngnFaTQe2KTcn/@public.gmane.org>
> Signed-off-by: Jianwei Wang <jianwei.wang.chn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

For dts patches sent to me, please use prefix like "ARM: dts: ls1021a:
..." in the subject.

Shawn

> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index c70bb27..6d6e3e2 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -383,6 +383,16 @@
>  				 <&platform_clk 1>;
>  		};
>  
> +		dcu: dcu@2ce0000 {
> +			compatible = "fsl,ls1021a-dcu";
> +			reg = <0x0 0x2ce0000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&platform_clk 0>;
> +			clock-names = "dcu";
> +			big-endian;
> +			status = "disabled";
> +		};
> +
>  		mdio0: mdio@2d24000 {
>  			compatible = "gianfar";
>  			device_type = "mdio";
> -- 
> 2.1.0.27.g96db324
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
