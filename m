From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v6 3/8] ARM: sunxi: Move the clock
 protection to machine hooks
Date: Wed, 23 Apr 2014 15:17:20 +0200
Message-ID: <20140423131720.GS24905@lukather>
References: <1397724379-15398-1-git-send-email-maxime.ripard@free-electrons.com>
 <1397724379-15398-4-git-send-email-maxime.ripard@free-electrons.com>
 <201404231439.02913.arnd@arndb.de>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="LmUdgXdNLPkN/XLh"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBA7432NAKGQE3WGVMEA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201404231439.02913.arnd-r2nGTMty4D4@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, andriy.shevchenko-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, zhuzhenhua-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, shuge-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, kevin.z.m.zh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sunny-0TFLnhJekD6UEPyfVivIlAC/G2K4zDHf@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--LmUdgXdNLPkN/XLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2014 at 02:39:02PM +0200, Arnd Bergmann wrote:
> On Thursday 17 April 2014, Maxime Ripard wrote:
> > Since we start to have a lot of clocks to protect, some of them in a fe=
w boards
> > only, it becomes difficult to handle the clock protection without havin=
g to add
> > per machine exceptions.
> >=20
> > Move these where they belong, in the machine definition code.
> >=20
> > Signed-off-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
>=20
> I don't like the fact that these are required to be hardcoded
> anywhere in source code.

I agree, but that would also mean having a driver for everything that
would need a clock: a CPU, the RAM. I'm not sure we want that either.

> > +#include <linux/clk.h>
> >  #include <linux/init.h>
> >  #include <linux/of_platform.h>
> > =20
> > @@ -19,9 +20,17 @@
> > =20
> >  static void __init sun4i_dt_init(void)
> >  {
> > +       struct clk *clk;
> > +
> >         sunxi_setup_restart();
> > =20
> >         of_platform_populate(NULL, of_default_bus_match_table, NULL, NU=
LL);
> > +
> > +       /* Make sure the clocks we absolutely need are enabled */
> > +       /* DDR clock */
> > +       clk =3D clk_get(NULL, "pll5_ddr");
> > +       if (!IS_ERR(clk))
> > +               clk_prepare_enable(clk);
> >  }
>=20
> Isn't there already DT syntax to do the same? If not, should there be?

I don't think there is, and I gave some thought about it too. But
something a la regulator-always-on wouldn't work with clocks with
multiple outputs (like pll5), because you might need to leave only one
of the output enabled, but not the others, and I couldn't think of a
nice way to do so.

If you have one, I'd be happy to implement it.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--LmUdgXdNLPkN/XLh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTV71gAAoJEBx+YmzsjxAgirgP/ivYNpFtkQxLgAKPmLJu7M10
1zRVRHJCS88ETnyQ5AQ47jaxF1l0cpH7ZWjEIOMd0bNFwBn9KzOcBuB+e6B90bDi
RjmzXORtf0CqL5DY9juBjTBItfSgjPszQbzmBAhq07cvttXPOb1gH75BMdjl0tf4
d/bv8bW++drhRw4CvTee6pKSLCKZUGGo6mki9UKzRzs8Guow9VPU60Z1ME/R98eT
KrYzRvFTMgWgUnOdZaXtZ0QXk0ueJlqZ3LWX+d+8YefFYt2vTVrU0n3PX1QkH6wf
XO7Qw5dw3RHpE/i3IXHjCdLT9elcCwCbPi9ANCHlaA0NysBb27EYZhskWhcL0i7g
no7gBlrSce8Bu+JbopYQ93MHICY3YMz4nq7CKawniJ6c9zSuJC+jpk6JqzPQtif0
bnGR2hwUv7xXsV3j8NPW330xCcQjISb0+O8lPog18KnDwzij1pM0J8yikP80vORD
WvlAYiezbXTB1rNhpkW9uog0KeNWNyxYyNdtPvndKUv0BdZRlEokHvF7xiZWSKJA
DVHvSgR72a8q+VuPhjzBZYHwxkkNnCWgW0QoYPfAFs2ctgPxGUpsNANj3ftXAvH7
oBmhI1HtfmhEcJTPNENAlCKd2KbggUwdjwCXjChiHsx5CrVSJuKe9eG50mqmCOYm
x2UnqH4ocrLnXGfVBbGF
=EvyB
-----END PGP SIGNATURE-----

--LmUdgXdNLPkN/XLh--
