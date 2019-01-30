Return-Path: <SRS0=1SK5=QG=verge.net.au=horms@kernel.org>
Date: Wed, 30 Jan 2019 10:58:54 +0100
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] dt-bindings: arm: renesas: Fix SoC mismatch for Stout
Message-ID: <20190130095854.ue6o2sovkl2y5woi@verge.net.au>
References: <20190128085529.20538-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128085529.20538-1-geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On Mon, Jan 28, 2019 at 09:55:29AM +0100, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm/boot/dts/r8a7790-stout.dt.yaml: compatible: ['renesas,stout', 'renesas,r8a7790'] is not valid under any of the given schemas
> 
> The Stout development board has an R-Car H2 (r8a7790) SoC, not an R-Car
> H1 (r8a7779).
> 
> Fixes: 12749350567c819d ("dt-bindings: arm: Convert Renesas board/soc bindings to json-schema")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v5.1.

> ---
>  Documentation/devicetree/bindings/arm/renesas.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> index cb9b4417e8a1cd75..19f379863d50bd41 100644
> --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> @@ -130,13 +130,13 @@ properties:
>          items:
>            - enum:
>                - renesas,marzen # Marzen (R0P7779A00010S)
> -              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>            - const: renesas,r8a7779
>  
>        - description: R-Car H2 (R8A77900)
>          items:
>            - enum:
>                - renesas,lager # Lager (RTP0RC7790SEB00010S)
> +              - renesas,stout # Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>            - const: renesas,r8a7790
>  
>        - description: R-Car M2-W (R8A77910)
> -- 
> 2.17.1
> 
