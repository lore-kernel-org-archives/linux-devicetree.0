From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 2/3] regulator: max8973: make default/unset dvs gpio as
 invalid gpio
Date: Mon, 20 Apr 2015 22:19:46 +0100
Message-ID: <20150420211946.GR14892@sirena.org.uk>
References: <1429534457-15515-1-git-send-email-ldewangan@nvidia.com>
 <1429534457-15515-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8RsyD0KswhpoK73Z"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1429534457-15515-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--8RsyD0KswhpoK73Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 06:24:16PM +0530, Laxman Dewangan wrote:
> If platform data has dvs-gpio value 0 as default/unset then
> make this as invalid gpio so that function gpio_is_valid()
> can return false on this case.

Applied, thanks.

--8RsyD0KswhpoK73Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVNW1yAAoJECTWi3JdVIfQHgQH/ReL6Ot//vklmN3jUfaf6qW6
A6MA+XfjnN4YDk/1rQK9TILEg1XhqgL7o7UYSAv0usiHJebK6b8VZ4btIv17MnxI
nwkzCWN2WldTdQRL6XsOgeViGvFSWgJT36MMYKUAWLmOcAaXns1yplUpz5xb0bXZ
lHqVtmLCtHvrbR3UVXmMwtV0j/KRtq2v7I0sE1AX5eQoXBTXRPTmcJkoDfeLtfO9
rThngZtCUs8rmyueoq+YGBlYmZMEoIPPXJAnbZf3xjnKtoG28WMhYShi6TKhJtz5
+f0sdgICSJBzHg9rlWy8tr+L9iuVoW8AgIDPfY28VacBuFGIIr4UG39S33zi57I=
=eX+G
-----END PGP SIGNATURE-----

--8RsyD0KswhpoK73Z--
