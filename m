From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v3 3/3] regulator: mcp16502: add regulator driver
 for MCP16502
Date: Tue, 11 Dec 2018 16:47:06 +0000
Message-ID: <20181211164706.GL6686@sirena.org.uk>
References: <1544522876-15967-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544522876-15967-4-git-send-email-andrei.stefanescu@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="umrsQkkrw7viUWFs"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1544522876-15967-4-git-send-email-andrei.stefanescu@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, Cristian.Birsan@microchip.com, Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--umrsQkkrw7viUWFs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 11, 2018 at 10:09:15AM +0000, Andrei.Stefanescu@microchip.com wrote:
> This patch adds a regulator driver for the MCP16502 PMIC.
> This drivers supports basic operations through the
> regulator interface such as:

Overall this looks really good, just a couple of comments:

> +++ b/drivers/regulator/mcp16502.c
> @@ -0,0 +1,555 @@
> +/* SPDX-License-Identifier: GPL-2.0
> + *
> + * MCP16502 PMIC driver

SPDX headers need to be C++ comments - please make the entire comment
block a C++ one so it looks more intentional.

> +#ifdef CONFIG_SUSPEND
> +static int mcp16502_suspend(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct mcp16502 *mcp = i2c_get_clientdata(client);
> +
> +	mcp16502_gpio_set_mode(mcp, MCP16502_OPMODE_LPM);
> +
> +	return 0;
> +}

This puts the device into low power mode when the suspend function gets
called but this might not be safe - devices using the regulator may not
be suspended yet so could still need full regulation.  Normally a GPIO
triggered transition like this would be being done by hardware as part
of the process of suspending the SoC.  Is there some reason to do this
manually?

--umrsQkkrw7viUWFs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwP6gkACgkQJNaLcl1U
h9BHwwf/cHsTUWUp5ToG+Kb4Fuv/H6ZxHsx3rArRbP6RrZs8AcV8P59bDdcVWgjQ
Jvrzl5wA1njl0bXYYCyNXWAsApqj5396NAHrZJhzpjYDTZu8rLQnqpJoyHsc6nUJ
UptK/vhhmZEH78iiEqBIUcQY/JzYxz4cC3iVl24+O3l30AvbrHiXeMALUGr1fJ80
RutTjPkvA67Gq1ogrfhy8IALDzFDGM7bX+Xe4jha//+23lf1f8HRTCXf3dMydP0A
Lk3z/8C4Dz2p4c7GZZMzwhjKrsp7AVGIH29SX0BAvM9cp6EnTv0B2l1xLQv3oXV3
OAviYfR1XwagJG5wcHyko6KGnNSjtQ==
=9bae
-----END PGP SIGNATURE-----

--umrsQkkrw7viUWFs--
