From: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS
 encoder DT bindings
Date: Fri, 12 Jan 2018 12:59:53 +0000
Message-ID: <KL1PR06MB170210E1BF374BF5FC05531CB8170@KL1PR06MB1702.apcprd06.prod.outlook.com>
References: <20180112005858.26472-1-laurent.pinchart+renesas@ideasonboard.com>
 <20180112005858.26472-2-laurent.pinchart+renesas@ideasonboard.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180112005858.26472-2-laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

> Subject: [PATCH 01/10] dt-bindings: display: renesas: Add R-Car LVDS enco=
der
> DT bindings
>
> The Renesas R-Car Gen2 and Gen3 SoCs have internal LVDS encoders. Add
> corresponding device tree bindings.
>
> Signed-off-by: Laurent Pinchart
> <laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
> ---
>  .../bindings/display/bridge/renesas,lvds.txt       | 54
> ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 55 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,lvd=
s.txt
> b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> new file mode 100644
> index 000000000000..459c56822eda
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.txt
> @@ -0,0 +1,54 @@
> +Renesas R-Car LVDS Encoder
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> +
> +These DT bindings describe the LVDS encoder embedded in the Renesas
> +R-Car Gen2 and Gen3 SoCs.
> +
> +Required properties:
> +
> +- compatible : Shall contain one of
> +  - "renesas,lvds-r8a7743" for R8A7790 (R-Car RZ/G1M) compatible LVDS
> +encoders

Typo. It should be R8A7743 .

Regards,
Biju




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
