From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 2/6] regulator: Add system_load constraint
Date: Fri, 12 Jun 2015 13:05:24 +0100
Message-ID: <20150612120524.GP1921@sirena.org.uk>
References: <1434069427-3642-1-git-send-email-sboyd@codeaurora.org>
 <1434069427-3642-3-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SavPGzlo48F1Gxyz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434069427-3642-3-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--SavPGzlo48F1Gxyz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2015 at 05:37:03PM -0700, Stephen Boyd wrote:
> Some regulators have a fixed load that isn't captured by
> consumers that the kernel knows about. Add a constraint to
> support this.

Applied, thanks.

--SavPGzlo48F1Gxyz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVessEAAoJECTWi3JdVIfQbb0H/2u5hCTY7HVmJCajTENJk/cC
qAgYrObtX5B+UUSo90JomBsexoy1vclb/f5YazZ4iRxUkrfs0OM5m2508w4IE7aX
f2mtyciGgTK+By++Nhx3t+EXJABDqJUCA7880odU9Ww71ELjHXV1m1BpeYWTm9ky
g9GScGaxqKow5q72c0+e/WB1t7oDxRT98+tlRuVHR1OB1X6JD4ja07+bgw8GvD2L
Nh9VuCUlI49AD8piC4f7JfpiDXusZn6yhZCX1LCuRvxwRUijqbRoeve/Wsnuv4Rm
/kFTfHq2XjoyqlJ1joeXTeUom6ozmZFVNOWi8r5cZ9L/ln0ryNXiMOW/NoUIEMs=
=sp0R
-----END PGP SIGNATURE-----

--SavPGzlo48F1Gxyz--
