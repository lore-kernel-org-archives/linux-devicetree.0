From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH 1/3] dt-bindings: timer: renesas, cmt: Document
 r8a774[35] CMT support
Date: Wed, 13 Dec 2017 09:40:48 +0100
Message-ID: <20171213084048.jxofa3hinb6gm2ax@verge.net.au>
References: <1513104579-6333-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513104579-6333-2-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1513104579-6333-2-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 12, 2017 at 06:49:37PM +0000, Fabrizio Castro wrote:
> Document SoC specific compatible strings for r8a7743 and r8a7745.
> No driver change is needed as the fallback strings will activate
> the right code.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> index d740989..1e4fe98 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -22,6 +22,10 @@ Required Properties:
>  
>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a73a4.
>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a73a4.
> +    - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7743.
> +    - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7743.
> +    - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7745.
> +    - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
> @@ -31,9 +35,11 @@ Required Properties:
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7794.
>  
> -    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2.
> -    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2.
> -		These are fallbacks for r8a73a4 and all the R-Car Gen2
> +    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car Gen2 or

nit: or -> and ?

> +		RZ/G1.
> +    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car Gen2 or
> +		RZ/G1.
> +		These are fallbacks for r8a73a4, all the R-Car Gen2 and RZ/G1
>  		entries	listed above.

nit: all the R-Car -> R-Car

>    - reg: base address and length of the registers block for the timer module.
