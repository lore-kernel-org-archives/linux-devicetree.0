From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: rockchip: fix typo in iommu nodes
Date: Tue, 10 Oct 2017 11:48:25 +0200
Message-ID: <4123717.0VmPnCpUOn@diego>
References: <20171010085648.1339605-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171010085648.1339605-1-arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Sugar Zhang <sugar.zhang-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, David Wu <david.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Rocky Hao <rocky.hao-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, William Wu <william.wu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Liang Chen <cl-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Jianqun Xu <jay.xu-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Simon Xue <xxm-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Arnd,

Am Dienstag, 10. Oktober 2017, 10:56:01 CEST schrieb Arnd Bergmann:
> The latest dtc warns about an extraneous cell in the interrupt
> property of two of the iommu device nodes:
> 
> Warning (interrupts_property): interrupts size is (16), expected multiple of
> 12 in /iommu@ff373f00 Warning (interrupts_property): interrupts size is
> (16), expected multiple of 12 in /iommu@ff900800
> 
> This removes the typo.
> 
> Fixes: cede4c79de28 ("arm64: dts: rockchip: add rk3368 iommu nodes")
> Fixes: 49c82f2b7c5d ("arm64: dts: rockchip: add rk3328 iommu nodes")
> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

looks like that got copy-pasted from rk3399 where we have 4 elements per irq.
In any case the change looks good, so if you want to apply it directly to 
armsoc-fixes here is a

Acked-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>

Depending on how you want to handle it I can also merge it, but
Olof already picked up my 2 fixes for 4.14, so you applying it might
save us the round-trip for a further 1-patch pull request :-)


Heiko

> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 2 +-
>  arch/arm64/boot/dts/rockchip/rk3368.dtsi | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3328.dtsi index 6d615cb6e64d..41d61840fb99
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -582,7 +582,7 @@
>  	vop_mmu: iommu@ff373f00 {
>  		compatible = "rockchip,iommu";
>  		reg = <0x0 0xff373f00 0x0 0x100>;
> -		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
>  		interrupt-names = "vop_mmu";
>  		#iommu-cells = <0>;
>  		status = "disabled";
> diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3368.dtsi index 19fbaa5e7bdd..1070c8264c13
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
> @@ -740,7 +740,7 @@
>  	iep_mmu: iommu@ff900800 {
>  		compatible = "rockchip,iommu";
>  		reg = <0x0 0xff900800 0x0 0x100>;
> -		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH 0>;
> +		interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
>  		interrupt-names = "iep_mmu";
>  		#iommu-cells = <0>;
>  		status = "disabled";


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
