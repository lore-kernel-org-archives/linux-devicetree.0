From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH 1/2] phy: rcar-gen3-usb2: Add support for r8a77965
Date: Mon, 5 Mar 2018 05:18:39 +0000
Message-ID: <TY1PR06MB0992C3B78E86E32B60B36735D8DA0@TY1PR06MB0992.apcprd06.prod.outlook.com>
References: <1519710747-26435-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1519710747-26435-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <046ceb88-56a1-56d3-5945-026597822aa0@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <046ceb88-56a1-56d3-5945-026597822aa0@ti.com>
Content-Language: ja-JP
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi,

> From: Kishon Vijay Abraham I, Sent: Friday, March 2, 2018 5:15 PM
>=20
> On Tuesday 27 February 2018 11:22 AM, Yoshihiro Shimoda wrote:
> > This patch adds support for r8a77965 (R-Car M3-N). This SoC has
> > dedicated pins.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt | 2 ++
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c                     | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.t=
xt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > index 99b651b..dbd137c 100644
> > --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > @@ -8,6 +8,8 @@ Required properties:
> >  	      SoC.
> >  	      "renesas,usb2-phy-r8a7796" if the device is a part of an R8A779=
6
> >  	      SoC.
> > +	      "renesas,usb2-phy-r8a77965" if the device is a part of an
> > +	      R8A77965 SoC.
>=20
> have dt-binding Documentation as a separate patch.

I will fix this in v2.

Best regards,
Yoshihiro Shimoda

> Thanks
> Kishon
