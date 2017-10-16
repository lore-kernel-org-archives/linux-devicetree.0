From: Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH RESEND] phy: rcar-gen2: Add r8a7743/5 support
Date: Mon, 16 Oct 2017 10:52:51 +0000
Message-ID: <TY1PR06MB0702439B7CD95E771FAC001DB74F0@TY1PR06MB0702.apcprd06.prod.outlook.com>
References: <1507544543-28654-1-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507544543-28654-1-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Kishon,

> From: Biju Das [mailto:biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org]
> Sent: 09 October 2017 11:22
>=20
> Add USB PHY support for r8a7743/5 SoC. Renesas RZ/G1[ME] (R8A7743/5)
> USB PHY is identical to the R-Car Gen2 family.
>=20
> Signed-off-by: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> Acked-by: Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
> Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>

Does this patch look okay to you?

Thanks, Chris


> ---
> This patch is tested against Linux next tag next-20170929.
>=20
>  Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> index 91da947..eeb9e18 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen2-phy.txt
> @@ -4,10 +4,13 @@ This file provides information on what the device node
> for the R-Car generation
>  2 USB PHY contains.
>=20
>  Required properties:
> -- compatible: "renesas,usb-phy-r8a7790" if the device is a part of R8A77=
90
> SoC.
> +- compatible: "renesas,usb-phy-r8a7743" if the device is a part of R8A77=
43
> SoC.
> +	      "renesas,usb-phy-r8a7745" if the device is a part of R8A7745 SoC.
> +	      "renesas,usb-phy-r8a7790" if the device is a part of R8A7790 SoC.
>  	      "renesas,usb-phy-r8a7791" if the device is a part of R8A7791 SoC.
>  	      "renesas,usb-phy-r8a7794" if the device is a part of R8A7794 SoC.
> -	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 compatible
> device.
> +	      "renesas,rcar-gen2-usb-phy" for a generic R-Car Gen2 or
> +					  RZ/G1 compatible device.
>=20
>  	      When compatible with the generic version, nodes must list the
>  	      SoC-specific version corresponding to the platform first
> --
> 1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
