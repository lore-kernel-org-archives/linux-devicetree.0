From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 06/12] regulator: axp20x: prepare support for multiple
 AXP chip families
Date: Tue, 10 Mar 2015 20:04:49 +0000
Message-ID: <20150310200449.GG28806@sirena.org.uk>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-7-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="M8BZqbl6q5NSES+8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425988764-23618-7-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--M8BZqbl6q5NSES+8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 07:59:17PM +0800, Chen-Yu Tsai wrote:
> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
>=20
> Rework the AXP20X_ macros and probe function to support the several chip
> families, so that each family can define it's own set of regulators.

Applied, thanks.

--M8BZqbl6q5NSES+8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU/05hAAoJECTWi3JdVIfQREIH/Apk8mHKQAgiYtfXAn7GnhU+
XdPLzY4tGy0Pjzi17FqexEG1/GRKEAsIgbmAUKtggCFHc8HqzKgunnr1d/0ChRH5
SDQQ+lH0qBAIYb/r4g6qbeREitqrhGeGuYCowmPcUiZMfw+AKtAeOhPgEYuDE3Yq
63Z6PQUe0ox/2VFy61M9aBUywH/4HVYGxuZQQXvwczYv+EjuT7VHdYL5U83bNlxD
Gibsp8xI9q3t7wVmLiWMqikq793ElOOt/xSR+AlaqeMqcYU641kveSErYfq5A0rm
CwIZzRXReE7jI0dhBX4nvfnh326X+Gxe5ZkMRozBXYQPLG57k2nqRIU51nO8tV8=
=gLOI
-----END PGP SIGNATURE-----

--M8BZqbl6q5NSES+8--
