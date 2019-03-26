From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH] ARM: dts: sun7i: fix typos in uart pin mux
Date: Tue, 26 Mar 2019 20:04:14 +0100
Message-ID: <20190326190414.3wpu37mhwgb4yqqd@flea>
References: <20190326112902.30080-1-mans@mansr.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3zyf22ldyzrxmiqu"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190326112902.30080-1-mans@mansr.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mans Rullgard <mans@mansr.com>
Cc: Chen-Yu Tsai <wens@csie.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Werner =?utf-8?B?QsO2bGxtYW5u?= <Werner.Boellmann@fh-dortmund.de>
List-Id: devicetree@vger.kernel.org


--3zyf22ldyzrxmiqu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 26, 2019 at 11:29:02AM +0000, Mans Rullgard wrote:
> The recently added uart mux options had a few typos.  Fix them.
>
> Fixes: 43d0fe112585 ("ARM: dts: sun7i: add pinctrl for missing uart mux o=
ptions")
> Reported-by: Werner B=F6llmann <Werner.Boellmann@fh-dortmund.de>
> Signed-off-by: Mans Rullgard <mans@mansr.com>

Applied, thanks!
Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--3zyf22ldyzrxmiqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXJp3rgAKCRDj7w1vZxhR
xY1dAQDkyaP+lKiPAnxWYflN+o+niW0yDTlsHqXqYND4USUcwAD/aoZ0xUVNC6hy
oVyNyCuxs/15uQoMul6FtnvuZwJv3As=
=pzTO
-----END PGP SIGNATURE-----

--3zyf22ldyzrxmiqu--
