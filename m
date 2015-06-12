From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 4/6] regulator: Add soft start support
Date: Fri, 12 Jun 2015 13:16:55 +0100
Message-ID: <20150612121655.GV1921@sirena.org.uk>
References: <1434069427-3642-1-git-send-email-sboyd@codeaurora.org>
 <1434069427-3642-5-git-send-email-sboyd@codeaurora.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o3Y+93sjbn8Tp8J9"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1434069427-3642-5-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, David Collins <collinsd@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--o3Y+93sjbn8Tp8J9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2015 at 05:37:05PM -0700, Stephen Boyd wrote:
> Some regulators support a "soft start" feature where the voltage
> ramps up slowly when the regulator is enabled. Add an op
> (set_soft_start) and a DT property + constraint to support this.

Applied, thanks.

--o3Y+93sjbn8Tp8J9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVes23AAoJECTWi3JdVIfQ2HIH/3+qEZY27EII279cph3PxibN
1S9HrYgMLH/zlz04sxvQuRlAFkJFMOXqeGMvD9yqZg+UyPYjE+4qBNPCp6gjK8fM
UWuDxhaZOVA+mLJ+mVpaugOYF36j093UohR0BdvZuvR8q2FTAjbd9VMrA40RSi2H
Z+ftVuMIljgjfIPF3SPLabMVLEKmWBIKqHbfIJWpe1PSnp4px81+5DnqiYlBbiSC
Y+CiPmPA0CFhw8kJx3PFFBEka6Yly8yGijFIYhqH4FvFK+C9pVenXolfMiYv5rLg
zUFXw25Qy4hwQuHczfEmiF20JezSaeuSSImOCEkr4rYvQmdnc8/qrOaCZtV5kuY=
=sp/Q
-----END PGP SIGNATURE-----

--o3Y+93sjbn8Tp8J9--
