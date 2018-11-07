Return-Path: <SRS0=70sl=NS=bp.renesas.com=fabrizio.castro@kernel.org>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: All variants use
 3 interrupts
Date: Wed, 7 Nov 2018 15:06:40 +0000
Message-ID: 
 <TY1PR01MB17705CB4DD1BB9DCA1289B82C0C40@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <20181107133500.12865-1-geert+renesas@glider.be>
In-Reply-To: <20181107133500.12865-1-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Geert Uytterhoeven <geert+renesas@glider.be>, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

> Subject: [PATCH] dt-bindings: thermal: rcar-gen3-thermal: All variants us=
e 3 interrupts
>
> RZ/G2M also has 3 interrupts routed to the TSC, but the list was not
> updated to reflect this.
>
> Just drop the list, as this is the case for this TSC variant in all
> R-Car Gen3 and RZ/G2 SoCs.
>
> Fixes: be6af481f3b2d508 ("dt-bindings: thermal: rcar-gen3-thermal: Add r8=
a774a1 support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  .../devicetree/bindings/thermal/rcar-gen3-thermal.txt          | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.=
txt b/Documentation/devicetree/bindings/thermal/rcar-
> gen3-thermal.txt
> index ad9a435afef446f6..b6ab60f6abbf95fd 100644
> --- a/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> +++ b/Documentation/devicetree/bindings/thermal/rcar-gen3-thermal.txt
> @@ -21,8 +21,7 @@ Required properties:
>
>  Optional properties:
>
> -- interrupts: interrupts routed to the TSC (3 for H3, M3-W, M3-N,
> -  and V3H)
> +- interrupts: interrupts routed to the TSC (must be 3).
>  - power-domain: Must contain a reference to the power domain. This
>    property is mandatory if the thermal sensor instance
>    is part of a controllable power domain.
> --
> 2.17.1




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
