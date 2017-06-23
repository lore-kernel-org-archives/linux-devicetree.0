From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/9] regulator: mt6380: Add support for MT6380
Date: Fri, 23 Jun 2017 17:14:20 +0100
Message-ID: <20170623161420.tbhn6sjuz7jjhaiu@sirena.org.uk>
References: <cover.1496425268.git.sean.wang@mediatek.com>
 <4276ab23ae0bbb6a54b1add98c4dc668f1a69c50.1496425268.git.sean.wang@mediatek.com>
 <20170606182224.sifkfod7hehadjvm@sirena.org.uk>
 <1498233365.20651.25.camel@mtkswgap22>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k53afb2dqusyixlj"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1498233365.20651.25.camel@mtkswgap22>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, henryc.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, chen.zhong-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, chenglin.xu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--k53afb2dqusyixlj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 23, 2017 at 11:56:05PM +0800, Sean Wang wrote:
> On Tue, 2017-06-06 at 19:22 +0100, Mark Brown wrote:

> > > +	return (regval & info->desc.enable_mask) ?
> > > +		REGULATOR_STATUS_ON : REGULATOR_STATUS_OFF;

> > This isn't really a get_status() operation - it's just showing the
> > status of the enable we set.  The get_status() operation is for hardware
> > that has a mechanism for reading back the current physical status of the
> > regulator, usually including things like if it's in regulation or not.

> > Also please write normal conditional statements, it helps people read
> > the code.

> for the hardware, the way for reflect the current physical physical=20
> has to depend on the bit reading as the bit we enable. It indeed tends
> to confuse other users and developers, we maybe can add some comments
> for this to avoid.

It's OK to just not have a get_status() operation - a lot of regulators
just can't do this and that's fine, the subsystem will cope.

> > > +static const struct of_device_id mt6380_of_match[] =3D {
> > > +	{ .compatible =3D "mediatek,mt6380-regulator", },
> > > +	{ /* sentinel */ },
> > > +};
> > > +MODULE_DEVICE_TABLE(of, mt6380_of_match);

> > Given that this driver is entirely specific to the parent PMIC there
> > should be no need for a separate compatible string, it's redundant.

> the parent of pmic is MediaTek pwrap which is possibly being used with
> various pmics such as MT6323, MT6797, MT6380 and so on. So extra
> matching we thought is required to identify which pmic is actually being
> connected.=20

> For those opinions, maybe we didn't get your exact point. If something
> is wrong, please kindly guide us to the right place.

It sounds like pwrap should be a bus rather than using a platform device
here?  But I guess that's how things are for now so OK.

--k53afb2dqusyixlj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllNPlsACgkQJNaLcl1U
h9DyMwf/XQhcLIYfJxi38/uKMGVW9S69KL+OCbRC3UJL4c2FJg5sw7xTwMB0TT5k
IQIizhYXwqp1fS6sqUAnUkyixJ4ny7O4NqgxGMDFD/Fh1XEiakBr7ZCMUODiTfVJ
nYtySpogQJ5TMydkOKE7kixEKiRG7J/luy0euOjAYnZzU5Gqb/it6bEmF1d+JCH7
L3iw0m/EpS0TLn/qWCjUE6dCgOe3eqYiavQdaivAR8bmwGtILosjNOSGBaQY5Uf0
VPmUsERUHY9gUE2rbhJPhfm1zX1Ov8Zr/Nw14sj7NAXAO90EYvpi00AWBm3gdpWP
ls4qJ8IGQRSsDnA1JgEuz3waYmZEBw==
=sSkW
-----END PGP SIGNATURE-----

--k53afb2dqusyixlj--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
