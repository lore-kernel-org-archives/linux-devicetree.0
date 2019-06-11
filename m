From: Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v15 0/7] support ROHM BD70528 PMIC
Date: Tue, 11 Jun 2019 22:00:43 +0200
Message-ID: <20190611200043.eib3g3acc7ilawsx@earth.universe>
References: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qfajaxb2wnhwswu6"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1559546139.git.matti.vaittinen@fi.rohmeurope.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: mazziesaccount@gmail.com, Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--qfajaxb2wnhwswu6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Mon, Jun 03, 2019 at 10:23:37AM +0300, Matti Vaittinen wrote:
> Patch series introducing support for ROHM BD70528 PMIC
> [...]

I think all patches have been reviewed by the respective subsystem
maintainers. Lee, can you provide an immutable branch with the MFD
patches (1, 2, 4)? Looks like the other patches only depend on those
and can go through their respective subsystems.

-- Sebastian

--qfajaxb2wnhwswu6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAl0ACGsACgkQ2O7X88g7
+pqpvxAAiZzNy6zuuXZ4vjjMA7V17elDn9CTdWUe1RZBcvYxmFmOUWxTEPtRsmoC
DSstvCVI3H0sOGanHoZ6WFe1R5cyV3jG4J9Xam7XQSQmVpWJPaQXSgQpSy4O6aMX
3Hrs2E8Nv+zUuflVsm4yIOnX7avFBDxBdJlZzKNRzA2b3KOzmNvNr3Y/CbvS9IO4
dTHBXDzcoo+XfrbOKD7Z/0LD6kPsVVkjI8qDiGMN0LCxVkkXV2IFFvMluaWzJHQl
hDUheJRJkD1TXC6z1bCxHSzT4/DCDbWHXN191CnZSIeORMLeZxFFldSmKbYIvOV1
DTJemYQUksIOl2usnvNvSl0GnxjrzZpw7PKbh3rXVlWaa52FEvRJJX++voIP3fNW
zTHSYUTZrBqyLzC4Rp9AWeCy19ebFTrPjV3g3LZDIx0D37C3BeS71gNotRa9o91w
aGBN/Um6Zm3PASbxAPk5TB9RIatlGSELFcVg4qa4of1Y7fY5+O/J5Civ/R1vQJkG
iKE+ujAxYfKJkoUebhETYoHhonRh+naZuEgVC4yl9TsP2hGhz4rArD76kKTUnwNY
g5rSpqb8LptHOkHdkP6ueQYIHavaNGfE6wJBfLqjG3uLU/8RU7YaOqZubQOH/WNT
f2hxCJ76WfvTO5avZpYkykwOS0LwdP8MUoVz2tVnYLYm/q7DhB4=
=2BRP
-----END PGP SIGNATURE-----

--qfajaxb2wnhwswu6--
