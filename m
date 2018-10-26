Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a7796 CMT
 support
Date: Fri, 26 Oct 2018 09:47:35 +0000
Message-ID: 
 <TYXPR01MB177538A507474EB9A6B2C3F7C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540540904-26131-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540540904-26131-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a7796 CMT s=
upport
>
> Document SoC specific bindings for R-Car M3-W (r8a7796) SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against linu-next
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Do=
cumentation/devicetree/bindings/timer/renesas,cmt.txt
> index 3399267..6de27b6 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -36,6 +36,8 @@ Required Properties:
>      - "renesas,r8a7793-cmt1" for the 48-bit CMT1 device included in r8a7=
793.
>      - "renesas,r8a7794-cmt0" for the 32-bit CMT0 device included in r8a7=
794.
>      - "renesas,r8a7794-cmt1" for the 48-bit CMT1 device included in r8a7=
794.
> +    - "renesas,r8a7796-cmt0" for the 32-bit CMT0 device included in r8a7=
796.
> +    - "renesas,r8a7796-cmt1" for the 48-bit CMT1 device included in r8a7=
796.
>      - "renesas,r8a77970-cmt0" for the 32-bit CMT0 device included in r8a=
77970.
>      - "renesas,r8a77970-cmt1" for the 48-bit CMT1 device included in r8a=
77970.
>      - "renesas,r8a77980-cmt0" for the 32-bit CMT0 device included in r8a=
77980.
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
