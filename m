From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v5 1/2] regulator: max14577: Add regulator driver for
 Maxim 14577
Date: Wed, 27 Nov 2013 15:20:42 +0000
Message-ID: <20131127152042.GY14725@sirena.org.uk>
References: <1385559982-32039-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HATTsZJGJQJ3rT4Z"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1385559982-32039-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-doc-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: devicetree@vger.kernel.org


--HATTsZJGJQJ3rT4Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 27, 2013 at 02:46:21PM +0100, Krzysztof Kozlowski wrote:

> +	{
> +		.name = "max14577-regulator",
> +		.of_compatible = "maxim,max14577-regulator",
> +	},

Why is there a compatible for this at all, would this ever appear as
part of a different device?

--HATTsZJGJQJ3rT4Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlg3GAAoJELSic+t+oim9x10P/1UvkkH8dhLKekFcQiyhJZVP
+4h3P2QScY6K/edHcb+0zhvFcBqRdo/0gX6Yp4BW9wr0yc+xg5SMSt66QWlw8OHF
TqWHmamCPS06bp47HU1wXw55bo9eOUFjRDPfTyPIaF2tnGkP+Q2zBIZmKcVCD87M
yyb/ka5acmmOiBH+eOtoE3cr5IiVt90MC9zFqE2B44o93cTsxHY1elHHleAEgux4
sAH09Cwp/klwIUkbWD+CmQ5cQCGRd2mn0grVm75RWvl2ZSlnScyty9d+d9qqaMlk
XarryjfpA7Qe0t+aEBf+WRAhfMvQishROl0ATtwh6gliOgv6xKv2Y+DJxxqGwZEM
qjBU88pu5AFZUB8UwTEWgOdlkMndetpHoXmflzezC5suPaCs/I+ihR95uKVl/47L
OCfPBtOZkYl0hds5L+OBIreT8ZB+BZe/e8DWb39UYdbayPE4S6XOX3jPbupq0eNG
7UYJiL2dbLdkevlfRPNfClAqWhq10SJyXOMgpHfze9gN+ntRWYZjogSi50dlCBNC
EdKsosxRnkFfrpnOu0PAVIBSY07/KOF3vqlCRmkutOzSqbDGDv1n2WQ/a4uWCbuk
QDfprJzC6VfvG3g1RIEdWuJa/6AEWtFmZmiJmbjsk83AE5xlInXhehgdrTQ0XoP8
jTjSvP7QREcRSglu8p2K
=iTcc
-----END PGP SIGNATURE-----

--HATTsZJGJQJ3rT4Z--
