From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v7 04/14] usb: chipidea: msm: add remove method
Date: Mon, 25 Jun 2012 17:14:44 +0300
Message-ID: <20120625141443.GB601@arwen.pp.htv.fi>
References: <1340607391-16380-1-git-send-email-richard.zhao@freescale.com>
 <201206251533.20788.marex@denx.de>
 <CAAe_U6JL5P26zJDOWaV3Z=uOmhJddBKE9B3r=OrzEtPEuM3vnA@mail.gmail.com>
 <201206251555.22820.marex@denx.de>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LyciRD1jyfeSSjG0"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201206251555.22820.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: "ABRAHAM, KISHON VIJAY" <kishon-l0cyMroinI0@public.gmane.org>, Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org


--LyciRD1jyfeSSjG0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 25, 2012 at 03:55:22PM +0200, Marek Vasut wrote:
> Dear ABRAHAM, KISHON VIJAY,
>=20
> > Hi,
> >=20
> > On Mon, Jun 25, 2012 at 7:03 PM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> > > Dear ABRAHAM, KISHON VIJAY,
> > >=20
> > >> Hi,
> > >>=20
> > >> On Mon, Jun 25, 2012 at 12:26 PM, Richard Zhao
> > >>=20
> > >> <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org> wrote:
> > >> > From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > >> >=20
> > >> > allow this driver to be removed too.
> > >> >=20
> > >> > Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
> > >> > Signed-off-by: Alexander Shishkin <alexander.shishkin-VuQAYsv1562uYJLRA6qg5Q@public.gmane.org=
com>
> > >> > ---
> > >> >  drivers/usb/chipidea/ci13xxx_msm.c |   20 ++++++++++++++------
> > >> >  1 file changed, 14 insertions(+), 6 deletions(-)
> > >> >=20
> > >> > diff --git a/drivers/usb/chipidea/ci13xxx_msm.c
> > >> > b/drivers/usb/chipidea/ci13xxx_msm.c index 8d438b8..68512d4 100644
> > >> > --- a/drivers/usb/chipidea/ci13xxx_msm.c
> > >> > +++ b/drivers/usb/chipidea/ci13xxx_msm.c
> > >> > @@ -84,6 +84,8 @@ static int __devinit ci13xxx_msm_probe(struct
> > >> > platform_device *pdev) if (ret)
> > >> >                goto put_platform;
> > >> >=20
> > >> > +       platform_set_drvdata(pdev, plat_ci);
> > >> > +
> > >> >        pm_runtime_no_callbacks(&pdev->dev);
> > >> >        pm_runtime_enable(&pdev->dev);
> > >> >=20
> > >> > @@ -95,16 +97,22 @@ put_platform:
> > >> >        return ret;
> > >> >  }
> > >> >=20
> > >> > +static int __devexit ci13xxx_msm_remove(struct platform_device *p=
dev)
> > >> > +{
> > >> > +       struct platform_device *plat_ci =3D platform_get_drvdata(p=
dev);
> > >>=20
> > >> How about a pm_runtime_disable() here?
> > >=20
> > > MX28 doesn't do runtime PM yet. Actually it doesn't do any PM.
> >=20
> > I was probably misled by the call to pm_runtime_enable in your probe
> >=20
> > :-( Then can we have it removed from probe as well?
>=20
> Yes, either that or properly add runtime PM support since mxc maybe does =
support=20
> it, I dunno right now.

I think adding pm_runtime_disable() to the exit path should be the way
to go. proper callbacks can be implemented later, but we cannot leave pm
enabled for the device.

--=20
balbi

--LyciRD1jyfeSSjG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJP6HJTAAoJEIaOsuA1yqRETH4P/1Os6k1B2M/gYe5TKex39Jnp
OTm86RMljtmUDvN7QuyRarGLDnHas2fuOt4VCG0LaOQuYmC2L3ehMOE7NglcVUSR
2vbnroN304nwPHyDHOoxQs/b/xbA2jOtxEuG2/A4gNld0YUhirVkwR++YRlfxkcg
xHxKXuGN6lnzeRnWblr5ateLjNd9ukrh9iuZJPhfVKzvs1lgO9pLWLUP4qz4XqIe
V0Do87SRf/qPvz7IvpbqDiZBmTbko9ScINJdpdoBPVCP9sX7+b29omuO0q3gG2QP
PyuSwKjizwmhPuJ5cnrFQ7MfBaz8fMzgLmKblcX+923guqnsX7qEyVujbVQACxN7
Gv0EyWlbJ/MOveWMSPvyFvn5XDtSLZPXQaFIURwcPWYNc88l1SwBjQv32Qqyl8JM
RGmmihj3/6vU+HT3YQwPivwyS3EXf7PU+JqZQeCV9+/zbidT8lGsv3a1JR9mhgtC
TGI3JwGt4NSR1FI16XO8lO6VTLD1or2T+kldrlmAEmjzQIUqWTLp1tlN0PsaHHsf
FfMIwcjv24esSvSJNbID66os+kO/ezuy/U9Y3nZJvkQStSLwY3Cegeb4K6QHgDq3
UAngfp05p0ZOOxIh99BANk6MfPocnD+LZdAK514U+b0NYsC9RE7wiS8lNIZsSyV8
YI+jqXLTI5WjzHBRRwqr
=D1BQ
-----END PGP SIGNATURE-----

--LyciRD1jyfeSSjG0--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
