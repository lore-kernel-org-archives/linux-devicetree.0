From: Lukasz Majewski <lukma@denx.de>
Subject: Re: [PATCH] dt-bindings: misc: bk4: Add device tree binding for
 Liebherr's BK4 SPI bus
Date: Mon, 15 Oct 2018 12:17:16 +0200
Message-ID: <20181015121716.2362d286@jawa>
References: <20180927222655.24482-1-lukma@denx.de>
        <20181008144350.GS3587@dragon>
        <20181009122114.39ff3553@jawa>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gmOy39BeIOY7=oX=WTjekxF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181009122114.39ff3553@jawa>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

--Sig_/gmOy39BeIOY7=oX=WTjekxF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Dear All,

> Hi Shawn,
>=20
> > On Fri, Sep 28, 2018 at 12:26:55AM +0200, Lukasz Majewski wrote: =20
> > > Add Device Tree binding document for Liebherr's BK4 external SPI
> > > bus.
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukma@denx.de>   =20
> >=20
> > There should really be a patch series consisting of this one and
> > spidev change [1].
> >=20
> > Since spidev has already been picked up, having a series including
> > this and dts change would be the second option.  With DT folks' ACK,
> > I can send bindings change together with DTS using it. =20
>=20
> Any option will work for me :-).

Gentle ping on this patch (as corresponding DTS file has been already
pulled by Shawn).

Thanks in advance,

>=20
> >=20
> > Shawn
> >=20
> > [1] https://lkml.org/lkml/2018/9/28/48
> >  =20
> > > ---
> > >  Documentation/devicetree/bindings/misc/lwn-bk4.txt | 26
> > > ++++++++++++++++++++++ 1 file changed, 26 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/misc/lwn-bk4.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> > > b/Documentation/devicetree/bindings/misc/lwn-bk4.txt new file mode
> > > 100644 index 000000000000..d6a8c188c087
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/misc/lwn-bk4.txt
> > > @@ -0,0 +1,26 @@
> > > +* Liebherr's BK4 controller external SPI
> > > +
> > > +A device which handles data acquisition from compatible
> > > industrial +peripherals.
> > > +The SPI is used for data and management purposes in both master
> > > and +slave modes.
> > > +
> > > +Required properties:
> > > +
> > > +- compatible : Should be "lwn,bk4"
> > > +
> > > +Required SPI properties:
> > > +
> > > +- reg : Should be address of the device chip select within
> > > +  the controller.
> > > +
> > > +- spi-max-frequency : Maximum SPI clocking speed of device in Hz,
> > > should be
> > > +  30MHz at most for the Liebherr's BK4 external bus.
> > > +
> > > +Example:
> > > +
> > > +spidev0: spi@0 {
> > > +	compatible =3D "lwn,bk4";
> > > +	spi-max-frequency =3D <30000000>;
> > > +	reg =3D <0>;
> > > +};
> > > --=20
> > > 2.11.0
> > >    =20
>=20
>=20
> Best regards,
>=20
> Lukasz Majewski
>=20
> --
>=20
> DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
> HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de

--Sig_/gmOy39BeIOY7=oX=WTjekxF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAlvEaSwACgkQAR8vZIA0
zr1OmwgAzD4ijGq9uMdxpcXGsjzFAeB3t8frizxNHNT/4YEUKndRf3KEq7qIIqsW
MRDUzD22oWDL59FLWsq7ap9siVLODxB3ITC6u4nrcVHehWNN1LDaEdcbFm1X2QZD
lgfSIpLg0wa5ryf8Ghm5u1GBi+5FHIUV7yhP6rQ2IuUMRI5LRprkxNO/6/S+oFoR
ixr2aC0N19rGINzoRpuCj0jyWtSGXG21+eqq3yk5Mjp58zjIkGsbPiGu1Xzwohu+
nf6taKD33t3brDmYYy2o4zNZt8IsOcKHqcivc51ma4TDJVTDnLK3agdUxSVOwNy8
LIy0d1KPVJ8pCpkCvTo1B0SjHGJXtg==
=/1td
-----END PGP SIGNATURE-----

--Sig_/gmOy39BeIOY7=oX=WTjekxF--
