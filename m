Return-Path: <SRS0=iicR=MQ=verge.net.au=horms@kernel.org>
Date: Thu, 4 Oct 2018 11:59:57 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/6] dt-bindings: mmc: renesas_sdhi: Add r8a77470 support
Message-ID: <20181004095955.qhltoiybmdd23lfx@verge.net.au>
References: <1538564744-15590-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1538564744-15590-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538564744-15590-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Wed, Oct 03, 2018 at 12:05:39PM +0100, Fabrizio Castro wrote:
> The RZ/G1C (a.k.a. R8A77470) comes with three SDHI interfaces,
> SDHI0 and SDHI2 are compatible with R-Car Gen2 SDHIs, and
> SDHI1 is compatible with R-Car Gen3 SDHIs, as it comes with an
> internal DMAC, therefore SDHI1 is fully compatible with driver
> renesas_sdhi_internal_dmac driver. As a result, the compatible
> strings for the R8A77470 SDHI interfaces are a little bit special.
> Document SDHI support for the RZ/G1C SoC.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> 
> ---
> v1->v2:
> * Added "renesas,sdhi-mmc-r8a77470"
> * Using generic/fallback compatibilty only for SDHI[02]
> * Reworked changelog
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index d39d5e4..247abee 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -19,6 +19,8 @@ Required properties:
>  		"renesas,sdhi-r8a7744" - SDHI IP on R8A7744 SoC
>  		"renesas,sdhi-r8a7745" - SDHI IP on R8A7745 SoC
>  		"renesas,sdhi-r8a774a1" - SDHI IP on R8A774A1 SoC
> +		"renesas,sdhi-r8a77470" - SDHI IP on R8A77470 SoC (SDHI[02])
> +		"renesas,sdhi-mmc-r8a77470" - SDHI IP on R8A77470 SoC (SDHI1)

I understand that SDHI[02] is different to SDHI1 on this SoC.
But I'm not clear on why SDHI1 is more "mmc" than SDHI[02].

>  		"renesas,sdhi-r8a7778" - SDHI IP on R8A7778 SoC
>  		"renesas,sdhi-r8a7779" - SDHI IP on R8A7779 SoC
>  		"renesas,sdhi-r8a7790" - SDHI IP on R8A7790 SoC
> @@ -35,8 +37,8 @@ Required properties:
>  		"renesas,sdhi-r8a77995" - SDHI IP on R8A77995 SoC
>  		"renesas,sdhi-shmobile" - a generic sh-mobile SDHI controller
>  		"renesas,rcar-gen1-sdhi" - a generic R-Car Gen1 SDHI controller
> -		"renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 or RZ/G1
> -					   SDHI controller
> +		"renesas,rcar-gen2-sdhi" - a generic R-Car Gen2 and RZ/G1 (but
> +					   not RZ/G1C SDHI1) SDHI controller
>  		"renesas,rcar-gen3-sdhi" - a generic R-Car Gen3 or RZ/G2
>  					   SDHI controller

renesas,rcar-gen3-sdhi can be used with RZ/G1C SDHI1, right?
The naming is starting to break down at this point :(

>  
> -- 
> 2.7.4
> 
