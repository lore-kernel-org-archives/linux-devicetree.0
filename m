Return-Path: <SRS0=dwc1=SL=renesas.com=yoshihiro.shimoda.uh@kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH V3 01/13] dt-bindings: phy: rcar-gen2: Add r8a77470
 support
Date: Tue, 9 Apr 2019 10:07:06 +0000
Message-ID: 
 <TYAPR01MB42719D7CCC82B48BF87A6D2CD82D0@TYAPR01MB4271.jpnprd01.prod.outlook.com>
References: <1554287324-22312-1-git-send-email-biju.das@bp.renesas.com>
 <1554287324-22312-2-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1554287324-22312-2-git-send-email-biju.das@bp.renesas.com>
Content-Language: ja-JP
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Biju Das <biju.das@bp.renesas.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Simon Horman <horms@verge.net.au>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Paterson <Chris.Paterson2@renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

Hi Biju-san,

> From: Biju Das, Sent: Wednesday, April 3, 2019 7:29 PM
>=20
> Add USB PHY support for r8a77470 SoC. Renesas RZ/G1C (R8A77470)
> USB PHY is similar to the R-Car Gen2 family, but has the below
> feature compared to other RZ/G1 and R-Car Gen2/3 SoCs
>=20
> It has a shared pll reset for usbphy0/usbphy1 and this register
> reside in usbphy0 block.
>=20
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda
