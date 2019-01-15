From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Fix a typo
Date: Tue, 15 Jan 2019 10:52:28 +0100
Message-ID: <20190115095228.kwhgtumqcechpr5j@flea>
References: <20190113161413.14654-1-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mochvrg5c7cnhkly"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190113161413.14654-1-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--mochvrg5c7cnhkly
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 13, 2019 at 05:14:13PM +0100, Jonathan Neusch=E4fer wrote:
> This typo inverted the meaning of the comment, but the rest of the
> comment and the code reveal that the regulator in question needs to be
> on at all times.
>=20
> Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--mochvrg5c7cnhkly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXD2tXAAKCRDj7w1vZxhR
xfD7AP4qywnKHNgiMVKQgQm9Unl856D2G5YayGFo46hzFw/4MQEA23fYuGlEoHwa
xCIReP3XHYr04DGgK/uAsJW/1WkT9Qg=
=kEiC
-----END PGP SIGNATURE-----

--mochvrg5c7cnhkly--
