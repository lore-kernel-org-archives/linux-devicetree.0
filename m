Return-Path: <SRS0=X0Lk=MG=verge.net.au=horms@kernel.org>
Date: Mon, 24 Sep 2018 11:00:00 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 3/4] dt-bindings: i2c: sh_mobile: Document r8a7744 support
Message-ID: <20180924085959.htvcfjxy7d3zprwi@verge.net.au>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537551421-4259-4-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537551421-4259-4-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Biju Das <biju.das@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 21, 2018 at 06:37:00PM +0100, Fabrizio Castro wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> Document i2c Device Tree support for RZ/G1N (R8A7744) SoC, which is
> compatible with R-Car Gen2 SoC family.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
> index 872673a..d81b626 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-sh_mobile.txt
> @@ -5,6 +5,7 @@ Required properties:
>  			- "renesas,iic-r8a73a4" (R-Mobile APE6)
>  			- "renesas,iic-r8a7740" (R-Mobile A1)
>  			- "renesas,iic-r8a7743" (RZ/G1M)
> +			- "renesas,iic-r8a7744" (RZ/G1N)
>  			- "renesas,iic-r8a7745" (RZ/G1E)
>  			- "renesas,iic-r8a774a1" (RZ/G2M)
>  			- "renesas,iic-r8a7790" (R-Car H2)
> -- 
> 2.7.4
> 
