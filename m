From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 1/2] regulator: act8945a: add regulator driver for
 ACT8945A
Date: Fri, 29 Jan 2016 12:35:18 +0100
Message-ID: <20160129113518.GQ4130@sirena.org.uk>
References: <1453863463-30515-1-git-send-email-wenyou.yang@atmel.com>
 <1453863463-30515-2-git-send-email-wenyou.yang@atmel.com>
 <20160129001603.GM4130@sirena.org.uk>
 <B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+S4DbcR7QPeSsP0V"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63FBF8B@penmbx01>
Sender: linux-kernel-owner@vger.kernel.org
To: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>, Lee Jones <lee.jones@linaro.org>, Peter Korsgaard <jacmet@gmail.com>, "Ferre, Nicolas" <Nicolas.FERRE@atmel.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--+S4DbcR7QPeSsP0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 01:20:08AM +0000, Yang, Wenyou wrote:

> > > +static const struct of_device_id act8945a_pmic_of_match[] =3D {
> > > +	{ .compatible =3D "active-semi,act8945a-regulator" },
> > > +	{ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, act8945a_pmic_of_match);

> > This seems mostly OK but why do we have a compatible string here - shou=
ldn't
> > the MFD be able to instantiate the regulator function without needing t=
his?

> Because I got feedback from Javier for the act8945a-charger patches of th=
is MFD series,
> He said missing the OF match table will cause the module autoloading brok=
en.=20

> http://lists.infradead.org/pipermail/linux-arm-kernel/2016-January/398113=
=2Ehtml

> What do you think about it?

If then device is not being loaded from the DT (and it shouldn't be, the
device looks like it should be instantiated directly by the MFD as it
can't exist separately to that MFD) an OF table will do nothing. =20

--+S4DbcR7QPeSsP0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWq051AAoJECTWi3JdVIfQn/EH/2mlAeT+19Ec1pHtINkqy1h9
/a4uQqluTycrV9ampDZ8qFDl2cIMXq/lGPi0PRZ79g0kJu3K1TTfjii1p1ywVWN+
RBA7f9xfQ1fAZivaHIDkbv6v2hlWyDqnrLXr6DrdmQol+lN0/69N+3oSnObz36Ny
VKd8mlknuoAt0aRGRH0P2Jcubj0emi26qHP37BrsJDNe1+jIknaR7AV9N2s4d2xm
+zYr6amcjIzrmEUq3NsaKnk8OuNRPNbdFgw1Bm+sIwEcl8njeaB3TooHUT4TrA8M
KWrLH9JnvyfQRzEvAOLxoE5EMRPdW2TuhpDFJIOSKamud6J9ZXJ7QxNcE4jpxe8=
=3DVN
-----END PGP SIGNATURE-----

--+S4DbcR7QPeSsP0V--
