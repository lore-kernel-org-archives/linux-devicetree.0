From: Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v7 2/2] v4l: cadence: Add Cadence MIPI-CSI2 RX driver
Date: Wed, 14 Feb 2018 14:19:33 +0100
Message-ID: <20180214131933.t75jg5b5cjfuo7r6@flea.home>
References: <20180208150830.9219-1-maxime.ripard@bootlin.com>
 <20180208150830.9219-3-maxime.ripard@bootlin.com>
 <2517178.9jmyBy62ST@avalon>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="feaizwvindirbxfr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2517178.9jmyBy62ST@avalon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Boris Brezillon <boris.brezillon-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>, nm-l0cyMroinI0@public.gmane.org, Simon Hatliff <hatliff-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--feaizwvindirbxfr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Thu, Feb 08, 2018 at 08:17:19PM +0200, Laurent Pinchart wrote:
> > +	/*
> > +	 * Create a static mapping between the CSI virtual channels
> > +	 * and the output stream.
> > +	 *
> > +	 * This should be enhanced, but v4l2 lacks the support for
> > +	 * changing that mapping dynamically.
> > +	 *
> > +	 * We also cannot enable and disable independant streams here,
> > +	 * hence the reference counting.
> > +	 */
>=20
> If you start all streams in one go, will s_stream(1) be called multiple t=
imes=20
> ? If not, you could possibly skip the whole reference counting and avoid=
=20
> locking.

I guess that while we should expect the CSI-2 bus to be always
enabled, the downstream camera interface could be shutdown
independently, so I guess s_stream would be called each time one is
brought up or brought down?

Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com

--feaizwvindirbxfr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqEN2QACgkQ0rTAlCFN
r3Q36g/+KS4LmieOgw+WCi+8sgZVCYtu8lyuPVa+uL48xh1KhHUUO+dlFm4OZKzS
0WcVhQ+KAMffU8kfG5jap7kLOFMBJj7PN9nHB6qsbBxlw+4M34gjBi/z0yjwY4FQ
1hWyMQwzb7lXR/IABfJVb5MvIrOHoRKQOualAi/6BtK91Kk2J2Q7oFcJZLlQPjp3
4Qsx0DMLw9XD/GtMvd5YOI//8BD0FKn3V1DIsDx3XbIQSxuiOJEY0jMtmRYGRNP5
kioOsF3NR8zgqsR88O0WVKMB9XnpLWhVd0BatCXHJegnrcYbc4QYXZ12iMsXKmZ/
XDDIK6/ImIrmlC//jt2PynHTDWZJGasZZOPb6UroImAhL5Oyi2xq9zeHxmA1Lf7g
dAVWGUocAO85KxImPlL0MI2u/df0daNcqmqVQqXESXBCCHX0+d2a7KDDrZWX89yV
rrPYjWSLBwbnhC8+Hat0IVjkIyHIyF31o+TxP0CwTOnQ6AtHP7VgLNsoTYV3iu3M
j9nfroZejvvhGpUWRL3ifTVbF9SAzY6oSWqQNYLmDangPxdnLUof0JoCFKxaNkUi
izvW3ZWxyhfZsv3BzaySHxG7etwbdRJ7xH4Qb/4wQx/cBncu7G0hEiXaoQMkh9Ku
xAjr7iERh1BDk88Ampyyheqgj7cV6JK7bDhzHS/ZKcBKcIWxPls=
=rZVy
-----END PGP SIGNATURE-----

--feaizwvindirbxfr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
