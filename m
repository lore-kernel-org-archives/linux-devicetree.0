Return-Path: <SRS0=0eFu=JA=cadence.com=kwitos@kernel.org>
From: Krzysztof Witos <kwitos@cadence.com>
Subject: RE: [PATCH 1/2] csirx updated doc for csirx with dphy supported
Date: Thu, 14 Jun 2018 06:22:41 +0000
Message-ID: <BYAPR07MB4886ACC332871B3C944A0BF8C37D0@BYAPR07MB4886.namprd07.prod.outlook.com>
References: <20180608103304.16054-1-kwitos@cadence.com>
 <20180608103304.16054-2-kwitos@cadence.com>
 <20180612220251.GA14085@rob-hp-laptop>
In-Reply-To: <20180612220251.GA14085@rob-hp-laptop>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
To: Rob Herring <robh@kernel.org>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:CADENCE MIPI-CSI2 BRIDGES" <linux-media@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS  <devicetree@vger.kernel.org>, open list" <linux-kernel@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

Hi Rob,

> On Fri, Jun 08, 2018 at 11:33:03AM +0100, Krzysztof Witos wrote:
>=20
> Commit message?
>=20
> And the subject prefix should be "dt-bindings: media: ..."

Yes, sorry for this mess with commit names.

>=20
> > Signed-off-by: Krzysztof Witos <kwitos@cadence.com>
> > ---
> >  .../devicetree/bindings/media/cdns,csi2rx.txt      | 32
> +++++++++++++++++++---
> >  1 file changed, 28 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> > b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> > index 6b02a0657ad9..753b967863c0 100644
> > --- a/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> > +++ b/Documentation/devicetree/bindings/media/cdns,csi2rx.txt
> > @@ -13,8 +13,7 @@ Required properties:
> >      * p_clk: register bank clock
> >      * pixel_if[0-3]_clk: pixel stream output clock, one for each strea=
m
> >                           implemented in hardware, between 0 and 3
> > -
> > -Optional properties:
>=20
> phys is no longer optional? That's not backwards compatible and needs an
> explanation if in fact intentional.
>=20

Thank you for pointing this out. I have to review it and probably will try =
to change it
to not break this backward compatibility.

Thanks,
Krzysiek
