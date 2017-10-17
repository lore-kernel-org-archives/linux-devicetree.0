From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: RE: [PATCH  1/2] dt-bindings: usb-xhci: Document r8a7743 support
Date: Tue, 17 Oct 2017 01:33:51 +0000
Message-ID: <TY1PR06MB0992CBE8ED62C52D6412BF28D84C0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1508148769-47488-1-git-send-email-biju.das@bp.renesas.com>
 <1508148769-47488-2-git-send-email-biju.das@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1508148769-47488-2-git-send-email-biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
Content-Language: ja-JP
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chris Paterson <Chris.Paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Biju-san,
(and added Mathias-san of the XHCI maintainer as TO)

Thank you for the patch!

> From: Biju Das, Sent: Monday, October 16, 2017 7:13 PM
>=20
> From: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
>=20
> Document r8a7743 xhci support. The driver will use the fallback
> compatible string "renesas,rcar-gen2-xhci", therefore no driver
> change is needed.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/usb/usb-xhci.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt b/Documen=
tation/devicetree/bindings/usb/usb-xhci.txt
> index 2d80b60..4125d02 100644
> --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> @@ -7,12 +7,14 @@ Required properties:
>      - "marvell,armada3700-xhci" for Armada 37xx SoCs
>      - "marvell,armada-375-xhci" for Armada 375 SoCs
>      - "marvell,armada-380-xhci" for Armada 38x SoCs
> +    - "renesas,xhci-r8a7743" for r8a7743 SoC
>      - "renesas,xhci-r8a7790" for r8a7790 SoC
>      - "renesas,xhci-r8a7791" for r8a7791 SoC
>      - "renesas,xhci-r8a7793" for r8a7793 SoC
>      - "renesas,xhci-r8a7795" for r8a7795 SoC
>      - "renesas,xhci-r8a7796" for r8a7796 SoC
> -    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 compatible devic=
e
> +    - "renesas,rcar-gen2-xhci" for a generic R-Car Gen2 or RZ/G1 compati=
ble
> +      device
>      - "renesas,rcar-gen3-xhci" for a generic R-Car Gen3 compatible devic=
e
>      - "xhci-platform" (deprecated)
>

It seems good to me. So,

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>

Best regards,
Yoshihiro Shimoda

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
