From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 3/4] regulator: pv88080: Update Regulator driver for
 MFD support
Date: Fri, 18 Nov 2016 12:00:28 +0000
Message-ID: <20161118120028.7wiqfnehnyubqarr@sirena.org.uk>
References: <cover.1479429347.git.eric.jeong@diasemi.com>
 <7248b3cd414d462a97b80d9e5d044e592f85d973.1479429347.git.eric.jeong@diasemi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gx5lb34odtfvjdza"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <7248b3cd414d462a97b80d9e5d044e592f85d973.1479429347.git.eric.jeong-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
Cc: LINUX-KERNEL <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, DEVICETREE <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LINUX-GPIO <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Support Opensource <support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--gx5lb34odtfvjdza
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 18, 2016 at 09:35:46AM +0900, Eric Jeong wrote:
>=20
> From: Eric Jeong <eric.jeong.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org>
>=20
> This change convert from using struct i2c_clinet=20
> to using struct platform_device for MFD structure.
> And, the declaration of of_device_id and regmap_config
> are also move to MFD driver.

Acked-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--gx5lb34odtfvjdza
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJYLu1bAAoJECTWi3JdVIfQV/kH/1yLcbafFa4WljwD8DegzykI
jb8GgFDJJYQx/4GAEawteCOVhtMjWUEpiiRs/lEouse9D0lPAPB2MCP91b8EzSt7
j3CflZXUDgWydV9sdpESHKJ2iqFN11W9mWvepskBwEYM3BOO5TE38qk79CZPoexj
CLX6EdtdAvztu8/LX7om1eWbI2IBI7dcQYEEmd0Jb4mf0fosOU/+ob3DnOGwwJDb
bKFFSnfHvb4biCrNty3DUWwZ3wvLQyzT1bx3GMXwX6oWGA6Kws7rvdHiHfj2P2fT
SYVtGauShO9nvXGs4BJ0JQWEVBa3jUYAsKvJtMumD+imvnVlhV0Ffj2S5PS0dew=
=2ehP
-----END PGP SIGNATURE-----

--gx5lb34odtfvjdza--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
