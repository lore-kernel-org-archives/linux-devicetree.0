From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/4] regulator: bcm590xx: add support for regulators on
 secondary i2c slave
Date: Mon, 14 Apr 2014 20:59:39 +0100
Message-ID: <20140414195939.GR25182@sirena.org.uk>
References: <1397501428-8857-1-git-send-email-mporter@linaro.org>
 <1397501428-8857-4-git-send-email-mporter@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PPxI8paQBs33t8dK"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1397501428-8857-4-git-send-email-mporter@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matt Porter <mporter@linaro.org>
Cc: Devicetree List <devicetree@vger.kernel.org>, Lee Jones <lee.jones@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, Tim Kryger <tim.kryger@linaro.org>, Markus Mayer <markus.mayer@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org


--PPxI8paQBs33t8dK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 14, 2014 at 02:50:27PM -0400, Matt Porter wrote:
> The bcm590xx mfd driver now exposes a second regmap descriptor making
> the registers for regulators on the secondary i2c slave address
> available.  Add support for GPLDO1-6 and VBUS regulators found within
> this register range.
>=20
> Signed-off-by: Matt Porter <mporter@linaro.org>

Acked-by: Mark Brown <broonie@linaro.org>

though if possible I'd prefer to merge this into the regulator tree
which would need a cross tree merge with MFD.

--PPxI8paQBs33t8dK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTTD4oAAoJELSic+t+oim9iNEP/j5zNfSRbmnUDjsI7avrqpdf
rESLNCU+3eRCAG63Sum+KYl9yeNELHE7lP3FFiuTdPahGcezHOvqmKvgMf7ti6mJ
G0Tv7Fp8LVFgGyT3sqA5aTQwgXsWpusBA3e4tNNVQtH67DsTh7wOCmfOK31GuU4B
0cIy4vDRcC/x5cd8h2G1SkLbm0v1QP68T1y998n1UPzh4omAdnbKeUbIfL5GvO3I
zHuB3MXdleZsh7/gpuo+ddUCpHKU5ftZlI3rUvEZyxBCcg8QHa9jk+Y4FHRMnwfE
+WOd1GgIwAV1+Lt54qGfc+MsBv7MFPxPMDnHHon4QKyWa9P7Ws8RKQZbyBjjqky9
wQ3og7dM5qQbtYRNscahxjN5nqfowzi362ld+NQqDuO96yjOKLZzx1b6CtGvcY4i
lLvPsJFZgHs8BM7hvV5RmhroiM1tbhyxX8a/XvR1DYNtolCNgqPGajPi1X3XFVsK
5EQ7DPnk22EmGG+LcPK2o/5x+JxSocGBonCYD1BT6mGiGSiyEtyw1H6pCpdSajpW
MBo687Nq98EkHMbFQGT5ocMuJMY0LV8V0DC5hXEpafuq0h+MQyIvXpJtojLy5qUh
7tGKan8HaUECnvUc3DOdABSFY+gbOmGgLHaX7j8dspRwVP2Y74T5+o+4KIWEhXLv
bG8LjRbxnGQex5MZC6Ei
=joNP
-----END PGP SIGNATURE-----

--PPxI8paQBs33t8dK--
