From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/9] pinctrl: sunxi: Deal with configless pins
Date: Fri, 7 Oct 2016 11:02:53 +0200
Message-ID: <20161007090253.GL4684@lukather>
References: <cover.26c6f76b361d146fb079d744251f020ef6d2db7d.1475489558.git-series.maxime.ripard@free-electrons.com>
 <8b72a134d957afdee6de48ec2c1891d8bba1b9e3.1475489558.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v654vv3B-OhHPgdLjsEOf0zPP=Ky1_+o=8mf9dZHMFjR-w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="w2xx78T4DcG3O+DJ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v654vv3B-OhHPgdLjsEOf0zPP=Ky1_+o=8mf9dZHMFjR-w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--w2xx78T4DcG3O+DJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 04, 2016 at 10:28:18AM +0800, Chen-Yu Tsai wrote:
> >         if (sunxi_pctrl_has_drive_prop(node)) {
> >                 int drive =3D sunxi_pctrl_parse_drive_prop(node);
> > -               if (drive < 0)
> > +               if (drive < 0) {
> > +                       ret =3D -EINVAL;
>=20
> Why not just pass the error code returned from the parse function?

Yep, I'll change that.

> > -               (*map)[i].type =3D PIN_MAP_TYPE_CONFIGS_GROUP;
> > -               (*map)[i].data.configs.group_or_pin =3D group;
> > -               (*map)[i].data.configs.configs =3D pinconfig;
> > -               (*map)[i].data.configs.num_configs =3D configlen;
> > -
> > -               i++;
> > +               if (pinconfig) {
> > +                       (*map)[i].type =3D PIN_MAP_TYPE_CONFIGS_GROUP;
> > +                       (*map)[i].data.configs.group_or_pin =3D group;
> > +                       (*map)[i].data.configs.configs =3D pinconfig;
> > +                       (*map)[i].data.configs.num_configs =3D configle=
n;
> > +                       i++;
> > +               }
> >         }
> >
> > -       *num_maps =3D nmaps;
> > +       *num_maps =3D i;
>=20
> Thought: should we do a krealloc to shrink the array?

Yep, I'll make an additional patch to fix that.

>=20
> >
> >         return 0;
> >
> > @@ -342,8 +357,13 @@ static void sunxi_pctrl_dt_free_map(struct pinctrl=
_dev *pctldev,
> >                                     struct pinctrl_map *map,
> >                                     unsigned num_maps)
> >  {
> > +       unsigned long *pinconfig;
> > +
> >         /* All the maps have the same pin config, free only the first o=
ne */
> > -       kfree(map[0].data.configs.configs);
> > +       pinconfig =3D map[0].data.configs.configs;
> > +       if (pinconfig)
> > +               kfree(pinconfig);
>=20
> Passing NULL to kfree is allowed. (It becomes a no-op.)
> So you could leave this function alone.

And I'll change that as well.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--w2xx78T4DcG3O+DJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX92S9AAoJEBx+YmzsjxAgdaoQAId8+y/Xj6v9urtPhjuvPF9L
Ax7no0ypLj3ZjZ9zJG3oCBYfOQr/cc36ndtM+upVZgfeDihPC/5ZnTREwkQTvQp/
4T6pC1ZROuzTRcHaeM/98X7/NQBfiRyfJ2fnsQ1F+RqBgmVVQChixgZa1t7lZg23
dww39cg+DwSItPF+gWgoE95JKc1OLj4fF1Gvlc4dYyZ3iadPbz30+lQ7Rfnbtswg
sXCPPo/WCwHKmeVOOX3Xh4equ9RASEnu4cCjCe2DrLC2HpC5OLHC+bqBzcqavmSz
k6Z/tw+KiPMl9QGCPWgDP0CUAVH2kxamuud8LucwVDQTVYsevjM2UYJxsc4k29aQ
IfWfDPFfZU0QktUrUnt7VkzcDvfwaDz6jCiFqNw7qs4+88Mn/yQZj6D0HKltJoQg
IFladk5WyULzhE7Ak5lLRJqIqNBzx+LZkETRyg0RUW/62yJp/D4xtwjnhdCYtHKs
KgiYWq7XNhfsQ7x8PbQq2EuCTIos3iCWJ+70SFJik630gTRvURuuYax6pm0SO1hG
xb1htpEGukByY23E71H9tlQvfFkop4Of/0/1OwxmHNm1K7+OFymb6D3lgQ4xa5EC
kD1PHadqqIYteBapu9OVXfeIpdCU0//MTxQMyv9zU+CHTpkgmTS00M3JO6cnvmgC
fooBESwo9DmIKrFNPNz9
=INML
-----END PGP SIGNATURE-----

--w2xx78T4DcG3O+DJ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
