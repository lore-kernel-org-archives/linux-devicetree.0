From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v4 1/5] clk: sunxi: Add CLK_OF_DECLARE support for
 sun8i-a23-apb0-clk driver
Date: Tue, 1 Dec 2015 13:50:32 +0100
Message-ID: <20151201125032.GH29263@lukather>
References: <1448766190-11345-1-git-send-email-wens@csie.org>
 <1448766190-11345-2-git-send-email-wens@csie.org>
 <20151201100416.GF29263@lukather>
 <CAGb2v66bJJZ_xmD8B2X6nR3bxte9CdrnBpnd1KMRTmyRTr1KRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bygAmIonOAIqBxQB"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGb2v66bJJZ_xmD8B2X6nR3bxte9CdrnBpnd1KMRTmyRTr1KRQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
To: Chen-Yu Tsai <wens@csie.org>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-clk <linux-clk@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-sunxi <linux-sunxi@googlegroups.com>
List-Id: devicetree@vger.kernel.org


--bygAmIonOAIqBxQB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 01, 2015 at 07:54:06PM +0800, Chen-Yu Tsai wrote:
> On Tue, Dec 1, 2015 at 6:04 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Hi,
> >
> > On Sun, Nov 29, 2015 at 11:03:06AM +0800, Chen-Yu Tsai wrote:
> >> The APBS clock on sun9i is the same as the APB0 clock on sun8i. With
> >> sun9i we are supporting the PRCM clocks by using CLK_OF_DECLARE,
> >> instead of through a PRCM mfd device and subdevices for each clock
> >> and reset control. As such we need a CLK_OF_DECLARE version of
> >> the sun8i-a23-apb0-clk driver.
> >>
> >> Also, build it for sun9i/A80, and not just for configurations with
> >> MFD_SUN6I_PRCM enabled.
> >>
> >> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> >> ---
> >>  drivers/clk/sunxi/Makefile         |  5 +--
> >>  drivers/clk/sunxi/clk-sun8i-apb0.c | 71 +++++++++++++++++++++++++++++=
++-------
> >>  2 files changed, 62 insertions(+), 14 deletions(-)
> >>
> >> diff --git a/drivers/clk/sunxi/Makefile b/drivers/clk/sunxi/Makefile
> >> index cb4c299214ce..c55d5cd1c0e5 100644
> >> --- a/drivers/clk/sunxi/Makefile
> >> +++ b/drivers/clk/sunxi/Makefile
> >> @@ -15,6 +15,7 @@ obj-y +=3D clk-sun9i-core.o
> >>  obj-y +=3D clk-sun9i-mmc.o
> >>  obj-y +=3D clk-usb.o
> >>
> >> +obj-$(CONFIG_MACH_SUN9I) +=3D clk-sun8i-apb0.o
> >> +
> >
> > So sun8i doesn't use it?
>=20
> Shit... I messed up. clk-sun8i-apb0.o should also be under
> CONFIG_MFD_SUN6I_PRCM.
>=20
> I'll send a new version of this patch. No need to keep spamming
> people with the whole series.

Ok.

