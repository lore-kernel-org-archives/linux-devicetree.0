From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH 2/7] ARM: dts: sun8i: h3: Split out common board design
 for ALL-H3-CC
Date: Tue, 24 Apr 2018 14:13:53 +0200
Message-ID: <20180424121353.zxujyehsw3er2xq6@flea>
References: <20180424113424.13196-1-wens@csie.org>
 <20180424113424.13196-3-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zypndlmz3osmozf6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180424113424.13196-3-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org


--zypndlmz3osmozf6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 24, 2018 at 07:34:19PM +0800, Chen-Yu Tsai wrote:
> The Libre Computer Project ALL-H3-CC has three models, all using the
> same board design, but with different pin compatible SoCs and amount of
> DRAM.
>=20
> Currently only the H3 1GB DRAM variant is supported. To support the two
> other variants, first split the original device tree into a common board
> design part and an SoC specific part.
>=20
> The SoC part only defines which SoC is used and model name, and includes
> the SoC specific dtsi file and the common design dtsi file.
>=20
> Also fix up the SPDX identifier line to use the correct comment style,
> and place it on the first line.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  .../boot/dts/sun8i-h3-libretech-all-h3-cc.dts | 213 +-----------------
>  ....dts =3D> sunxi-hx-libretech-all-h3-cc.dtsi} |  11 +-

I think I prefer the name of Neil's DTSI better, and since pretty much
the same patches (a couple of hours) before, we'll merge them (while
merging the rest of your patches, obviously).

Does that work for you?

Maxime
--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--zypndlmz3osmozf6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlrfH4AACgkQ0rTAlCFN
r3RioA/+MlcxGSywxCDUN5R2w4zVifw61aSZ+wcQO2Jespz7hut6trVBtKtQblqY
NuP4PsUa5XpeD/xnnLVXldVPQ0DQel5TbZarfmYi5HqIBbbDfFEHSST/WABVm+u2
Ujj37gCehwbkk8qfgTJWhpB6pyZ92bAyhePjrekLYXjOUW0M5/7x4uCce7AWvtQV
KJkIkfGrIJhLSlCMlYYzoAUmxLSxtTGymNaaXzBautuL3Ar92NC/RHn5YqwZOe1o
wa/ZN2aRDGiej6Fsv3ILw3rkzLaPvXsW4I05JgogJDV8BgY001O9KsiMuy9Vezx/
XB3s3QbQnZ/7VNhTUHBdwoQVYbXAgvsS0C7GczAUs9cCeg3SsA+e6INKZmp2E2kk
5sW1InlKd1BXHC9teHsQyBys5KFuqTnSqKucqSe9x3TFHr+116GkVO+KE7sNwnI+
d1V4s3N44w4AaERFZRFdfeLOwNYq6TyQKxEBrepz6n+HL1BveXFYDFYGtA9mtnup
Lfc8sAx9jjBneDqWsogQd1z9xEunzRD03FXkjHVBkc2qa82Wq54WeOVRrJ5V8QRN
zF6r5PlGQrVSKohzV4N2o9PscseWFdk5/7tL6Ue8/t9AJfAUoxrX08EoxgmfakLk
lBiNgiqghDj8iFaFPjjNONOlVgUweBKNl2hUxo4kVxHz5Pxdl2o=
=5ReF
-----END PGP SIGNATURE-----

--zypndlmz3osmozf6--
