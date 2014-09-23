From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Tue, 23 Sep 2014 11:55:15 -0500
Message-ID: <20140923165515.GA26604@saruman>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <2909480.SL9c0XWUbW@wuerfel>
 <20140923133645.GA18924@kwain>
 <5140494.LzvyOiyY3U@wuerfel>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5140494.LzvyOiyY3U@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

HI,

On Tue, Sep 23, 2014 at 06:44:40PM +0200, Arnd Bergmann wrote:
> On Tuesday 23 September 2014 15:36:45 Antoine Tenart wrote:
> > On Tue, Sep 23, 2014 at 12:39:04PM +0200, Arnd Bergmann wrote:
> > > On Tuesday 23 September 2014 12:28:03 Antoine Tenart wrote:
> > > > +       if (dev->of_node) {
> > > > +               ret =3D ci_hdrc_usb2_dt_probe(dev, ci_pdata);
> > > > +               if (ret)
> > > > +                       goto clk_err;
> > > > +       } else {
> > > > +               ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_B=
IT_MASK(32));
> > > > +               if (ret)
> > > > +                       goto clk_err;
> > > > +       }
> > > >=20
> > >=20
> > > Why do you care about the non-DT case here? I think it would be nicer=
 to
> > > open-code the ci_hdrc_usb2_dt_probe() function in here and remove
> > > the dma_set_mask_and_coherent(), which should not even be necessary f=
or
> > > the case where you have a hardwired platform device.
> > >=20
> >=20
> > I thought we agreed to call dma_set_mask_and_coherent():
> > http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/273335.=
html
> >=20
> > I do not have a strong opinion on this as I only use the dt case for my
> > usage.
>=20
> The question is more about who actually wants the non-DT case.
>=20
> Since this is a new driver, I suspect that the answer is "nobody",
> as the existing board files are all for legacy platforms that we
> are not going to adapt for this driver.

wait a minute... will the legacy platforms be adapted to DT and, thus,
to this driver in the future ? I really don't want to keep several
copies of chipidea driver just because there are still some legacy
platforms still using them. I have said in the past and will say again,
everybody should move to the generic chipidea driver at the earliest
opportunity so we avoid duplication of work.

--=20
balbi

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIaXzAAoJEIaOsuA1yqRE5CIP/iT2SKj7CN9O2e6dGqU06/uY
m0Zq03hC0NNpqmhbaUJ/heyhvPuG+8R36ggbj5Bu1DmAvwkBkRGrD93VIztyGv4u
qliZLi5wqO8zviDlb+DjzgsyPGa5i90PxqrgY2ehleDe+m3NGtO7cOUvZfpxS2gj
EhH9oIdxRHf97Tn1FSomYRZf50F/MJ1vQGwzYgqAA1OquRZe8igdNzNog56Xf9/o
TEvoEtblgkpZp1ogQ0dDDu3DaFeVDdAYfN5cLMROEuf4ewwAqoC+YtSMAYe7nOSP
fWn04cCbYFYW1zVIr2CvmM11T75QYwr7oi2dp6g+1fEkYAcl+5l6i4HwLSKGPE1Z
br5fnevCsdsB3mVDXQ4zD4VigU6cbA8rILWcaNWdaXeT48k7heIpldw4gsOxst0h
Yq4bJrLZybyNAkFdNOyW4LGXNv5VKlsYqvE/aYqvVoqff7zViGZgsXbxyHBAzbur
Dt/Ghwp1+HAgX1A5fNR6fLwB6ZYQDGuQNF3K4bih+Z5n4sxwUUOZlqlNFqGoei+P
IuEm/xBoYe0iRw6KuBQi0iNQa4F91L7fnGemPdUHIqbd5ewaks5zq7DgNVZBUhMM
jJi1jiKlqYS9or6VjA+pws69UNs3waMHbhiiFY/F5a4+aTIa8WuIcXc7R2ts90Va
O389V8DRiBrCjM6HsYZA
=GvQe
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
