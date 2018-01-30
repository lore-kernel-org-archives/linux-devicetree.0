From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] v4l: cadence: Add Cadence MIPI-CSI2 TX driver
Date: Tue, 30 Jan 2018 16:36:23 +0100
Message-ID: <20180130153623.vt32c4xzlj4nppjk@flea.lan>
References: <20180119081547.22312-1-maxime.ripard@free-electrons.com>
 <20180119081547.22312-3-maxime.ripard@free-electrons.com>
 <20180129193046.GF25980@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r33ibizqk65sjx2j"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180129193046.GF25980-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--r33ibizqk65sjx2j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Benoit,

On Mon, Jan 29, 2018 at 01:30:46PM -0600, Benoit Parrot wrote:
> > +++ b/drivers/media/platform/cadence/cdns-csi2tx.c
> > @@ -0,0 +1,586 @@
> > +/*
> > + * Driver for Cadence MIPI-CSI2 TX Controller
> > + *
> > + * Copyright (C) 2017 Cadence Design Systems Inc.
> > + *
> > + * This program is free software; you can redistribute  it and/or modi=
fy it
> > + * under  the terms of  the GNU General  Public License as published b=
y the
> > + * Free Software Foundation;  either version 2 of the  License, or (at=
 your
> > + * option) any later version.
>=20
> Should use SPDX license tag line instead.

Indeed.

> > +struct csi2tx_priv {
> > +	struct device			*dev;
> > +	atomic_t			count;
> > +
> > +	void __iomem			*base;
> > +
> > +	struct clk			*esc_clk;
> > +	struct clk			*p_clk;
> > +	struct clk			*pixel_clk[CSI2TX_STREAMS_MAX];
> > +
> > +	struct v4l2_subdev		subdev;
> > +	struct v4l2_async_notifier	notifier;
> > +	struct media_pad		pads[CSI2TX_PAD_MAX];
> > +	struct v4l2_mbus_framefmt	pad_fmts[CSI2TX_PAD_MAX];
> > +
> > +	bool				has_internal_dphy;
> > +	unsigned int			lanes;
> > +	unsigned int			max_lanes;
>=20
> So if I understand this correctly the actual lane number list
> specified in DT is not actually used? And so the lane numbers are only
> derived from the current numbers of lanes specified.
>=20
> Meaning the following would produce identical setup:
> 	csi2tx_out: endpoint {
> 		remote-endpoint =3D <&remote_in>;
> 		clock-lanes =3D <0>;
> 		data-lanes =3D <1 2>;
> 	};
>=20
> or
> 	csi2tx_out: endpoint {
> 		remote-endpoint =3D <&remote_in>;
> 		clock-lanes =3D <0>;
> 		data-lanes =3D <2 3>;
> 	};
>=20
> But they would be interpreted differently by say the CSI2-RX side, no?

Ah, right, I should totally fix that.

I'll send a new version shortly.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--r33ibizqk65sjx2j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpwkPcACgkQ0rTAlCFN
r3SLihAAhs8HcO+tcz7YmM35/WG/1W/FXDcEcVVDnC4IewTZs5IVD6F2W5jEwlZA
Abp6OxohbrlVzGcmE1PpuzlVhO0035yN1j8xDP0/gZBKhOsPVb7wdUnVMFHk+i0T
m4RSN0BORbzP/Ai+wgv+Q5pB0JhDw+I6ZZfYQw+pZ6ZVPMJ2j3ExIgKaOJqC1GF4
zBVwB8UsuSF6qbI/p1Pjbc/bejNI2DRWL04E6+YQsZAR83Yix3TFhLZHBCGQfESx
8jM6LmFKnVJPQRGuDnqEySbyPdL3rFoXmD7zLVdhGoVvnAh5IFo+J88fA2ehtlgJ
h9tGHXmUlPGoT7c6Pzk7Ful2Xc8QDdQf6Iw1XQt/pjSnqQfKSVVsy+9Fdr8bHrXF
3M0JcJlsx+KQfTyPfdKCrFp+wFSv7bsNzM+LZBye+qDgXN/2zCW4NHtpCao6i5Lp
HDUZTPuqoFLpD/YLsdMv7NNmK0g/ww5dzSOgC4FmQ0fW3HI8s4BAcUrOBxC4+WzJ
yFdXtA1yoR/WsxjbAXVIkItT+J0OcZXrVXKZgln5L2WwgZDZtWQcg7TrvshtFhd0
8jPdnEHJeeDbK9qkSEL6BWSSc6exfdPG+FHVzYJCROEQUA/A315zuEF0nRC0JrN+
t/TPIZYM6/H1O/2wHkCbKGTxOtEytOEWKgy+Sm83X4HZfF40dtY=
=1AUZ
-----END PGP SIGNATURE-----

--r33ibizqk65sjx2j--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
