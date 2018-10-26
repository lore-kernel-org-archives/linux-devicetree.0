Return-Path: <SRS0=m4HG=NG=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: watchdog: renesas-wdt: Document r8a77470
 support
Date: Fri, 26 Oct 2018 09:49:24 +0000
Message-ID: 
 <TYXPR01MB177523BF9A1BC792C2EB2374C0F00@TYXPR01MB1775.jpnprd01.prod.outlook.com>
References: <1540544153-48098-1-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1540544153-48098-1-git-send-email-biju.das@bp.renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH] dt-bindings: watchdog: renesas-wdt: Document r8a77470 su=
pport
>
> RZ/G1C (R8A77470) watchdog implementation is compatible with R-Car
> Gen2, therefore add relevant documentation.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
> This patch is tested against linux-next
> ---
>  Documentation/devicetree/bindings/watchdog/renesas-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> index a8ee29f..a47bdea 100644
> --- a/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> +++ b/Documentation/devicetree/bindings/watchdog/renesas-wdt.txt
> @@ -8,6 +8,7 @@ Required properties:
>   - "renesas,r8a7743-wdt" (RZ/G1M)
>   - "renesas,r8a7744-wdt" (RZ/G1N)
>   - "renesas,r8a7745-wdt" (RZ/G1E)
> + - "renesas,r8a77470-wdt" (RZ/G1C)
>   - "renesas,r8a774a1-wdt" (RZ/G2M)
>           - "renesas,r8a7790-wdt" (R-Car H2)
>           - "renesas,r8a7791-wdt" (R-Car M2-W)
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
