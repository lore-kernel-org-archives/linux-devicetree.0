From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] dts/ls2080a: Update PCIe compatible
Date: Fri, 4 Dec 2015 10:22:43 -0600
Message-ID: <20151204162243.GA12415@rob-hp-laptop>
References: <1449224417-20753-1-git-send-email-Mingkai.Hu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1449224417-20753-1-git-send-email-Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, leoli-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Dec 04, 2015 at 06:20:17PM +0800, Mingkai Hu wrote:
> From: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> The patch adds LS2085a to PCIe compatible to fix the compatibility
> issue when using firmware with LS2085a compatible property.
> 
> Signed-off-by: Minghuan Lian <Minghuan.Lian-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> Signed-off-by: Mingkai Hu <Mingkai.Hu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
> v2 change:
>  - Rebased to latest kernel base

How about implementing my comments on v1, too?

> 
>  Documentation/devicetree/bindings/pci/layerscape-pci.txt |  1 +
>  arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi           | 12 ++++++++----
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/layerscape-pci.txt b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> index e376785..4600007 100644
> --- a/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> +++ b/Documentation/devicetree/bindings/pci/layerscape-pci.txt
> @@ -15,6 +15,7 @@ Required properties:
>  - compatible: should contain the platform identifier such as:
>          "fsl,ls1021a-pcie", "snps,dw-pcie"
>          "fsl,ls2080a-pcie", "snps,dw-pcie"
> +        "fsl,ls2085a-pcie", "snps,dw-pcie"
>  - reg: base addresses and lengths of the PCIe controller
>  - interrupts: A list of interrupt outputs of the controller. Must contain an
>    entry for each entry in the interrupt-names property.
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> index e81cd48..3821bb1 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
> @@ -383,7 +383,8 @@
>  		};
>  
>  		pcie@3400000 {
> -			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
> +			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
> +				     "snps,dw-pcie";
>  			reg = <0x00 0x03400000 0x0 0x00100000   /* controller registers */
>  			       0x10 0x00000000 0x0 0x00002000>; /* configuration space */
>  			reg-names = "regs", "config";
> @@ -406,7 +407,8 @@
>  		};
>  
>  		pcie@3500000 {
> -			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
> +			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
> +				     "snps,dw-pcie";
>  			reg = <0x00 0x03500000 0x0 0x00100000   /* controller registers */
>  			       0x12 0x00000000 0x0 0x00002000>; /* configuration space */
>  			reg-names = "regs", "config";
> @@ -429,7 +431,8 @@
>  		};
>  
>  		pcie@3600000 {
> -			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
> +			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
> +				     "snps,dw-pcie";
>  			reg = <0x00 0x03600000 0x0 0x00100000   /* controller registers */
>  			       0x14 0x00000000 0x0 0x00002000>; /* configuration space */
>  			reg-names = "regs", "config";
> @@ -452,7 +455,8 @@
>  		};
>  
>  		pcie@3700000 {
> -			compatible = "fsl,ls2080a-pcie", "snps,dw-pcie";
> +			compatible = "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
> +				     "snps,dw-pcie";
>  			reg = <0x00 0x03700000 0x0 0x00100000   /* controller registers */
>  			       0x16 0x00000000 0x0 0x00002000>; /* configuration space */
>  			reg-names = "regs", "config";
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
