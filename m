Return-Path: <SRS0=X0Lk=MG=verge.net.au=horms@kernel.org>
Date: Mon, 24 Sep 2018 10:55:54 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 2/4] dt-bindings: i2c: rcar: Document r8a7744 support
Message-ID: <20180924085553.f24txbyjm7dpthyl@verge.net.au>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537551421-4259-3-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537551421-4259-3-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Biju Das <biju.das@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 21, 2018 at 06:36:59PM +0100, Fabrizio Castro wrote:
> From: Biju Das <biju.das@bp.renesas.com>
> 
> Document i2c Device Tree support for RZ/G1N (R8A7744) SoC, which is
> compatible with R-Car Gen2 SoC family.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> index 671e2a1..30c0485 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> @@ -3,6 +3,7 @@ I2C for R-Car platforms
>  Required properties:
>  - compatible:
>  	"renesas,i2c-r8a7743" if the device is a part of a R8A7743 SoC.
> +	"renesas,i2c-r8a7744" if the device is a part of a R8A7744 SoC.
>  	"renesas,i2c-r8a7745" if the device is a part of a R8A7745 SoC.
>  	"renesas,i2c-r8a77470" if the device is a part of a R8A77470 SoC.
>  	"renesas,i2c-r8a774a1" if the device is a part of a R8A774A1 SoC.
> -- 
> 2.7.4
> 
