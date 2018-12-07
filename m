From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 2/5] media: dt-bindings: Add binding for si470x radio
Date: Fri, 07 Dec 2018 12:43:14 +0100
Message-ID: <2202435.V78jBJhvEB@acerlaptop>
References: <20181205154750.17996-1-pawel.mikolaj.chmiel@gmail.com> <20181205154750.17996-3-pawel.mikolaj.chmiel@gmail.com> <2c8bb6ef-5f37-69ef-6829-a9e9ad04579b@xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <2c8bb6ef-5f37-69ef-6829-a9e9ad04579b@xs4all.nl>
Sender: linux-kernel-owner@vger.kernel.org
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, fischerdouglasc@gmail.com, keescook@chromium.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Dnia pi=C4=85tek, 7 grudnia 2018 12:33:10 CET Hans Verkuil pisze:
> Please combine 2/5 with 5/5. No need to have two patches for these bindin=
gs.
I though that it will be better to separate patches which just adds devicet=
ree support
and those adding new functionality (reset), so for example if there is more=
 work needed on one of them,
the second one can still be picked (devicetree one).

Ok will do this in next version of patchset.
=20
>=20
> Regards,
>=20
> 	Hans
>=20
> On 12/05/2018 04:47 PM, Pawe=C5=82 Chmiel wrote:
> > Add device tree bindings for si470x family radio receiver driver.
> >=20
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> > ---
> >  .../devicetree/bindings/media/si470x.txt      | 24 +++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/si470x.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/si470x.txt b/Docum=
entation/devicetree/bindings/media/si470x.txt
> > new file mode 100644
> > index 000000000000..9294fdfd3aae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/si470x.txt
> > @@ -0,0 +1,24 @@
> > +* Silicon Labs FM Radio receiver
> > +
> > +The Silicon Labs Si470x is family of FM radio receivers with receive p=
ower scan
> > +supporting 76-108 MHz, programmable through an I2C interface.
> > +Some of them includes an RDS encoder.
> > +
> > +Required Properties:
> > +- compatible: Should contain "silabs,si470x"
> > +- reg: the I2C address of the device
> > +
> > +Optional Properties:
> > +- interrupts : The interrupt number
> > +
> > +Example:
> > +
> > +&i2c2 {
> > +        si470x@63 {
> > +                compatible =3D "silabs,si470x";
> > +                reg =3D <0x63>;
> > +
> > +                interrupt-parent =3D <&gpj2>;
> > +                interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
> > +        };
> > +};
> >=20
>=20
>=20
