From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/7] spi: pl022: attempt to get sspclk by name
Date: Wed, 12 Feb 2014 16:22:44 +0000
Message-ID: <20140212162244.GE28112@sirena.org.uk>
References: <1392118632-11312-1-git-send-email-mark.rutland@arm.com>
 <201402121221.51233.arnd@arndb.de>
 <20140212114740.GE21992@e106331-lin.cambridge.arm.com>
 <1786282.mNUF0ZaUg2@wuerfel>
 <20140212161206.GD25957@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="r3RYAYa9cXQlbOHD"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140212161206.GD25957-NuALmloUBlrZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--r3RYAYa9cXQlbOHD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 12, 2014 at 04:12:06PM +0000, Mark Rutland wrote:

> I thought one of the issues before dt was that clocks were in a global
> namespace. Mark's reply implies that's not necessarily the case, so I'll
> take a tour through clkdev to educate myself.

There's both a global namespace and a device local namespace, the most
exact match is used - see the comment on clk_find().  Remember that in
the past clock implementations didn't have to use clkdev at all so the
implementations varied a lot (which is half the problem with drivers
now).  Lots of implementations just used global clock names and didn't
pay any attention to dev.

--r3RYAYa9cXQlbOHD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJS+5/QAAoJELSic+t+oim9gkgP/iHROLSpMgoyvtwCVsGTab/R
1Qa8pcvPp8eK0mOZUifwP1cCXrqS/1YZlU0YUhW7tuyadxXfYmb0D2MDG9gs5xpl
73Mmrw32Qq906iylk/hncdb91UAXQXXLYv9Zb+kgEAM58F5A4Fn27T/z0f23KoL1
Gc/F5ic3YLkiUvtjBpwofZ8n0yt6XXCAddtNUkYr2t+qhN80SG68Horg2uM7Zjp1
tywrbw7AfMwy86lk0QCMMHzPL7CwLtl1eLhBBmDMyjfzhoHQskHwMSlipdoTFwhz
uy1ePDWnhSP/d9rnyvwkauEoUP+1jLitQOFaiXM0VqDnkhE/OqO9tloRqb9ALl4m
vCdQ+b4J1LOGlWEerdRb97DNehr4IcNjMUfpG+PTb+iBC/Z7BMl35tOB+ufoGpL+
G9D3kvt/vzSthZqUU5UoGW90WyqdJleBOvz8eto7BdHLKIgcc24uQxrJM+TQPKa1
MgXHHL3y4kg29rGY9Kyc8PwOf7trzmhEAZV+AW0xxyhwy6hcolRIcSOq2/HQfbco
uJbAUdI49vVGp0KMwc6RofqVReJUC8ieQGMasqP6QE0AccxxVT/OqIX5aAIruxSO
0kgCG0jtlMUnUpF9smmHQJTSS/MAInzN+AooX6oyI3shwo8wmVui1H+dUJwym88z
UaWe4TibrcSmrmy6k4lA
=milW
-----END PGP SIGNATURE-----

--r3RYAYa9cXQlbOHD--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
