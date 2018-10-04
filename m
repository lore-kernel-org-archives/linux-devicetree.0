Return-Path: <SRS0=iicR=MQ=verge.net.au=horms@kernel.org>
Date: Thu, 4 Oct 2018 12:03:35 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: arm: Fix RZ/G2E part number
Message-ID: <20181004100334.vnunbcu5pyiqnble@verge.net.au>
References: <1538643190-21880-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538643190-21880-1-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, Oct 04, 2018 at 09:53:10AM +0100, Fabrizio Castro wrote:
> Fix RZ/G2E part number from its description.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Thanks for following up on this Fabrizio.

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
> index f5e0f82..58c4256 100644
> --- a/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ b/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -27,7 +27,7 @@ SoCs:
>      compatible = "renesas,r8a77470"
>    - RZ/G2M (R8A774A1)
>      compatible = "renesas,r8a774a1"
> -  - RZ/G2E (RA8774C0)
> +  - RZ/G2E (R8A774C0)
>      compatible = "renesas,r8a774c0"
>    - R-Car M1A (R8A77781)
>      compatible = "renesas,r8a7778"
> -- 
> 2.7.4
> 
