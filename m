From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v2 14/15] clk: sunxi-ng: Add H3 clocks
Date: Sun, 26 Jun 2016 14:34:09 +0200
Message-ID: <20160626123409.GK4000@lukather>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
 <20160607204154.31967-15-maxime.ripard@free-electrons.com>
 <146681451703.35033.17009542256505173233@resonance>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tBhgiDt8dP1efIIJ"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <146681451703.35033.17009542256505173233@resonance>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Jean-Francois Moine <moinejf@free.fr>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org


--tBhgiDt8dP1efIIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Fri, Jun 24, 2016 at 05:28:37PM -0700, Michael Turquette wrote:
> Hi Maxime,
>=20
> Nice series! Looks really great to me. :-)

Great :)

> Quoting Maxime Ripard (2016-06-07 13:41:53)
> > +static SUNXI_CCU_NKMP_WITH_GATE_LOCK(pll_cpux_clk, "pll-cpux",
> > +                                    "osc24M", 0x000,
> > +                                    8, 5,      /* N */
> > +                                    4, 2,      /* K */
> > +                                    0, 2,      /* M */
> > +                                    16, 2,     /* P */
> > +                                    BIT(31),   /* gate */
> > +                                    BIT(28),   /* lock */
> > +                                    0);
>=20
> I'm more of a fan of expanding the struct with designated initializers
> versus macro use, but that's only personal preference.

Chen-Yu was very much in favour of having everything defined by
macros, I didn't care that much either, so I guess he wins :)

