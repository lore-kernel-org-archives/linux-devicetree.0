From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Subject: RE: [PATCH v2 2/4] dt-bindings: media: rcar_vin: add device tree
 support for r8a774[35]
Date: Wed, 24 Jan 2018 17:05:34 +0000
Message-ID: <SG2PR06MB0886F5169407E95110EA324CC0E20@SG2PR06MB0886.apcprd06.prod.outlook.com>
References: <1510856571-30281-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510856571-30281-3-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1510856571-30281-3-git-send-email-fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: =?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello guys,

I am sorry to bother you,  just wondering if this patch has any chance to e=
nd up in v4.16?

Thanks,
Fabrizio

> Subject: [PATCH v2 2/4] dt-bindings: media: rcar_vin: add device tree sup=
port for r8a774[35]
>
> Add compatible strings for r8a7743 and r8a7745. No driver change
> is needed as "renesas,rcar-gen2-vin" will activate the right code.
> However, it is good practice to document compatible strings for the
> specific SoC as this allows SoC specific changes to the driver if
> needed, in addition to document SoC support and therefore allow
> checkpatch.pl to validate compatible string values.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Reviewed-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
> v1->v2:
> * Fixed double "change" in changelog
>
>  Documentation/devicetree/bindings/media/rcar_vin.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/rcar_vin.txt b/Docum=
entation/devicetree/bindings/media/rcar_vin.txt
> index 98931f5..ff9697e 100644
> --- a/Documentation/devicetree/bindings/media/rcar_vin.txt
> +++ b/Documentation/devicetree/bindings/media/rcar_vin.txt
> @@ -6,6 +6,8 @@ family of devices. The current blocks are always slaves a=
nd suppot one input
>  channel which can be either RGB, YUYV or BT656.
>
>   - compatible: Must be one or more of the following
> +   - "renesas,vin-r8a7743" for the R8A7743 device
> +   - "renesas,vin-r8a7745" for the R8A7745 device
>     - "renesas,vin-r8a7778" for the R8A7778 device
>     - "renesas,vin-r8a7779" for the R8A7779 device
>     - "renesas,vin-r8a7790" for the R8A7790 device
> @@ -14,7 +16,8 @@ channel which can be either RGB, YUYV or BT656.
>     - "renesas,vin-r8a7793" for the R8A7793 device
>     - "renesas,vin-r8a7794" for the R8A7794 device
>     - "renesas,vin-r8a7795" for the R8A7795 device
> -   - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 compatible device.
> +   - "renesas,rcar-gen2-vin" for a generic R-Car Gen2 or RZ/G1 compatibl=
e
> +     device.
>     - "renesas,rcar-gen3-vin" for a generic R-Car Gen3 compatible device.
>
>     When compatible with the generic version nodes must list the
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
