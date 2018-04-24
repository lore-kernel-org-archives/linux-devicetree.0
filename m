From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: h5: Add cpu0 label for first
 cpu
Date: Tue, 24 Apr 2018 13:54:37 +0200
Message-ID: <20180424115437.bknv53qpb4sve4ew@flea>
References: <20180424113424.13196-1-wens@csie.org>
 <20180424113424.13196-6-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7919654522347815664=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180424113424.13196-6-wens@csie.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org


--===============7919654522347815664==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cchyp32opx2nrsg4"
Content-Disposition: inline


--cchyp32opx2nrsg4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 07:34:22PM +0800, Chen-Yu Tsai wrote:
> At the board level, we want to be able to specify what regulator
> supplies power to the cpu domain.
>=20
> Add a label to the first cpu node so we can reference it later.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@bootlin.com>

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--cchyp32opx2nrsg4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrfGvwACgkQ0rTAlCFN
r3Rjeg//fK8J8LjU3WXpYMx7pLv0DyfrHbASuwJPvlAdlgjZr4nbG1DCE2oWxNky
Y3p7f9BfFZ6LasaRVS+kT0n7mZgZM8FhOrhZ2+SI9H3f7oG3gXGWmWJLL7UQcHuh
rLfYf45pV9A/+OB2LQUSFQsNtABI8W7cj8FeQHOYoVVYlOfXakeeJZqZjyMoAf+A
/p2mhcXOoLd9lenOXM4a8Mo86/d075T8FHPew7gB/4hd9JXcgHWVyOXS//fOBb0l
EdpVlEQZxj0bPKcAUZxKaJnh9wQko9sSUsjdc9Zw3O4+KxiJiSKUpuzy0S8DYrDw
SztjNAC1nPSnyO8xoKIYjC0v4ad+nefWnMEpTdC801UD1EsXsRfwfY4YbsC8AxmV
7GxlEXEnGQtJzmECjxnoFUMUa+Y8i+Qv1wizGsC153sMjVJDmTc5eX6cjUbJvh+G
wtY+hMlZrtHDRDpi4xa1rJMOeJ7AqklHOuPBj+qKB3qThzOLUdl9ysQm4qaruG8B
vgbnY+s3z9/Sx2m6dPYWKcdt7/lI23Q135V5K0Hx6pzQpHoEazUczJEMfuYYVrFU
+WUA3L2wpVYHFxfmYyhh4LyRZiQcw1GodzuXIXwC3TnbVTr/hInGuh550Uw7ynHK
dCWlDtIiQ1p5DgdvVpuXaAZvLcEY2/rPHnrXb2fDEw2VkPMqPb8=
=H8FS
-----END PGP SIGNATURE-----

--cchyp32opx2nrsg4--


--===============7919654522347815664==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7919654522347815664==--
