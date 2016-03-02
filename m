From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/4] regulator: core: Add support for active-discharge
 configuration
Date: Wed, 2 Mar 2016 10:44:21 +0900
Message-ID: <20160302014421.GM18327@sirena.org.uk>
References: <1456835895-16503-1-git-send-email-ldewangan@nvidia.com>
 <1456835895-16503-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rQfmhCPYrIx9zeBl"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1456835895-16503-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--rQfmhCPYrIx9zeBl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 01, 2016 at 06:08:13PM +0530, Laxman Dewangan wrote:

> + * @active_discharge: Enable/disable active discharge. The values are:
> + *		      -1: Default, 0: Disable, 1: Enable.

This isn't a good interface, it means that 0 (which is the default value
for static constrants or kzalloc()ed constraints) means to actively
discharge rather than leave the settings unchanged but our general
policy is to not touch anything unless explicitly told to do so.

--rQfmhCPYrIx9zeBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW1kV0AAoJECTWi3JdVIfQQMgH/0m+WSz3HjcNwCcD5N/G1tzW
a3sshhLraU3E4rfa+9t/gji5j3wFJQRot2oIJaZ7OEAiFHflj3AEUPKLFGCSVLZK
yv4eLdRrHaMnY+Pex9g0Czj7FMu1Bwbua88nhgK+j6xDw1hUTmdvettJr0hZ680i
IS1L24cV6lZ5dI8hvmPLfAaAiGbSPFQhKcx4pLccgCdkI3NZziMCgPQiM8yHPB+t
kmy22aHxD0pEM+n+OB4Vzw2tqSn6y+Pf4bSqEPaI3ugFyq7Hi4oOlr6GiXKYcM65
bSKJoxXvM4UbjJVp764wkDAWiuIkYmaW8ceelDWKQZu6vmtJqfQwAnMxaYWlx9k=
=WIob
-----END PGP SIGNATURE-----

--rQfmhCPYrIx9zeBl--
