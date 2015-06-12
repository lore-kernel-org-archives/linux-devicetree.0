From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 5/6] regulator: Add input current limit support
Date: Fri, 12 Jun 2015 13:18:20 +0100
Message-ID: <20150612121820.GW1921@sirena.org.uk>
References: <1434069427-3642-1-git-send-email-sboyd@codeaurora.org>
 <1434069427-3642-6-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5UQzRzi9WojKXOfC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434069427-3642-6-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--5UQzRzi9WojKXOfC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2015 at 05:37:06PM -0700, Stephen Boyd wrote:
> Some regulators can limit their input current (typically annotated
> as ilim). Add an op (set_input_current_limit) and a DT property +
> constraint to support this.

Applied, thanks.

--5UQzRzi9WojKXOfC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVes4LAAoJECTWi3JdVIfQbHMH/1+MjbAO6MlG3yIvuS0qdn9b
LvVyHkvxsBJWYLR7EzO3aul+My/6if/lwCphrIVfOXXvv/TTNWoZaiPjlH6Ldb24
nTxxgbN2NYTNRsMcLPf5FvPgGsHH7zGOlcDAGoJqYsnkXypdwZhV/UuSRdHre+ZQ
rOf6Dl1r+LiDXu4cQHP4lhc9ztJenez2u5a4kRIurWWTYC4B22A06w6yHdXUYzs5
fTBuOy0YBGIIM+iirlDRwiPNdSFyv2jTKLJbwuvLmW3hgoFFl3Iwy+9hNJrh9JXO
FbsgdvVpTfB4jflcPRrPyQyXuCMDxdWXZTRBM7mAlYLd2yPuvrTtIRQ64RhRTSI=
=QOZc
-----END PGP SIGNATURE-----

--5UQzRzi9WojKXOfC--
