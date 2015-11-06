From: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Fri, 6 Nov 2015 10:43:22 +0000
Message-ID: <20151106104322.GA18409@sirena.org.uk>
References: <1443731874-21362-1-git-send-email-afd@ti.com>
 <1443731874-21362-5-git-send-email-afd@ti.com>
 <20151022164724.GZ8232@sirena.org.uk>
 <563A25BE.90609@ti.com>
 <20151105101417.GM1717@sirena.org.uk>
 <563B9A10.4020907@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ELawpaRm0uGyL1wg"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <563B9A10.4020907@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--ELawpaRm0uGyL1wg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 05, 2015 at 12:04:00PM -0600, Andrew F. Davis wrote:
> On 11/05/2015 04:14 AM, Mark Brown wrote:

> >That sounds like a bug to me, it'll have broken a bunch of existing
> >devices.

> Most OF drivers have the OF MODALIAS.

That's nice but not relevant to non-OF devices.

> 'platform_uevent' can only emit one MODALIAS string per device (only
> the last emitted one seems to count), so for any device with
> 'dev->of_node' set it will be the OF MODALIAS string. So I need
> that table (to generate the OF MODALIAS) or this sub-device module
> will not be loaded.

No, you need to fix the bug that is causing dev->of_node to be populated
for the MFD function device.  Probably the issue is that you have put
this pointless compatible string in your DT.

Please stop this.  I don't understand why you are pushing so hard to put
the Linux device model representation of the device into DT but it's
getting very repetitive.

--ELawpaRm0uGyL1wg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWPIRJAAoJECTWi3JdVIfQlj4H/0k7Ubxmy+jfI/3DKeRQXYD4
/EaN3xmKNxk/F62lZBgsZJDQZXHHpzBPpCC0y2421xAj4pY2mS15SV75k5vozptT
ZV+htoWtEeNY11nvw32SvJoZOiGng5S75OcPuhHgX2CSEzDUJiWTY43YGw2p6An8
eR7W2MwqqnJZArewmkdZiPH2HkRNiBZNt/ebgo6QR+ZVqVxThjL8Kb+WcmytmNJC
3Pqvmuo4NKMOCJtec2ChWfGjfrBSFQSOM+Br8ZWvUxUWljr5AqWp/22sJT0aUfh+
gHhYbkb966f+jOZlqxuh3r5XvCPp+1Ci44FZ9jKubPRQ2w1cQrOjhOdFRHIGfWw=
=yKA1
-----END PGP SIGNATURE-----

--ELawpaRm0uGyL1wg--
