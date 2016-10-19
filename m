From: Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCH v2 1/6] clk: stm32f4: Add LSI & LSE clocks
Date: Wed, 19 Oct 2016 13:24:33 -0700
Message-ID: <20161019202433.GA8871@codeaurora.org>
References: <1476436699-21879-1-git-send-email-gabriel.fernandez@st.com>
 <1476436699-21879-2-git-send-email-gabriel.fernandez@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1476436699-21879-2-git-send-email-gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gabriel.fernandez-qxv4g6HH51o@public.gmane.org
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Maxime Coquelin <mcoquelin.stm32-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Nicolas Pitre <nico-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ludovic.barre-qxv4g6HH51o@public.gmane.org, olivier.bideau-qxv4g6HH51o@public.gmane.org, amelie.delaunay-qxv4g6HH51o@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 10/14, gabriel.fernandez-qxv4g6HH51o@public.gmane.org wrote:
> @@ -292,8 +298,110 @@ static int stm32f4_rcc_lookup_clk_idx(u8 primary, u8 secondary)
>  	return clks[i];
>  }
>  
> +static struct regmap *pdrm;

This can't be part of the stm32_rgate structure?

> +
> +static inline void disable_power_domain_write_protection(void)
> +{
> +	regmap_update_bits(pdrm, 0x00, (1 << 8), (1 << 8));
> +}
> +
> +static inline void enable_power_domain_write_protection(void)
> +{
> +	regmap_update_bits(pdrm, 0x00, (1 << 8), (0 << 8));
> +}
> +
> +struct stm32_rgate {
> +	struct	clk_hw hw;
> +	struct	clk_gate gate;

Why not use the clk_hw inside clk_gate?

> +	u8	bit_rdy_idx;
> +};
> +
> +#define RTC_TIMEOUT 1000000
> +
> +#define to_rgclk(_hw) container_of(_hw, struct stm32_rgate, hw)
> +
> +static int rgclk_enable(struct clk_hw *hw)
> +{
> +	struct stm32_rgate *rgate = to_rgclk(hw);
> +	struct clk_hw *gate_hw = &rgate->gate.hw;
> +	struct clk_gate *gate = to_clk_gate(gate_hw);
> +	u32 reg;
> +	int ret;
> +
> +	__clk_hw_set_clk(gate_hw, hw);

Then we don't need this part.

> +
> +	disable_power_domain_write_protection();
> +
> +	clk_gate_ops.enable(gate_hw);
> +
> +	ret = readl_relaxed_poll_timeout_atomic(gate->reg, reg,
> +			reg & rgate->bit_rdy_idx, 1000, RTC_TIMEOUT);
> +
> +	enable_power_domain_write_protection();
> +
> +	return ret;
> +}
> +
> +static void rgclk_disable(struct clk_hw *hw)
> +{
> +	clk_gate_ops.disable(hw);
> +}
> +
> +static int rgclk_is_enabled(struct clk_hw *hw)
> +{
> +	return clk_gate_ops.is_enabled(hw);
> +}
> +
> +

Drop the double newline here please.

> +static const struct clk_ops rgclk_ops = {
> +	.enable = rgclk_enable,
> +	.disable = rgclk_disable,
> +	.is_enabled = rgclk_is_enabled,
> +};
> +
> +static struct clk_hw *clk_register_rgate(struct device *dev, const char *name,
> +		const char *parent_name, unsigned long flags,
> +		void __iomem *reg, u8 bit_idx, u8 bit_rdy_idx,
> +		u8 clk_gate_flags, spinlock_t *lock)
> +{
> +	struct stm32_rgate *rgate;
> +	struct clk_init_data init = { NULL };
> +	struct clk_hw *hw;
> +	int ret;
> +
> +	rgate = kzalloc(sizeof(*rgate), GFP_KERNEL);
> +	if (!rgate)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &rgclk_ops;
> +	init.flags = flags | CLK_IS_BASIC;

Please no CLK_IS_BASIC flags.

> +	init.parent_names = &parent_name;
> +	init.num_parents = 1;
> +
> +	rgate->hw.init = &init;
> +	rgate->bit_rdy_idx = bit_rdy_idx;
> +
> +	rgate->gate.lock = lock;
> +	rgate->gate.reg = reg;
> +	rgate->gate.bit_idx = bit_idx;
> +
> +	hw = &rgate->hw;
> +	ret = clk_hw_register(dev, hw);
> +	if (ret) {
> +		kfree(rgate);
> +		hw = ERR_PTR(ret);
> +	}
> +
> +	return hw;
> +}
> +
>  static const char *sys_parents[] __initdata =   { "hsi", NULL, "pll" };
>  
> +const char *rtc_parents[4] = {

static const char * const?

> +	"no-clock", "lse", "lsi", "hse-rtc"
> +};
> +
>  static const struct clk_div_table ahb_div_table[] = {
>  	{ 0x0,   1 }, { 0x1,   1 }, { 0x2,   1 }, { 0x3,   1 },
>  	{ 0x4,   1 }, { 0x5,   1 }, { 0x6,   1 }, { 0x7,   1 },
> @@ -319,6 +427,12 @@ static void __init stm32f4_rcc_init(struct device_node *np)
>  		return;
>  	}
>  
> +	pdrm = syscon_regmap_lookup_by_phandle(np, "st,syscfg");

Is there a dt binding update for this? It should probably be
optional?

> +	if (IS_ERR(pdrm)) {
> +		pr_err("%s: Unable to get syscfg\n", __func__);
> +		goto fail;
> +	}
> +
>  	hse_clk = of_clk_get_parent_name(np, 0);
>  

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
