From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v7 0/5] mfd: tps65912: Driver rewrite with DT support
Date: Tue, 8 Dec 2015 19:16:57 +0000
Message-ID: <20151208191657.GA5727@sirena.org.uk>
References: <1447869580-10416-1-git-send-email-afd@ti.com>
 <20151124162624.GI807@x1>
 <20151204120240.GW26072@sirena.org.uk>
 <5665E4F7.1070707@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AhCCdIwQf0d0uSA5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5665E4F7.1070707@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--AhCCdIwQf0d0uSA5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 07, 2015 at 01:58:47PM -0600, Andrew F. Davis wrote:

> As all of this driver should be taken though the MFD tree how
> can this gpiolib change be handled? If we have gpio.parent it
> will not build on MFD, with gpio.dev it will fail to build when
> the changes are merged from the gpio subsystem. As the change
> has not been merged into linux-next as far a I can tell maybe
> this should be taken as is, then when the gpiolib change is
> made this can be changed with all the other drivers?

Do a cross tree merge in one direction or the other between MFD and GPIO.

--AhCCdIwQf0d0uSA5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWZyypAAoJECTWi3JdVIfQpU4H/ij35SZlVMMpGYJ7elTp4EcG
ZHny83qV2quRQOk3hbQuG9NKCqnK/b/tV+zNcD2t+UtYhbIVr6qofFowzwQUoYaU
4PXImVu1DggTtWflSQoSRRhV/3rKRk4lCfcay7eNCBQsO2loIjgAwjs5r6htZ9pM
607HnZB7B6Lje0f/pftFB8NTU6DgPSp8QaUBYvZB+FyBpz84s54W11jZxW+2ink7
MQqNOCWgvlcx5yyHPxNI1wA+cH1UkYbeS1n8Pu7p4lg7enfQ2D5a4m4WebK+zhFz
k04FHhZwO1nS5cK8C8aNGg8F3/+aTKCFKOd83iJNUzjmFiIuuqGSu5NZJ/sX4CE=
=Gmrz
-----END PGP SIGNATURE-----

--AhCCdIwQf0d0uSA5--
