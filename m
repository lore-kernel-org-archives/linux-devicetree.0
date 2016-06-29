From: Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH 1/3] clk: sunxi: Add a driver for the CCU
Date: Wed, 29 Jun 2016 10:12:56 +0200
Message-ID: <20160629101256.93895e6ff9184efa340f69dd@free.fr>
References: <cover.1467135898.git.moinejf@free.fr>
	<a55dc5d1a9f02dc4d71d5c21064bffebe5a7b149.1467135898.git.moinejf@free.fr>
	<20160628204502.GG5550@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20160628204502.GG5550@lukather>
Sender: linux-clk-owner@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

On Tue, 28 Jun 2016 22:45:02 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> On Tue, Jun 28, 2016 at 05:37:35PM +0200, Jean-Francois Moine wrote:
> > +/* --- prepare / enable --- */
> > +int ccu_prepare(struct clk_hw *hw)
> > +{
> > +	struct ccu *ccu =3D hw2ccu(hw);
> > +
> > +	if (!ccu->reset_reg && !ccu->bus_reg)
> > +		return 0;
> > +
> > +#if CCU_DEBUG
> > +	pr_info("** ccu %s prepare\n", clk_hw_get_name(&ccu->hw));
> > +#endif
> > +	spin_lock(&ccu_lock);
> > +	if (ccu->reset_reg)
> > +		writel(readl(ccu->base + ccu->reset_reg) |
> > +							BIT(ccu->reset_bit),
> > +				ccu->base + ccu->reset_reg);
> > +	if (ccu->bus_reg)
> > +		writel(readl(ccu->base + ccu->bus_reg) | BIT(ccu->bus_bit),
> > +				ccu->base + ccu->bus_reg);
>=20
> Like I already said, this is a no-go.

I don't see why: prepare/unprepare do the right job.

> > +
> > +/* --- PLL --- */
> > +static int ccu_pll_find_best(struct ccu *ccu,
> > +				unsigned long rate,
> > +				unsigned long parent_rate,
> > +				struct values *p_v)
> > +{
> > +	int max_mul, max_div, mul, div, t;
> > +	int n =3D 1, d1 =3D 1, k =3D 1, m =3D 1, p =3D 0;
> > +	int max_n =3D 1 << ccu->n_width;
> > +	int max_d1 =3D 1 << ccu->d1_width;
> > +	int max_k =3D 1 << ccu->k_width;
> > +	int max_m =3D 1 << ccu->m_width;
> > +	int max_p =3D 1 << ccu->p_width;
> > +
> > +	if (ccu->features & CCU_FEATURE_N0)
> > +		max_n--;
> > +
> > +	/* compute n */
> > +	if (max_n > 1) {
> > +		max_mul =3D max_n * max_k;
> > +		if (rate > parent_rate * max_mul) {
> > +			pr_err("%s: Clock rate too high %ld > %ld * %d * %d\n",
> > +				clk_hw_get_name(&ccu->hw),
> > +				rate, parent_rate, max_n, max_k);
> > +			return -EINVAL;
> > +		}
> > +		max_div =3D max_m * max_d1 << max_p;
> > +		if (max_div > 1) {
> > +			unsigned long lmul, ldiv;
> > +
> > +			rational_best_approximation(rate, parent_rate,
> > +						max_mul - 1,
> > +						max_div - 1,
> > +						&lmul, &ldiv);
> > +			mul =3D lmul;
> > +			div =3D ldiv;
> > +			if (ccu->n_min && mul < ccu->n_min) {
> > +				t =3D (ccu->n_min + mul - 1) / mul;
> > +				mul *=3D t;
> > +				div *=3D t;
> > +			}
> > +		} else {
> > +			mul =3D (rate + parent_rate - 1) / parent_rate;
> > +			div =3D 1;
> > +		}
> > +
> > +		/* compute k (present only when 'n' is present) */
> > +		if (max_k > 1) {
> > +			int k_min, k_opt, delta_opt =3D 100, delta;
> > +
> > +			k =3D (mul + max_n - 1) / max_n;
> > +			k_opt =3D k_min =3D k;
> > +			for (k =3D max_k; k > k_min; k--) {
> > +				n =3D (mul + k - 1) / k;
> > +				t =3D n * k;
> > +				delta =3D t - mul;
> > +				if (delta =3D=3D 0) {
> > +					k_opt =3D k;
> > +					break;
> > +				}
> > +				if (delta < 0)
> > +					delta =3D -delta;
> > +				if (delta < delta_opt) {
> > +					delta_opt =3D delta;
> > +					k_opt =3D k;
> > +				}
> > +			}
> > +			k =3D k_opt;
> > +			n =3D (mul + k - 1) / k;
> > +		} else {
> > +			n =3D mul;
> > +		}
> > +	} else {
> > +		div =3D (parent_rate + rate - 1) / rate;
> > +	}
> > +
> > +	/* compute d1 (value is only 1 or 2) */
> > +	if (max_d1 > 1) {
> > +		if (div % 2 =3D=3D 0) {
> > +			d1 =3D 2;
> > +			div /=3D 2;
> > +		}
> > +	}
> > +
> > +	/* compute p */
> > +/*	p =3D 0; */
> > +	while (div % 2 =3D=3D 0 && p <=3D max_p) {
> > +		p++;
> > +		div /=3D 2;
> > +	}
> > +
> > +	/* compute m */
> > +	if (max_m > 1) {
> > +		if (div <=3D max_m)
> > +			m =3D div;
> > +		else
> > +			m =3D max_m;
> > +		div /=3D m;
> > +	}
> > +
> > +	/* adjust n */
> > +	n =3D DIV_ROUND_CLOSEST((rate << p) * m * d1, parent_rate);
> > +	n =3D DIV_ROUND_CLOSEST(n, k);
> > +
> > +	p_v->n =3D n;
> > +	p_v->d1 =3D d1;
> > +	p_v->k =3D k;
> > +	p_v->m =3D m;
> > +	p_v->p =3D p;
> > +
> > +	return 0;
> > +}
>=20
> So. In order to move away from an unmaintainable mess, we create a ne=
w
> unmaintainable mess? Looks like the way to go.

Why is it unmaintainable? This routine should work fine for most
Allwinner's SoCs.
If it would not for some particular SoC, an other one could be written
and called for this case.
Maybe are you thinking about the pre/post-divider order. Yes, this
routine should enhanced if some rounding problem would be found.

> > +const struct clk_ops ccu_pll_ops =3D {
> > +	.prepare	=3D ccu_prepare,
> > +	.unprepare	=3D ccu_unprepare,
> > +	.enable		=3D ccu_enable,
> > +	.disable	=3D ccu_disable,
> > +/*	.is_enabled	=3D NULL;	(don't disable the clocks at startup time=
) */
>=20
> Why?

3 reasons:

- as the unused clocks are disabled at system startup time, all the
  critical clocks should be flagged as such. A problem exists when
  trying a new SoC: we may not know which clocks are critical, and
  we stay in front of a black screen when trying to boot.

- the clocks may be enabled again when already enabled without any
  problem. So, it is not important to know if they are already enabled
  by hardware: the software enable counter is enough.

- less code!

> > +/* --- mux --- */
> > +static void ccu_mux_adjust_parent_for_prediv(struct ccu *ccu,
> > +					     int parent_index,
> > +					     unsigned long *parent_rate)
> > +{
> > +	const struct ccu_extra *extra =3D ccu->extra;
> > +	int prediv =3D 1;
> > +	u32 reg;
> > +
> > +	if (!(extra &&
> > +	      (ccu->features & (CCU_FEATURE_MUX_FIXED_PREDIV |
> > +				CCU_FEATURE_MUX_VARIABLE_PREDIV))))
> > +		return;
> > +
> > +	reg =3D readl(ccu->base + ccu->reg);
> > +	if (parent_index < 0)
> > +		parent_index =3D (reg >> ccu->mux_shift) &
> > +					((1 << ccu->mux_width) - 1);
> > +
> > +	if (ccu->features & CCU_FEATURE_MUX_FIXED_PREDIV)
> > +		prediv =3D extra->fixed_div[parent_index];
> > +
> > +	if (ccu->features & CCU_FEATURE_MUX_VARIABLE_PREDIV)
> > +		if (parent_index =3D=3D extra->variable_prediv.index) {
> > +			u8 div;
> > +
> > +			div =3D reg >> extra->variable_prediv.shift;
> > +			div &=3D (1 << extra->variable_prediv.width) - 1;
> > +			prediv =3D div + 1;
> > +		}
> > +
> > +	*parent_rate /=3D prediv;
> > +}
> > +
> > +/* --- periph --- */
> > +static unsigned long ccu_m_round_rate(struct ccu *ccu,
> > +					unsigned long rate,
> > +					unsigned long parent_rate)
> > +{
> > +	int m;
> > +
> > +	/*
> > +	 * We can't use divider_round_rate that assumes that there's
> > +	 * several parents, while we might be called to evaluate
> > +	 * several different parents.
> > +	 */
> > +	m =3D divider_get_val(rate, parent_rate,
> > +			ccu->div_table, ccu->m_width, ccu->div_flags);
> > +
> > +	return divider_recalc_rate(&ccu->hw, parent_rate, m,
> > +				   ccu->div_table, ccu->div_flags);
> > +}
> > +
> > +static unsigned long ccu_mp_round_rate(struct ccu *ccu,
> > +				unsigned long rate,
> > +				unsigned long parent_rate)
> > +{
> > +	struct values v;
> > +	int ret;
> > +
> > +	ret =3D ccu_pll_find_best(ccu, rate, parent_rate, &v);
> > +	if (ret)
> > +		return 0;
> > +
> > +	return parent_rate / v.m >> v.p;
> > +}
> > +
> > +unsigned long ccu_periph_recalc_rate(struct clk_hw *hw,
> > +					unsigned long parent_rate)
> > +{
> > +	struct ccu *ccu =3D hw2ccu(hw);
> > +	int m, p;
> > +	u32 reg;
> > +
> > +	ccu_mux_adjust_parent_for_prediv(ccu, -1, &parent_rate);
> > +
> > +	if (!ccu->m_width && !ccu->p_width)
> > +		return parent_rate;
> > +
> > +	reg =3D readl(ccu->base + ccu->reg);
> > +	m =3D (reg >> ccu->m_shift) & ((1 << ccu->m_width) - 1);
> > +
> > +	if (ccu->p_width) {
> > +		reg =3D readl(ccu->base + ccu->reg);
> > +		p =3D (reg >> ccu->p_shift) & ((1 << ccu->p_width) - 1);
> > +
> > +		return parent_rate / (m + 1) >> p;
> > +	}
> > +
> > +	return divider_recalc_rate(hw, parent_rate, m,
> > +				ccu->div_table, ccu->div_flags);
> > +}
> > +
> > +int ccu_periph_determine_rate(struct clk_hw *hw,
> > +				struct clk_rate_request *req)
> > +{
> > +	struct ccu *ccu =3D hw2ccu(hw);
> > +
> > +	unsigned long best_parent_rate =3D 0, best_rate =3D 0;
> > +	struct clk_hw *best_parent;
> > +	unsigned int i;
> > +	unsigned long (*round)(struct ccu *,
> > +				unsigned long,
> > +				unsigned long);
> > +
> > +	if (ccu->p_width)
> > +		round =3D ccu_mp_round_rate;
> > +	else if (ccu->m_width)
> > +		round =3D ccu_m_round_rate;
> > +	else
> > +		return __clk_mux_determine_rate(hw, req);
> > +
> > +	for (i =3D 0; i < clk_hw_get_num_parents(hw); i++) {
> > +		unsigned long new_rate, parent_rate;
> > +		struct clk_hw *parent;
> > +
> > +		parent =3D clk_hw_get_parent_by_index(hw, i);
> > +		if (!parent)
> > +			continue;
> > +
> > +		parent_rate =3D clk_hw_get_rate(parent);
> > +		ccu_mux_adjust_parent_for_prediv(ccu, i, &parent_rate);
> > +		new_rate =3D round(ccu, req->rate, parent_rate);
> > +
> > +		if (new_rate =3D=3D req->rate) {
> > +			best_parent =3D parent;
> > +			best_parent_rate =3D parent_rate;
> > +			best_rate =3D new_rate;
> > +			goto out;
> > +		}
> > +
> > +		if ((req->rate - new_rate) < (req->rate - best_rate)) {
> > +			best_rate =3D new_rate;
> > +			best_parent_rate =3D parent_rate;
> > +			best_parent =3D parent;
> > +		}
> > +	}
> > +
> > +	if (best_rate =3D=3D 0)
> > +		return -EINVAL;
> > +
> > +out:
> > +	req->best_parent_hw =3D best_parent;
> > +	req->best_parent_rate =3D best_parent_rate;
> > +	req->rate =3D best_rate;
> > +
> > +	return 0;
> > +}
>=20
> Sooo, basically my code.

Absolutely. That is told in the header:
+ * Rewrite from 'sunxi-ng':
+ * Copyright (C) 2016 Maxime Ripard <maxime.ripard@free-electrons.com>

Your code is good, not the structures.

> > +int ccu_periph_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			unsigned long parent_rate)
> > +{
> > +	struct ccu *ccu =3D hw2ccu(hw);
> > +	const struct ccu_extra *extra =3D ccu->extra;
> > +	struct values v;
> > +	u32 mask;
> > +	int ret;
> > +
> > +	if (!ccu->m_width && !ccu->p_width)
> > +		return 0;
> > +
> > +	ccu_mux_adjust_parent_for_prediv(ccu, -1, &parent_rate);
> > +
> > +	if (extra && (ccu->features & CCU_FEATURE_MODE_SELECT)) {
> > +		/* fixme: should use new mode */
> > +		if (rate =3D=3D extra->mode_select.rate)
> > +			rate /=3D 2;
> > +	}
>=20
> That needs synchronisation with the MMC driver. How are you dealing
> with this?

I have problems with the MMCs. I will propose the necessary changes in
both the clock and MMC drivers as soon as I have the 3 MMCs working
(SDcard, wifi and eMMC) in the Banana Pi M3.

> > +
> > +	if (ccu->p_width) {				/* m and p */
> > +		ret =3D ccu_pll_find_best(ccu, rate, parent_rate, &v);
> > +		if (ret)
> > +			return ret;
> > +	} else {					/* m alone */
> > +		v.m =3D divider_get_val(rate, parent_rate,
> > +				ccu->div_table, ccu->m_width, ccu->div_flags);
> > +		v.p =3D 0;
> > +		return 0;
> > +	}
> > +
> > +	mask =3D CCU_MASK(ccu->m_shift, ccu->m_width) |
> > +		CCU_MASK(ccu->p_shift, ccu->p_width);
> > +
> > +	if (ccu->features & CCU_FEATURE_SET_RATE_UNGATE)
> > +		ccu_disable(hw);
>=20
> ungating means enable, and this is already dealt with by the core.

Right, the name is wrong.
But nothing is done by the core: when CLK_SET_RATE_GATE is set, and
when the gate is enabled, set_rate() fails.

> > +
> > +/* --- fixed factor --- */
> > +/* mul is n_width - div is m_width */
> > +unsigned long ccu_fixed_factor_recalc_rate(struct clk_hw *hw,
> > +					unsigned long parent_rate)
> > +{
> > +	struct ccu *ccu =3D hw2ccu(hw);
> > +
> > +	return parent_rate / ccu->m_width * ccu->n_width;
> > +}
> > +
> > +long ccu_fixed_factor_round_rate(struct clk_hw *hw,
> > +				unsigned long rate,
> > +				unsigned long *parent_rate)
> > +{
> > +	struct ccu *ccu =3D hw2ccu(hw);
> > +
> > +	if (clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) {
> > +		unsigned long best_parent;
> > +
> > +		best_parent =3D (rate / ccu->n_width) * ccu->m_width;
> > +		*parent_rate =3D clk_hw_round_rate(clk_hw_get_parent(hw),
> > +						 best_parent);
> > +	}
> > +
> > +	return *parent_rate / ccu->m_width * ccu->n_width;
> > +}
> > +
> > +int ccu_fixed_factor_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> > +				     unsigned long parent_rate)
> > +{
> > +	return 0;
> > +}
> > +
> > +const struct clk_ops ccu_fixed_factor_ops =3D {
> > +	.disable	=3D ccu_disable,
> > +	.enable		=3D ccu_enable,
> > +/*	.is_enabled	=3D NULL, */
> > +
> > +	.recalc_rate	=3D ccu_fixed_factor_recalc_rate,
> > +	.round_rate	=3D ccu_fixed_factor_round_rate,
> > +	.set_rate	=3D ccu_fixed_factor_set_rate,
> > +};
>=20
> This is redundant with the core.

I don't see how:
- the 'mul' and 'div' fields are not at the same offset
- some fixed_factor clocks may have a gate.

> > +/* --- reset --- */
> > +static inline
> > +struct ccu_reset *rcdev_to_ccu_reset(struct reset_controller_dev *=
rcdev)
> > +{
> > +	return container_of(rcdev, struct ccu_reset, rcdev);
> > +}
> > +
> > +static void ccu_set_reset_clock(struct ccu_reset *ccu_reset,
> > +				int reg, int bit, int enable)
> > +{
> > +	u32 mask;
> > +
> > +	if (!reg)			/* compatibility */
> > +		return;
> > +
> > +#if CCU_DEBUG
> > +	pr_info("** ccu reset %03x %d %sassert\n",
> > +		reg, bit, enable ? "de-" : "");
> > +#endif
>=20
> You have tracepoints for that.

Right.

> > +	mask =3D BIT(bit);
> > +
> > +	spin_lock(&ccu_lock);
> > +	if (enable)
> > +		writel(readl(ccu_reset->base + reg) | mask,
> > +			ccu_reset->base + reg);
> > +	else
> > +		writel(readl(ccu_reset->base + reg) & ~mask,
> > +			ccu_reset->base + reg);
> > +	spin_unlock(&ccu_lock);
> > +}
> > +
> > +static int ccu_reset_assert(struct reset_controller_dev *rcdev,
> > +			    unsigned long id)
> > +{
> > +	struct ccu_reset *ccu_reset =3D rcdev_to_ccu_reset(rcdev);
> > +	const struct ccu_reset_map *map =3D &ccu_reset->reset_map[id];
> > +
> > +	ccu_set_reset_clock(ccu_reset, map->reg, map->bit, 0);
> > +
> > +	return 0;
> > +}
> > +
> > +static int ccu_reset_deassert(struct reset_controller_dev *rcdev,
> > +			      unsigned long id)
> > +{
> > +	struct ccu_reset *ccu_reset =3D rcdev_to_ccu_reset(rcdev);
> > +	const struct ccu_reset_map *map =3D &ccu_reset->reset_map[id];
> > +
> > +	ccu_set_reset_clock(ccu_reset, map->reg, map->bit, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +const struct reset_control_ops ccu_reset_ops =3D {
> > +	.assert		=3D ccu_reset_assert,
> > +	.deassert	=3D ccu_reset_deassert,
> > +};
> > +
> > +/* --- init --- */
> > +int __init ccu_probe(struct device_node *node,
> > +			struct clk_hw_onecell_data *data,
> > +			struct ccu_reset *resets)
> > +{
> > +	struct clk_hw *hw;
> > +	struct ccu *ccu;
> > +	void __iomem *reg;
> > +	int i, ret;
> > +
> > +	reg =3D of_io_request_and_map(node, 0, of_node_full_name(node));
> > +	if (IS_ERR(reg)) {
> > +		pr_err("%s: Clock mapping failed %d\n",
> > +			of_node_full_name(node), (int) PTR_ERR(reg));
> > +		return PTR_ERR(reg);
> > +	}
> > +
> > +	/* register the clocks */
> > +	for (i =3D 0; i < data->num; i++) {
> > +		hw =3D data->hws[i];
> > +#if CCU_DEBUG
> > +		if (!hw) {
> > +			pr_err("%s: Bad number of clocks %d !=3D %d\n",
> > +				of_node_full_name(node),
> > +				i + 1, data->num);
> > +			data->num =3D i;
> > +			break;
> > +		}
> > +#endif
> > +		ccu =3D hw2ccu(hw);
> > +		ccu->base =3D reg;
> > +		ret =3D clk_hw_register(NULL, hw);
> > +		if (ret < 0) {
> > +			pr_err("%s: Register clock %s failed %d\n",
> > +				of_node_full_name(node),
> > +				clk_hw_get_name(hw), ret);
> > +			data->num =3D i;
> > +			break;
> > +		}
> > +	}
> > +	ret =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, data)=
;
> > +	if (ret < 0)
> > +		goto err;
> > +
> > +	/* register the resets */
> > +	resets->rcdev.of_node =3D node;
> > +	resets->base =3D reg;
> > +
> > +	ret =3D reset_controller_register(&resets->rcdev);
> > +	if (ret) {
> > +		pr_err("%s: Reset register failed %d\n",
> > +			of_node_full_name(node), ret);
> > +		goto err;
> > +	}
> > +
> > +	return ret;
>=20
> What's the point of this, if we're not using (or exposing for that
> matter) any of it?

Maybe I was misunderstood:
- the control of the reset state may be needed for some clocks or by
  some drivers, but,
- most clocks / drivers don't need it, so, it is possible to hide these
  resets inside the clock stuff. You may note that some drivers are
  already prepared to this fact. For example, in the sunxi MMC driver,
  the reset is optional.
- in case a driver requests a reset, this last one should exist.
  But, this reset may point to a void one (reg =3D null) when the real
  reset has been moved to the prepare/unprepare of the associated clock=
=2E

>=20
> I'm sorry, but the whole point of the initial serie was to rework and
> simplify things, precisely because dealing with the clk_factors code
> was just too difficult nowadays. And this doesn't solve anything on
> that aspect.

In my code, all the clock factors I know about are handled.
Basically, the requested and the parent rates give a multiplier and a
divider. These ones are dispatched into the specific clock factors
according to their constraints.

If you better like your loops, there is only one place to do the change=
=2E

> We came with an approach that have all the maintainers involved
> agreeing on it, I don't see why we should start over. There's some
> useful features there (like tracing). But it's something that can be
> added, and should be done differently anyway.

OK. I cannot force you.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
