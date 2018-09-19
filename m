Return-Path: <SRS0=njd1=MB=verge.net.au=horms@kernel.org>
Date: Wed, 19 Sep 2018 11:38:26 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: rcar-dmac: Document r8a7744 support
Message-ID: <20180919093826.yr3hnqehy7vyg6ik@verge.net.au>
References: <1537197496-22345-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537197496-22345-1-git-send-email-biju.das@bp.renesas.com>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Sep 17, 2018 at 04:18:16PM +0100, Biju Das wrote:
> Renesas RZ/G SoC also have the R-Car gen2/3 compatible DMA controllers.
> Document RZ/G1N (also known as R8A7744) SoC bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> index 946229c..a5a7c3f 100644
> --- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> +++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.txt
> @@ -17,6 +17,7 @@ Required Properties:
>  - compatible: "renesas,dmac-<soctype>", "renesas,rcar-dmac" as fallback.
>  	      Examples with soctypes are:
>  		- "renesas,dmac-r8a7743" (RZ/G1M)
> +		- "renesas,dmac-r8a7744" (RZ/G1N)
>  		- "renesas,dmac-r8a7745" (RZ/G1E)
>  		- "renesas,dmac-r8a77470" (RZ/G1C)
>  		- "renesas,dmac-r8a7790" (R-Car H2)
> -- 
> 2.7.4
> 
