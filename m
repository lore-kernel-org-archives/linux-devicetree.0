From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 13/14] clk: sunxi-ng: Add H3 clocks
Date: Fri, 8 Jul 2016 23:35:06 +0200
Message-ID: <20160708213506.GD4522@lukather>
References: <20160629190535.11855-1-maxime.ripard@free-electrons.com>
 <20160629190535.11855-14-maxime.ripard@free-electrons.com>
 <146785878822.73491.15164592643568518865@resonance>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jq0ap7NbKX2Kqbes"
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <146785878822.73491.15164592643568518865@resonance>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Jean-Francois Moine <moinejf@free.fr>
List-Id: devicetree@vger.kernel.org


--jq0ap7NbKX2Kqbes
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Wed, Jul 06, 2016 at 07:33:08PM -0700, Michael Turquette wrote:
> Hi Maxime,
>=20
> Quoting Maxime Ripard (2016-06-29 12:05:34)
> > +static void __init sun8i_h3_ccu_setup(struct device_node *node)
> > +{
> > +       void __iomem *reg;
> > +       u32 val;
> > +
> > +       reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +       if (IS_ERR(reg)) {
> > +               pr_err("%s: Could not map the clock registers\n",
> > +                      of_node_full_name(node));
> > +               return;
> > +       }
> > +
> > +       /* Force the PLL-Audio-1x divider to 4 */
> > +       val =3D readl(reg + SUN8I_H3_PLL_AUDIO_REG);
> > +       val &=3D ~GENMASK(4, 0);
> > +       writel(val | 3, reg + SUN8I_H3_PLL_AUDIO_REG);
> > +
> > +       sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> > +}
> > +CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
> > +              sun8i_h3_ccu_setup);
>=20
> There are several examples of drivers that split the clocks between
> "early" CLK_OF_DECLARE clocks and "late" module clocks. If you really
> need early clocks (which is less likely on a 64-bit platform with
> architected timers), it would be nice to pair that with a proper
> platform_driver (using builtin_platform_driver most likely).

I think we discussed that already, but yeah, we do have timers that
are not the architected ones (and this is a ARMv7 platform). I have
the feeling that splitting the two doesn't really bring any benefit,
but complexify a lot the driver.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jq0ap7NbKX2Kqbes
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXgByKAAoJEBx+YmzsjxAguFgP/2WpKChtDyTQ5tgd1pxBaP6P
kGkKQNOdBOc3wXQf3G59+Ph76lgpkQiJNTMMN3zh4p4vF1p/UvyIhoAr1ct5a+bA
nrIFs/EMRHi1UkqbrzTEpA6ZWBXlJnV+XLF0AOlFak/IfjXSVbsax933RN7j62ph
BkZCIJ1zdPvumszQwTz06xnVSZ1pXfgahirYpXqZ2a7dpBGW43GCvdcZlPX4fG0v
LHPjGXXx/mBC4LQfLZv3HK5kHwktdfvR5vGGm87Thugaalm30InWmimjnfyTmsmT
xXWeEcbLxeUEJVr7Z1ozrLk+rimhBmqJWcKRaDXLs6TrWMvELSi72mGBLnbuLEfU
eEJ9lyOR4TVMk8tKXUHQGrC6OVqarS0H3HDk2hFzJNZ+NLluDtZUnwW9z/UHzR0G
5ckIfyEOFRkrPGWBYqgn/ArTBnUPrFFv0PXHmeS4360OiQnZ9/ei8hGuoqzuU88L
DNxDS8TVYO5fj3k5HxPtTeQ9g/mt52Q5mz+is/9nyRvkAvaKHvykXcTc/V9WSzq9
qZuGmSe1po852wtwJEnHV1X2GpsyCCLcUcaxiHaPyydPqluSqyUW2JuDNnNZRLsr
nhNcaOTOsD/01IH0EcjfiLh6XylJCpbDWwjj/C+rTal6Bm56PdZ5xNiCBVznIJXm
2kQdnLoWGbpHEDdk5/sw
=0m3t
-----END PGP SIGNATURE-----

--jq0ap7NbKX2Kqbes--
