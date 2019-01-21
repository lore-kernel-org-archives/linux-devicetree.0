Return-Path: <SRS0=aZAz=P5=ndufresne.ca=nicolas@kernel.org>
Message-ID: <26befa99cb1ddb0c36823cb573f2012d4bd98015.camel@ndufresne.ca>
Subject: Re: [PATCH v2 1/3] media: dt-bindings: media: document allegro-dvt
 bindings
From: Nicolas Dufresne <nicolas@ndufresne.ca>
Date: Mon, 21 Jan 2019 11:17:43 -0500
In-Reply-To: <1548068375.3287.1.camel@pengutronix.de>
References: <20190118133716.29288-1-m.tretter@pengutronix.de>
	 <20190118133716.29288-2-m.tretter@pengutronix.de>
	 <1548068375.3287.1.camel@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-lQPxKoB79i4VAHIKDfTM"
Mime-Version: 1.0
To: Philipp Zabel <p.zabel@pengutronix.de>, Michael Tretter <m.tretter@pengutronix.de>, linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org, kernel@pengutronix.de, tfiga@chromium.org
List-ID: <devicetree@vger.kernel.org>


--=-lQPxKoB79i4VAHIKDfTM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 21 janvier 2019 =C3=A0 11:59 +0100, Philipp Zabel a =C3=A9crit :
> On Fri, 2019-01-18 at 14:37 +0100, Michael Tretter wrote:
> > Add device-tree bindings for the Allegro DVT video IP core found on the
> > Xilinx ZynqMP EV family.
> >=20
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> > Changes since v1:
> > none
> >=20
> > ---
> >  .../devicetree/bindings/media/allegro.txt     | 35 +++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/media/allegro.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/media/allegro.txt b/Docu=
mentation/devicetree/bindings/media/allegro.txt
> > new file mode 100644
> > index 000000000000..765f4b0c1a57
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/allegro.txt
> > @@ -0,0 +1,35 @@
> > +Device-tree bindings for the Allegro DVT video IP codecs present in th=
e Xilinx
> > +ZynqMP SoC. The IP core may either be a H.264/H.265 encoder or H.264/H=
.265
> > +decoder ip core.
> > +
> > +Each actual codec engines is controlled by a microcontroller (MCU). Ho=
st
> > +software uses a provided mailbox interface to communicate with the MCU=
. The
> > +MCU share an interrupt.
> > +
> > +Required properties:
> > +  - compatible: value should be one of the following
> > +    "allegro,al5e-1.1", "allegro,al5e": encoder IP core
> > +    "allegro,al5d-1.1", "allegro,al5d": decoder IP core
> > +  - reg: base and length of the memory mapped register region and base=
 and
> > +    length of the memory mapped sram
> > +  - reg-names: must include "regs" and "sram"
> > +  - interrupts: shared interrupt from the MCUs to the processing syste=
m
> > +  - interrupt-names: "vcu_host_interrupt"
> > +
> > +Example:
> > +	al5e: al5e@a0009000 {
>=20
> Should the node names be "vpu" or "video-codec"?

Xilinx calls this IP the "vcu", so "vpu" would be even more confusing.
Was this just a typo ? That being said, is this referring to the actual
HW or the firmware that runs on a microblaze (the firmware being
Allegro specific) ?

>=20
> > +		compatible =3D "allegro,al5e";
> > +		reg =3D <0 0xa0009000 0 0x1000>,
> > +		      <0 0xa0000000 0 0x8000>;
> > +		reg-names =3D "regs", "sram";
> > +		interrupt-names =3D "vcu_host_interrupt";
> > +		interrupts =3D <0 96 4>;
> > +	};
> > +	al5d: al5d@a0029000 {
> > +		compatible =3D "allegro,al5d";
> > +		reg =3D <0 0xa0029000 0 0x1000>,
> > +		      <0 0xa0020000 0 0x8000>;
> > +		reg-names =3D "regs", "sram";
> > +		interrupt-names =3D "vcu_host_interrupt";
> > +		interrupts =3D <0 96 4>;
> > +	};
>=20
> regards
> Philipp

--=-lQPxKoB79i4VAHIKDfTM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQSScpfJiL+hb5vvd45xUwItrAaoHAUCXEXwpwAKCRBxUwItrAao
HOxvAJ9u6EA5OXi54w54InkgrTzEnra5EQCgvjCgJtcdd55aViXVaME0Y4dcekI=
=JHsK
-----END PGP SIGNATURE-----

--=-lQPxKoB79i4VAHIKDfTM--
