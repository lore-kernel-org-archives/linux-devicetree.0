From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH] dt-bindings: rcar-gen3-phy-usb2: Add r8a774c0 support
Date: Fri, 14 Dec 2018 08:57:43 +0000
Message-ID: <TY2PR01MB22970FDA6CFA1EED3209E51DD8A10@TY2PR01MB2297.jpnprd01.prod.outlook.com>
References: <1544732481-6775-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1544732481-6775-1-git-send-email-fabrizio.castro@bp.renesas.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Kishon Vijay Abraham I <kishon@ti.com>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Fabrizio,

> From: Fabrizio Castro, Sent: Friday, December 14, 2018 5:21 AM
>=20
> Document RZ/G2E (R8A774C0) SoC bindings.
>=20
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index de7b539..ad9c290 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -6,6 +6,8 @@ This file provides information on what the device node fo=
r the R-Car generation
>  Required properties:
>  - compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an =
R8A774A1
>  	      SoC.
> +	      "renesas,usb2-phy-r8a774c0" if the device is a part of an R8A774C=
0
> +	      SoC.
>  	      "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
>  	      SoC.
>  	      "renesas,usb2-phy-r8a7796" if the device is a part of an R8A7796
> --
> 2.7.4
