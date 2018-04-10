Return-Path: <SRS0=idpo=G7=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document
 r8a774[35] CMT support
Date: Tue, 10 Apr 2018 09:36:39 +0000
Message-ID: <TY1PR01MB1770621EC40038C4237B1BAAC0BE0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1513618743-4773-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1513618743-4773-2-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1513618743-4773-2-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Thomas Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "Mark Rutland  <mark.rutland@arm.com>, Fabrizio Castro" <fabrizio.castro@bp.renesas.com>
List-ID: <devicetree@vger.kernel.org>

Good morning gentlemen,

I am very sorry to bother you again, but it seems this patch has no master.=
 Is anybody willing to take it?

Thanks,
Fab

> -----Original Message-----
> From: Fabrizio Castro [mailto:fabrizio.castro@bp.renesas.com]
> Sent: 18 December 2017 17:39
> To: Rob Herring <robh+dt@kernel.org>; Mark Rutland <mark.rutland@arm.com>
> Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>; Daniel Lezcano <dan=
iel.lezcano@linaro.org>; Thomas Gleixner
> <tglx@linutronix.de>; devicetree@vger.kernel.org; Simon Horman <horms@ver=
ge.net.au>; Geert Uytterhoeven
> <geert+renesas@glider.be>; Chris Paterson <Chris.Paterson2@renesas.com>; =
Biju Das <biju.das@bp.renesas.com>; linux-renesas-
> soc@vger.kernel.org
> Subject: [PATCH v2 1/3] dt-bindings: timer: renesas, cmt: Document r8a774=
[35] CMT support
>
> Document SoC specific compatible strings for r8a7743 and r8a7745.
> No driver change is needed as the fallback strings will activate
> the right code.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Simon Horman <horms@verge.net.au>
> ---
> v1->v2:
> * "R-Car Gen2 or RZ/G1." -> "R-Car Gen2 and RZ/G1."
> * "all the R-Car" -> "R-Car"
>
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 14 ++++++++++-=
---
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Do=
cumentation/devicetree/bindings/timer/renesas,cmt.txt
> index d740989..b40add2 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -22,6 +22,10 @@ Required Properties:
>
>      - "renesas,r8a73a4-cmt0" for the 32-bit CMT0 device included in r8a7=
3a4.
>      - "renesas,r8a73a4-cmt1" for the 48-bit CMT1 device included in r8a7=
3a4.
> +    - "renesas,r8a7743-cmt0" for the 32-bit CMT0 device included in r8a7=
743.
> +    - "renesas,r8a7743-cmt1" for the 48-bit CMT1 device included in r8a7=
743.
> +    - "renesas,r8a7745-cmt0" for the 32-bit CMT0 device included in r8a7=
745.
> +    - "renesas,r8a7745-cmt1" for the 48-bit CMT1 device included in r8a7=
745.
>      - "renesas,r8a7790-cmt0" for the 32-bit CMT0 device included in r8a7=
790.
>      - "renesas,r8a7790-cmt1" for the 48-bit CMT1 device included in r8a7=
790.
>      - "renesas,r8a7791-cmt0" for the 32-bit CMT0 device included in r8a7=
791.
> @@ -31,10 +35,12 @@ Required Properties:
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7=
794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7=
794.
>
> -    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car=
 Gen2.
> -    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car=
 Gen2.
> -These are fallbacks for r8a73a4 and all the R-Car Gen2
> -entrieslisted above.
> +    - "renesas,rcar-gen2-cmt0" for 32-bit CMT0 devices included in R-Car=
 Gen2
> +and RZ/G1.
> +    - "renesas,rcar-gen2-cmt1" for 48-bit CMT1 devices included in R-Car=
 Gen2
> +and RZ/G1.
> +These are fallbacks for r8a73a4, R-Car Gen2 and RZ/G1 entries
> +listed above.
>
>    - reg: base address and length of the registers block for the timer mo=
dule.
>    - interrupts: interrupt-specifier for the timer, one per channel.
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
