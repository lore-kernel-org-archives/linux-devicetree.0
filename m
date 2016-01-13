From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 6/6] regulator: max77620: add regulator driver for
 max77620/max20024
Date: Wed, 13 Jan 2016 14:20:23 +0000
Message-ID: <20160113142023.GM6588@sirena.org.uk>
References: <1452590273-16421-1-git-send-email-ldewangan@nvidia.com>
 <1452590273-16421-7-git-send-email-ldewangan@nvidia.com>
 <5695A854.60108@samsung.com>
 <5696378B.6070704@nvidia.com>
 <20160113115736.GJ6588@sirena.org.uk>
 <56963D8D.9060908@nvidia.com>
 <20160113123133.GK6588@sirena.org.uk>
 <5696451F.3000707@nvidia.com>
 <20160113130909.GL6588@sirena.org.uk>
 <56964CEF.3030900@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pU61X8j5lbVWa/m1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56964CEF.3030900-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Mallikarjun Kasoju <mkasoju-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--pU61X8j5lbVWa/m1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 13, 2016 at 06:41:11PM +0530, Laxman Dewangan wrote:
> On Wednesday 13 January 2016 06:39 PM, Mark Brown wrote:

> >What is "it" and why can't we check what the current configuration is
> >while setting FPS to NONE?

> I will have platform specific data in callback of enable/disable only.
> Which call back do I need to set this? enable/disable or post register?

I'm sorry but I can't parse what you're saying here.

> >>I need to set the FPS src properly for each rails before callback happen
> >>from regulator init so that enable/disable/is_enable can handle it properly.

> >Why not just reorder the callback so it happens before the constraints
> >are applied?

> which callback I need to reorder for getting the context for configruation?

The existing call to parse the DT.

--pU61X8j5lbVWa/m1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWll0mAAoJECTWi3JdVIfQsukH/R+a9s1tTmf+1hQNVfXuJJ69
62Zs2B+zrBEa5Cp+NcaeXbM6RJT4zjzjBsen0c+qV4ebDWPdIjNGJus1sCKgKxF1
Uc5gU07Ht63Fved3Zp2RN19ZOKFih0PcoIZT/sN9eEpkFicoA45pEQhJuf8UDCry
EbCQyxrE+Io0DJCWkE02bu1lAUI09XwvZiW9WUPIQOttgLyzWh5KSeG1Wnf14JZ1
ETqIRllKLvcNOUdnIrXizckHC47hDKIeVT6FmcQrR92gXhLLiLH/cGU8oda2odnt
M0JgviMMTTnLWJemVPa/hAPUzjuy26m5KBCEcmh61QvavUwIkbHHwivzU3BVGWY=
=5Hxz
-----END PGP SIGNATURE-----

--pU61X8j5lbVWa/m1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
