From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 13/14] clk: sunxi-ng: Add H3 clocks
Date: Mon, 11 Jul 2016 22:26:32 +0200
Message-ID: <20160711202632.GG4589@lukather>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
 <20160629190535.11855-14-maxime.ripard@free-electrons.com>
 <146785878822.73491.15164592643568518865@resonance>
 <20160708213506.GD4522@lukather>
 <146802703641.73491.4992163597821488987@resonance>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ndw/alBWmZEhfcZ"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <146802703641.73491.4992163597821488987@resonance>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>
List-Id: devicetree@vger.kernel.org


--4ndw/alBWmZEhfcZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Fri, Jul 08, 2016 at 06:17:16PM -0700, Michael Turquette wrote:
> Quoting Maxime Ripard (2016-07-08 14:35:06)
> > Hi Mike,
> >=20
> > On Wed, Jul 06, 2016 at 07:33:08PM -0700, Michael Turquette wrote:
> > > Hi Maxime,
> > >=20
> > > Quoting Maxime Ripard (2016-06-29 12:05:34)
> > > > +static void __init sun8i_h3_ccu_setup(struct device_node *node)
> > > > +{
> > > > +       void __iomem *reg;
> > > > +       u32 val;
> > > > +
> > > > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(no=
de));
> > > > +       if (IS_ERR(reg)) {
> > > > +               pr_err("%s: Could not map the clock registers\n",
> > > > +                      of_node_full_name(node));
> > > > +               return;
> > > > +       }
> > > > +
> > > > +       /* Force the PLL-Audio-1x divider to 4 */
> > > > +       val =3D readl(reg + SUN8I_H3_PLL_AUDIO_REG);
> > > > +       val &=3D ~GENMASK(4, 0);
> > > > +       writel(val | 3, reg + SUN8I_H3_PLL_AUDIO_REG);
> > > > +
> > > > +       sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> > > > +}
> > > > +CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
> > > > +              sun8i_h3_ccu_setup);
> > >=20
> > > There are several examples of drivers that split the clocks between
> > > "early" CLK_OF_DECLARE clocks and "late" module clocks. If you really
> > > need early clocks (which is less likely on a 64-bit platform with
> > > architected timers), it would be nice to pair that with a proper
> > > platform_driver (using builtin_platform_driver most likely).
> >=20
> > I think we discussed that already, but yeah, we do have timers that
> > are not the architected ones (and this is a ARMv7 platform). I have
> > the feeling that splitting the two doesn't really bring any benefit,
> > but complexify a lot the driver.
>=20
> Cool. I've pushed patches 1-13 to the clk tree under a shared, immutable
> branch: clk-sunxi-ng
>=20
> I've merged this branch into clk-next to get some soak testing.
>=20
> I did not merge patch #14. Feel free to add my reviewed-by to that
> patch.

Thanks for merging the other patches, but can you merge patch 14 too?
Merging it through my tree would break bisectability, and it should
apply properly on your tree.

> Were you going to spin another version? If so I can replace v3 with v4
> when it is ready. Thanks again for your hard work on this! Very happy to
> see the binding be reworked :-)

I'll send another patch to fix the bug found by Jean-Francois, and one
to fix a typo. Feel free to squash them in.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4ndw/alBWmZEhfcZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXhAD4AAoJEBx+YmzsjxAgQnIQAI6N3OijHYbA8P0vyvs6Rj4s
t8+Qz/UHtyqCPGunWdBvhcIzlOpXRazRx9BwNOelzClexG4weKCQqekdlSo8lHyB
hbdyjNfEV/iqDxT31iLEt4OdN9qsreecZXp92IjNdUfm1DzshxD4dXoScUO5rmQs
8Me0CGPEzN0vWmhiwy7H1Lxq8OHLv1jtiDUc8/CsT1ODukaKyFQaiz53Mn+JxSG0
CxfLKiL8IdohU9UCuqJim6cYDcaBmiDdGlQ+uMU0cLz1n8/ApuyvRdRpey29w/xP
6kQ9SmnQhKBIRpdOoxApvC5BjuQO0rUxafcNSe9Bf3MppTcXRFFnJ/MUVNia8xgg
oi1WzdHERf4LyfTZJ5FL7n9rdXVl1S4L5G3AO8dpsWg2z5i/fb2aMcJHdwxDWcKC
xMylZXrxJWTDyNTrq6Omwj13s3cWCGmUQKZjPpIk7U+zc0kr2zTEws7Yd9ay+C7t
Ff1tDXg72j/N5CRzVHM5QkW6ReHlV0o3Pfh0phub6HQ6HbfvxL6LlQyU/f8Z9lLM
g2RmWEIXrneaHByyMiduSWPGmvJNbGZOcwMv1qz463Tdq2Q6z8BU7AIu1AGEvC5m
DdZncVmumeDs6V9jfmGLn09Uq3oTNkJWCHk+5WMaxUG09ZBvK2O5iPVX8NClnllJ
LjwwMZMRZ7vDVW4rofic
=9CKb
-----END PGP SIGNATURE-----

--4ndw/alBWmZEhfcZ--
