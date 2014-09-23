From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v6 07/12] usb: chipidea: add a usb2 driver for ci13xxx
Date: Tue, 23 Sep 2014 12:43:10 -0500
Message-ID: <20140923174310.GG28592@saruman>
References: <1411468088-5702-1-git-send-email-antoine.tenart@free-electrons.com>
 <5140494.LzvyOiyY3U@wuerfel>
 <20140923165515.GA26604@saruman>
 <62705234.gKJDtUQLyT@wuerfel>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oOB74oR0WcNeq9Zb"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <62705234.gKJDtUQLyT@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: balbi-l0cyMroinI0@public.gmane.org, Antoine Tenart <antoine.tenart-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, zmxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, jszhang-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

--oOB74oR0WcNeq9Zb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Sep 23, 2014 at 07:37:25PM +0200, Arnd Bergmann wrote:
> On Tuesday 23 September 2014 11:55:15 Felipe Balbi wrote:
> > On Tue, Sep 23, 2014 at 06:44:40PM +0200, Arnd Bergmann wrote:
> > > On Tuesday 23 September 2014 15:36:45 Antoine Tenart wrote:
> > > > On Tue, Sep 23, 2014 at 12:39:04PM +0200, Arnd Bergmann wrote:
> > > > > On Tuesday 23 September 2014 12:28:03 Antoine Tenart wrote:
> > > > > > +       if (dev->of_node) {
> > > > > > +               ret =3D ci_hdrc_usb2_dt_probe(dev, ci_pdata);
> > > > > > +               if (ret)
> > > > > > +                       goto clk_err;
> > > > > > +       } else {
> > > > > > +               ret =3D dma_set_mask_and_coherent(&pdev->dev, D=
MA_BIT_MASK(32));
> > > > > > +               if (ret)
> > > > > > +                       goto clk_err;
> > > > > > +       }
> > > > > >=20
> > > > >=20
> > > > > Why do you care about the non-DT case here? I think it would be n=
icer to
> > > > > open-code the ci_hdrc_usb2_dt_probe() function in here and remove
> > > > > the dma_set_mask_and_coherent(), which should not even be necessa=
ry for
> > > > > the case where you have a hardwired platform device.
> > > > >=20
> > > >=20
> > > > I thought we agreed to call dma_set_mask_and_coherent():
> > > > http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/273=
335.html
> > > >=20
> > > > I do not have a strong opinion on this as I only use the dt case fo=
r my
> > > > usage.
> > >=20
> > > The question is more about who actually wants the non-DT case.
> > >=20
> > > Since this is a new driver, I suspect that the answer is "nobody",
> > > as the existing board files are all for legacy platforms that we
> > > are not going to adapt for this driver.
> >=20
> > wait a minute... will the legacy platforms be adapted to DT and, thus,
> > to this driver in the future ? I really don't want to keep several
> > copies of chipidea driver just because there are still some legacy
> > platforms still using them. I have said in the past and will say again,
> > everybody should move to the generic chipidea driver at the earliest
> > opportunity so we avoid duplication of work.
> >=20
>=20
> Sorry, my mistake. The intention that this new driver is meant to
> replace the existing ones wasn't clear to me from the changelog, and
> if I'd been involved in the discussion before, then I've forgotten
> about it.
>=20
> It absolutely makes sense to migrate to a common driver, and in that
> case we should keep the platform_data handling and
> dma_set_mask_and_coherent() call in there, so we can do the two
> conversions (migrating from platform specific frontends to the generic
> one, and migrating from platform_data to DT) on independent schedules.

makes sense to me.

> Eventually I'd like all of the existing users of the platform_data
> path to move to DT, but that should not hold up the other cleanup if
> it takes longer.

yeah, certainly.

> There is however still my point that we shouldn't have an extra
> platform device that is not attached to the device node. I think the
> generic driver should just be part of the common code, without an
> extra framework.  Something like the (entirely untested) patch below.

yeah, that's what I did on dwc3 at least. We support platform_data and
DT on the core driver. As for glue layers, we have ST, Qcom, PCI, OMAP,
Exynos and Keystone.

The only difference is that core dwc3 still doesn't know about clocks,
but that's not an issue right now because we're not yet supporting
pm_runtime.

--=20
balbi

--oOB74oR0WcNeq9Zb
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUIbEuAAoJEIaOsuA1yqREfvIP/Rg8cmCcpUEagQnZDO8pSbqI
JmkpZx3a7Zg3P8pw8ZXp7WLdevEX4LDRgdgNvBAUxnsaqUp7/GntHsjLlzYbGBQv
Rl3xd2tNNJ6AZQpWMmOejG+qUl0m3K/c3ivhVFzz+KajJDzN0pC3qyWGwSBg6Ahc
p4/6cvzCDr+hAwPJzYtxn9MaX+TnGkiF/NiDSb8psHp/X2Ivj0i7uVfWuAVhJhv7
N6aOW37uTa3tuhs39MTBzpa4OyPBR0EK91HbyhtgnzD4PoRbqV2qphBvtCTZqOw3
ticMwyIZzeZ4GsaqmpG+V8tTEmzqzYrLGaKOgkIfl8GfDCu8PXgX173SoNwxOyjm
z/aG9CiQgWzJHfI6E+X3SgJvU3hLhXAjTGnEl3+DmwYLGDCfUkH+l3GQbbrgU7E+
aik5JHbYbbymXA4O2NICRhJjjNVc39Arhh3Ah237R8NW/hgOu4TVDr2ELynNTrWf
6wdy5LRk8Ndp4EMzWACeLL43u8O+GOeZhO5O8RXJ/NVfMWTymMRyxwBAH+WIcZsb
+iewoiqaWn3fiH6PjUCV7gLjm4yjK+s+ZM2afREAv/tDiswZYINeOQlIBfnlbB7Q
DnrRmGRzTVsuDmS08rdXkyCzT+JREPR63qSxmEeus95jdt0kIuae6ghnZQvhceEi
Vuf/Y70S+xO/mnAYizKt
=uY0x
-----END PGP SIGNATURE-----

--oOB74oR0WcNeq9Zb--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
