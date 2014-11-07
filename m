From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv0 3/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Fri, 7 Nov 2014 09:47:21 +0000
Message-ID: <20141107094721.GY8509@sirena.org.uk>
References: <cover.1415222752.git.arno@natisbad.org>
 <148403c0ab1d556cbb99d9242c65f714a77843e5.1415222752.git.arno@natisbad.org>
 <20141106055017.GL8509@sirena.org.uk>
 <87ppcznbyv.fsf@natisbad.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nbwp0cmFVefRM4Ni"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <87ppcznbyv.fsf@natisbad.org>
Sender: linux-doc-owner@vger.kernel.org
To: Arnaud Ebalard <arno@natisbad.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, Peter Huewe <peter.huewe@infineon.com>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <treding@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Rob Landley <rob@landley.net>, rtc-linux@googlegroups.com, Jason Cooper <jason@lakedaemon.net>, Guenter Roeck <linux@roeck-us.net>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
List-Id: devicetree@vger.kernel.org


--nbwp0cmFVefRM4Ni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 07, 2014 at 12:30:48AM +0100, Arnaud Ebalard wrote:
> Mark Brown <broonie@kernel.org> writes:

> > None of the alarm functionality checks to see if there's actually an IRQ
> > - is that OK? I'd at least expect the alarm interrupt enable call to
> > check if the interrupt is wired up.

> I can add those check BUT I would like some directions in order to
> support the following use case too.

> Current three in-tree users of ISL12057 are NAS devices (Netgear
> ReadyNAS 102, 104 and 2120). All of them *do not have* the interrupt pin
> of the RTC chip connected to an interrupt line of the SoC. Nonetheless,
> the IRQ line of the chip being connected to a PMIC on the board (TI
> TPS65251 [1] on ReadyNAS 102 and 104, I do not know for ReadyNAS
> 2120). When the device is off and the alarm rings, the device gets
> powered on. AFAICT, the IRQ coming on the TPS65251 is not replicated on
> any line of the SoC.

It's OK to support not having the interrupt, the point is that if there
isn't an interrupt the driver shouldn't support operations which rely on
the interrupt to succeed - things like enabling the alarm IRQ for
example.

--nbwp0cmFVefRM4Ni
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUXJUoAAoJECTWi3JdVIfQzGwH/2eEoNRI4xN2PXAwEumfHFOX
UF9JtUrr+kHVfJuqX3QtKkVEDwsDGV2HOWzKTOPe8LsHSR8jHKP7u5+Oj9LaBIls
Od9yoMpMkKfnFSjbOBqpfYx8AatXm154tfi9HKsHUcgVCoRmB+ZkVD6knalSkghM
MIZ8BXeGRZdvbsMMBxgQNSGGnMkBHt7pBWPlewFURrmeUtZ+cICw95AY/Q9WgQJh
bKAbSFpofC1zX0rzucO1p9GW9uj4c+CR92K946jQJBjWgDS5PCB61jPR0ycIjZ76
awhXYMOzVS+GNCI0JW1q7TJvcZUo/Hebl01+17R7Lc8qO313KgP/0Bk4tvXL2aU=
=qq/f
-----END PGP SIGNATURE-----

--nbwp0cmFVefRM4Ni--
