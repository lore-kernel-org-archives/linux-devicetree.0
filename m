From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: topology: Use a clock if possible to get the
 CPU frequency
Date: Mon, 30 Jun 2014 16:01:46 +0200
Message-ID: <20140630140146.GD28647@lukather>
References: <1404123143-13041-1-git-send-email-maxime.ripard@free-electrons.com>
 <1404123143-13041-2-git-send-email-maxime.ripard@free-electrons.com>
 <20140630102934.GV32514@n2100.arm.linux.org.uk>
 <CAKfTPtC+XcH122AytyZ=x1JVx9THmxCasJLA3Z1e17X_OmH1xA@mail.gmail.com>
 <20140630124919.GC28647@lukather>
 <CAKfTPtCgpc1J888hbqxoaF5UfcUoRwcpokme32WHPpsPAAawUQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ieNMXl1Fr3cevapt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKfTPtCgpc1J888hbqxoaF5UfcUoRwcpokme32WHPpsPAAawUQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--ieNMXl1Fr3cevapt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2014 at 03:27:21PM +0200, Vincent Guittot wrote:
> >> >> -             rate =3D of_get_property(cn, "clock-frequency", &len);
> >> >> -             if (!rate || len !=3D 4) {
> >> >> -                     pr_err("%s missing clock-frequency property\n=
",
> >> >> -                             cn->full_name);
> >> >> +             clk =3D of_clk_get(cn, 0);
> >> >> +             if (!IS_ERR(clk))
> >> >> +                     rate =3D clk_get_rate(clk);
> >>
> >> We need the max frequency as it will be used to weight the different
> >> CPUs capacity. How do you ensure that the current clock rate is the
> >> max one ?
> >
> > Hmm, the clock-frequency attribute in the ePAPR is defined at the
> > current CPU frequency, not the max one.
>=20
> What means current frequency in device tree when DVFS is involved ?

The ePAPR states that clock-frequency is supposed to be "the current
clock speed of the CPU in Hertz". It's exactly what my patch add.

Now, you're right, DVFS would be an issue here with clock-frequency,
but this patch actually makes it easier to deal with, since you only
get a reference to a clock, and you can get its rate at any given
time.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ieNMXl1Fr3cevapt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJTsW3KAAoJEBx+YmzsjxAguNAP/iqCIiOwveqr8Ej3jxnUe8B9
mQJUCChgRcS93Y3z+KHDsz2n9zHvvTN9SQ94cgAXzIq8sVbkvL9mX3SFz1zVjWYY
QGx3F4Ckoi4rnmPkO596MFEpJeuK33yn1SvJ0AcU170h8iKKBMv9xKkxfjfrn/do
M7uTwFZuI6HzuSJ+qvu5t9iKoW/Yk3FsLrNx1NOaARJLk5Y5LLvCab7zBn+i/BgJ
pIwTn8Z56MMpJe6P+ZwZjnZYrTVwX4ZXc6IPw28T2cVOJcsREx5iiyzMSNSjHzcE
/6n287i+wvq8YxKgUcjMI7o/SgP0kUzaieIn96ATRg3qCWZUabEPzj2e1RFEOp8R
7vI3hGOz9vDO2veiHYEvk94EM5jDQKyfFh+9Th77B8yYg+9Cnz7IhZchLRevQ9KP
05U7/lMHGzptXeubM9ZzG+o8DSNlMk7ub1i6eX3+ccgR+57AUOb2IWj7wvwxsMKQ
Np/U0qxCiVt7m1J7gPuJdYZpPqG09mpcfZFDmzQNkCtJSZDNGWW7pVb7kPk3YG8/
1bHYrx72jjLwcrrdUMaWaHM0F007DqunAX9UAQ4C8A3jGNe7JpFZ2lw3Ul3nMaY/
Nk+2O1MWawJtUm9NbqrxaoltCf3Ml8jYQt1qV8NkiWUDt7DbtLajOz6Fr64MpJzC
eAot3S9Q5MmzwFkz12yn
=7LYx
-----END PGP SIGNATURE-----

--ieNMXl1Fr3cevapt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
