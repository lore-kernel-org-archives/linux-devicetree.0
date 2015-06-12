From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 3/6] regulator: Add pull down support
Date: Fri, 12 Jun 2015 13:09:41 +0100
Message-ID: <20150612120941.GQ1921@sirena.org.uk>
References: <1434069427-3642-1-git-send-email-sboyd@codeaurora.org>
 <1434069427-3642-4-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NEaRsfQExFH3jWtg"
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434069427-3642-4-git-send-email-sboyd@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--NEaRsfQExFH3jWtg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2015 at 05:37:04PM -0700, Stephen Boyd wrote:
> Some regulators need to be configured to pull down a resistor
> when the regulator is disabled. Add an op (set_pull_down) and a
> DT property + constraint to support this.

Applied, thanks.

--NEaRsfQExFH3jWtg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVeswEAAoJECTWi3JdVIfQGUYH/1zPbdhPpqUgBRc6+N+bKOfx
I5/YzBkVRHUGoGFxQQOnZK6XSyoSJxHkklFsZnbTNqFdcKLZO4Mgv9GYC0fonxBa
L0ge/ic7wGo9Ov0lULLxcvXVbYNGyM/sVKAaKngk2zuVm2nhK1i/pVQGpkLGwLHG
asETrQ1UePDf0GClR92RQ9ScG3sS7xOWkxS0aV1XNRJWBg7vU9egV5A4jOLewLJc
3MTwvBdMMzwMzOMVzbEYtlUO71oy25to+ZlkpaN7EhmK26PzhYGUcl/JTsL3bEnB
x6s1dajKvJ2egpgZxS2Iiefm1prsdivKupfZ1eM4Mzx8U/tkrtZn0Mp0ZGVKz94=
=m3QG
-----END PGP SIGNATURE-----

--NEaRsfQExFH3jWtg--
