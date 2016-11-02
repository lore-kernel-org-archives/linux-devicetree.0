From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/3] ARM: dts: sun9i: Enable SDIO-based WiFi
Date: Wed, 2 Nov 2016 14:32:46 +0100
Message-ID: <20161102133246.tyvdoxxzekpqhiuu@lukather>
References: <20161028101154.7350-1-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xzkfs35yrd4dq2wa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161028101154.7350-1-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--xzkfs35yrd4dq2wa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 28, 2016 at 06:11:51PM +0800, Chen-Yu Tsai wrote:
> Hi Maxime,
>=20
> Now that we have support for both PMICs, we can turn on the
> regulators needed for the onboard WiFi chips.
>=20
> This is a fairly simple series. The WiFi chips themselves are
> supported by the brcmfmac driver, but the user needs to get an
> nvram.txt file and put it in their firmware directory, in
> addition to the firmware file in linux-firmware. Otherwise we
> just need to enable the mmc controller and supply the vmmc and
> vqmmc regulators.

Applied all three, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xzkfs35yrd4dq2wa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYGer6AAoJEBx+YmzsjxAgBA4P/1cbaOc95V77c2JnD9502oz/
DxoBofh3Vg4U0Bqjal4R4esZB9TiRqiRN0vO5Q8qnrSi/3QsjD+ORipdtY5waeFY
geYSJBJhM5oaQ4IeTL01ouVINscq0ya6VjktzFVxLy8qsVZFlMvNgXXe+MZWwDpi
2sFt8iteHrBIq0JwNtBT5VYWdExO0aWCcsovwlFbG3WBASydR4rpoFU9t7rkfNfY
+ThWL+kwHBJt5HxNTVK7dY8hNQkR/jvQhVxmv9ixXBw9lq99I22Fx9xAi/aTETEO
KXyij3aqlA6QERdfYimUa0EIetj3XbBt1dNkzJm3Yisa+Tv0CeRY+TqXo2LttIRz
tYoHfQVomVnoiOtg8g4pEc88X0HD8wX2KfjNrjpGUL8LDn47mrfrXYW6nZowe8z+
Rb7s/5yM13bljKMV7ZzfOaIGfMty6N42QZb942CxJmkF5TGM5deVP13FTtGy6lnv
Z4F1XKGPF+yriddf9ywdmT0779uld+kXKUiMKWcDWDKTxmh4S50m4MbzL7mnw8z3
Fz6YRZcA/QUNRDquAfgjycNI6/bqqk5+ohhmlMaMtw84elXLOto6dnk4uYdcR9Cs
EtTgR/7mETb2zQ4VreSya2IB1DlJfBiT1FPqPUb71NRIPC5v2K+6fCIT95sGKG69
9Nep1o2A0/e9NE2aogCN
=KLgR
-----END PGP SIGNATURE-----

--xzkfs35yrd4dq2wa--
