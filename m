From: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Subject: Re: [PATCH v4 1/3] [media] of: move graph helpers from drivers/media/v4l2-core to drivers/of
Date: Mon, 10 Mar 2014 14:57:40 +0100
Message-ID: <5535468.UzAob2tcU4@avalon>
References: <1393340304-19005-1-git-send-email-p.zabel@pengutronix.de> <1536567.OYzyi25bjL@avalon> <531D54E2.8030303@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2040582.688Yf7bA7m"; micalg="pgp-sha1"; protocol="application/pgp-signature"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531D54E2.8030303-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Philipp Zabel <philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--nextPart2040582.688Yf7bA7m
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi Tomi,

On Monday 10 March 2014 08:00:02 Tomi Valkeinen wrote:
> On 08/03/14 17:54, Laurent Pinchart wrote:
> >> Sylwester suggested as an alternative, if I understood correctly, =
to
> >>=20
> >> drop the endpoint node and instead keep the port:
> >>     device-a {
> >>         implicit_output_ep: port {
> >>             remote-endpoint =3D <&explicit_input_ep>;
> >>         };
> >>     };
> >>    =20
> >>     device-b {
> >>         port {
> >>             explicit_input_ep: endpoint {
> >>                 remote-endpoint =3D <&implicit_output_ep>;
> >>             };
> >>         };
> >>     };
> >>=20
> >> This would have the advantage to reduce verbosity for devices with=

> >> multiple ports that are only connected via one endport each, and y=
ou'd
> >> always have the connected ports in the device tree as 'port' nodes=
.
> >=20
> > I like that idea. I would prefer making the 'port' nodes mandatory =
and the
> > 'ports' and 'endpoint' nodes optional. Leaving the 'port' node out
> > slightly
> > decreases readability in my opinion, but making the 'endpoint' node=

> > optional increases it. That's just my point of view though.
>=20
> I, on the other hand, don't like it =3D). With that format, the
> remote-endpoint doesn't point to an EP, but a port. And you'll have
> endpoint's properties in a port node, among the port's properties.

We'll need to discuss port and endpoint properties separately, but it m=
ight=20
make sense to allow endpoints to override port properties instead of=20=

specifying the same value explicitly for each endpoint. Endpoint parsin=
g=20
functions would thus look for properties in endpoints first and then in=
 the=20
parent port node if the property can't be found. This would work with i=
mplicit=20
endpoints and would be hidden to the drivers.

(Please note that this is just food for thought)

=2D-=20
Regards,

Laurent Pinchart

--nextPart2040582.688Yf7bA7m
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAABAgAGBQJTHcTUAAoJEIkPb2GL7hl13loH/j9F18fh/nKm2t1gabghaVF1
UzBQnSQirdoRuFBjC166EVXsZK4mp2N57FWFALOGSsznji7COqb3MJFoXEL2p7s6
hjWEnuS0kjSTyy/7hGC3jUOC+moM6F6EJ4FLckKstUmkGA41W7JGoQyRxoe02x35
rkPJ4krQwvMW+Kyql2YD7wl1eevXECD/b6twhP60vbauqObItyu/LK+6IC4qZLKI
f9TJQkPiBsbGk+VFgM2C3Yv49oQ5SMiaKSttjY7rSdEQssF4Ob3WA2AXurQTuIBU
E7/7YkBoS7mVALIMt99H8Jp7JzjwYqghyB7cWmyBt2PE9rd/XTZaW0lMvj1ulto=
=Df0E
-----END PGP SIGNATURE-----

--nextPart2040582.688Yf7bA7m--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
