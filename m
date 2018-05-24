From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 8/9] regulator: bd71837: BD71837 PMIC regulator driver
Date: Thu, 24 May 2018 18:59:40 +0100
Message-ID: <20180524175940.GC4828@sirena.org.uk>
References: <20180524060036.GI4249@localhost.localdomain>
 <20180524141427.GU4828@sirena.org.uk>
 <042F8805D2046347BB8420BEAE397A4016C06B60@WILL-MAIL002.REu.RohmEu.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GD+uNaHYxbVPHaQt"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <042F8805D2046347BB8420BEAE397A4016C06B60@WILL-MAIL002.REu.RohmEu.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen, Mikko" <Mikko.Mutanen@fi.rohmeurope.com>, "Haikola, Heikki" <Heikki.Haikola@fi.rohmeurope.com>
List-Id: devicetree@vger.kernel.org


--GD+uNaHYxbVPHaQt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 24, 2018 at 05:51:27PM +0000, Vaittinen, Matti wrote:

> > what is the lock doing and what is this wrapper function intended to do?

> This was the other spot which I was unsure how to handle. Datasheet for
> the chip says that if voltage is to be changed, the regulator must be
> disabled. Thus my voltage changing function checks if regulator is enabled

Ugh, this chip is not very good is it?  Don't bounce the supply to
change the voltage silently, that's clearly a bad idea - the devices
using the supply are going to get very upset when the power gets removed
just because they changed the voltage.  Instead implement a custom set
operation that returns an error if the user attempts to change the
voltage while the regualtor is enabled.

--GD+uNaHYxbVPHaQt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlsG/YwACgkQJNaLcl1U
h9BXpQf/WYbuiSe8ThB/68hLWXcXe3R37BpLnhEleUsosoSpg1qIgd5EcyLZol1P
4xry9Bl24RtomPJWJhsxaYEp9sRNJOr2CZ6UDoxvFzGN9EGFlDaDFyu2Zy4QmvCl
f1OtoRzlLsB4iDPdpcG1Z9nPPWwS/FV7R8fN/f5sEj0GsL+6m6fo4KL0ZGl7Awln
qgNLzK3U+QvstXEW7izC9C3KGi4rNDSrJL7geZDuwYcRp8nZnRRg3LPa4Zdad+gz
w+yIxJEfxdqr0M0ZcDbihsfm2j76Mn8PI+4JgolZVDfyN6iaief0ANSH2R/6kI0x
aT2Mc98aWauj7tVBmCeen3QNVSt1SQ==
=unJ+
-----END PGP SIGNATURE-----

--GD+uNaHYxbVPHaQt--
