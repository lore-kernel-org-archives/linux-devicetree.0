Return-Path: <SRS0=tQ8O=GN=verge.net.au=horms@kernel.org>
Date: Fri, 23 Mar 2018 10:17:33 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] spi: sh-msiof: Document R-Car M3-N support
Message-ID: <20180323091732.rrn62wjyl5l5g65k@verge.net.au>
References: <1521795785-23825-1-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521795785-23825-1-git-send-email-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Fri, Mar 23, 2018 at 10:03:05AM +0100, Geert Uytterhoeven wrote:
> Document support for the MSIOF module in the Renesas M3-N (r8a77965) SoC.
> 
> No driver update is needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/spi/sh-msiof.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/sh-msiof.txt b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> index 80710f0f04489174..39806329c19396f6 100644
> --- a/Documentation/devicetree/bindings/spi/sh-msiof.txt
> +++ b/Documentation/devicetree/bindings/spi/sh-msiof.txt
> @@ -10,6 +10,7 @@ Required properties:
>  			 "renesas,msiof-r8a7794" (R-Car E2)
>  			 "renesas,msiof-r8a7795" (R-Car H3)
>  			 "renesas,msiof-r8a7796" (R-Car M3-W)
> +			 "renesas,msiof-r8a77965" (R-Car M3-N)
>  			 "renesas,msiof-sh73a0" (SH-Mobile AG5)
>  			 "renesas,sh-mobile-msiof" (generic SH-Mobile compatibile device)
>  			 "renesas,rcar-gen2-msiof" (generic R-Car Gen2 and RZ/G1 compatible device)
> -- 
> 2.7.4
> 
