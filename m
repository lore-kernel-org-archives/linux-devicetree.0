From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: pfuze100: add optional disable
 switch-regulators binding
Date: Fri, 13 Jul 2018 16:03:14 +0100
Message-ID: <20180713150314.GD16228@sirena.org.uk>
References: <20180713125002.24331-1-m.felsch@pengutronix.de>
 <20180713125002.24331-2-m.felsch@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180713125002.24331-2-m.felsch@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, fabio.estevam@nxp.com, Anson.Huang@nxp.com, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jul 13, 2018 at 02:50:01PM +0200, Marco Felsch wrote:

> +Optional properties:
> +- fsl,pfuze-support-disable: Boolean, if present disable all unused switch
> +  regulators to save power consumption. Attention, till 4.18 these regulators

The property name sounds like it affects all the regulators but really
it's just the sw ones - how about adding -sw at the end?  Bit of a
bikeshed but it does end up in an ABI.

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAltIvzEACgkQJNaLcl1U
h9DQzQgAg4+A2buzEZeWVLozK89w3p8isr1qmFeTm9xW9OW/UT+i7waDOYhOaRbo
UKqpmjMfgZOhDcMV3JSxUy3Ji8EbhnqeuBzAXWO8lz221sYGgzgveIatwnM0t5VH
McjsglbkOBr8rxRAc55b64CL4Yj7A/oyxCJmN4fiQPnzTDYUYQpj92dy2l3na08l
XQI8XNbeu/FO9y+Wg5WeHrAHuUuOFtpC4hK89n8AHvI8XFhg8L4MmR2/j4Jm4Nt4
fXNIoy+tjgujza7xhgvfimD/g984Biv20c2tri7YhZBURF/IUXPC+a0sjJFHlwcD
40ISgJQT6r8Y+tprxtd6QsGQe2B1Pw==
=In62
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--
