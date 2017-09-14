From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] v4l: cadence: Add Cadence MIPI-CSI2 RX driver
Date: Thu, 14 Sep 2017 13:57:58 +0200
Message-ID: <20170914115758.7phdpeagiyvo4bf3@flea.lan>
References: <20170904130335.23280-1-maxime.ripard@free-electrons.com>
 <20170904130335.23280-3-maxime.ripard@free-electrons.com>
 <20170912182339.GA27713@ti.com>
 <20170912191312.GB27713@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="w7553w5onksf67sf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170912191312.GB27713-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--w7553w5onksf67sf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 12, 2017 at 02:13:12PM -0500, Benoit Parrot wrote:
> > > +	/*
> > > +	 * Create a static mapping between the CSI virtual channels
> > > +	 * and the output stream.
> > > +	 *
> > > +	 * This should be enhanced, but v4l2 lacks the support for
> > > +	 * changing that mapping dynamically.
> > > +	 *
> > > +	 * We also cannot enable and disable independant streams here,
> > > +	 * hence the reference counting.
> > > +	 */
> > > +	for (i =3D 0; i < csi2rx->max_streams; i++) {
> > > +		clk_prepare_enable(csi2rx->pixel_clk[i]);
> > > +
> > > +		writel(CSI2RX_STREAM_CFG_FIFO_MODE_LARGE_BUF,
> > > +		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
> > > +
> > > +		writel(CSI2RX_STREAM_DATA_CFG_EN_VC_SELECT |
> > > +		       CSI2RX_STREAM_DATA_CFG_VC_SELECT(i),
> > > +		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
>=20
> I see here that we are setting the data_type to 0 (as we are not
> setting it) so effectively capturing everything on the channel(s).
> Will we be adding a method to select/filter specific data type?  For
> instance if we only want to grab YUV data in one stream and only
> RGB24 in another. Of course that would not be possible here as is...

Ah, right, I forgot about that. I've actually started that discussion
on another thread for a transceiver, without much success though:
https://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg117920.html

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--w7553w5onksf67sf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZum7GAAoJEBx+YmzsjxAguJYP/0Si5DkeSr/ZtWlmSJ8q7bMw
mTUrvQo33JHwJfBKQB6pANjJ+2DTefliAZ5ByOY3Pa3aVsBQz0A4ZPuqWQBbaPBg
exmlAzl3lGxuS7yFnAZNWK/cxqDlBFioY5uyOeGE6hs4yTmtbDkDHvCtIFpw/RdM
Tp/VZzskSbQ7BvUEkofVo7Dp9GhhtjTZcG8LGCZ5myVWC9R26rNSiLadEQorAwE/
SX7GOvH0dMvrNWccRyhEbGbG+pv6Ev0WJgimY4mWEkjSPhakv9h+vqwg1ACIO+00
Teq6na3Yo7Id3WFsZ+NG18j0OT3lWvxYMkeysMIDqAtYsyzGrMTHfiORe38i1MK4
40C7eCx5EnzNvkzw+04c4KdmuLyyX59AnePDmmqhY1lKJsUZfyDQMiwkA9Bzh1LH
XAGJUO2Io0f4H83x/7xu+w8+BmMuY9XI5QDkdg/lnjuLZeKzq77F5j92VS+HAVit
GMJdQIDTYJ50FlkdEBZupOwYUjasrvk+gzr/2ViCksaTqPh3nRO3e69tAhkhv+bk
p6G5nSo5qXF2reKnVipDVmWCm/OmfaLszCqSFcoaFrkyeaBBEdAcxWcUYfzpUHCR
+hjhFWez+fa/I5h3NT7k59LAHsMkBVKnv/BVlL/CY1jlU61O/nkl3VumFPGoSZ2G
nXUHxg/0Ork6Dn3cokiF
=HB6s
-----END PGP SIGNATURE-----

--w7553w5onksf67sf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
