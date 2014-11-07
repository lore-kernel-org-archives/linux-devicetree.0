From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCHv0 3/3] rtc: rtc-isl12057: add alarm support to Intersil
 ISL12057 RTC driver
Date: Fri, 7 Nov 2014 09:53:07 +0000
Message-ID: <20141107095307.GZ8509@sirena.org.uk>
References: <cover.1415222752.git.arno@natisbad.org>
 <148403c0ab1d556cbb99d9242c65f714a77843e5.1415222752.git.arno@natisbad.org>
 <20141106055017.GL8509@sirena.org.uk>
 <87ppcznbyv.fsf@natisbad.org>
 <20141107075843.GD10432@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RSlZVk60zX3C2H5v"
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20141107075843.GD10432@pengutronix.de>
Sender: linux-doc-owner@vger.kernel.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Arnaud Ebalard <arno@natisbad.org>, Mark Rutland <mark.rutland@arm.com>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Linus Walleij <linus.walleij@linaro.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-doc@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, devicetree@vger.kernel.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>, linux-arm-kernel@lists.infradead.org, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Peter Huewe <peter.huewe@infineon.com>, Thierry Reding <treding@nvidia.com>, Guenter Roeck <linux@roeck-us.net>, Jason Cooper <jason@lakedaemon.net>
List-Id: devicetree@vger.kernel.org


--RSlZVk60zX3C2H5v
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 07, 2014 at 08:58:43AM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Nov 07, 2014 at 12:30:48AM +0100, Arnaud Ebalard wrote:
> > Mark Brown <broonie@kernel.org> writes:

> > FWIW, we had a similar discussion a while ago, during driver inclusion:
> >=20
> >   http://marc.info/?l=3Ddevicetree&m=3D138109313118504&w=3D2
> >=20
> > Uwe, any idea?

> What is the problem of a not-wired-up irq line? Does the rtc framework
> need to change to allow setting an alarm without the irq line being
> hooked up? Is it "only" that the alarm is missed? Irq polling probably
> isn't sensible?

The problem is that we've got operations like alarm_irq_enable() which
probably shouldn't be reporting success if we don't have an interrupt
line.  Setting the alarm with no interrupt might still be useful but
that at least ought to fail I'd expect.

>=20
> I assume it's not that unusual that an rtc irq doesn't trigger a system
> irq, so having that supported nicely would be great.
>=20
> Looking through the rtc's datasheet, the device is a tad more
> complicated than the current driver handles. There are two irq lines and
> three functions that can be routed through these (alarm1, alarm2 and
> clkout; not all combinations are possible).
>=20
> Best regards
> Uwe
>=20
> --=20
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  |
>=20

--RSlZVk60zX3C2H5v
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUXJaDAAoJECTWi3JdVIfQXCUIAIEcVXL8QnNj58zSmE0lrkCo
xif6hvvPPVjGIQsD9ipToFUeAZIjkNOpLxRkWwfgVNQf9f109y5dddm1g9xkfeR1
6D8NBVJfcJ2lV2swn5pmzNiN3cHtTwY+2US6ZyrjGrp93OjSwBKkJnyBTo0FyKN9
+j4k+fMjrLJ0Vgji5fjSqdyD1IP4VCJo0WpsQ8j5Uq6uSQBZziD2dUDs4CHMS33E
xcFLO8vMgaOglOpuT+LC1c6mMO4Nr/9VSZ6NaqyKDmX+IXBVRjtZtVxKMXbq0otp
MhJhYzeWqBV/wYJqIVRrAVQQd3tCdNHkXmOaZ5R9k5W57BJ03nyhoZ5TyMRXShk=
=Isob
-----END PGP SIGNATURE-----

--RSlZVk60zX3C2H5v--
