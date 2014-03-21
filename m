From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4 1/3] [media] of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Fri, 21 Mar 2014 15:13:38 +0100
Message-ID: <1755937.SSGT2MZJMC@avalon>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de> <2848953.vVjghJyYNE@avalon> <532C408D.4070002@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1481097.JvJTheO4j4"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <532C408D.4070002-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nextPart1481097.JvJTheO4j4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Tomi,

On Friday 21 March 2014 15:37:17 Tomi Valkeinen wrote:
> On 21/03/14 00:32, Laurent Pinchart wrote:
> > The OF graph bindings documentation could just specify the ports no=
de as
> > optional and mandate individual device bindings to specify it as ma=
ndatory
> > or forbidden (possibly with a default behaviour to avoid making all=

> > device bindings too verbose).
>=20
> Isn't it so that if the device has one port, it can always do without=

> 'ports', but if it has multiple ports, it always has to use 'ports' s=
o
> that #address-cells and #size-cells can be defined?

You can put the #address-cells and #size-cells property in the device n=
ode=20
directly without requiring a ports subnode.

> If so, there's nothing left for the individual device bindings to dec=
ide.


=2D-=20
Regards,

Laurent Pinchart

--nextPart1481097.JvJTheO4j4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJTLEkYAAoJEIkPb2GL7hl1O/EIAI7GZa+/PoYcUZH7msuy322R
9u/uWub9R4lPngV/kPiPygxV7UbWRlvv3XvhrZxrQ8m8j0U080ukVZB2JJ6ewksD
pdYr2BwKcO6JsOeCe9WiAfxxj8urJjv2dRM6lTFleR0tamgJqzIS9RcApIR+FWuz
DEr29k92DVQ2+EIQj/tdlFQHazaH5r9Nh1IyIYDo4KwUWXVUManVIRl3ioE+D9MZ
4+D6VNwsuaWGrw34L3Cfy7mfe2MOH1LQIvgpXP0/IXyUfK4LHgAh02I0QlsXbEnQ
3/P11+fNSs9PiLfzaGKtP+Bklkr6ZnO0BqUZ0UWVHp01bKtAtDOb2Z9KIW15CtE=
=NnJ/
-----END PGP SIGNATURE-----

--nextPart1481097.JvJTheO4j4--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
