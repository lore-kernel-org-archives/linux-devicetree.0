From: Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH 3/4] dt-bindings: i3c: Make 'assigned-address' valid if
 static address != 0
Date: Thu, 29 Aug 2019 14:06:00 +0000
Message-ID: <SN6PR12MB2655528456BB8E6661A5F962AEA20@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <cover.1567071213.git.vitor.soares@synopsys.com>
        <9d69c83c7193e377bbc77bea7f1812fc17dafaee.1567071213.git.vitor.soares@synopsys.com>
 <20190829125138.4b36b8f6@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190829125138.4b36b8f6@collabora.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@collabora.com>, Vitor Soares <Vitor.Soares@synopsys.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>
List-Id: devicetree@vger.kernel.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Aug 29, 2019 at 11:51:38

> On Thu, 29 Aug 2019 12:19:34 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
>=20
> > The I3C devices without a static address can require a specific dynamic
> > address for priority reasons.
> >=20
> > Let's update the binding document to make the 'assigned-address' proper=
ty
> > valid if static address !=3D 0 and add an example with this use case.
>=20
>            ^ you mean static address =3D=3D 0, right?

Indeed.

>=20
> Yes, it makes sense to support that case and do our best to assign the
> requested address after DAA has taken place by explicitly executing
> SETDA.
>=20
> >=20
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > ---
> >  Documentation/devicetree/bindings/i3c/i3c.txt | 13 ++++++++++---
> >  1 file changed, 10 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/i3c/i3c.txt b/Documentat=
ion/devicetree/bindings/i3c/i3c.txt
> > index ab729a0..c851e75 100644
> > --- a/Documentation/devicetree/bindings/i3c/i3c.txt
> > +++ b/Documentation/devicetree/bindings/i3c/i3c.txt
> > @@ -98,9 +98,7 @@ Required properties
> > =20
> >  Optional properties
> >  -------------------
> > -- assigned-address: dynamic address to be assigned to this device. Thi=
s
> > -		    property is only valid if the I3C device has a static
> > -		    address (first cell of the reg property !=3D 0).
> > +- assigned-address: dynamic address to be assigned to this device.
>=20
> We should probably mention that we don't provide strong guarantees
> here. We will try to assign this dynamic address to the device, but if
> something fails (like another device owning the address and refusing to
> give it up), the actual dynamic address will be different.
> This clarification can be done in a separate patch.

So, another patch on top of this one explaining that, right?

I would suggest to use a dynamic address, like 0x40 (mid priority), on=20
ENTDAA so lowers addresses (High Priority) can be used in DT or another=20
method.

What do you think about this?=20

>=20
> > =20
> > =20
> >  Example:
> > @@ -129,6 +127,15 @@ Example:
> > =20
> >  		/*
> >  		 * I3C device without a static I2C address but requiring
> > +		 * specific dynamic address.
> > +		 */
> > +		sensor@0,39200154004 {
> > +			reg =3D <0x0 0x6072 0x303904d2>;
> > +			assigned-address =3D <0xb>;
> > +		};
> > +
> > +		/*
> > +		 * I3C device without a static I2C address but requiring
> >  		 * resources described in the DT.
> >  		 */
> >  		sensor@0,39200154004 {

Best regards,
Vitor Soares
