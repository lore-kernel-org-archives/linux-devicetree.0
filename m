From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Sat, 24 Oct 2015 08:18:22 +0900
Message-ID: <20151023231822.GQ29919@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <562A2C2F.1020808@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HAv5+T9jbwMPl6Kw"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <562A2C2F.1020808@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--HAv5+T9jbwMPl6Kw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2015 at 07:46:39AM -0500, Andrew F. Davis wrote:

> I know just because other drivers do it doesn't mean it's a good idea,
> but this is not new for MFDs and it is done in other regulators as well
> (mt6397, tps659038, qcom,spmi, etc..).

mt6397 doesn't do this, it doesn't have a compatible string at all (it's
doing what I'm recommending that you do).  The SPMI devices are
standalone devices, their parent device is actually functioning as a bus
controller here (it's really a microcontroller inside the SoC).  The
Palmas is part of how we realised this was a problem.

> >It seems like this is describing how Linux
> >loads drivers not how the hardware is constructed but DT should describe
> >the hardware.

> While I agree to a point, if we follow this to its logical conclusion we
> would end up with one compatible binding per SoC and be basically back to
> board files. We need some granularity, just finding out where is the issue,

The fact that the SoC DT is not distinct from the board DT is actually
one of the problems with the way we're using DT at the minute, it means
that DTBs are much less stable than they should be since we can enhance
support for SoCs but DTBs need regenerating to take advantage of it.  It
would be much better if the boards just referenced the SoC they use and
pulled in a separate definition of the SoC (DT overlays will make it
much more tractable to implement that if someone has time...).

> I would say that as these devices belong to different subsystems and are
> almost completely independent there should be no problem with having their
> own compatible matched hardware sub-node.

All it's adding is more typing for users.

--HAv5+T9jbwMPl6Kw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWKsA9AAoJECTWi3JdVIfQdu4H/2TuG9Bkmg0RbCd9hllXO+oN
oj9qDxl5fYuI71NuNNsyRz6Boyzg5rRcOCYkORit8RC3VXXEd9uocYVETxyAp9VL
R5YtdhhdagZtYGEtymFGl9N0u969dhcqpGy3SPnyBANaEHRlr8dCYWuI6xkBCXPH
xeLD5/QkB+QkrUe7kGpVzuMYPoAsds+YfYgCmlxeyl+ZVktscyHIBvh3A0nIMxWv
3IOKWYbII8ymd9sNsCETIvHLXeMxgNFrpva1a7X4X5wbizYgGv3XYS/bYNbcto0N
ecrPDibsxnpGyeYhg4AunIZcyWp93u8ikQJiapmnuJte1FYTyO/VsfvVdRuNRaA=
=4ADp
-----END PGP SIGNATURE-----

--HAv5+T9jbwMPl6Kw--
