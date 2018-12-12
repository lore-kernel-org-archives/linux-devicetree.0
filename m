From: Mark Brown <broonie@kernel.org>
Subject: Re: [RESEND PATCH v3 3/3] regulator: mcp16502: add regulator driver
 for MCP16502
Date: Wed, 12 Dec 2018 15:55:02 +0000
Message-ID: <20181212155502.GD6920@sirena.org.uk>
References: <1544522876-15967-1-git-send-email-andrei.stefanescu@microchip.com>
 <1544522876-15967-4-git-send-email-andrei.stefanescu@microchip.com>
 <20181211164706.GL6686@sirena.org.uk>
 <6a35df06-1309-f069-9b22-8c2cc5cca56e@microchip.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yudcn1FV7Hsu/q59"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6a35df06-1309-f069-9b22-8c2cc5cca56e@microchip.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrei.Stefanescu@microchip.com
Cc: robh+dt@kernel.org, lgirdwood@gmail.com, mark.rutland@arm.com, gregkh@linuxfoundation.org, Cristian.Birsan@microchip.com, Nicolas.Ferre@microchip.com, Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--yudcn1FV7Hsu/q59
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 12, 2018 at 08:01:07AM +0000, Andrei.Stefanescu@microchip.com w=
rote:

> > This puts the device into low power mode when the suspend function gets
> > called but this might not be safe - devices using the regulator may not
> > be suspended yet so could still need full regulation.  Normally a GPIO
> > triggered transition like this would be being done by hardware as part
> > of the process of suspending the SoC.  Is there some reason to do this
> > manually?

> There is a line from the MPU (SHDN) which goes low only when the MPU
> turns off. That line is already connected to the PMIC and it differentiat=
es
> between suspend-to-mem and standby. To switch to low-power, the PMIC must
> be controlled by the GPIO pin LPM.

> The suspend sequence is:
> - LPM pin goes high (PMIC enters Low-Power <-> Linux standby)
> - SHDN goes low (if target suspend state is mem) and then PMIC enters=20
> HIBERNATE

This feels like it should be being controlled somewhere else, if it's
actually causing a change in the PMIC state it seems like it wants to be
done as late as possible in suspend to minimize the risks.  At the very
least suspend_late() for the driver seems appropriate.

Could you submit a version with this feature at least split out into a
separate patch please so we can apply the rest of the code while this is
discussed?

--yudcn1FV7Hsu/q59
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlwRL1UACgkQJNaLcl1U
h9AOAwf+K8t0YPz/fYY45FbWktz2aoX3ECrcgy5r25ACJVOjG7tBhTelZLbGkitB
314uampogG8tT6s8WObZbEJjQL+VUbyt7bgcpTI7YamUdPSwkXSJDsfjpPOVVLoa
2iAHn+GBi7O63sKNUb9s+D4q7K1xbMs1vxcpQoV+I/SZx33z6GaoJPBUI8CcDes3
UmC9aaIMUMva/RuKtPSEomI/+qAhiuMdZ1e4SQyZ/AZLxThOPyXJvh1hs8fa2IQg
qC4heudi00SNdZj0dGl6GlyYLetqaYKamlZ8aYf++xJPwI6hH/bsSP/Tiq2iaWTE
wnP4HNcX1dCaLvgGy84OxUTV9fmiOQ==
=8c4e
-----END PGP SIGNATURE-----

--yudcn1FV7Hsu/q59--
