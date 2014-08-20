From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/5] MFD: Add rk808 device tree bindings documentation
Date: Wed, 20 Aug 2014 10:26:33 -0500
Message-ID: <20140820152633.GX24407@sirena.org.uk>
References: <1408505248-23995-1-git-send-email-zyw@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uN3tURjgVTLfI0kr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1408505248-23995-1-git-send-email-zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chris Zhong <zyw-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, hl-TNX95d0MmH7DzftRWevZcw@public.gmane.org, huangtao-TNX95d0MmH7DzftRWevZcw@public.gmane.org, cf-TNX95d0MmH7DzftRWevZcw@public.gmane.org, zhangqing-TNX95d0MmH7DzftRWevZcw@public.gmane.org, xxx-TNX95d0MmH7DzftRWevZcw@public.gmane.org, dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, dtor-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org, kever.yang-TNX95d0MmH7DzftRWevZcw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--uN3tURjgVTLfI0kr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 20, 2014 at 11:27:28AM +0800, Chris Zhong wrote:

> +- regulators: This is the list of child nodes that specify the regulator
> +  initialization data for defined regulators. Not all regulators for the given
> +  device need to be present. The definition for each of these nodes is defined
> +  using the standard binding for regulators found at
> +  Documentation/devicetree/bindings/regulator/regulator.txt.

You need to identify all the valid names for regulators on the device so
people know which string to use for which regulator.

--uN3tURjgVTLfI0kr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJT9L4mAAoJELSic+t+oim9GTsP/jk9EGBnzzpqSNfJauIs4spT
oJXe+1MF8NggWdZg0HN75RZyf9v1qsssJmc946w5yjUI4ppbdbdyUn2BPSMY6oKk
Zdi/gXdWE5nK1XiH7TbleLq9yteVbpVDQljbQ2zhNaMfku+R950wd5KdWBtIk4zn
S9BYWUwh2JkI9dNie7l+ao8kL8/gx9/Bcv71tA6Y87YEkDVSmHfxND48rLTU5k3v
076ym04gyi9fzQVfMviIkn1BklLZ/xYstK0cfF7NRgdWDzrC1DKubTdGqYilaPYf
PIc57m1kF6fuARYR7zmyOSWfD41jwCTBSFkzcU7Fu57wq+vJxGKM1vFi0xXnt1FJ
u91NB7auha+DzVGqG0u0gxX1BagQc0r0e4AQASUvhNnOdhi+LN3NKzdtpHgK0b12
TBY1zoFTz+j4dgyrdARUyqkH2WC8VSTZxINDSfkdbZsc/JSWCE5TePkx73ECNF6/
iOwrHGQFyuj3snkusMPbFYkqCiPQ5je7Es1iOmpDbw0i+D4IH7quJTJwbTFcvnVe
z8QHQVaUEdYsoWMFeOm1bXo2I6X1BnMbhUwEhMwNUSv4mCmO1Pao3mJC7lUprAuB
5gKODGhT/w2I+ZcmB+XGPJigGSVQewegTke3q+0ZabAHG07crubuz9XD2pGw7rFG
DblZ7zpQ9qNWc1OGVNfe
=/UKv
-----END PGP SIGNATURE-----

--uN3tURjgVTLfI0kr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
