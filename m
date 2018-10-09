From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] dt-bindings: misc: bk4: Add device tree binding for
 Liebherr's BK4 SPI bus
Date: Tue, 9 Oct 2018 12:21:14 +0200
Message-ID: <20181009122114.39ff3553@jawa>
References: <20180927222655.24482-1-lukma@denx.de>
        <20181008144350.GS3587@dragon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8gpAw4s9jZow/4LHh6SfTxs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181008144350.GS3587@dragon>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/8gpAw4s9jZow/4LHh6SfTxs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

> On Fri, Sep 28, 2018 at 12:26:55AM +0200, Lukasz Majewski wrote:
> > Add Device Tree binding document for Liebherr's BK4 external SPI
> > bus.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de> =20
>=20
> There should really be a patch series consisting of this one and
> spidev change [1].
>=20
> Since spidev has already been picked up, having a series including
> this and dts change would be the second option.  With DT folks' ACK,
> I can send bindings change together with DTS using it.

Any option will work for me :-).

>=20
> Shawn
>=20
> [1] https://lkml.org/lkml/2018/9/28/48
>=20
> > ---
> >  Documentation/devicetree/bindings/misc/lwn-bk4.txt | 26
> > ++++++++++++++++++++++ 1 file changed, 26 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/misc/lwn-bk4.txt
> >=20
> > diff --git a/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> > b/Documentation/devicetree/bindings/misc/lwn-bk4.txt new file mode
> > 100644 index 000000000000..d6a8c188c087
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> > @@ -0,0 +1,26 @@
> > +* Liebherr's BK4 controller external SPI
> > +
> > +A device which handles data acquisition from compatible industrial
> > +peripherals.
> > +The SPI is used for data and management purposes in both master and
> > +slave modes.
> > +
> > +Required properties:
> > +
> > +- compatible : Should be "lwn,bk4"
> > +
> > +Required SPI properties:
> > +
> > +- reg : Should be address of the device chip select within
> > +  the controller.
> > +
> > +- spi-max-frequency : Maximum SPI clocking speed of device in Hz,
> > should be
> > +  30MHz at most for the Liebherr's BK4 external bus.
> > +
> > +Example:
> > +
> > +spidev0: spi@0 {
> > +	compatible =3D "lwn,bk4";
> > +	spi-max-frequency =3D <30000000>;
> > +	reg =3D <0>;
> > +};
> > --=20
> > 2.11.0
> >  =20


Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/8gpAw4s9jZow/4LHh6SfTxs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlu8gRoACgkQAR8vZIA0
zr2I5QgA1rwcD72qjO/pbSM/PriYIzhlokJ20Pg24TpC2BZeSl1ND2Dhi1yEHmxp
y40hF3+64nGuUlbJmAL+tPTBuO65xdBSTDXrhfIr5zCCwCOZXif+MphRg3n1NYBq
ep8iD8QWtjGC2IkxuBlK0az77vJgYg51JfBGywabJCBHwyFKCsMbBONn2xjjvciw
rLBIQTLHhGL/bhrhAjBOnY1nG37OWtjtD+Xk1s74BwtWwt1AWoUDcJM/jG+wuLPI
Xh24CaFFNdENg4ZhxwFyacRKfrloc8G8fDKXiaMhBLa3c/kx5qiIi1SJ5ZmF3yF/
KVPjbdDla/l2rjC87AkLnFjU0jj+PQ==
=RGBJ
-----END PGP SIGNATURE-----

--Sig_/8gpAw4s9jZow/4LHh6SfTxs--
