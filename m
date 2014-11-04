From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v6 1/8] mfd: Add support for Skyworks SKY81452
 driver
Date: Tue, 4 Nov 2014 11:38:33 +0000
Message-ID: <20141104113833.GI3815@sirena.org.uk>
References: <1414393369-31583-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-1-git-send-email-jack.yoo@skyworksinc.com>
 <1414739322-12487-2-git-send-email-jack.yoo@skyworksinc.com>
 <20141103171451.GG12011@x1>
 <1415050088.20372.72.camel@x220>
 <20141103223022.GE13359@x1>
 <1415091946.20372.136.camel@x220>
 <20141104091609.GI17577@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fze0sZZmuBV4A+b2"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141104091609.GI17577@x1>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>, gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fze0sZZmuBV4A+b2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 04, 2014 at 09:16:09AM +0000, Lee Jones wrote:
> On Tue, 04 Nov 2014, Paul Bolle wrote:

> > Nothing will break. But I think Mark prefers the dependency rename, now
> > done in 7/8, to be done as part of this patch.

> I don't agree.  The rename should be taken independantly by Mark.
> The regulator driver won't build until they match anyway, so there's
> no hard dependency.  Unless someone can give me a really good reason
> to revert it, I'm applying this driver now.

The important thing is that the dependency rename isn't silently thrown
into an unrelated patch.

--fze0sZZmuBV4A+b2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUWLq5AAoJECTWi3JdVIfQ7BMH/0fsSCTGrADlqu3T1AszEMkH
a1VPtAuDRHAFZWsnAqLxFzOQOHx6Z4dMFsBMKrbYCnq+E5ExphzUlXcFTMVCbloI
UUuc16QPcob7UEy5LmHB8MVgKrhYKuSTWLPdr6WN4ypdhcsKybNpu4tZ5y5vXxe/
kxGIQoeYPcFbULUU0TbQIjp6GEmFC8kZfpIU64a5ERNXYkgyJ3Y8KRcR20YyruRQ
HKQ7Ak/vZbfg6xSEo2UOoW0sCPxEHbYufApaYsEUCUFpHl+mlJ+Z/BsvcIXrxJyq
nTvk6pSVXzlHPHluXmXuTUa4tETq3xfe+vU2QmYT9fPTfRo6jCBmmXVKEOMGZAk=
=fr+h
-----END PGP SIGNATURE-----

--fze0sZZmuBV4A+b2--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
