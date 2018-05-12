Return-Path: <SRS0=TwA5=IA=verge.net.au=horms@kernel.org>
Date: Sat, 12 May 2018 16:12:37 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/2] dt-bindings: arm: document Renesas V3HSK board
 bindings
Message-ID: <20180512141237.e47b2qwg7i7pkfs6@verge.net.au>
References: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com>
 <24039c74-d6d3-cac3-6c68-5dcd88ef8ecc@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24039c74-d6d3-cac3-6c68-5dcd88ef8ecc@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Thu, May 10, 2018 at 09:09:40PM +0300, Sergei Shtylyov wrote:
> Document the V3H Starter Kit device tree bindings, listing it as
> a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to
> the V3HSK board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

This looks fine but I will wait to see if there are other reviews before
applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> ---
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> ===================================================================
> --- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -132,6 +132,8 @@ Boards:
>      compatible = "renesas,sk-rzg1m", "renesas,r8a7743"
>    - Stout (ADAS Starterkit, Y-R-CAR-ADAS-SKH2-BOARD)
>      compatible = "renesas,stout", "renesas,r8a7790"
> +  - V3HSK (Y-ASK-RCAR-V3H-WS10)
> +    compatible = "renesas,v3hsk", "renesas,r8a77980"
>    - V3MSK (Y-ASK-RCAR-V3M-WS10)
>      compatible = "renesas,v3msk", "renesas,r8a77970"
>    - Wheat (RTP0RC7792ASKB0000JE)
> 
