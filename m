From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: r8a7795: Fix register mappings on VSPs
Date: Wed, 14 Feb 2018 00:04:06 +0200
Message-ID: <3018772.vufxKlmmgK@avalon>
References: <1518550237-16753-1-git-send-email-kbingham@kernel.org> <1518550237-16753-4-git-send-email-kbingham@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1518550237-16753-4-git-send-email-kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kieran Bingham <kbingham-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Kieran Bingham <kieran.bingham-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Tuesday, 13 February 2018 21:30:36 EET Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> 
> The VSPD includes a CLUT on RPF2. Ensure that the register space is
> mapped correctly to support this.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>

> ---
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> b/arch/arm64/boot/dts/renesas/r8a7795.dtsi index 1f32340af2d1..772991db8820
> 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -2607,7 +2607,7 @@
> 
>  		vspd0: vsp@fea20000 {
>  			compatible = "renesas,vsp2";
> -			reg = <0 0xfea20000 0 0x4000>;
> +			reg = <0 0xfea20000 0 0x8000>;
>  			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 623>;
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> @@ -2627,7 +2627,7 @@
> 
>  		vspd1: vsp@fea28000 {
>  			compatible = "renesas,vsp2";
> -			reg = <0 0xfea28000 0 0x4000>;
> +			reg = <0 0xfea28000 0 0x8000>;
>  			interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 622>;
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
> @@ -2647,7 +2647,7 @@
> 
>  		vspd2: vsp@fea30000 {
>  			compatible = "renesas,vsp2";
> -			reg = <0 0xfea30000 0 0x4000>;
> +			reg = <0 0xfea30000 0 0x8000>;
>  			interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 621>;
>  			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;


-- 
Regards,

Laurent Pinchart

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
