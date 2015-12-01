From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 1/2] regulator: Add coupled regulator
Date: Tue, 1 Dec 2015 22:30:42 +0100
Message-ID: <20151201213042.GR29263@lukather>
References: <1448897346-17780-1-git-send-email-maxime.ripard@free-electrons.com>
 <1448897346-17780-2-git-send-email-maxime.ripard@free-electrons.com>
 <CABxcv=kn+jkQV2g=a+Sz8TdhMcvcQiBWsBuPejA159mm8WWB=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jcwRHPSxFqmwpRFb"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CABxcv=kn+jkQV2g=a+Sz8TdhMcvcQiBWsBuPejA159mm8WWB=w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Javier Martinez Canillas <javier@dowhile0.org>
Cc: Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Liam Girdwood <lgirdwood@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--jcwRHPSxFqmwpRFb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Javier,

On Mon, Nov 30, 2015 at 04:06:14PM -0300, Javier Martinez Canillas wrote:
> Hello Maxime,
>=20
> On Mon, Nov 30, 2015 at 12:29 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
>=20
> [snip]
>=20
> >
> > +config REGULATOR_COUPLED_VOLTAGE
>=20
> Shouldn't this depend on OF?
>=20
> > +       tristate "Coupled voltage regulator support"
>=20
> the Kconfig symbol is tristate so the driver can be built as a module...
>=20
> > +
> > +static struct of_device_id coupled_regulator_of_match[] =3D {
> > +       { .compatible =3D "coupled-voltage-regulator" },
> > +       { /* Sentinel */ },
> > +};
> > +
>=20
> ...but the driver is missing a MODULE_DEVICE_TABLE(of, ...) so module
> autoloading won't work.

You're right, it will be in the v2.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--jcwRHPSxFqmwpRFb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXhGCAAoJEBx+YmzsjxAgPnAP/2Zk1xnjxcWHpFWS7Up8nguo
9Qww6pF5IrO2qzjVL5jViU1hSe5QvGeiuDV/KXRzZkwPnPIYOTGbG5BA1dLBdCbp
cnCOZRYoCl/BT50ZslcnmlQFu3YD0RFmQVuc4vEA06R+p67XhmO7Utjc0AU6KjOu
beW9WfY2bSLBDdw5jjn8Z0gT8X4Nmk5qN/AiWY64d9wIiwHXq2zq0tNdCIwD5Eoy
BVAo9P7ncJFm7BnQUwzKW5S3NS6B2OItBFj1YibuT0cUunBNDoBjrLUC21ovQydC
OGSYXokOqynvKC0N9qZOZA1sWDpx8f7f4pr1jUIivpRRIplJWxpJS5UgW1sUS9I3
FVnSGiT2OKFC4CtuIwbernDbxW3J/IfivZ9NShZYuufYg6nLDxDT07RKvCpqT/OX
X01soDh8R/3SLvKZ9w83v0894rEd+MLmgoPb3WvJUUV/bW/vwNrDiWjwjUh5v67D
it6YyOQcuGH//qIrAS5EyX4vIWR3JpEwnUxU+pHEct+fSsDjkcrXcA2b8mSZw+LS
aw8HxzhrclKZktlHMlVl4DgrUKWyCEi651VV+bE2xw23Pj0raXULS7g30CmssRq1
0lIfucHbMTLCQr30Lfh2AokmZUOcqxn2SN54W+KIi8vqyMt0RIY/49XB4xLGrEF/
ewYw3zvbBzKFP8YoI2P1
=BM9R
-----END PGP SIGNATURE-----

--jcwRHPSxFqmwpRFb--
