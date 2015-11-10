From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Tue, 10 Nov 2015 18:44:08 +0000
Message-ID: <20151110184408.GJ12392@sirena.org.uk>
References: <20151105101417.GM1717@sirena.org.uk>
 <563B9A10.4020907@ti.com>
 <20151106104322.GA18409@sirena.org.uk>
 <563CED25.6020405@ti.com>
 <20151106211651.GJ18409@sirena.org.uk>
 <5640DAC0.9080008@ti.com>
 <20151110095719.GC12392@sirena.org.uk>
 <56421FA5.1020103@ti.com>
 <20151110170447.GI12392@sirena.org.uk>
 <56422ECC.6070603@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2fjX3cMESU3XgGmZ"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56422ECC.6070603@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--2fjX3cMESU3XgGmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2015 at 11:52:12AM -0600, Andrew F. Davis wrote:

> Anyway, All I'm trying to do here is keep things clean in the DT. We only have
> one consistent option:

No, not really.

> Match all sub parts by compatible:

> Or we end up with some hybrid approach, matching some on node name, others
> on compatible when needed. Yes, the above matches Linux device model (still
> not sure why that is such a problem?), but it also matches modular functionality
> in the device.

There's also the third option where we don't have any compatible strings
in the subnodes at all.

--2fjX3cMESU3XgGmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWQjr4AAoJECTWi3JdVIfQ6PYH/1pAF1iayHDGONFRofUFWIX6
8M0D6UY+xdGfDexB7q4/vcZpXROC3Q0XG/IM+xRin5BhjHR35gikQvGrmxYEwas6
+9Uwu4jRPteFqNHozTRBv4pWwUaJbo13uA0GEayEAbYA2HSMUAYSRHQjXR2yxEwH
MgGxUjD16yBv70GE7njuUsqXw7XFaeICMhX/NiHhORUCc/DjvsfvrcDGOrQyvERM
1ojR3GKzgi4IdyXxyO7odJhcUnjvF/XI4ssW3yaRMjdczOhvB5wPjvqrqVF8yZ1q
Xn1sjXwmhp+kVvSQ9/hU5Oh/Yf7eOSy0h8qjUXBr0Mfx3qQFydCww/2ga18okbA=
=mvAw
-----END PGP SIGNATURE-----

--2fjX3cMESU3XgGmZ--
