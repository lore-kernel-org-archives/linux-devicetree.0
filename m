From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/3] Documentation: DT: Add entry for FSL LS1012A RDB,
 FRDM, QDS boards
Date: Sun, 29 Jan 2017 10:10:40 +0800
Message-ID: <20170129021039.GA11950@dragon>
References: <1478714651-12679-1-git-send-email-harninder.rai@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1478714651-12679-1-git-send-email-harninder.rai-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, oss-fOR+EgIDQEHk1uMJSBkQmQ@public.gmane.org, Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Nov 09, 2016 at 11:34:11PM +0530, Harninder Rai wrote:
> Signed-off-by: Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>
> Signed-off-by: Bhaskar Upadhaya <Bhaskar.Upadhaya-3arQi8VN3Tc@public.gmane.org>

Applied all 3, thanks.

> ---
>  Documentation/devicetree/bindings/arm/fsl.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index d6ee9c6..3b01338 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -139,6 +139,22 @@ Example:
>  Freescale ARMv8 based Layerscape SoC family Device Tree Bindings
>  ----------------------------------------------------------------
>  
> +LS1012A SoC
> +Required root node properties:
> +    - compatible = "fsl,ls1012a";
> +
> +LS1012A ARMv8 based RDB Board
> +Required root node properties:
> +    - compatible = "fsl,ls1012a-rdb", "fsl,ls1012a";
> +
> +LS1012A ARMv8 based FRDM Board
> +Required root node properties:
> +    - compatible = "fsl,ls1012a-frdm", "fsl,ls1012a";
> +
> +LS1012A ARMv8 based QDS Board
> +Required root node properties:
> +    - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
> +
>  LS1043A SoC
>  Required root node properties:
>      - compatible = "fsl,ls1043a";
> -- 
> 2.7.4
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
