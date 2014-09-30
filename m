From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 4/7] clk: sunxi: unify sun6i AHB1 clock with proper
 PLL6 pre-divider
Date: Tue, 30 Sep 2014 17:54:15 +0200
Message-ID: <20140930155415.GO4081@lukather>
References: <1411807795-6575-1-git-send-email-wens@csie.org>
 <1411807795-6575-5-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vNrHrykRFvLVX6W3"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1411807795-6575-5-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--vNrHrykRFvLVX6W3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 27, 2014 at 04:49:52PM +0800, Chen-Yu Tsai wrote:
> This patch unifies the sun6i AHB1 clock, originally supported
> with separate mux and divider clks. It also adds support for
> the pre-divider on the PLL6 input, thus allowing the clock to
> be muxed to PLL6 with proper clock rate calculation.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt |   2 +-
>  drivers/clk/sunxi/clk-sunxi.c                     | 209 ++++++++++++++++=
++++++
>  2 files changed, 210 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index 0d84f4b..e862818 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -23,7 +23,7 @@ Required properties:
>  	"allwinner,sun5i-a10s-ahb-gates-clk" - for the AHB gates on A10s
>  	"allwinner,sun7i-a20-ahb-gates-clk" - for the AHB gates on A20
>  	"allwinner,sun6i-a31-ar100-clk" - for the AR100 on A31
> -	"allwinner,sun6i-a31-ahb1-mux-clk" - for the AHB1 multiplexer on A31
> +	"allwinner,sun6i-a31-ahb1-clk" - for the AHB1 clock on A31
>  	"allwinner,sun6i-a31-ahb1-gates-clk" - for the AHB1 gates on A31
>  	"allwinner,sun8i-a23-ahb1-gates-clk" - for the AHB1 gates on A23
>  	"allwinner,sun4i-a10-apb0-clk" - for the APB0 clock
> diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
> index 9caebff..7151e2c 100644
> --- a/drivers/clk/sunxi/clk-sunxi.c
> +++ b/drivers/clk/sunxi/clk-sunxi.c
> @@ -19,6 +19,7 @@
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/reset-controller.h>
> +#include <linux/log2.h>
> =20
>  #include "clk-factors.h"
> =20
> @@ -1357,3 +1358,211 @@ static void __init sun6i_init_clocks(struct devic=
e_node *node)
>  }
>  CLK_OF_DECLARE(sun6i_a31_clk_init, "allwinner,sun6i-a31", sun6i_init_clo=
cks);
>  CLK_OF_DECLARE(sun8i_a23_clk_init, "allwinner,sun8i-a23", sun6i_init_clo=
cks);
> +
> +

Drop the extra newline

> +/**
> + * sun6i_a31_ahb1_clk_setup() - Setup function for a31 ahb1 composite clk
> + */
> +
> +#define SUN6I_AHB1_MAX_PARENTS		4
> +#define SUN6I_AHB1_MUX_PARENT_PLL6	3
> +#define SUN6I_AHB1_MUX_SHIFT		12
> +#define SUN6I_AHB1_MUX_MASK		0x3
> +#define SUN6I_AHB1_MUX_GET_PARENT(reg)	((reg >> SUN6I_AHB1_MUX_SHIFT) & \
> +					 SUN6I_AHB1_MUX_MASK)
> +#define SUN6I_AHB1_DIV_SHIFT		4
> +#define SUN6I_AHB1_DIV_MASK		0x3
> +#define SUN6I_AHB1_DIV_GET(reg)		((reg >> SUN6I_AHB1_DIV_SHIFT) & \
> +					 SUN6I_AHB1_DIV_MASK)
> +#define SUN6I_AHB1_DIV_SET(reg, div)	((reg & ~(SUN6I_AHB1_DIV_MASK << \
> +						  SUN6I_AHB1_DIV_SHIFT)) | \
> +					 (div << SUN6I_AHB1_DIV_SHIFT))
> +#define SUN6I_AHB1_PLL6_DIV_SHIFT	6
> +#define SUN6I_AHB1_PLL6_DIV_MASK	0x3
> +#define SUN6I_AHB1_PLL6_DIV_GET(reg)	((reg >> SUN6I_AHB1_PLL6_DIV_SHIFT)=
 & \
> +					 SUN6I_AHB1_PLL6_DIV_MASK)
> +#define SUN6I_AHB1_PLL6_DIV_SET(reg, div) ((reg & \
> +					    ~(SUN6I_AHB1_PLL6_DIV_MASK << \
> +					      SUN6I_AHB1_PLL6_DIV_SHIFT)) | \
> +					   (div << SUN6I_AHB1_PLL6_DIV_SHIFT))

Your indentation looks really odd, and the masks you have should
really point to the actual mask, and not just the number of bits.

