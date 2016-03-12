From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/5] regulator: pwm: Add support for voltage linear equal
 steps
Date: Sat, 12 Mar 2016 13:09:25 +0700
Message-ID: <20160312060925.GW3898@sirena.org.uk>
References: <1457434405-30372-1-git-send-email-ldewangan@nvidia.com>
 <1457434405-30372-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cxfMsoqvp1jUizWj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457434405-30372-5-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--cxfMsoqvp1jUizWj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 08, 2016 at 04:23:24PM +0530, Laxman Dewangan wrote:

> There is a use cases where entire voltage ranges from minimum
> to maximum is divided into n equal steps and just providing the
> steps count, the voltage table with duty cycles is linearly
> calculated.

I can't see any reason why this would ever be preferable to just using
the flat linear range (you certainly haven't articulated one, you're
just stating it).  This seems like you are bodging around a limited
consumer driver, you should fix the consumer to cope with regulators
with lots of voltages - PWM regulators aren't the only ones with high
resolution steps.

--cxfMsoqvp1jUizWj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJW47KUAAoJECTWi3JdVIfQsCQH/0eYPqlP5grSKoZoBaHQkEia
w4CjC+OrXaWu4rCLoYXdmlWpRA87fIDvV3CFYJGAIiD52xxP4QdmV6ntlFywQWGP
Itet42mZYIvnt6kOgq7cHwF9GusUluQ7Dvkwe9vWaf5Tk/fRfdlBsKXxDNOsc1lU
xEPGAuskcEwPXqx5p0jps/DNLA++Am717BbuqqsvdNvg0yloO4n4GphwMf2yrj/C
uLnoS5M5+bHsKpiBf/dmSxmxSA151jbM4yhoD/k4GPptJ4jvdpaZH9Ik/Fr6kHFt
RfdWcWdaNdP4dQNZah+wKdqK9YmqRI/ZIpqGQ4TySIzcdzs5NZipDiYp6nYh5nw=
=w5LL
-----END PGP SIGNATURE-----

--cxfMsoqvp1jUizWj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
