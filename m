Return-Path: <SRS0=D29a=L4=pengutronix.de=p.zabel@kernel.org>
Message-ID: <1536919741.4112.4.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: reset: rcar-rst: Document r8a774c0 rst
From: Philipp Zabel <p.zabel@pengutronix.de>
Date: Fri, 14 Sep 2018 12:09:01 +0200
In-Reply-To: <1536592181-25649-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: 
	<1536592181-25649-1-git-send-email-fabrizio.castro@bp.renesas.com>
	 <1536592181-25649-2-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, 2018-09-10 at 16:09 +0100, Fabrizio Castro wrote:
> Document bindings for the RZ/G2E (a.k.a. R8A774C0) reset
> module.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/reset/renesas,rst.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> index e4fe0ab..25e6db5 100644
> --- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
> +++ b/Documentation/devicetree/bindings/reset/renesas,rst.txt
> @@ -19,6 +19,7 @@ Required properties:
>  		  - "renesas,r8a7745-rst" (RZ/G1E)
>  		  - "renesas,r8a77470-rst" (RZ/G1C)
>  		  - "renesas,r8a774a1-rst" (RZ/G2M)
> +		  - "renesas,r8a774c0-rst" (RZ/G2E)
>  		  - "renesas,r8a7778-reset-wdt" (R-Car M1A)
>  		  - "renesas,r8a7779-reset-wdt" (R-Car H1)
>  		  - "renesas,r8a7790-rst" (R-Car H2)

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
