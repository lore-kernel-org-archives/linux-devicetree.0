From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/7] [v2] dt-bindings: fsl: updates bindings for some
 SoC-specific devices
Date: Thu, 8 Sep 2016 10:30:27 +0800
Message-ID: <20160908023026.GC2533@x250>
References: <1473069695-33092-1-git-send-email-shh.xie@gmail.com>
 <1473069695-33092-2-git-send-email-shh.xie@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1473069695-33092-2-git-send-email-shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Sep 05, 2016 at 06:01:29PM +0800, shh.xie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>
> 
> SCFG and DCFG are SoC-specific devices can be found on SoCs like LS1021A,
> LS1043A and LS1046A, this patch updates bindings for SCFG and DCFG to
> reflect more SoCs.
> 
> Signed-off-by: Shaohui Xie <Shaohui.Xie-3arQi8VN3Tc@public.gmane.org>
> ---
> changes in V2:
> new patch.
> 
>  Documentation/devicetree/bindings/arm/fsl.txt | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
> index dbbc095..6f92d0b 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.txt
> +++ b/Documentation/devicetree/bindings/arm/fsl.txt
> @@ -97,7 +97,7 @@ Freescale LS1021A Platform Device Tree Bindings
>  Required root node compatible properties:
>    - compatible = "fsl,ls1021a";
>  
> -Freescale LS1021A SoC-specific Device Tree Bindings
> +Freescale SoC-specific Device Tree Bindings
>  -------------------------------------------
>  
>  Freescale SCFG
> @@ -105,7 +105,10 @@ Freescale SCFG
>  configuration and status registers for the chip. Such as getting PEX port
>  status.
>    Required properties:
> -  - compatible: should be "fsl,ls1021a-scfg"
> +  - compatible: Should contain a chip-specific compatible string,
> +	Chip-specific strings are of the form "fsl,<chip>-scfg", such as:
> +	"fsl,ls1021a-scfg"

Per Documentation/devicetree/bindings/submitting-patches.txt, the known
values of "<chip>" should be documented.

Shawn

> +
>    - reg: should contain base address and length of SCFG memory-mapped registers
>  
>  Example:
> @@ -119,7 +122,10 @@ Freescale DCFG
>  configuration and status for the device. Such as setting the secondary
>  core start address and release the secondary core from holdoff and startup.
>    Required properties:
> -  - compatible: should be "fsl,ls1021a-dcfg"
> +  - compatible: Should contain a chip-specific compatible string,
> +	Chip-specific strings are of the form "fsl,<chip>-dcfg", such as:
> +	"fsl,ls1021a-dcfg"
> +
>    - reg : should contain base address and length of DCFG memory-mapped registers
>  
>  Example:
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
