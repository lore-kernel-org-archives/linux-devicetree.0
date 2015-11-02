From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH RESEND 16/16] regulator: add LM363X driver
Date: Mon, 2 Nov 2015 12:26:40 +0000
Message-ID: <20151102122640.GF20228@sirena.org.uk>
References: <1446441875-1256-1-git-send-email-milo.kim@ti.com>
 <1446441875-1256-17-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8TaQrIeukR7mmbKf"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1446441875-1256-17-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Milo Kim <milo.kim@ti.com>
Cc: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--8TaQrIeukR7mmbKf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2015 at 02:24:35PM +0900, Milo Kim wrote:
> LM363X regulator driver supports LM3631 and LM3632.
> LM3631 has 5 regulators. LM3632 provides 3 regulators.
> One boost output and LDOs are used for the display module.
> Boost voltage is configurable but always on.
> Supported operations for LDOs are enabled/disabled and voltage change.

As far as I can tell this is another partial resend of a series you
originally sent about 15 minutes previously - what's going on here?

--8TaQrIeukR7mmbKf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWN1Z/AAoJECTWi3JdVIfQgy0H/01YUd2cS9BIOad8QD4fCpq2
FebcXGfosE5JvKn3QQlmjSm24DJ213AbdVrd2Z88OWWfcDt6ObJvv/AV6bTeHMlK
fMGHPmDNl4sgw8hHwPXZpMqxImB6wbVG9fHD/RkxyMKc8L+j3ancEUH6fLDY6YEh
Mlu2c9bNaBnm0DLUkpLDhP6T3qCAS/ApsDy4W4H+XiJuDYDSZeWvdTmCInXEKooM
0CqBtf3e4v7Q6jIs+swgx3HXYTD0IJPIfcBFgZx8vEVeCCIV4NJuN0Z0F7oS4Xin
8oBuLFwoXSWwscIPJ78mZCwdSW0RmYl/pBCD93eB9QxaV4zEOzd0mqPbGIsZL4A=
=1UDH
-----END PGP SIGNATURE-----

--8TaQrIeukR7mmbKf--
