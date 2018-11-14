Return-Path: <SRS0=klaB=NZ=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr1410124.outbound.protection.outlook.com ([40.107.141.124]:26208
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727816AbeKNU4N (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 14 Nov 2018 15:56:13 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 3/3] dt-bindings: rcar-gen3-phy-usb2: Add r7s9210 support
Date: Wed, 14 Nov 2018 10:53:24 +0000
Message-ID: <OSBPR01MB22933220D185AA39621849DED8C30@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
 <20181107173558.54481-4-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-4-chris.brandt@renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: Chris Brandt <Chris.Brandt@renesas.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Simon Horman <horms+renesas@verge.net.au>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Chris-san,

Thank you for the patch!

> From: Chris Brandt, Sent: Thursday, November 8, 2018 2:36 AM
>=20
> Document RZ/A2 (R7S9210) SoC bindings.
>=20
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 10 ++++++=
----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> index de7b5393c163..b545daf8ccb3 100644
> --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> @@ -1,10 +1,12 @@
>  * Renesas R-Car generation 3 USB 2.0 PHY
>=20
>  This file provides information on what the device node for the R-Car gen=
eration
> -3 and RZ/G2 USB 2.0 PHY contain.
> +3, RZ/G2 and RZ/A2 USB 2.0 PHY contain.
>=20
>  Required properties:
> -- compatible: "renesas,usb2-phy-r8a774a1" if the device is a part of an =
R8A774A1
> +- compatible: "renesas,usb2-phy-r7s9210" if the device is a part of an R=
7S9210
> +	      SoC.
> +	      "renesas,usb2-phy-r8a774a1" if the device is a part of an R8A774A=
1
>  	      SoC.
>  	      "renesas,usb2-phy-r8a7795" if the device is a part of an R8A7795
>  	      SoC.
> @@ -16,8 +18,8 @@ Required properties:
>  	      R8A77990 SoC.
>  	      "renesas,usb2-phy-r8a77995" if the device is a part of an
>  	      R8A77995 SoC.
> -	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3 or RZ/G2
> -	      compatible device.
> +	      "renesas,rcar-gen3-usb2-phy" for a generic R-Car Gen3, RZ/G2 or
> +	      RZ/A2 compatible device.
>=20
>  	      When compatible with the generic version, nodes must list the
>  	      SoC-specific version corresponding to the platform first
> --
> 2.16.1

As I mentioned the PATCH 2/3, we should describe a new property "renesas,us=
es_usb_x1"
as optional properties here.

Best regards,
Yoshihiro Shimoda
