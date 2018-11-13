From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 1/3] regulator: dt-bindings: add MCP16502 regulator
 bindings
Date: Tue, 13 Nov 2018 09:30:37 -0800
Message-ID: <20181113173036.GA2089@sirena.org.uk>
References: <1542108563-10108-1-git-send-email-andrei.stefanescu@microchip.com>
 <1542108563-10108-2-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+QahgC5+KEYLbs62"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1542108563-10108-2-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, gregkh@linuxfoundation.org, Nicolas.Ferre@microchip.com, Cristian.Birsan@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--+QahgC5+KEYLbs62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 13, 2018 at 11:29:24AM +0000, Andrei.Stefanescu@microchip.com wrote:

> +- lpm-gpio: GPIO for LPM pin. Note that this GPIO *must* remain high during
> +	     suspend-to-ram, keeping the PMIC into HIBERNATE mode.

All GPIO properties should be -gpios even if they can only ever have one
GPIO.

> +- regulators: A node that houses a sub-node for each regulator within
> +              the device. Each sub-node is identified using the node's
> +              name. The content of each sub-node is defined by the
> +              standard binding for regulators; see regulator.txt.

You should describe which regulators exist for the device.

--+QahgC5+KEYLbs62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlvrCjwACgkQJNaLcl1U
h9DZswf9GQpDUhtUazQEWWGCA9nxNLctztNbAOvLPP1iIsX0/japywptd3vRfEPi
eP57zQj15pBOhxlFb3LwdfwOqaTvHdwui5eJdc7HVhtWfBbKihu5m5bgOJOL+C6g
0lCxFzMlfPD/GyaTsOImaJjOiFWjG6sJHuUHCil7llizBr3mBumvywomjxH5MIx0
xH2juZw+l+vaInsTfJTO8B/T0v2GlH8Xk9H1ZEGUGVs2SHe5UCFD7Daf2F2iCcJw
5gDG0h8AW0I9oNSf2bMQ7lFFfoAX+3j2Fn6KjJxlAjP+6kQYsNzUE/SnFYqyp/0M
FWGlobdhWxRGVh1eUksXpPkrJxlNFA==
=w5i+
-----END PGP SIGNATURE-----

--+QahgC5+KEYLbs62--
