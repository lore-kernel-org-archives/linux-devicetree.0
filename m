From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi] Re: [PATCH v4 4/6] reset: sunxi: Add Allwinner H3
 bus resets
Date: Mon, 23 Nov 2015 12:29:15 +0100
Message-ID: <20151123112915.GU32142@lukather>
References: <1445964626-6484-1-git-send-email-jenskuske@gmail.com>
 <1445964626-6484-5-git-send-email-jenskuske@gmail.com>
 <13919923.o3Dj9msmoa@wuerfel>
 <20151104163014.GB6114@lukather>
 <20151105074730.fd6a9d57a1f2c7933478c680@free.fr>
 <CAGb2v665C-EM4t1h3rQ=hNR=1Z4J2mp7DRy_zM8-OkCXzZ03iw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cGn0fZIJon5R7R2H"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v665C-EM4t1h3rQ=hNR=1Z4J2mp7DRy_zM8-OkCXzZ03iw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: moinejf-GANU6spQydw@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vishnu Patekar <vishnupatekar0510-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Emilio =?iso-8859-1?Q?L=F3pez?= <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jens Kuske <jenskuske-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--cGn0fZIJon5R7R2H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 23, 2015 at 03:41:52PM +0800, Chen-Yu Tsai wrote:
> On Thu, Nov 5, 2015 at 2:47 PM, Jean-Francois Moine <moinejf-GANU6spQydw@public.gmane.org> wro=
te:
> > On Wed, 4 Nov 2015 08:30:14 -0800
> > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >
> >> Hi Arnd,
> >>
> >> On Fri, Oct 30, 2015 at 09:27:03AM +0100, Arnd Bergmann wrote:
> >> > On Tuesday 27 October 2015 17:50:24 Jens Kuske wrote:
> >> > >
> >> > > +static int sun8i_h3_bus_reset_xlate(struct reset_controller_dev *=
rcdev,
> >> > > +                                   const struct of_phandle_args *=
reset_spec)
> >> > > +{
> >> > > +       unsigned int index =3D reset_spec->args[0];
> >> > > +
> >> > > +       if (index < 96)
> >> > > +               return index;
> >> > > +       else if (index < 128)
> >> > > +               return index + 32;
> >> > > +       else if (index < 160)
> >> > > +               return index + 64;
> >> > > +       else
> >> > > +               return -EINVAL;
> >> > > +}
> >> > > +
> >> > >
> >> >
> >> > This looks like you are doing something wrong and should either
> >> > put the actual number into DT,
> >>
> >> This is the actual number, except that there's some useless registers
> >> in between. Allwinner documents it like that:
> >>
> >> 0x0   Reset 0
> >> 0x4   Reset 1
> >> 0xc   Reset 2
> >>
> >> So we have to adjust the offset to account with the blank register in
> >> between (0x8).
> >>
> >> > or use a two-cell representation, with the first cell indicating the
> >> > block (0, 1 or 2), and the second cell the index.
> >>
> >> And the missing register is not a block either.
> >>
> >> That would also imply either changing the bindings of that driver (and
> >> all the current DTS that are using it), or introducing a whole new
> >> driver just to deal with some extraordinary offset calculation.
> >
> > In the H3, the holes are not used, but what would occur if these holes
> > would be used for some other purpose in future SoCs? Double mapping?
>=20
> We'd have a different compatible string for it.
>=20
> My suggestion for the resets is to just split them into 3 nodes: AHB
> (since AHB1 and AHB2 devices are mixed together in the bunch), APB1,
> and APB2 reset controls.
>=20
> This follows what we have for existing SoCs, and gets rid of the unused
> hole. We can use the existing "allwinner,sun6i-a31-clock-reset" and
> "allwinner,sun6i-a31-ahb1-reset" compatibles.

That seems a bit weird to have a single clock and split resets, but as
long as they are not mixed, and you can compute easily the id from the
datasheet, ok.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--cGn0fZIJon5R7R2H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWUviKAAoJEBx+YmzsjxAguA4QAL04kcYc1gI0yf84nn0Hq6kV
zs2luGIx7BCTp0l+VuqysynYhn0qKixIQIokQTKuf8SFYS2mHWuLQcgHNNf2HCmc
gwFM4CipC8jjjvZfEs+K4L4fT5LM8YEGKz9GvKNt8Aho3JhuHwPkC/T8CAHoXAhg
aI4pjqzX7UA90sVuonrRnPhtlHCKuIIADnHh2BGSbnOfYFqTMNPTEt7w2rk/RDEQ
erAQ163JiIqejlPCCF57U4dBTmnrdMQzhMwS0lNWBTnRtV2/crr3phFoWIpLaVTy
tfBu0XHTqK0+i9j9IBdAUSmb2dfPyqDOrwuHMVi4uaAKwyi+RqRwYB5bzXB0Tkbw
NIO8GS+J+4Lp1qHwmv6xdYmYuIxQe/xQ2dSYEsMD3kkMrthV7YzCwm4RtTgjBDh1
mLJpZk8mhpM6FdXXRNMPJ0t5WtCJhNI46dwKXL3QAmJUs39PVVUto5VI7exIU2WO
GWborctvkoEZzskdDiE+/UgGGKRS0CvoiJPR8srwwyjdMHdsuziJJaP3oap4aTVE
rREGsf2s2MFzTjkMyVEfwjsHYUWVO0BnHjgO/DPsl3abc6nWwcsQPy25PVv1SxH2
UVZXBSf8JHzp8MMJeDUEJQ0QKbK4zNSbaP9I9bMf3JzvAwME6F8rCtzKevj9W+VA
OJqzHBxuA2AUtJ5J/8fd
=CI4J
-----END PGP SIGNATURE-----

--cGn0fZIJon5R7R2H--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