> >>  obj-$(CONFIG_MFD_SUN6I_PRCM) +=3D \
> >> -     clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o \
> >> -     clk-sun8i-apb0.o
> >> +     clk-sun6i-ar100.o clk-sun6i-apb0.o clk-sun6i-apb0-gates.o
> >> diff --git a/drivers/clk/sunxi/clk-sun8i-apb0.c b/drivers/clk/sunxi/cl=
k-sun8i-apb0.c
> >> index 7ae5d2c2cde1..c1e2ac8f4b0d 100644
> >> --- a/drivers/clk/sunxi/clk-sun8i-apb0.c
> >> +++ b/drivers/clk/sunxi/clk-sun8i-apb0.c
> >> @@ -17,13 +17,68 @@
> >>  #include <linux/clk-provider.h>
> >>  #include <linux/module.h>
> >>  #include <linux/of.h>
> >> +#include <linux/of_address.h>
> >>  #include <linux/platform_device.h>
> >>
> >> +static struct clk *sun8i_a23_apb0_register(struct device_node *node,
> >> +                                        void __iomem *reg)
> >> +{
> >> +     const char *clk_name =3D node->name;
> >> +     const char *clk_parent;
> >> +     struct clk *clk;
> >> +     int ret;
> >> +
> >> +     clk_parent =3D of_clk_get_parent_name(node, 0);
> >> +     if (!clk_parent)
> >> +             return ERR_PTR(-EINVAL);
> >> +
> >> +     of_property_read_string(node, "clock-output-names", &clk_name);
> >> +
> >> +     /* The A23 APB0 clock is a standard 2 bit wide divider clock */
> >> +     clk =3D clk_register_divider(NULL, clk_name, clk_parent, 0, reg,
> >> +                                0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
> >> +     if (IS_ERR(clk))
> >> +             return clk;
> >> +
> >> +     ret =3D of_clk_add_provider(node, of_clk_src_simple_get, clk);
> >> +     if (ret)
> >> +             goto err_unregister;
> >> +
> >> +     return clk;
> >> +
> >> +err_unregister:
> >> +     clk_unregister_divider(clk);
> >> +
> >> +     return ERR_PTR(ret);
> >> +}
> >> +
> >> +static void sun8i_a23_apb0_setup(struct device_node *node)
> >> +{
> >> +     void __iomem *reg;
> >> +     struct resource res;
> >> +     struct clk *clk;
> >> +
> >> +     reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> >> +     if (IS_ERR(reg))
> >> +             return;
> >> +
> >> +     clk =3D sun8i_a23_apb0_register(node, reg);
> >> +     if (IS_ERR(clk))
> >> +             goto err_unmap;
> >> +
> >> +     return;
> >> +
> >> +err_unmap:
> >> +     iounmap(reg);
> >> +     of_address_to_resource(node, 0, &res);
> >> +     release_mem_region(res.start, resource_size(&res));
> >> +}
> >> +CLK_OF_DECLARE(sun8i_a23_apb0, "allwinner,sun8i-a23-apb0-clk",
> >> +            sun8i_a23_apb0_setup);
> >> +
> >>  static int sun8i_a23_apb0_clk_probe(struct platform_device *pdev)
> >>  {
> >>       struct device_node *np =3D pdev->dev.of_node;
> >> -     const char *clk_name =3D np->name;
> >> -     const char *clk_parent;
> >>       struct resource *r;
> >>       void __iomem *reg;
> >>       struct clk *clk;
> >> @@ -33,19 +88,11 @@ static int sun8i_a23_apb0_clk_probe(struct platfor=
m_device *pdev)
> >>       if (IS_ERR(reg))
> >>               return PTR_ERR(reg);
> >>
> >> -     clk_parent =3D of_clk_get_parent_name(np, 0);
> >> -     if (!clk_parent)
> >> -             return -EINVAL;
> >> -
> >> -     of_property_read_string(np, "clock-output-names", &clk_name);
> >> -
> >> -     /* The A23 APB0 clock is a standard 2 bit wide divider clock */
> >> -     clk =3D clk_register_divider(&pdev->dev, clk_name, clk_parent, 0=
, reg,
> >> -                                0, 2, CLK_DIVIDER_POWER_OF_TWO, NULL);
> >> +     clk =3D sun8i_a23_apb0_register(np, reg);
> >>       if (IS_ERR(clk))
> >>               return PTR_ERR(clk);
> >>
> >> -     return of_clk_add_provider(np, of_clk_src_simple_get, clk);
> >> +     return 0;
> >>  }
> >
> > Won't this probe twice now? First the CLK_OF_DECLARE will register a
> > clock, and then the device model will call probe a second time.
>=20
> AFAIK it will.
>=20
> > I guess then request_mem_region will catch it, but then you return an
> > error code, which is probably an error success, since the clock is
> > registered :)
>=20
> Indeed. clk-mod0.c actually has a comment block explaining this.
> I didn't want to repeat the whole thing though.

I guess, we can simply return 0 if of_io_request_and_map returns
EBUSY, since it would simply mean that we already probed.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--bygAmIonOAIqBxQB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWXZeYAAoJEBx+YmzsjxAgeuIQAL9SZvog0cImpO416EpKMjKE
A9U1rfQpKaFbRXqly+Ar3qHJfdh39XSzaJ13toe4katVq+4iqAOY2HjKcWsaXZeS
nKq78sc69+sEqjw7qSg5YQ1hnbTV/GhaktYokNjbBYl0dXwZ3HIqopsM4MYy4WnH
lr/Ww/1jTDcMkpWCvnzZaAwtqNzPecw/mSSmuIOF8Rw9bw7z5+SE/pqyr5ksYjBp
1L60G/wNJMoSO7ibF7WLpKQP05Gbrhm7q5hqGKc8wYa1h7m48B2KdteQIipBdhpi
fKXterqhkKlhGM7zB81QU2+tO9OERYXdVUpCmUYplQv2jGIcxQdMK7a0YuZh23A1
cO4Qt6bR2dnZBQ/ziR6QaCviliBb/SpaZwoWEgpARTwBb7I7VGK3MiJoUzpvyeJu
8FzhnfWY0OiQN030Pi7YFD3DoxAZkqt4eHGNi8x/YVUg4vTgcWzEui14TlfbwUG/
DOHxUuZY53dJb7YmcJs+ct+NWEYvLGl7ghbI3dZMvLXmMk9PmzI+4tWPmkTgi1EB
zj31uhyMq0Tbi4Fbkcv+uu9mWdLS4Lx+RKG3zP7h+9e7ijDqqtkUzl83ZOvn7fLz
m8ZUpsFOcdUSWJ3tgxOVwOEKXB3Jnx1YhZSq1HIAduaj/Yw+e6Yla4z9nSvGCCtS
3FWNlNlblCYsdOjP3b5j
=ZWQ4
-----END PGP SIGNATURE-----

--bygAmIonOAIqBxQB--
