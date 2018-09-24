Return-Path: <SRS0=X0Lk=MG=verge.net.au=horms@kernel.org>
Date: Mon, 24 Sep 2018 10:59:04 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/4] dt-bindings: i2c: rcar: Add r8a77470 support
Message-ID: <20180924085904.xa76egqvowg5gkjs@verge.net.au>
References: <1537551421-4259-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537551421-4259-2-git-send-email-fabrizio.castro@bp.renesas.com>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das@bp.renesas.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>, Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>, linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>
List-ID: <devicetree@vger.kernel.org>

On Fri, Sep 21, 2018 at 06:36:58PM +0100, Fabrizio Castro wrote:
> Although the I2C IP found in the RZ/G1C is not exactly the same
> as the one found in the R-Car Gen2 family or R-Car Gen3 family,
> it can still be considered as compatible with R-Car Gen2 from
> a software perpective.
> This patch therefore documents the SoC specific compatible string,
> and the compatibility with Gen2 fallback is retained.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-rcar.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> index 39cd21d..671e2a1 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-rcar.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible:
>  	"renesas,i2c-r8a7743" if the device is a part of a R8A7743 SoC.
>  	"renesas,i2c-r8a7745" if the device is a part of a R8A7745 SoC.
> +	"renesas,i2c-r8a77470" if the device is a part of a R8A77470 SoC.

It seems to me that the RZ/G1C has some extra registers described for
I2C when compared with both other RZ/G1 and R-Car Gen2 SoCs.

Am I correct in assuming that operation is correct for the RZ/G1C
when using the fallback compat string for RZ/G1 and R-Car Gen2 SoCs?

And that, speculating wildly, in future it may be possible for
the driver to use these extra resgisters, f.e. by via a match on
the renesas,i2c-r8a77470 compat string?

>  	"renesas,i2c-r8a774a1" if the device is a part of a R8A774A1 SoC.
>  	"renesas,i2c-r8a7778" if the device is a part of a R8A7778 SoC.
>  	"renesas,i2c-r8a7779" if the device is a part of a R8A7779 SoC.
> -- 
> 2.7.4
> 
