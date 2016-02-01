From: Eric Anholt <eric@anholt.net>
Subject: Re: [PATCH V4 1/7] clk: bcm2835: the minimum clock divider is 2
Date: Mon, 01 Feb 2016 15:15:32 -0800
Message-ID: <87oac03tuz.fsf@eliezer.anholt.net>
References: <1452867667-2447-1-git-send-email-kernel@martin.sperl.org> <1452867667-2447-2-git-send-email-kernel@martin.sperl.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <1452867667-2447-2-git-send-email-kernel@martin.sperl.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Remi Pommarel <repk@triplefau.lt>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Martin Sperl <kernel@martin.sperl.org>
List-Id: devicetree@vger.kernel.org

--=-=-=
Content-Type: text/plain

kernel@martin.sperl.org writes:

> From: Martin Sperl <kernel@martin.sperl.org>
>
> Testing with different clock divider values has shown
> that (at least for the PCM clock) the clock divider
> has to be at least 2, otherwise the clock will not
> output a signal.

For a MASH clock (PWM, PCM, SLIMBUS, but not the others), the minimum
integer component of the divider is:

mash 0: 1
mash 1: 2
mash 2: 3
mash 3: 5

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWr+cVAAoJELXWKTbR/J7oIawQAK9eKqkQYfEKTG3yPk9zrQtw
x5j03RzUvUyksbS5e3TKOMadtPun4WGfRzmc7gokuyhMgX1I11e1ZWcD6FOCqEJp
pX0Fo5IaKS9sX/TS2Wk7LKTsg+SPmnatSIYPIx06zCmBtOa9mH8Ybua4+cNH95yj
O8yVgq/2ONwvvAXssbJLogKwIe+p9ze7ZId9Dxj0UaaxEDue+H9T4pn9z3hTXi20
b2M61jrd3o9HP8D0zyi/ajkt7+QlBzuRJfuxfK8rZXe9SU4fNuTqHZWXzRLrYFHD
c06IrxRZAQvOtubf7MIkYTlJNF9SqHOKNM8JTuHK/YG2o7wsZr2OizHbdagVXM4p
T0OKx2WU/75Ji7hZKcMIsPxrKBqb6lVoXxO8ao8DUNsZGWZaX2jVAGGMaa/4udl6
GFIQU5+F6K+EPorfg+HrfcJ+cz8Xob+Rc5V8j21zOSYb+DGiPKiUQ5kjzGJ87All
dL7uMl1OWXxqFjoAXX5WqQpZW/Nj639GEdhFZyeS+iWRP7OS4Wdciqoq8JhwjGlp
ST577zIq0Fhv6uQkSW8LMKVuXglgiIaJ7AimxNDUX7JnrRpFLWXSciMh0Cwb7Z2w
3dU++d5ubhlr9yMJoyxJomXhBsQgesBdMgP5EXr8MaesuMyWQEaEfpc2t4nFrmM5
pT5h4Xd2OPBx9rT1hwe2
=0Vf9
-----END PGP SIGNATURE-----
--=-=-=--
