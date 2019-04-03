From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 1/3] dt-bindings: phy: rcar-gen3-phy-usb2: Revise
 #phy-cells property
Date: Wed, 3 Apr 2019 10:35:29 +0000
Message-ID: <TY1PR01MB17708AF072E039D362FDE659C0570@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1554120083-29990-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1554120083-29990-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1554120083-29990-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "kishon@ti.com" <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-Id: devicetree@vger.kernel.org

Hello Yoshihiro-san,

Thank you for your patch!

> From: linux-kernel-owner@vger.kernel.org <linux-kernel-owner@vger.kernel.=
org> On Behalf Of Yoshihiro Shimoda
> Sent: 01 April 2019 13:01
> Subject: [PATCH 1/3] dt-bindings: phy: rcar-gen3-phy-usb2: Revise #phy-ce=
lls property
>=20
> To have the detailed property on each PHY specifier, this patch revices

s/revices/revises/g

> the #phy-cells property.
>=20
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt=
 b/Documentation/devicetree/bindings/phy/rcar-gen3-
> phy-usb2.txt
> index ad9c290..7f0d4bf 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -27,7 +27,12 @@ Required properties:
>=20
>  - reg: offset and length of the partial USB 2.0 Host register block.
>  - clocks: clock phandle and specifier pair(s).
> -- #phy-cells: see phy-bindings.txt in the same directory, must be <0>.
> +- #phy-cells: see phy-bindings.txt in the same directory, must be <1>.
> +
> +The phandle's argument in the PHY specifier is the INT_STATUS bit of con=
troller:

>From the driver we are also looking for value 0, as in rcar_gen3_get_dr_mod=
e we
have a for loop that starts from 0, and we call of_usb_get_dr_mode_by_phy w=
ith
arg0 =3D=3D 0, why are we leaving this out from this list?

Thanks,
Fab

> +- 1 =3D USBH_INTA (OHCI)
> +- 2 =3D USBH_INTB (EHCI)
> +- 3 =3D UCOM_INT (OTG and BC)
>=20
>  Optional properties:
>  To use a USB channel where USB 2.0 Host and HSUSB (USB 2.0 Peripheral) a=
re
> --
> 2.7.4
