From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] ARM: dts: sun6i: hummingbird: Add aliases for rtc devices
Date: Thu, 1 Oct 2015 12:11:26 +0200
Message-ID: <20151001101126.GD7104@lukather>
References: <1443600937-11071-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/xevKuQXtvXNcizp"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1443600937-11071-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>
List-Id: devicetree@vger.kernel.org


--/xevKuQXtvXNcizp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 30, 2015 at 04:15:37PM +0800, Chen-Yu Tsai wrote:
> The hummingbird A31 has 2 rtc devices available: one in the SoC, and
> a pcf8563 external rtc on i2c2.
>=20
> For some unknown reason, the onboard backup battery to power the
> internal rtc when power is removed, and its time would reset. Hence
> we want to use the external one by default.

The patch looks fine, but I'm not sure to understand the first
sentence of that paragraph :/

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/xevKuQXtvXNcizp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDQbOAAoJEBx+YmzsjxAgPQwP/3Hw9qpCePAboSYDjT103vLU
e0jXsGbI72CWDPxZrT8RTp8WCAJmLlU0PAm2iq6WBaJnP+tFFawcz9t6RZ5ov/Ir
3f0GKTc8aRddsX/66g0e2q22NqzFXVSb2+LNv1cEDOApbP/5FDc9UXTeRglI3Azb
hh9Rg0qs70HLjQ9/WYg96k4sGvi5WjgbLtF07YBhu2BtNaCMruF4ykLJJ+XzrcXr
m2c8Gv4X6J4ODN0V9VcSp733fiItpFNotUZb61Uhs7DlRPOJgiWPdMOBK4iF0riv
XrdLGl3dmvoZqGLhCy0XOE/cxfVR6fhlaPd05Jzzbz1t2DLUl44MeFdfdjnXVXNr
ZkNsQgk7zfz7QvfZtP1zyTGwkR3DQhF4SR+NPJ9cBDFe2p47xJrOVR1/kOhuIiLo
ir+byC7M8MU0oAA0zQEaeG7Fwy1rO28tZzRpM5pqrg+GlyBplgt6sfciRKbnVgar
wyz3KQvsFMT3zX/ccFRepR9tntcLU+Xdgz1D3pPHgcpqJBLWtKI8/D5l+o/3vGBh
XMnhSvO1Nt+Ci0VjwkHJkFkZnQmDIc9vBoxtFe+/d1eAhu+vGXXQvSoLeZygh9Os
QXVRnNcEn42NKUCUSSu13DGevWWKlYHhZHajOl5wDuGSmykq+Ut/acqrMyNOvU3D
75SYH7OoYIylzV7Oona9
=+ARR
-----END PGP SIGNATURE-----

--/xevKuQXtvXNcizp--
