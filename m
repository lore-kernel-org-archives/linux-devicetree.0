From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 2/2] v4l: cadence: Add Cadence MIPI-CSI2 RX driver
Date: Thu, 14 Sep 2017 13:54:29 +0200
Message-ID: <20170914115429.cjulb2s74xsppx5j@flea.lan>
References: <20170904130335.23280-1-maxime.ripard@free-electrons.com>
 <20170904130335.23280-3-maxime.ripard@free-electrons.com>
 <20170912182339.GA27713@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="4julbau6b7y4g5px"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170912182339.GA27713-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Benoit Parrot <bparrot-l0cyMroinI0@public.gmane.org>
Cc: Mauro Carvalho Chehab <mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Cyprian Wronka <cwronka-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Neil Webb <neilw-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Richard Sproul <sproul-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Alan Douglas <adouglas-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Steve Creaney <screaney-vna1KIf7WgpBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund-1zkq55x86MTxsAP9Fp7wbw@public.gmane.org>, Hans Verkuil <hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sakari Ailus <sakari.ailus-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4julbau6b7y4g5px
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Benoit,

Thanks for your comments,

On Tue, Sep 12, 2017 at 01:23:39PM -0500, Benoit Parrot wrote:
> > +static int csi2rx_probe(struct platform_device *pdev)
> > +{
> > +	struct v4l2_async_subdev **subdevs;
> > +	struct csi2rx_priv *csi2rx;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	/*
> > +	 * Since the v4l2_subdev structure is embedded in our
> > +	 * csi2rx_priv structure, and that the structure is exposed to
> > +	 * the user-space, we cannot just use the devm_variant
> > +	 * here. Indeed, that would lead to a use-after-free in a
> > +	 * open() - unbind - close() pattern.
> > +	 */
> > +	csi2rx =3D kzalloc(sizeof(*csi2rx), GFP_KERNEL);
> > +	if (!csi2rx)
> > +		return -ENOMEM;
> > +	platform_set_drvdata(pdev, csi2rx);
> > +	csi2rx->dev =3D &pdev->dev;

[snip]

> > +
> > +	subdevs =3D devm_kzalloc(csi2rx->dev, sizeof(*subdevs), GFP_KERNEL);
> > +	if (!subdevs) {
> > +		ret =3D -ENOMEM;
> > +		goto err_free_priv;
> > +	}
> > +	subdevs[0] =3D &csi2rx->asd;
> > +
>=20
> Shouldn't the comment related to lifetime of memory allocation be
> also applied here?  A reference to the "subdevs" pointer is taken
> internally so it might suffer the same fate.  Not sure how many
> "struct v4l2_async_subdev **subdevs" we would end up needing but
> since here we are only dealing with one, why not just make it a
> member of the struct csi2rx_priv object.

As far as I know, only the notifier will use that array. The notifier
will be removed before that array is de-allocated, and the user-space
never has access to it, so I'm not sure the same issue arises here.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4julbau6b7y4g5px
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZum30AAoJEBx+YmzsjxAgVOQP/1vzRMZMFO5ReFVx3vZxWIr2
YTMxhomI5HzOiEkMT/WMPQRjBLOrSEKWI0/3jlAZs8gSd8LnbpGvYjt/Hpy8ZgTq
u2slLUTQMCbhXot0IoxVI/bnWjKttktU2Mms89JjgSC3EnQo5LmCQJ8E+dSx4KGA
+zouqAgw6y+phKSV8iyy6C5jf/NK8QPFTaDRz0jqc7998GLjBUwlNTbu+ljrtAW8
Qst5aNF2cYQI+dlHomIeXsaewOZHeIHib/+VTB1+rdqMPTwXBrwJL6Q7P9v5eAMb
cwmwFYVLM6UeOohPH2P2M0Nhsx2zezm/TCeuINPHwvA1hj//R7S2e+EGuAvpRJR0
68KFNNKXciSdkR+/Se8qC3lnMjmPRi6fqLS6EFYQS4uK/liIHio9HUmfXTDxFHE+
JvXu9uhJm8+pAWwJ65rjc2rBoGr124WbW/xXnhnsCxkjCLsOd3bR3uNj3mvz1G5i
I90BWynYTbIvEq2KO8JOsZz9Ns2rQlFf5bgpywpOdNDE52GmQWe9Ud36bVYbWgVy
otiOEnSgG+QWGcv9u7LLmO47ujChn6dGDbyrJwJwrolmpboHfXktLjzunGf8XCOj
hL7q5EOxFt0ssnvUN+czfK7v6LRd4+X61flgv+weLQXzkaoMRgnJbpStvW9TBKvK
rcbRfMKz4RGGvVlDRxUH
=xEOr
-----END PGP SIGNATURE-----

--4julbau6b7y4g5px--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
