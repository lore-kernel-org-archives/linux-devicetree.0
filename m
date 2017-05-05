From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [v2, 1/5] mmc: dt: add compatible into eSDHC required properties
Date: Fri, 5 May 2017 10:36:52 +0800
Message-ID: <20170505023651.GW18578@dragon>
References: <1493894940-47452-1-git-send-email-yangbo.lu@nxp.com>
 <1493894940-47452-2-git-send-email-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1493894940-47452-2-git-send-email-yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, May 04, 2017 at 06:48:56PM +0800, Yangbo Lu wrote:
> This patch is to add compatible into eSDHC required properties.
> 
> Signed-off-by: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
> ---
> Changes for v2:
> 	- Added this patch.
> ---
>  Documentation/devicetree/bindings/mmc/fsl-esdhc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt b/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
> index dedfb02..b04b248 100644
> --- a/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
> +++ b/Documentation/devicetree/bindings/mmc/fsl-esdhc.txt
> @@ -7,6 +7,7 @@ This file documents differences between the core properties described
>  by mmc.txt and the properties used by the sdhci-esdhc driver.
>  
>  Required properties:
> +  - compatible : should be "fsl,esdhc", or "fsl,<chip>-esdhc".

I think either supported <chip> or the compatible should be listed
explicitly.

Shawn

>    - interrupt-parent : interrupt source phandle.
>    - clock-frequency : specifies eSDHC base clock frequency.
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
