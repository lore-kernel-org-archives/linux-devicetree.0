Return-Path: <SRS0=fOFy=OB=linaro.org=daniel.lezcano@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a774a1 CMT
 support
References: <1542644054-34660-1-git-send-email-biju.das@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <16b7f14c-7ed6-4350-357f-224cc18aa10d@linaro.org>
Date: Thu, 22 Nov 2018 15:22:31 +0100
MIME-Version: 1.0
In-Reply-To: <1542644054-34660-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

On 19/11/2018 17:14, Biju Das wrote:
> Document SoC specific bindings for RZ/G2M (r8a774a1) SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Please send to lkml@ also.

> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> index eb602c5..862a80f 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -30,6 +30,8 @@ Required Properties:
>      - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7745.
>      - "renesas,r8a77470-cmt0" for the 32-bit CMT0 device included in r8a77470.
>      - "renesas,r8a77470-cmt1" for the 48-bit CMT1 device included in r8a77470.
> +    - "renesas,r8a774a1-cmt0" for the 32-bit CMT0 device included in r8a774a1.
> +    - "renesas,r8a774a1-cmt1" for the 48-bit CMT1 device included in r8a774a1.
>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7790.
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7791.
> @@ -51,9 +53,12 @@ Required Properties:
>  		and RZ/G1.
>  		These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
>  		listed above.
> -    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3.
> -    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3.
> -		These are fallbacks for R-Car Gen3 entries listed above.
> +    - "renesas,rcar-gen3-cmt0" for 32-bit CMT0 devices included in R-Car Gen3
> +		and RZ/G2.
> +    - "renesas,rcar-gen3-cmt1" for 48-bit CMT1 devices included in R-Car Gen3
> +		and RZ/G2.
> +		These are fallbacks for R-Car Gen3 and RZ/G2 entries listed
> +		above.
>  
>    - reg: base address and length of the registers block for the timer module.
>    - interrupts: interrupt-specifier for the timer, one per channel.
> 


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
