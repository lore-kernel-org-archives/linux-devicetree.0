From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/5] regulator: rn5t618: add RN5T567 PMIC support
Date: Mon, 6 Jun 2016 19:04:11 +0100
Message-ID: <20160606180411.GG7510@sirena.org.uk>
References: <20160605001749.4062-1-stefan@agner.ch>
 <20160605001749.4062-5-stefan@agner.ch>
 <20160606173539.GC7510@sirena.org.uk>
 <c6edd422420533d16c076ad5e721e549@agner.ch>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L1c6L/cjZjI9d0Eq"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <c6edd422420533d16c076ad5e721e549@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: lee.jones@linaro.org, lgirdwood@gmail.com, khilman@baylibre.com, carlo@caione.org, b.galvani@gmail.com, max.oss.09@gmail.com, marcel@ziswiler.com, linux@armlinux.org.uk, galak@codeaurora.org, ijc+devicetree@hellion.org.uk, mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
List-Id: devicetree@vger.kernel.org


--L1c6L/cjZjI9d0Eq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 06, 2016 at 10:47:40AM -0700, Stefan Agner wrote:
> On 2016-06-06 10:35, Mark Brown wrote:

> > Acked-by: Mark Brown <broonie@kernel.org>

> Thanks Mark.

> Do you have an idea how the patchset should be handled with the
> dependent dt change in patch 1?

Lee will need to apply at least the first patch, I'd expect he'll also
apply this and send me a pull request (or perhaps just send me a pull
request for the MFD change).

--L1c6L/cjZjI9d0Eq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXVbsaAAoJECTWi3JdVIfQmAgH/RAIEI/JmnRcxGbepe+AKfP/
teUemlt0FIBljw6qpGTpGP8gLdK/9ZRbMnMn/H5MQjCLhNgWuNDZEIA6oNklLcgp
PvgFfWqWzLFe0wobFK6HI8nF6KwMYt7l52LzP/ZMh6Up3nv8nYCagXFY8TePqEVC
hcIU8vFAvEJZR6IPvfqaouq1qsTF4cP2yOlfXFslF4bZEPvyVNGBK5/cegsEXBOb
q+hED9//B8ojjfAZxc4S8xfvUPpBdp9CTqV3/a6GQBWzKYCCXlbxJDEQOky/k5Hf
DsKGowWaFz5FTWJVnB+D3YCGoSZ1XWd7ZSr3npLM1c8GziccTvTS/jnrtl3COJA=
=9smB
-----END PGP SIGNATURE-----

--L1c6L/cjZjI9d0Eq--
