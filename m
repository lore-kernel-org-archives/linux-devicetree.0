From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH 0/2] ARM: dts: sun6i: Drop constraints on dc1sw regulator
Date: Wed, 11 May 2016 14:43:44 +0200
Message-ID: <20160511124344.GO3733@lukather>
References: <1462944194-6920-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjOMJDssiV0CZSJH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1462944194-6920-1-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>
List-Id: devicetree@vger.kernel.org


--tjOMJDssiV0CZSJH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 01:23:12PM +0800, Chen-Yu Tsai wrote:
> Hi Arnd, Olof,
>=20
> Here are 2 last minute fixes for 4.6. The 2 patches drop constaints on
> the dc1sw regulator for 2 A31s tablets. I checked with Maxime and he said
> to send them directly to you.
>=20
> The issue was first brought up and fixed for A23/A33 Q8 tablets in commit
> dcf5341f0150 ("ARM: dts: sun8i-q8-common: Do not set constraints on dc1sw
> regulator"). It was brought up again yesterday on IRC, and I realized that
> 2 sun6i A31s tablet DTS files also had this setting. The setting causes
> PMIC regulator registration to fail, and since among other things, mmc
> depends on the regulators, the system will likely hang.
>=20
> There seems to be a fix for this queued up for 4.7: commit 45389c47526d
> ("regulator: core: Add early supply resolution for regulators") in the
> regulator "supply" topic branch. So we should be able to revert these
> fixes in 4.7.

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

For the two patches.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--tjOMJDssiV0CZSJH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXMykAAAoJEBx+YmzsjxAguAYP/i0idg2ZWj3ukzj2YyDJeQiC
vWFxjqHg+FLm1YJmeyDB+HAOtmnGsC1X8lKZcmSvqdsUTMz7FmOpdEgMrhxwZlOF
9O1N55CPI21VRFhm+cPzeUjbVQ+ZcP9famhYNqfLaJx3kx7W3sAYj9fTsfMxH9Ar
V4wjsBltqiTIpCv88hN5cKgsx4osexrs+0Yts02MgOONehL+gbo70eoDxhO3PBgn
YE7Uhkd1R7Se/txZYr7Jb47VKCRwTIOzYGL4Zpy2nTj06FZIUUwGtTwVrGj1X4s9
9bIoTuE/ZY6fb341tr92gKXwAKwzrfmqd2Vrv5dfabhsnnUFD1ixAl0il/zsb5uL
XdrgD5ahK9ahSCkwIZ+K1LA/gp6sib69lNCKsc8gKoE4JPByjN6ADycFl8ocIq1l
NuCrbb4TjD4GSbHfmbbbnbPGXAanHleY7T3GrPNcKVYW8bM01Vqfq9IVwwXeoRri
yGUQAmT2M+rSn1X8/1W+eaWD8d79EGFz3D5KOOxjLSZZfDtC8uFEsFjXsE9tOT26
/1dV7yp5WEf0USUPsUya1b904ZF6KpUuYyFgoBhdsuiKqYnuDn+DftKdXYAQYid3
KgMsKpPNNhS423b1oxSV1fJTz+E2Wc9FK1lmYMK2Tn+KGI5hb4Fg/tpLcAW1ekoo
yiIVB93brGJKFTXSrvfy
=+I8O
-----END PGP SIGNATURE-----

--tjOMJDssiV0CZSJH--
