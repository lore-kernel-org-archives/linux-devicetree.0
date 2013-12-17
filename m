From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3 v2] ARM: dts: sama5d3xcm: add the regulator device
 node
Date: Tue, 17 Dec 2013 12:38:18 +0000
Message-ID: <20131217123818.GV3185@sirena.org.uk>
References: <1387258597-21866-1-git-send-email-wenyou.yang@atmel.com>
 <1387258597-21866-4-git-send-email-wenyou.yang@atmel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hhQYCuHgdlt9iR18"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1387258597-21866-4-git-send-email-wenyou.yang@atmel.com>
Sender: linux-doc-owner@vger.kernel.org
To: Wenyou Yang <wenyou.yang@atmel.com>
Cc: lgirdwood@gmail.com, linux-kernel@vger.kernel.org, grant.likely@linaro.org, rob.herring@calxeda.com, linux-doc@vger.kernel.org, vpalatin@chromium.org, nicolas.ferre@atmel.com, plagnioj@jcrosoft.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--hhQYCuHgdlt9iR18
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 01:36:37PM +0800, Wenyou Yang wrote:

> +						vcc_1v8_reg: DCDC_REG1 {
> +							regulator-name = "DCDC_REG1";

The whole point of naming the regulators is to help users read kernel
diagnostic output so the should normally be named after the supply in
the schematic.  If you're using the name of the supply on the PMIC you
can just omit it since that's the default anyway and it's not adding
extra information.  Use something like VCC_1V8.

--hhQYCuHgdlt9iR18
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsEW3AAoJELSic+t+oim99l0P/jXtE9XjrCW8EJ6Y+pdyWFas
kM3ToUUtgacNubmAdBwDMyiiq42wh4Io61qcW3qtNDMKWMG39Nsu2t2Vz/bJNF0F
QKMVbjUf+oSZs32D/3FjcfAfJKjk45u/K2NqMQ2foxdy5lvvquUm/u6Ymuaq2yCj
nXFFkxbQKE5tKA79TJCgDlQL9hdGhGcuPmdjWXzHEq7NxLmHFv80HPDyew+ah4Dr
3v0eKdjP02aNoSI4C3umbPgRpEaB7Add/fti0qjtnxTZhDyVH72SB89GGhyjmqI2
G7dGC446EOulr3KZyHSFAR9vYEaxBgN7H3alXjeyAHigPyu/Vhb4By/OkI7XLHmL
iUADv+Q3T8qzQHokYZB2khpfH/OayizhNj6OrMVLQPRBCzwSi5cXSHGt8+o8Sx38
GKqSL7rPL72A3JWRs0XHdXslm/PP+pwTj5O9TzJNehjP8752UCgHtetXIXFq0a4R
sq9yctC3lgNWnK5o03DLOVBJ9Mo916uxJ0+dhTAJvDGYl9CqqSGhwfZ/DKsb1CCP
xLFOTvxjkIEI0AMH51ONO2Pauc3sMM9XSwnF6uNnAAFyJHPs46CV3FMicIiLwuQf
rAGqbkUG22HlwF8D4o/meyOQq+A0Cy5CGC9Dl1IOImP4dl1YT9H+1T7AHlfrMtAB
LW+gz3XEljy/Vv1HnzUO
=NiEt
-----END PGP SIGNATURE-----

--hhQYCuHgdlt9iR18--
