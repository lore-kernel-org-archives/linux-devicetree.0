Return-Path: <robherring2@gmail.com>
Date: Fri, 12 Oct 2018 09:53:28 -0500
From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 1/6] dt-bindings: mmc: renesas_sdhi: Add r8a77470
 support
Message-ID: <20181012145328.GA9952@bogus>
References: <1538988712-17077-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1538988712-17077-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538988712-17077-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms@verge.net.au>, Mark Rutland <mark.rutland@arm.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon,  8 Oct 2018 09:51:47 +0100, Fabrizio Castro wrote:
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
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> v2->v3:
> * Incorporated comments from Geert
> 
> v1->v2:
> * Added "renesas,sdhi-mmc-r8a77470"
> * Using generic/fallback compatibilty only for SDHI[02]
> * Reworked changelog
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
