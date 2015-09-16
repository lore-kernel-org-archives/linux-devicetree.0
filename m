From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH 3/3] tps65912: Cleanup TPS65912 subdevice configuration
 dependencies
Date: Wed, 16 Sep 2015 20:57:05 +0100
Message-ID: <20150916195705.GU12027@sirena.org.uk>
References: <1442339861-30300-1-git-send-email-afd@ti.com>
 <1442339861-30300-4-git-send-email-afd@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yy52EcrBpZv8owgy"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1442339861-30300-4-git-send-email-afd@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--yy52EcrBpZv8owgy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 15, 2015 at 12:57:41PM -0500, Andrew F. Davis wrote:
> The TPS65912 subdevices depend on the mfd core and not any particular
> interface. The core is only enabled by enabling an interface so this
> is safe.

Acked-by: Mark Brown <broonie@kernel.org>

--yy52EcrBpZv8owgy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJV+cmQAAoJECTWi3JdVIfQjocH/iFNRZUacfoFBwd0Z5nI/upp
vmnVEoTlGZCJLneu7uIIfSN55UiZxlTNOnQcqFpUDGmpvf+BlhxdI6PRCEoTENd7
GsIxXWFhrFOa3Xg/bJNqUZDevqU19oS29CUvXCGKR/bufyCoivAoKtUAg7c2hAKG
qxYYa+QrbT8+HPZ8OVAz/wo0ctEDuHgEr1Wi1Yd4SrwLFm7a0KjOT1OjLSA8zICj
ClBySSYIUPTQQbgZRFO7JDPirpH2dKKW/Hy1Y10TAmBvK/JUuEbbuarcJqiILvsL
9bWiMwBrzenOZmMOTYqlwaY+fml9/2Bf2DeMEnqI96LM+tlnxlwqyEptHnyfTP0=
=UoPV
-----END PGP SIGNATURE-----

--yy52EcrBpZv8owgy--
