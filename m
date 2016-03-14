From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] regulator: pwm: Add support for voltage linear equal
 steps
Date: Mon, 14 Mar 2016 16:28:43 +0000
Message-ID: <20160314162843.GC2566@sirena.org.uk>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
 <1457434405-30372-5-git-send-email-ldewangan@nvidia.com>
 <20160312060925.GW3898@sirena.org.uk>
 <56E565BE.5010703@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wxDdMuZNg1r63Hyj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56E565BE.5010703-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--wxDdMuZNg1r63Hyj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Mar 13, 2016 at 06:36:06PM +0530, Laxman Dewangan wrote:
> On Saturday 12 March 2016 11:39 AM, Mark Brown wrote:

> >I can't see any reason why this would ever be preferable to just using
> >the flat linear range (you certainly haven't articulated one, you're
> >just stating it).  This seems like you are bodging around a limited
> >consumer driver, you should fix the consumer to cope with regulators
> >with lots of voltages - PWM regulators aren't the only ones with high
> >resolution steps.

> The requirement is to have perfect linear steps interms of the period/pulse
> time of PWM without loosing any voltage.
> Continuous mode is pretty much near to what you said but here we are loosing
> the perfect step as this divides the periods to 100 parts and then set
> voltage.

Could you be more specific about what the issue is?  We've hopefully got
errors of less than 1% in the values here...

> If new mode is not accpetable then need to enhance the existing continuous
> mode like before scaling for 100% of period, first look if we get the
> perfect pulse time of of PWM period and if it is there then use this direct
> instead of converting required voltage to 100% scale and then back
> calculating duty time.

That seems a lot better, what you're proposing is changing the ABI to
fudge things for a client specific requirement where both the client
requirement and the change you're proposing are specific to the current
Linux implementation.  That doesn't sound like a DT thing.

--wxDdMuZNg1r63Hyj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW5ua6AAoJECTWi3JdVIfQqw0H/RQktJyRcNuIDmbziylrXQ5v
czCa7zha6uSDIIizkU0pvwBI8tmrbgAUloRiACb8MlgEk1dsGShRjMjbShPeMLp8
rNe5FN5b3zRQQrOUzF40UzMwhiy+PuJhwPfMbE4GVwtE3nS5svbaonGD9SVjMiCB
az0XrE1T28oef4tyhfbSxqq8C3w1JYgiNzbje09JLieMmFjYMaV5PKSId00eHGFg
uMgNdUZ9Q4nhmA0zQPMUdMTUz8qu3XduLY0vHlICzY/Yc78mg3M/U3k8uNjztvRi
r7zRGVt5bGfdkEdTeRbjJozx1sM6NGrBTCf0KqzUg9cv40fktFOqoJ3cY8G1zVM=
=GJ61
-----END PGP SIGNATURE-----

--wxDdMuZNg1r63Hyj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
