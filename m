From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RESUBMIT PATCH v7 7/9] regulator: sky81452: Modify Device Tree
 structure
Date: Mon, 17 Nov 2014 14:18:36 +0000
Message-ID: <20141117141836.GA2722@sirena.org.uk>
References: <1416213190-20935-1-git-send-email-jack.yoo@skyworksinc.com>
 <1416213190-20935-8-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f8lmXUvqnCdFQPaI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416213190-20935-8-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, florian.vaussard-p8DiymsW2f8@public.gmane.org, trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--f8lmXUvqnCdFQPaI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 17, 2014 at 05:33:08PM +0900, gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:

>  	np = of_get_child_by_name(dev->parent->of_node, "regulator");

> +	ret = of_regulator_match(dev, np, &sky81452_match, 1);

Don't open code this, use regulators_node and of_match as previously
advised.

--f8lmXUvqnCdFQPaI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUagOhAAoJECTWi3JdVIfQ2VAH/2B+tKW5DSX6DFwzPi1EjGdz
IfzTeXCQVn3FrpHu0f3jgC6BXupOW88CTtUQ5fYL8FLW9jxbdxLkridMqLZnPpNA
lN8wkUSsCCrcUdC22lnYoir767FxihprzoCQdCji/NoatZx51QWDYkrvvVoArDOH
gi4pH5jj9Cqmd7xDoz/Um5kkGOlBCnxi9uKpOvTCuvy3vLs2vvzRgARekfTNt1y2
lYyaj2qwBV3h4QxWsPH+XOL580xDRF/xIvldVNJHY54O/tBFX34Hua6fGnJOxrYM
/DjZNW9CvPESFajchTa1c/WZf/5kVQpQ5zocVaA1OuBSVG3PyLv6N0YXi8WzHvU=
=yhq5
-----END PGP SIGNATURE-----

--f8lmXUvqnCdFQPaI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
