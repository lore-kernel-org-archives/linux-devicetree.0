From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] ARM: DTS: LS1021A: add SATA node to DTS
Date: Wed, 2 Dec 2015 14:30:40 +0800
Message-ID: <20151202063040.GJ692@tiger>
References: <1448854775-19865-1-git-send-email-Yuantian.Tang@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1448854775-19865-1-git-send-email-Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Nov 30, 2015 at 11:39:35AM +0800, Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org wrote:
> From: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> 
> Added SATA node to LS1021A DTS to support SATA function.
> 
> Signed-off-by: Tang Yuantian <Yuantian.Tang-KZfg59tc24xl57MIdRCFDg@public.gmane.org>

I think 'ARM: dts: ls1021a: ...' is a more idiomatic patch prefix for
your patch. 

> ---
> v2:
> 	- put reg-names right after reg property
> 
>  arch/arm/boot/dts/ls1021a.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
> index 9430a99..33aae8d 100644
> --- a/arch/arm/boot/dts/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/ls1021a.dtsi
> @@ -143,6 +143,16 @@
>  			status = "disabled";
>  		};
>  
> +		sata: sata@3200000 {
> +			compatible = "fsl,ls1021a-ahci";
> +			reg = <0x0 0x3200000 0x0 0x10000>,
> +			      <0x0 0x20220520 0x0 0x4>;
> +			reg-names = "ahci", "sata-ecc";
> +			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&platform_clk 1>;
> +			dma-coherent;
> +		};

Shouldn't it have the line below to get the device disabled in
<soc>.dtsi by default, and let <board>.dts that has sata support to
enable it?

	status = "disabled";

Shawn

> +
>  		scfg: scfg@1570000 {
>  			compatible = "fsl,ls1021a-scfg", "syscon";
>  			reg = <0x0 0x1570000 0x0 0x10000>;
> -- 
> 2.1.0.27.g96db324
> 
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
