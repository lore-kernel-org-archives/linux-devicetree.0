From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: RE: [PATCH v2 6/6] phy: renesas: rcar-gen3-usb2: add gpio handling
Date: Mon, 18 Dec 2017 05:16:10 +0000
Message-ID: <SG2PR06MB0981CC4061F538B7ADFE48FDD80E0@SG2PR06MB0981.apcprd06.prod.outlook.com>
References: <1513316726-14387-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1513316726-14387-7-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20171216180510.qh5uiu5kwz5mx7zi@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <20171216180510.qh5uiu5kwz5mx7zi@rob-hp-laptop>
Content-Language: ja-JP
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: "kishon@ti.com" <kishon@ti.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Hi Rob,

Thank you for your comments!

> -----Original Message-----
> From: Rob Herring, Sent: Sunday, December 17, 2017 3:05 AM
>=20
> On Fri, Dec 15, 2017 at 02:45:26PM +0900, Yoshihiro Shimoda wrote:
> > Some R-Car SoCs (e.g. R-Car D3) doesn't have dedicated pins of VBUS
> > and ID. So, they may be connected to gpio pins. To handle the gpio
> > pins, this patch adds the handling of VBUS and ID pins instead of
> > dedicated pins.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >  .../devicetree/bindings/phy/rcar-gen3-phy-usb2.txt |  2 +
> >  drivers/phy/renesas/phy-rcar-gen3-usb2.c           | 77 ++++++++++++++=
++++++--
> >  2 files changed, 72 insertions(+), 7 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.t=
xt
> b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > index 99b651b..999a6ef 100644
> > --- a/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > +++ b/Documentation/devicetree/bindings/phy/rcar-gen3-phy-usb2.txt
> > @@ -27,6 +27,8 @@ channel as USB OTG:
> >  - interrupts: interrupt specifier for the PHY.
> >  - vbus-supply: Phandle to a regulator that provides power to the VBUS.=
 This
> >  	       regulator will be managed during the PHY power on/off sequence=
.
> > +- vbus-gpios: use gpio to control vbus instead of dedicated pin.
>=20
> How does this relate to vbus-supply? A gpio-regulator doesn't work here?

Thank you for the pointed out. You're correct. A gpio-regulator can work in=
tead of "vbus-gpios".
So, I will drop this.

> > +- id-gpios: use gpio to detect id instead of dedicated pin.
>=20
> These aren't part of the phy, but really belong in a connector node.

I'm afraid but I don't understand "a connector node" mean.
Is it an extcon device for instance?
If so, I'll try to use extcon-usb-gpio.c instead of own gpio handling on th=
e driver.

Best regards,
Yoshihiro Shimoda

> Rob
