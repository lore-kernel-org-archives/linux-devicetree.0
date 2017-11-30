From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2][RESEND] arm: dts: Add big-endian for IFC on LS1021A
Date: Thu, 30 Nov 2017 08:51:57 +0800
Message-ID: <20171130005156.GF22908@dragon>
References: <1511955091-8816-1-git-send-email-prabhakar.kushwaha@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1511955091-8816-1-git-send-email-prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>, Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 29, 2017 at 05:01:31PM +0530, Prabhakar Kushwaha wrote:
> From: Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
> 
> For the patch to update struct map_info's swap field based on device
> characteristics defined in device tree, big-endian parameter is added
> for LS1021A.
> 
> Signed-off-by: Alison Wang <alison.wang-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Jagdish Gediya <jagdish.gediya-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Prabhakar Kushwaha <prabhakar.kushwaha-3arQi8VN3Tc@public.gmane.org>
> ---
>  arch/arm/boot/dts/ls1021a.dtsi | 1 +

For arm32 dts patches, please use prefix like 'ARM: dts: ...'.

Shawn

>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index 9319e1f..babb086 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -145,6 +145,7 @@
>  		ifc: ifc@1530000 {
>  			compatible = "fsl,ifc", "simple-bus";
>  			reg = <0x0 0x1530000 0x0 0x10000>;
> +			big-endian;
>  			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> -- 
> 1.9.1
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
