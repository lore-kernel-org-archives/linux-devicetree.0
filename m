From: Maxime Ripard <maxime.ripard@bootlin.com>
Subject: Re: [PATCH v3 2/4] arm64: dts: allwinner: h6: add watchdog node
Date: Mon, 20 May 2019 09:36:52 +0200
Message-ID: <20190520073652.itk452vrpnicta5v@flea>
References: <20190518152355.11134-1-peron.clem@gmail.com>
 <20190518152355.11134-3-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="e276a7us3gg53ua6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190518152355.11134-3-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Chen-Yu Tsai <wens@csie.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--e276a7us3gg53ua6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 18, 2019 at 05:23:53PM +0200, Cl=E9ment P=E9ron wrote:
> Allwinner H6 has a watchog node which seems broken
> on some boards.
>
> Test has been performed on several boards.
>
> Chen-Yu Tsai boards:
> Pine H64 - H6448BA 7782 =3D> OK
> OrangePi Lite 2 - H8068BA 61C2 =3D> KO
>
> Martin Ayotte boards:
> Pine H64 - H8069BA 6892 =3D> OK
> OrangePi 3 - HA047BA 69W2 =3D> KO
> OrangePi One Plus - H7310BA 6842 =3D> KO
> OrangePi Lite2 - H6448BA 6662 =3D> KO
>
> Cl=E9ment P=E9ron board:
> Beelink GS1 - H7309BA 6842 =3D> KO
>
> As it seems not fixable for now, declare the node
> but leave it disable with a comment.
>
> Signed-off-by: Cl=E9ment P=E9ron <peron.clem@gmail.com>

If it doesn't work most boards, then why do we need to merge that
patch in the first place?

Maxime

--
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--e276a7us3gg53ua6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXOJZFAAKCRDj7w1vZxhR
xQh1AQD1wT9FiJDFc3HyLL1R5Zfgdvvje9Gm40LwAYtcqbVztQD/WWrr2dC4yL3m
eySG7yJU57b661i7G27N2vwjLCO0Wg4=
=Vx+h
-----END PGP SIGNATURE-----

--e276a7us3gg53ua6--
