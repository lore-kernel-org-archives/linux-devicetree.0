From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Question about fixed regulator DT properties
Date: Wed, 26 Nov 2014 19:20:21 +0000
Message-ID: <20141126192021.GU7712@sirena.org.uk>
References: <546B5EF9.3080102@mentor.com>
 <546CAB49.8030103@mentor.com>
 <20141125121749.GV7712@sirena.org.uk>
 <54760D6A.9080306@mentor.com>
 <20141126175304.GM7712@sirena.org.uk>
 <5476266E.9040901@mentor.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W9xFwOr4e03bkzx5"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5476266E.9040901-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vladimir Zapolskiy <vladimir_zapolskiy-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--W9xFwOr4e03bkzx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 26, 2014 at 09:13:50PM +0200, Vladimir Zapolskiy wrote:

> If I want to enable a fixed regulator (not controlled by
> bootloader/firmware) by Linux on boot or when fixed.ko module is bound,
> shall I specify the same "regulator-boot-on" property? At least this is
> the practical way to enable a fixed and/or gpio regulator right now, but
> is it correct?

It depends what you're trying to accomplish by doing this.

> Or should the regulator always be enabled externally (assuming
> "regulator-always-on" is omitted) after registration independently on
> "regulator-boot-on" property?

Best practice is that there should be a consumer which keeps the
regulator enabled whenever it is required.  There should normally be
little use for boot-on, it's mostly there to ease handover from the
bootloader in cases where we can't read the hardware state - if you're
not sure if you should use it the chances are you shouldn't.

--W9xFwOr4e03bkzx5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUdif0AAoJECTWi3JdVIfQdvEIAIWJAQI7FT9Arcn6lb2DZpVq
j8uwo03bPTlytutv0HSFoj2/koSbCh8VkBOKzmoOmcsk6JFELEpN6NsMnIhN0qwM
9D8Defe3YqyYAoPwmBLnOl/6ygO9ICNZf8nZDZk45QHf1Q2GcWocCj+yhP33U/Ei
aCBXtrQPi/fvv2hwsT8LlAujj9llg+AEhrKfc/HMX/V2oTCs/RjuqmmGzxvPCWoM
jIXVzG4BggbxxFQEPZeOsbNXBBPzPjDInIsOOqfQ1uyqn3h1UFxuMF34K33PTwAc
WaqE8kBc34/cb7cbwlSRiV2Ly8GO7YGA39n0fucaIv4uC3bcY2CHx5sZPIP9Rwk=
=364J
-----END PGP SIGNATURE-----

--W9xFwOr4e03bkzx5--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
