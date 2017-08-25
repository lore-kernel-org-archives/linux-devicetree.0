From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] v4l: cadence: Add Cadence MIPI-CSI2 RX driver
Date: Fri, 25 Aug 2017 16:03:37 +0200
Message-ID: <20170825140337.ywrponpjetjnam5n@flea.lan>
References: <20170720092302.2982-1-maxime.ripard@free-electrons.com>
 <20170720092302.2982-3-maxime.ripard@free-electrons.com>
 <20170807192423.GD10611@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="dhhjlobvuunpaxuq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170807192423.GD10611-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--dhhjlobvuunpaxuq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Benoit,

On Mon, Aug 07, 2017 at 02:24:24PM -0500, Benoit Parrot wrote:
> > +#define CSI2RX_STREAMS_MAX	4
> > +
>=20
> Just to confirm here that "streams" in this case are equivalent to
> "Virtual Channel", correct?

Kind of, yes, but it's a bit more complicated than that. The streams
are the output of the CSI2-RX block, so the interface to the capture
devices.

You can associate any CSI-2 virtual channel (in input) to any stream
(in output). However, as we don't have a way to change that routing at
runtime using v4l2 (yet [1]), the driver currently hardcode that
routing to have CSI-2 VC0 sent to stream 0, VC1 to stream 1, etc.

> > +static void csi2rx_reset(struct csi2rx_priv *csi2rx)
> > +{
> > +	writel(CSI2RX_SOFT_RESET_PROTOCOL | CSI2RX_SOFT_RESET_FRONT,
> > +	       csi2rx->base + CSI2RX_SOFT_RESET_REG);
> > +
> > +	udelay(10);
>=20
> Shouldn't we use usleep_range() instead?

We totally should.

> > +static int csi2rx_stop(struct csi2rx_priv *csi2rx)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < csi2rx->max_streams; i++)
> > +		writel(0, csi2rx->base + CSI2RX_STREAM_CTRL_REG(i));
> > +
> > +	return 0;
> > +}
> > +
>=20
> Here, it is entirely possible that the "dma/buffer" engine which will
> make use of this receiver creates separates video nodes for each streams.
> In which case, you could theoretically have multiple user space capture
> on-going.
> But the "start" and "stop" method above would disrupt any of the other
> stream. Unless you start and stop all 4 capture streams in lock step.
>=20
> Eventually, the sub device might be a port aggregator which has up to
> 4 sensors on the source pad and feed each camera traffic on its own
> Virtual Channel.
>=20
> I know there isn't support in the framework for this currently but it
> is something to think about.

I guess you could make the same argument if you have several engines,
each one connected to a stream.

One way to work around that could be to add some reference counting in
the start and stop functions, and keep enabling all the outputs.

This wouldn't solve the underlying issue that all the stream would be
enabled and we don't really have a way to tell which one we want to
enable, but at least we wouldn't disrupt active streams when the first
one goes away.

Maxime

1: https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg116955.html

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--dhhjlobvuunpaxuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZoC45AAoJEBx+YmzsjxAgjq4P/jMtzcV6vFfHl3lQCsHvgQgz
+buA/FI755G6CobQ7N5mXTFzk7KgIZnooDHabTq7fnVkHNxf5MTIboNtpTNP3EvF
BD533hXOUFvsInztNL/zafFRxJTkYpFTBjkq1FqKThxuGT1Yu7+IFwHCIlImR7N6
tGk2kwPX16Rg45dqRYIYGtW4mjFE/y2iWbBzICBXom8NSwiayBzi3ZKNlxJQuc6I
1wNfG+yZkpTAg3z1sEu7ewjwcC0ePx7ZH3rthC605WfXO7PkC2IrJum/lqtk24L7
2Q7DcG84/s0Q04M6h2FSFp1TBwOFiqo+silDHTEUMMMzttr/+G0efGSwsIe0McjK
kPHXbWJWn7y1hcTax198zrmhAD8wt/zmzl6rLBVIbTj2oioeXuM4I1nFujq6/EcU
z1BdCXViqK1qoRU3pZuYj6Pwy74R9b5+dtiWY891GM+syCHMqTeQ5A1wgXfaFXI7
X6yCVCZlj/Bq9gt1Dqo0hHgxSJGsh2tJZ49EyMcpla6jJwJ6m4Ft8/S1J/89mZfi
nT4oRqp/6dcau0G+iTZBcKp5WR88lDi8aeWC3bRvLeVZSDNm6lwBArMntxKDbvp4
y3vxcULwbw4RDGu44tB7oTGHcibGiJzq+E+StrakgjWcTisMTp3tfk0UlZ9B2YwL
+wGU36BqNbJ7IG+x9sjh
=u1Qh
-----END PGP SIGNATURE-----

--dhhjlobvuunpaxuq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
