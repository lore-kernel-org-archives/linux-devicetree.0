From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 07/12] regulator: axp20x: add support for AXP22X
 regulators
Date: Tue, 10 Mar 2015 20:04:56 +0000
Message-ID: <20150310200456.GH28806@sirena.org.uk>
References: <1425988764-23618-1-git-send-email-wens@csie.org>
 <1425988764-23618-8-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ixDdryD3ui8aoCe5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425988764-23618-8-git-send-email-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <robh+dt@kernel.org>, Boris BREZILLON <boris.brezillon@free-electrons.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org


--ixDdryD3ui8aoCe5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2015 at 07:59:18PM +0800, Chen-Yu Tsai wrote:
> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
>=20
> Add AXP22X regulator definitions and variant id associations.
> This introduces a new "switch" type output for one of the regulators.
> It is a switchable secondary output of one regulator, with the same
> voltage level as the primary output.

Applied, thanks.

--ixDdryD3ui8aoCe5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU/05oAAoJECTWi3JdVIfQwNIH+gOQyicZ3xYUlm3Tt3Tepe8z
8GeVyWstqEtE8PYw3IO2cknpAvCl2rwUh/JiOHZw3MZ0s6j9xruF2z5EZ8o7dc/x
JbDFj5GbfftG/pe/31ah7KlComxb3Zx7yB2PF+Ixkp8b05gfye4YS3GJrP5X+5ns
o4Wd/Phm9rih82JgticUy3GImmqBD28hTdwQa1wm+/INb8OhDZgR0XNz9GLMUDXv
joe7Y+zvhxUUkCbhs7NvOOOHc9q75judVTQgcltSjk5Rmu4OQ61+ZEV5W8GePE/i
XYk5XEWpJ/JERVsYcaVx73lX5M0s7LfOK+l1qt2WfTeUz/lwAW9fV1j0fBZQhII=
=59bw
-----END PGP SIGNATURE-----

--ixDdryD3ui8aoCe5--
