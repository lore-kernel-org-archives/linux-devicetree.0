From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: topology: Use a clock if possible to get the
 CPU frequency
Date: Fri, 4 Jul 2014 10:02:55 +0200
Message-ID: <20140704080255.GO31996@lukather>
References: <20140630102934.GV32514@n2100.arm.linux.org.uk>
 <CAKfTPtC+XcH122AytyZ=x1JVx9THmxCasJLA3Z1e17X_OmH1xA@mail.gmail.com>
 <20140630124919.GC28647@lukather>
 <CAKfTPtCgpc1J888hbqxoaF5UfcUoRwcpokme32WHPpsPAAawUQ@mail.gmail.com>
 <20140630140146.GD28647@lukather>
 <CAKfTPtAu+mSVO8dvg_Z6w_nYWndap+FY5VGKeg-0pae_4JqR=A@mail.gmail.com>
 <20140630145847.GE28647@lukather>
 <CAKfTPtDvQJ5i=t8FN0gLQex0yAC4NNgewTnGKdiCeGk7nQwZYg@mail.gmail.com>
 <20140703071016.GB31996@lukather>
 <CAKfTPtBonwH0PoEkKazUS9bPaR631Vu7p7qZ0AF1whmXq_53wg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s9kDAZ2EyO0AcRYa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtBonwH0PoEkKazUS9bPaR631Vu7p7qZ0AF1whmXq_53wg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--s9kDAZ2EyO0AcRYa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 03, 2014 at 09:51:27AM +0200, Vincent Guittot wrote:
> On 3 July 2014 09:10, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wr=
ote:
> > On Mon, Jun 30, 2014 at 05:06:16PM +0200, Vincent Guittot wrote:
> >> On 30 June 2014 16:58, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org=
> wrote:
> >> > On Mon, Jun 30, 2014 at 04:48:35PM +0200, Vincent Guittot wrote:
> >> >> On 30 June 2014 16:01, Maxime Ripard <maxime.ripard@free-electrons.=
com> wrote:
> >> >> > On Mon, Jun 30, 2014 at 03:27:21PM +0200, Vincent Guittot wrote:
> >> >> >> >> >> -             rate =3D of_get_property(cn, "clock-frequenc=
y", &len);
> >> >> >> >> >> -             if (!rate || len !=3D 4) {
> >> >> >> >> >> -                     pr_err("%s missing clock-frequency p=
roperty\n",
> >> >> >> >> >> -                             cn->full_name);
> >> >> >> >> >> +             clk =3D of_clk_get(cn, 0);
> >> >> >> >> >> +             if (!IS_ERR(clk))
> >> >> >> >> >> +                     rate =3D clk_get_rate(clk);
> >> >> >> >>
> >> >> >> >> We need the max frequency as it will be used to weight the di=
fferent
> >> >> >> >> CPUs capacity. How do you ensure that the current clock rate =
is the
> >> >> >> >> max one ?
> >> >> >> >
> >> >> >> > Hmm, the clock-frequency attribute in the ePAPR is defined at =
the
> >> >> >> > current CPU frequency, not the max one.
> >> >> >>
> >> >> >> What means current frequency in device tree when DVFS is involve=
d ?
> >> >> >
> >> >> > The ePAPR states that clock-frequency is supposed to be "the curr=
ent
> >> >> > clock speed of the CPU in Hertz". It's exactly what my patch add.
> >> >> >
> >> >> > Now, you're right, DVFS would be an issue here with clock-frequen=
cy,
> >> >> > but this patch actually makes it easier to deal with, since you o=
nly
> >> >> > get a reference to a clock, and you can get its rate at any given
> >> >> > time.
> >> >>
> >> >> and what about using clk_round_rate(clk, ULONG_MAX) ?
> >> >
> >> > Well, the clock itself might generate a frequency higher that what t=
he
> >> > CPU can run at, so I'm not sure it's a valid assumption.
> >>
> >> yes, you're right
> >>
> >> >
> >> >> We will not be dependent of when we parse DT
> >> >
> >> > You lost me there. clk_round_rate and clk_get_rate are available at
> >> > the same time in the boot process, aren't they?
> >>
> >> yes, but  clk_round_rate(clk, ULONG_MAX) will return the max frequency
> >> and not the current one. But as you mentioned, it doesn't ensure that
> >> it's a possible frequency for the core
> >
> > Is this an Acked-by ?
>=20
>  I still think that using the current rate with clk_get_rate is not a
> good solution.

Well, it's just as good as using clock-frequency, really. If you want
the CPU max frequency, it's not the right property (plus, since the
changed behaviour is not documented in Linux anywhere, the only
reference we have is the ePAPR on this).

> Could you give us more details about why you nee to use current clock ?

Honestly, I just want to remove that big warning at boot on the
A7-based SoCs we have :)

> AFAICT, your patch only makes sense for HMP system which don't have
> DVFS, is it your case ?

Nope, it's just plain simple SMP.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--s9kDAZ2EyO0AcRYa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTtl+vAAoJEBx+YmzsjxAgxgUP/1j6+84Adkox0ZBVZwtw1zZF
xvKmmVOna829n927R4wuVO2GOklh/4za0ripviivv+ct4iLxuCU0Ng/FGf/QdbWB
09ljPAy1VZWjUy3NXokj9dtsTN82xXPiPCEMtEaZnDJOltgXwZIl42xYanlqvxOV
S/dHEwfp4h/iuTDULnUeMQUGyio6nTAjXH4EHVwS/RzcKdmH+VGxLuSvA7DaELEB
oaOZqGIszSKG21yMs9cQ8yUfAWbV4QnMKGdlWK+YUpwj2OlqbMoxZjlckyBEwmin
6XflwZYzIq1x2XqtRDO2H0FyktmZVV+HVZ3Nm8ywUDZN1k+fwD39Hggnz7wGNt4i
JiRg2S1+dn+kk+5T7bhVTBFoLrZFBYbAezZrmLbPxAxTGDRZdbz/VkjUlJtd8Kto
zrHdP7aRwK5Rt9aAaNSVETJx8YUoemEAw5u69YD4QWVK8EHmznadwfRFziUVvvAc
BSM4o18tGEl4jBIXlgxo8KsGJBmcxFC2tYwuyQzfPGkX1iwEPYuR6UpLmMPaIA2H
gyee5YHiC1zIo9cFe4bKbEGhH7P06Wq2WCINBD9E+7Fs3G6ulV1AB2LHp4r6yKde
y3KXcOFEX8MjpLGt/LjpCz0ZK+a0cAbRdD34Tcyl4VMUDhYsxYtFb8K9HTxMfwa1
Y3/rWXg6DTSRE9rYybNK
=5Zf7
-----END PGP SIGNATURE-----

--s9kDAZ2EyO0AcRYa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
