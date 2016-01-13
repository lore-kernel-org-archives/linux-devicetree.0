From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Wed, 13 Jan 2016 15:51:54 +0000
Message-ID: <20160113155154.GN6588@sirena.org.uk>
References: <5695A854.60108@samsung.com>
 <5696378B.6070704@nvidia.com>
 <20160113115736.GJ6588@sirena.org.uk>
 <56963D8D.9060908@nvidia.com>
 <20160113123133.GK6588@sirena.org.uk>
 <5696451F.3000707@nvidia.com>
 <20160113130909.GL6588@sirena.org.uk>
 <56964CEF.3030900@nvidia.com>
 <20160113142023.GM6588@sirena.org.uk>
 <56966242.4080601@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wCvMePosDEf3szVw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56966242.4080601-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--wCvMePosDEf3szVw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2016 at 08:12:10PM +0530, Laxman Dewangan wrote:
> On Wednesday 13 January 2016 07:50 PM, Mark Brown wrote:
> >On Wed, Jan 13, 2016 at 06:41:11PM +0530, Laxman Dewangan wrote:
> >>On Wednesday 13 January 2016 06:39 PM, Mark Brown wrote:

> >>>What is "it" and why can't we check what the current configuration is
> >>>while setting FPS to NONE?

> >>I will have platform specific data in callback of enable/disable only.
> >>Which call back do I need to set this? enable/disable or post register?

> >I'm sorry but I can't parse what you're saying here.

> Here, before machine constraint applies, I need to configure FPS on desired
> source.

I'm a bit confused here - I had thought you needed things the other way
around?  Can you describe in concrete terms what you want to configure?

> >>>>I need to set the FPS src properly for each rails before callback happen
> >>>>from regulator init so that enable/disable/is_enable can handle it properly.

> >>>Why not just reorder the callback so it happens before the constraints
> >>>are applied?

> >>which callback I need to reorder for getting the context for configruation?
> >The existing call to parse the DT.

> Are we allow to do i2c transfer in the existing callback for parsing the DT?

Yes, of course.

--wCvMePosDEf3szVw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWlnKZAAoJECTWi3JdVIfQuTAH/2xoPMUPjm/TIKnibYdD8Pas
DVtt7ufLP8+4/52m2te6EEtgHl1lFsqoTtvNyUMORjeY9Uv5aWXubNXFy2Je1vnr
xplbYaIWV6tVzuFsfQABE000P3HEarIxWvvZImRQ187g0VDjDmsLbI7XrzIDJofd
EdBeuCecL12RH1tOeQBUtagsZaWvMd1UWspmVUjmLp8MlrLVndHz6ZmkEIk17xdl
6SIya8u8IFyB3+URQ9aRwiSH5CE0Rsm7kRT/PThbXWwfnnMSCUZimi7/6mHqvrFO
OZS70XvOR+1n/ekkdPrd6YSWSsYenlfGy5H42muCLmw1VEbXdEK/uBHhoyG6D4k=
=rJk0
-----END PGP SIGNATURE-----

--wCvMePosDEf3szVw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
