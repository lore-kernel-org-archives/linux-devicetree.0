From: Thierry Reding <thierry.reding@avionic-design.de>
Subject: Re: Use of the pwm-names DT property
Date: Wed, 4 Jul 2012 09:39:42 +0200
Message-ID: <20120704073942.GC25386@avionic-0098.mockup.avionic-design.de>
References: <4FF3E862.8050101@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4FF3E862.8050101@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Courbot <acourbot@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>
List-Id: devicetree@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 04, 2012 at 03:53:22PM +0900, Alex Courbot wrote:
> Hi Thierry,
>=20
> Looking at your PWM/DT integration patches for linux-next, I was
> wondering what is the rationale behind using the pwm-names property.
> If I got it correctly, its purpose is to be able to reference
> different PWMs by name, e.g. by having
>=20
> 	pwms =3D <&pwm 0 5000000>, <&pwm 1 5000000>;
> 	pwm-names =3D "backlight", "flash";
>=20
> You could get the first PWM in the driver code by calling
> pwm_get(dev, "backlight") and the second through pwm_get(dev,
> "flash").

Yes, that's the way it is supposed to work.

> While I am ok with this way of doing, why not having the form that
> is already used by the regulator and gpio frameworks, in which the
> consumer is part of the property name?
>=20
> 	vdd-supply =3D <&vdd_reg>;
> 	core-supply =3D <&core_reg>;
>=20
> Both regulators are then accessed using regulator_get(dev, "vdd")
> and regulator_get(dev, "core").
>=20
> Wouldn't it make more sense to follow the same scheme that has been
> popularized by other frameworks? It also has the advantage that you
> do not need to maintain two different properties which must be the
> same size.

In fact the *-names properties are rather common. They are used for the
reg and interrupts properties. The pinctrl subsystem and the upcoming
clock bindings also use the *-names properties. So one could just as
well argue that the regulator and gpio bindings should have been using
regulator-names and gpio-names respectively instead.

Thierry

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJP8/M+AAoJEN0jrNd/PrOhXL0QAICAYFCpJuukcyIkTBrFuFkc
a4/Nn7+hwB64ZhMwMt4ug+AxxC+9dqTw0EOm3+7YWe38PskbYEqhGldBKW/r1b0x
Wwmil6de5yizUANRn7V89RYJ/LGr6gfXYEZ8ekjUvEh0oqcmqMK8dqEOHdhdrRg+
PR/knFTA/259KvV3oL9a3MO2skK9gvM2fKAx2RTKL6qmnGs3ZoYUhcbJHTL8BIrv
ivBAxG6TFWkYPKLX3jb2aBiKANUQy8i2QsytD2M7wPxVZb0RXm5pXI7zerNWgmnf
/t9Am20YlJ0S+3MuxeiBW3PsccqYPKluuOe+E4QAi2EaJZqq0h/tOevSHEoGUwEa
MCoNiQu/vXpnB8LdJ2j7fTiniZnJUGRJOyqA5XfL81HBfOuV665Y3yRZt2TUQ7XF
qblngZixUFTeBnDxZ5wP8bOrgC2qpAf1Q0tiKF6vizt0DQpbOep4t5ewr8UdErAx
WLu5W91e9cWgtOkovQmkRBqRYqh0/LbrLdYBRye1Yt18xcvPMUDtzKUPI/kgvwOI
DqI4r1C7OdKyrr7Nbr7uzYQ9QOxCVK+SUzV5NDcHeGGnTKyGxNd0bAXJ9CpfMfwr
PSKjAsMaY64CmKfWwC24ZpCSG3ePuPjNyHC4ACs5Nud10KVBAoO2uWX31F7IZ7KQ
vc/KSuuY4Ecm4FGWsIca
=YzxT
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
