From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v2 14/15] clk: sunxi-ng: Add H3 clocks
Date: Thu, 9 Jun 2016 09:42:19 +0200
Message-ID: <20160609094219.6b4153aed49fb5ab6ccd7f74@free.fr>
References: <20160607204154.31967-1-maxime.ripard@free-electrons.com>
	<20160607204154.31967-15-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160607204154.31967-15-maxime.ripard@free-electrons.com>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Vishnu Patekar <vishnupatekar0510@gmail.com>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Tue,  7 Jun 2016 22:41:53 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> Add the list of clocks and resets found in the H3 CCU.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> ---
> Changes from v1:
>   - Only build the H3 clocks description when MACH_SUN8I is set
> ---
>  drivers/clk/sunxi-ng/Makefile        |   2 +
>  drivers/clk/sunxi-ng/ccu-sun8i-h3.c  | 703 +++++++++++++++++++++++++=
++++++++++
>  include/dt-bindings/clock/sun8i-h3.h | 162 ++++++++
>  include/dt-bindings/reset/sun8i-h3.h | 103 +++++
>  4 files changed, 970 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-h3.c
>  create mode 100644 include/dt-bindings/clock/sun8i-h3.h
>  create mode 100644 include/dt-bindings/reset/sun8i-h3.h
>=20
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Mak=
efile
> index ddcf456df719..cafabf0e8060 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -13,3 +13,5 @@ obj-y +=3D ccu_nkm.o
>  obj-y +=3D ccu_nkmp.o
>  obj-y +=3D ccu_nm.o
>  obj-y +=3D ccu_phase.o
> +
> +obj-$(CONFIG_MACH_SUN8I) +=3D ccu-sun8i-h3.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-h3.c b/drivers/clk/sunxi-=
ng/ccu-sun8i-h3.c
> new file mode 100644
> index 000000000000..41102ac020d9
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-h3.c
	[snip]
> +static const struct sunxi_ccu_desc sun8i_h3_ccu_desc =3D {
> +	.clks		=3D sun8i_h3_ccu_clks,
> +	.num_clks	=3D ARRAY_SIZE(sun8i_h3_ccu_clks),
> +
> +	.resets		=3D sun8i_h3_ccu_resets,
> +	.num_resets	=3D ARRAY_SIZE(sun8i_h3_ccu_resets),
> +};
> +
> +#define SUN8I_H3_PLL2_REG	0x008

SUN8I_H3_PLL_AUDIO_REG would be clearer.

This definition could go near the audio PLL description with some
comments.

> +
> +static void __init sun8i_h3_ccu_setup(struct device_node *node)
> +{
> +	void __iomem *reg;
> +	u32 val;
> +
> +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> +	if (IS_ERR(reg)) {
> +		pr_err("%s: Could not map the clock registers\n",
> +		       of_node_full_name(node));
> +		return;
> +	}
> +
> +	/* Force the PLL2-1x divider to 4 */
> +	val =3D readl(reg + SUN8I_H3_PLL2_REG);
> +	val &=3D ~GENMASK(4, 0);
> +	writel(val | 3, reg + SUN8I_H3_PLL2_REG);
> +
> +	sunxi_ccu_probe(node, reg, &sun8i_h3_ccu_desc);
> +}
> +CLK_OF_DECLARE(sun8i_h3_ccu, "allwinner,sun8i-h3-ccu",
> +	       sun8i_h3_ccu_setup);
> diff --git a/include/dt-bindings/clock/sun8i-h3.h b/include/dt-bindin=
gs/clock/sun8i-h3.h
> new file mode 100644
> index 000000000000..96eced56e7a2
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun8i-h3.h
	[snip]

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