> > +static const char * const ahb2_parents[] =3D { "ahb1" , "pll-periph0" =
};
> > +static struct ccu_mux ahb2_clk =3D {
> > +       .mux            =3D {
> > +               .shift  =3D 0,
> > +               .width  =3D 1,
> > +
> > +               .fixed_prediv   =3D {
> > +                       .index  =3D 1,
> > +                       .div    =3D 2,
> > +               },
> > +       },
> > +
> > +       .common         =3D {
> > +               .reg            =3D 0x05c,
> > +               .features       =3D CCU_FEATURE_FIXED_PREDIV,
> > +               .hw.init        =3D SUNXI_HW_INIT_PARENTS("ahb2",
> > +                                                       ahb2_parents,
>=20
> Note that it's possible to initialize the parent strings here if you
> prefer:
>=20
> 	.hw.init =3D &(struct clk_init_data){
> 		   .parent_names =3D (const char *[]){ "ahb1",
> 		   				     "pll-periph0" };
>
> Similar to the above, no big deal, just an observation.

A significant bunch of our clocks have the same parent list. Passing
the parent array allows to reuse the same arrays for those, so I'd
really like that over having VA_ARGS based macros (and that would put
the list of parents at the end of the declaration, which seems weird).
=20
> > +static struct ccu_common *sun8i_h3_ccu_clks[] =3D {
> > +       [CLK_PLL_CPUX]          =3D &pll_cpux_clk.common,
> > +       [CLK_PLL_AUDIO_BASE]    =3D &pll_audio_base_clk.common,
> > +       [CLK_PLL_AUDIO]         =3D &pll_audio_clk.common,
>=20
> OK, it looks like you followed the qcom clk driver approach here, which
> is a nice way to do things. However, as Stephen alluded to in his
> response to the cover letter, the clk_hw_* api's are an even more
> friendly interface for clock providers. For example, check out the gxbb
> clk driver probe:
>=20
> 	static int gxbb_clkc_probe(struct platform_device *pdev)
> 	{
> 		void __iomem *clk_base;
> 		int ret, clkid, i;
> 		struct device *dev =3D &pdev->dev;
> =09
> 		/*  Generic clocks and PLLs */
> 		clk_base =3D of_iomap(dev->of_node, 0);
> 		if (!clk_base) {
> 			pr_err("%s: Unable to map clk base\n", __func__);
> 			return -ENXIO;
> 		}
> =09
> 		/* Populate base address for PLLs */
> 		for (i =3D 0; i < ARRAY_SIZE(gxbb_clk_plls); i++)
> 			gxbb_clk_plls[i]->base =3D clk_base;
> =09
> 		/* Populate base address for MPLLs */
> 		for (i =3D 0; i < ARRAY_SIZE(gxbb_clk_mplls); i++)
> 			gxbb_clk_mplls[i]->base =3D clk_base;
>=20
> 		...
>=20
> 		/*
> 		 * register all clks
> 		 */
> 		for (clkid =3D 0; clkid < NR_CLKS; clkid++) {
> 			ret =3D devm_clk_hw_register(dev, gxbb_hw_onecell_data.hws[clkid]);
> 			if (ret)
> 				goto iounmap;
> 		}

Ok, I'll move the fixed factor clocks out of the common list, and
initialize the clk_hw_onedata_cell structure to register it.

> The nice thing about struct ccu_common is that you don't have to walk
> the list of clocks for each separate clock type like the above probe
> function does. I'm still thinking of the best way to solve this
> generically. Maybe add a .base member struct clk_hw? I dunno, and I've
> resisted the urge to add stuff to struct clk_hw in the past... But I
> really want to minimize this .probe as much as possible, and I do not
> want every clock provider driver to be forced to invent something like
> struct ccu_common every time.

We'd need a few more things (in this case) at least: the register
offset and a private field to store our flags.

> Anyways, that is not a blocker for your implementation to be merged,
> but Stephen's question in patch #4 got me thinking about this
> again...
>=20
> The real nice part is the call to devm_clk_hw_register. That uses the
> new clk_hw_* apis and struct clk_hw_onecell_data, which is initialized
> statically like so:
>=20
> 	static struct clk_hw_onecell_data gxbb_hw_onecell_data =3D {
> 		.hws =3D {
> 			[CLKID_SYS_PLL]	     =3D &gxbb_sys_pll.hw,
> 			[CLKID_CPUCLK]	      =3D &gxbb_cpu_clk.hw,
> 			...
> 		},
> 		.num =3D NR_CLKS,
> 	};
>=20
> Unfortunately I believe it impossible to replace NR_CLKS with some
> ARRAY_SIZE stuff because C. As Stephen mentioned, please use this method
> instead.

That's unfortunate :/

> > diff --git a/include/dt-bindings/clock/sun8i-h3.h b/include/dt-bindings=
/clock/sun8i-h3.h
> > new file mode 100644
> > index 000000000000..96eced56e7a2
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/sun8i-h3.h
> > @@ -0,0 +1,162 @@
> > +#ifndef _DT_BINDINGS_CLK_SUN8I_H3_H_
> > +#define _DT_BINDINGS_CLK_SUN8I_H3_H_
> > +
> > +#define CLK_PLL_CPUX           0
> > +#define CLK_PLL_AUDIO_BASE     1
> > +#define CLK_PLL_AUDIO          2
> > +#define CLK_PLL_AUDIO_2X       3
> > +#define CLK_PLL_AUDIO_4X       4
>=20
> Are you sure you want to expose all of these clocks as part of the ABI?
> I exposed the bare minimum clocks for the gxbb driver in the DT shared
> header (we can always add more later) and kept the rest internal to the
> kernel source.

I thought about it, but that would require a third array with
basically the same clocks:

  * the ccu_common array to patch to set the lock and base pointers,
  * the list of clocks to register
  * the clk_hw_onecell_data to deal with the dt binding.

That seems a bit overkill.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--tBhgiDt8dP1efIIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXb8vBAAoJEBx+YmzsjxAg5aEQALzdbPIs97uHxiB1LP9i3K8s
yzDXmfluQOBOA2rdZhQe8oAfmqUpj2TcQPLprh+FcMYDqB8UIYhkOODtg6xrtJVk
ygmY9gwHLUPXpBAsCv1Lh6ggZgUB6IMyv9Vu7DAhGeQZcnc/23ouhgDP+tJznjoQ
9uaPAQ1vnFT+/5d+iWYFn/sBH1N5Bmk001QmdRs1sDNG3H+IjW3GGUg2kdupylLQ
KVjNWXKARIkGqpo3AcfOWbG86rDLLbi/hqNOcCumibEekdK+2rT0XAIiyLPyOQ6a
qv9kruO0Od7B87fSbzGjTduAR/d6Lhq8sSIv8j2P1DRmV4il/3Yc4AZ6jdOgZY4x
/6mT9/F9TZpDLxr2rDKaKcEUaOoWtEbcaZz3+xZUCfDJrVA/8tUtjllTp47YR4Ab
BO5OzKmA5XxqXNat46OXsJpRBROWA07qpaLUkiC25A0BFCLCU5sy97gHTeUrFCYt
9O1dlCjc8ffCd0DL9ln2IJGJoOrd85jpK2k0t7kST5s5VgJOltQX22j+OsqepeL0
q1TM5Sj+trG1Gg18V4spxbs+ImpTHEPA0feSYxnAc55rC48JRjXUCKMuHZf4ztYz
NSOJodcwtVuFWH7oI/NpBhdml1rzklG6zgNnG2BW4hchiYqvWnB+ucWnfmkiGPpD
TdgvMpjn47024BJwm1x+
=WZxn
-----END PGP SIGNATURE-----

--tBhgiDt8dP1efIIJ--