> +
> +struct sun6i_ahb1_clk {
> +	struct clk_hw hw;
> +	void __iomem *reg;
> +};
> +
> +#define to_sun6i_ahb1_clk(_hw) container_of(_hw, struct sun6i_ahb1_clk, =
hw)
> +
> +static unsigned long sun6i_ahb1_clk_recalc_rate(struct clk_hw *hw,
> +						unsigned long parent_rate)
> +{
> +	struct sun6i_ahb1_clk *ahb1 =3D to_sun6i_ahb1_clk(hw);
> +	unsigned long rate;
> +	u32 reg;
> +
> +	/* Fetch the register value */
> +	reg =3D readl(ahb1->reg);
> +
> +	/* apply pre-divider first if parent is pll6 */
> +	if (SUN6I_AHB1_MUX_GET_PARENT(reg) =3D=3D SUN6I_AHB1_MUX_PARENT_PLL6)
> +		parent_rate /=3D SUN6I_AHB1_PLL6_DIV_GET(reg) + 1;
> +
> +	/* clk divider */
> +	rate =3D parent_rate >> SUN6I_AHB1_DIV_GET(reg);
> +
> +	return rate;
> +}
> +
> +static long sun6i_ahb1_clk_round(unsigned long rate, u8 *divp, u8 *pre_d=
ivp,
> +				 u8 parent, unsigned long parent_rate)
> +{
> +	u8 div, calcp, calcm =3D 1;
> +
> +	/* clock can only divide, so we will never be able to achieve
> +	 * frequencies higher than the parent frequency */

Wrong multiline comment style

> +	if (parent_rate && rate > parent_rate)
> +		rate =3D parent_rate;
> +
> +	div =3D DIV_ROUND_UP(parent_rate, rate);
> +
> +	/* calculate pre-divider if parent is pll6 */
> +	if (parent =3D=3D SUN6I_AHB1_MUX_PARENT_PLL6) {
> +		if (div < 4)
> +			calcp =3D 0;
> +		else if (div / 2 < 4)
> +			calcp =3D 1;
> +		else if (div / 4 < 4)
> +			calcp =3D 2;
> +		else
> +			calcp =3D 3;
> +
> +		calcm =3D DIV_ROUND_UP(div, 1 << calcp);
> +	} else {
> +		calcp =3D __roundup_pow_of_two(div);
> +		calcp =3D calcp > 3 ? 3 : calcp;
> +	}
> +
> +	if (divp) {
> +		*divp =3D calcp;
> +		*pre_divp =3D calcm - 1;
> +	}
> +
> +	return (parent_rate / calcm) >> calcp;
> +}
> +
> +static long sun6i_ahb1_clk_determine_rate(struct clk_hw *hw, unsigned lo=
ng rate,
> +					  unsigned long *best_parent_rate,
> +					  struct clk **best_parent_clk)
> +{
> +	struct clk *clk =3D hw->clk, *parent, *best_parent =3D NULL;
> +	int i, num_parents;
> +	unsigned long parent_rate, best =3D 0, child_rate, best_child_rate =3D =
0;
> +
> +	/* find the parent that can help provide the fastest rate <=3D rate */
> +	num_parents =3D __clk_get_num_parents(clk);
> +	for (i =3D 0; i < num_parents; i++) {
> +		parent =3D clk_get_parent_by_index(clk, i);
> +		if (!parent)
> +			continue;
> +		if (__clk_get_flags(clk) & CLK_SET_RATE_PARENT)
> +			parent_rate =3D __clk_round_rate(parent, rate);
> +		else
> +			parent_rate =3D __clk_get_rate(parent);
> +
> +		child_rate =3D sun6i_ahb1_clk_round(rate, NULL, NULL, i,
> +						  parent_rate);
> +
> +		if (child_rate <=3D rate && child_rate > best_child_rate) {
> +			best_parent =3D parent;
> +			best =3D parent_rate;
> +			best_child_rate =3D child_rate;
> +		}
> +	}
> +
> +	if (best_parent)
> +		*best_parent_clk =3D best_parent;
> +	*best_parent_rate =3D best;
> +
> +	return best_child_rate;
> +}
> +
> +static int sun6i_ahb1_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> +				   unsigned long parent_rate)
> +{
> +	struct sun6i_ahb1_clk *ahb1 =3D to_sun6i_ahb1_clk(hw);
> +	unsigned long flags;
> +	u8 div, pre_div, parent;
> +	u32 reg;
> +
> +	spin_lock_irqsave(&clk_lock, flags);

Isn't that already taken by the composite clock?

> +
> +	reg =3D readl(ahb1->reg);
> +
> +	/* need to know which parent is used to apply pre-divider */
> +	parent =3D SUN6I_AHB1_MUX_GET_PARENT(reg);
> +	sun6i_ahb1_clk_round(rate, &div, &pre_div, parent, parent_rate);

Haven't you called that already in determine_rate?

> +
> +	reg =3D SUN6I_AHB1_DIV_SET(reg, div);
> +	reg =3D SUN6I_AHB1_PLL6_DIV_SET(reg, pre_div);
> +	writel(reg, ahb1->reg);
> +
> +	spin_unlock_irqrestore(&clk_lock, flags);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops sun6i_ahb1_clk_ops =3D {
> +	.determine_rate	=3D sun6i_ahb1_clk_determine_rate,
> +	.recalc_rate	=3D sun6i_ahb1_clk_recalc_rate,
> +	.set_rate	=3D sun6i_ahb1_clk_set_rate,
> +};
> +
> +static void __init sun6i_ahb1_clk_setup(struct device_node *node)
> +{
> +	struct clk *clk;
> +	struct sun6i_ahb1_clk *ahb1;
> +	struct clk_mux *mux;
> +	const char *clk_name =3D node->name;
> +	const char *parents[SUN6I_AHB1_MAX_PARENTS];
> +	void __iomem *reg;
> +	int i =3D 0;
> +
> +	reg =3D of_iomap(node, 0);

of_io_request_and_map please :)

> +
> +	/* we have a mux, we will have >1 parents */
> +	while (i < SUN6I_AHB1_MAX_PARENTS &&
> +	       (parents[i] =3D of_clk_get_parent_name(node, i)) !=3D NULL)
> +		i++;
> +
> +	of_property_read_string(node, "clock-output-names", &clk_name);
> +
> +	ahb1 =3D kzalloc(sizeof(struct sun6i_ahb1_clk), GFP_KERNEL);
> +	if (!ahb1)
> +		return;
> +
> +	mux =3D kzalloc(sizeof(struct clk_mux), GFP_KERNEL);
> +	if (!mux) {
> +		kfree(ahb1);
> +		return;
> +	}
> +
> +	/* set up clock properties */
> +	mux->reg =3D reg;
> +	mux->shift =3D SUN6I_AHB1_MUX_SHIFT;
> +	mux->mask =3D SUN6I_AHB1_MUX_MASK;
> +	mux->lock =3D &clk_lock;
> +	ahb1->reg =3D reg;
> +
> +	clk =3D clk_register_composite(NULL, clk_name, parents, i,
> +				     &mux->hw, &clk_mux_ops,
> +				     &ahb1->hw, &sun6i_ahb1_clk_ops,
> +				     NULL, NULL, 0);
> +
> +	if (!IS_ERR(clk)) {
> +		of_clk_add_provider(node, of_clk_src_simple_get, clk);
> +		clk_register_clkdev(clk, clk_name, NULL);
> +	}
> +}
> +
> +CLK_OF_DECLARE(sun6i_a31_ahb1, "allwinner,sun6i-a31-ahb1-clk",
> +		sun6i_ahb1_clk_setup);
> --=20
> 2.1.1
>=20

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--vNrHrykRFvLVX6W3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUKtInAAoJEBx+YmzsjxAg+rYP/iaWsyZmrDieIR0VVBqxNV+4
00FCS/fOpkJnAouy0Wlz+Ia/W15HG0shhdnoMUpu563uVJE4gDufVPed5SzqvLbQ
QQ6Tss9WWH7Ku6M1AN7ki+BaUKH5o0ag+i3gTfptGH5GC2MybjRSbNA0sp8s+G2F
WPcFsmGZK+q2DH108J5g720Va0No+mjxNDqlITGLD8t9GE9aPDmOxbV7UHssURCR
G8Nroh00GMgOrLN/yjr9oqsQH5ZeIucK2riID9ZrZ63YmkMR+1ICOdVGSq+cIlGB
g1gSj8ERbUarhQYms2oyEasYSqbz7SQKHE26XNzeBKskKxgJ8sVM3O89r3xg2J+/
yuYZAH6sUSFnEY/+m0eDlUcANpLchSbcL0cIOXHkxlZxSAfzl8QLukfEuVvysKJj
9Qxj3UH+/nwIZl9FjUP9cvlO+KQKDkQGLUrbmi4REfirdiW1ytXVyR7cp4jhgs4O
sv01BgRyw+AR8141RFjCuWtw9US2bbhj0sc4OK6VO4HUGa3sg4bSDrf5H0V5I9Fw
4DPabhV0C9xpQKgYTW+inygEJClOwWND7YAkEBwr0gSkkQH05VHMvgyyWz3QNfWJ
H+9j/NHUsKB0b5V6jpR5CThDVi4OBfYdOYyD78M84K9HyOWi1/BcfdMCKCjGKkCx
3UsreoCZC+BUYyhgz8m7
=mrgU
-----END PGP SIGNATURE-----

--vNrHrykRFvLVX6W3--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
