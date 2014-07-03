From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: topology: Use a clock if possible to get the
 CPU frequency
Date: Thu, 3 Jul 2014 09:10:16 +0200
Message-ID: <20140703071016.GB31996@lukather>
References: <1404123143-13041-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404123143-13041-2-git-send-email-maxime.ripard@free-electrons.com>
 <20140630102934.GV32514@n2100.arm.linux.org.uk>
 <CAKfTPtC+XcH122AytyZ=x1JVx9THmxCasJLA3Z1e17X_OmH1xA@mail.gmail.com>
 <20140630124919.GC28647@lukather>
 <CAKfTPtCgpc1J888hbqxoaF5UfcUoRwcpokme32WHPpsPAAawUQ@mail.gmail.com>
 <20140630140146.GD28647@lukather>
 <CAKfTPtAu+mSVO8dvg_Z6w_nYWndap+FY5VGKeg-0pae_4JqR=A@mail.gmail.com>
 <20140630145847.GE28647@lukather>
 <CAKfTPtDvQJ5i=t8FN0gLQex0yAC4NNgewTnGKdiCeGk7nQwZYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtDvQJ5i=t8FN0gLQex0yAC4NNgewTnGKdiCeGk7nQwZYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 05:06:16PM +0200, Vincent Guittot wrote:
> On 30 June 2014 16:58, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> w=
rote:
> > On Mon, Jun 30, 2014 at 04:48:35PM +0200, Vincent Guittot wrote:
> >> On 30 June 2014 16:01, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
> wrote:
> >> > On Mon, Jun 30, 2014 at 03:27:21PM +0200, Vincent Guittot wrote:
> >> >> >> >> -             rate =3D of_get_property(cn, "clock-frequency",=
 &len);
> >> >> >> >> -             if (!rate || len !=3D 4) {
> >> >> >> >> -                     pr_err("%s missing clock-frequency prop=
erty\n",
> >> >> >> >> -                             cn->full_name);
> >> >> >> >> +             clk =3D of_clk_get(cn, 0);
> >> >> >> >> +             if (!IS_ERR(clk))
> >> >> >> >> +                     rate =3D clk_get_rate(clk);
> >> >> >>
> >> >> >> We need the max frequency as it will be used to weight the diffe=
rent
> >> >> >> CPUs capacity. How do you ensure that the current clock rate is =
the
> >> >> >> max one ?
> >> >> >
> >> >> > Hmm, the clock-frequency attribute in the ePAPR is defined at the
> >> >> > current CPU frequency, not the max one.
> >> >>
> >> >> What means current frequency in device tree when DVFS is involved ?
> >> >
> >> > The ePAPR states that clock-frequency is supposed to be "the current
> >> > clock speed of the CPU in Hertz". It's exactly what my patch add.
> >> >
> >> > Now, you're right, DVFS would be an issue here with clock-frequency,
> >> > but this patch actually makes it easier to deal with, since you only
> >> > get a reference to a clock, and you can get its rate at any given
> >> > time.
> >>
> >> and what about using clk_round_rate(clk, ULONG_MAX) ?
> >
> > Well, the clock itself might generate a frequency higher that what the
> > CPU can run at, so I'm not sure it's a valid assumption.
>=20
> yes, you're right
>=20
> >
> >> We will not be dependent of when we parse DT
> >
> > You lost me there. clk_round_rate and clk_get_rate are available at
> > the same time in the boot process, aren't they?
>=20
> yes, but  clk_round_rate(clk, ULONG_MAX) will return the max frequency
> and not the current one. But as you mentioned, it doesn't ensure that
> it's a possible frequency for the core

Is this an Acked-by ?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTtQHXAAoJEBx+YmzsjxAgB9YP/3k9caqssNv1+lNoBw84+9Sr
E/6qXbwE9IcF0x5AMuOYqkMiFVRfFaudXzmb8ULfHnbqiyg57BfFGef8NzVMyrjJ
kegevydqryIjDrRomEvLGVn4VzER9wy3PShtQ1jlFmkVFJ1P4w0uhKSHUekWOSrC
lnNHteq1v1snOoX7xmJjX58p0YyCGn+/45lkjlc5cgDMy194FDWtyrwOlhPawMQR
nzJY4q/dhtXsP9K+X6FX3DsGh5nGaR1dX+WP3FQFAxgd2Rw2f2B/HzA/eEHaYxNj
p3yKU0TeZf3Ge8Ed1Y/JKLb4t+x0M/DNWmg4HE/5i9zliYrdnWuKzVgNjuwyIZdU
Ac5W/B3p5UHx8Jt4eDEZbP2esjHAfyRqS5lRK+gnlJlxq4xI3KxYb2USnNIFKNRv
nTIy7FGOK6cxbA39Wd/XIdO/YBjeTgQYU1W7eV2Qjc78hVtdU98TP9wnfVfuxC0W
Y3zS1e3vjkr65hQZmmJiLLrNVNSnFCAy0tel59jiGVipqTWFnJcxw+uCZK7R2em2
LpyL8ReIknQaDZNxE6J22fOoQOAm1bIMN8P88yo2maY+oH4BaBJ8cd/Gvi5h78N2
Yvy1TRnzw4+oEEccJ0u3km8FCg+oL84vXfOAf5upKaUAv7B9df8pY/It2G7wErXw
gCKofezcGEjTMxd0ULDp
=CZr1
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
