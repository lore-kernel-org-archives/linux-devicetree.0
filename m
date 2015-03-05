From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] dt: spi: fsl-imx-cspi: add explicit compatible strings
 and required clock properties
Date: Thu, 5 Mar 2015 17:07:42 +0000
Message-ID: <20150305170742.GT21293@sirena.org.uk>
References: <1425496378-16561-1-git-send-email-mporter@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="mrSJCujIr/bkIKwq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1425496378-16561-1-git-send-email-mporter@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@konsulko.com>
Cc: Devicetree List <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Marek Vasut <marex@denx.de>, Robin Gong <b38343@freescale.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org


--mrSJCujIr/bkIKwq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 04, 2015 at 02:12:58PM -0500, Matt Porter wrote:
> The fsl-imx-cspi binding contains language indicating compatible
> strings to be used that is not valid for all supported parts
> e.g. Should be "fsl,<soc>-cspi" or "fsl,<soc>-ecspi". Fix this
> by enumerating the set of valid compatible strings.

Applied, thanks.  Please use subject lines matching the style for the
subsystem.

--mrSJCujIr/bkIKwq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU+I1dAAoJECTWi3JdVIfQK1AH/RSjEmstR2azMLiZTv3YDX9/
XAZm0IvY5cjGzq2FBAhRiSOqblHaHoOHiGUeH7ggo6a9FuMRXLLCpjQREB6LPl59
CTAxwttQzwjADkFdzbPSrIJrD5an0G1U2PFLeXCgBXL4LEchCwvHz0Uhz0tS45wa
GOGdX02GYf1fNZnREQjQYd2ddoZ69b8TTf0apUkzVWLi/ZVFtnh9JLPqlUcbIU6K
ZJ7MRBTEt/aBTjqOT/LsxKrD27beeyyrJQMdmD92D3k5Fx/WHWhoAlB/rkTlKy3+
QESYczYVFlYCzaWMSxR0s4lpwmFUv1so6gWtA98nvv5zs8JElZFgxMwwgIOKOdk=
=XsN8
-----END PGP SIGNATURE-----

--mrSJCujIr/bkIKwq--
