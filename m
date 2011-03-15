From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/5] arm/dt: mx51: dynamically add gpt and uart related
	clocks per dt nodes
Date: Tue, 15 Mar 2011 01:37:31 -0600
Message-ID: <20110315073731.GG23050@angua.secretlab.ca>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-4-git-send-email-shawn.guo@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1299514932-13558-4-git-send-email-shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 08, 2011 at 12:22:10AM +0800, Shawn Guo wrote:
> This patch is to change the static clock creating and registering to
> the dynamic way, which scans dt clock nodes, associate clk with
> device_node, and then add them to clkdev accordingly.
> 
> Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
>  arch/arm/mach-mx5/clock-mx51-mx53.c |  436 +++++++++++++++++++++++++++++++++--
>  1 files changed, 422 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
> index dedb7f9..1940171 100644
> --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
> +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
> @@ -135,6 +135,9 @@ static inline u32 _get_mux(struct clk *parent, struct clk *m0,
>  
>  static inline void __iomem *_mx51_get_pll_base(struct clk *pll)
>  {
> +#ifdef CONFIG_OF
> +	return pll->pll_base;
> +#else
>  	if (pll == &pll1_main_clk)
>  		return MX51_DPLL1_BASE;
>  	else if (pll == &pll2_sw_clk)
> @@ -145,6 +148,7 @@ static inline void __iomem *_mx51_get_pll_base(struct clk *pll)
>  		BUG();
>  
>  	return NULL;
> +#endif
>  }
>  
>  static inline void __iomem *_mx53_get_pll_base(struct clk *pll)
> @@ -1439,33 +1443,437 @@ int __init mx53_clocks_init(unsigned long ckil, unsigned long osc,
>  	return 0;
>  }
>  
> +/*
> + * Dynamically create and register clks per dt nodes
> + */
>  #ifdef CONFIG_OF
> -static struct clk *mx5_dt_clk_get(struct device_node *np,
> -					const char *output_id, void *data)
> +
> +#define ALLOC_CLK_LOOKUP()						\
> +	struct clk_lookup *cl;						\
> +	struct clk *clk;						\
> +	int ret;							\
> +									\
> +	do {								\
> +		cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);	\
> +		if (!cl)						\
> +			return -ENOMEM;					\
> +		clk = (struct clk *) (cl + 1);				\
> +									\
> +		clk->parent = mx5_get_source_clk(node);			\
> +		clk->secondary = mx5_get_source_clk(node);		\
> +	} while (0)
> +
> +#define ADD_CLK_LOOKUP()						\
> +	do {								\
> +		node->data = clk;					\
> +		cl->dev_id = of_get_property(node,			\
> +				"clock-outputs", NULL);			\
> +		cl->con_id = of_get_property(node,			\
> +				"clock-alias", NULL);			\
> +		if (!cl->dev_id && !cl->con_id) {			\
> +			ret = -EINVAL;					\
> +			goto out_kfree;					\
> +		}							\
> +		cl->clk = clk;						\
> +		clkdev_add(cl);						\
> +									\
> +		return 0;						\
> +									\
> +	out_kfree:							\
> +		kfree(cl);						\
> +		return ret;						\
> +	} while (0)

Yikes!  Doing this as a macro will be a nightmare for debugging.
This needs refactoring into functions.

> +
> +static unsigned long get_fixed_clk_rate(struct clk *clk)
>  {
> -	return data;
> +	return clk->rate;
>  }
>  
> -static __init void mx5_dt_scan_clks(void)
> +static __init int mx5_scan_fixed_clks(void)
>  {
>  	struct device_node *node;
> +	struct clk_lookup *cl;
>  	struct clk *clk;
> -	const char *id;
> -	int rc;
> +	const __be32 *rate;
> +	int ret = 0;
>  
> -	for_each_compatible_node(node, NULL, "clock") {
> -		id = of_get_property(node, "clock-outputs", NULL);
> -		if (!id)
> +	for_each_compatible_node(node, NULL, "fixed-clock") {
> +		cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
> +		if (!cl) {
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		clk = (struct clk *) (cl + 1);
> +
> +		rate = of_get_property(node, "clock-frequency", NULL);
> +		if (!rate) {
> +			kfree(cl);
>  			continue;
> +		}
> +		clk->rate = be32_to_cpu(*rate);
> +		clk->get_rate = get_fixed_clk_rate;
> +
> +		node->data = clk;
>  
> -		clk = clk_get_sys(id, NULL);
> -		if (IS_ERR(clk))
> +		cl->dev_id = of_get_property(node, "clock-outputs", NULL);
> +		cl->con_id = of_get_property(node, "clock-alias", NULL);

As discussed briefly earlier, clock-alias looks like it is encoding
Linux-specific implementation details into the device tree, and it
shouldn't be necessary when explicit links to clock providers are
supplied in the device tree.

> +		if (!cl->dev_id && !cl->con_id) {
> +			kfree(cl);
>  			continue;
> +		}
> +		cl->clk = clk;
> +		clkdev_add(cl);
> +	}
> +
> +	return ret;
> +}
> +
> +static struct clk *mx5_prop_name_to_clk(struct device_node *node,
> +		const char *prop_name)
> +{
> +	struct device_node *provnode;
> +	struct clk *clk;
> +	const void *prop;
> +	u32 provhandle;
> +
> +	prop = of_get_property(node, prop_name, NULL);
> +	if (!prop)
> +		return NULL;
> +	provhandle = be32_to_cpup(prop);
> +
> +	provnode = of_find_node_by_phandle(provhandle);
> +	if (!provnode)
> +		return NULL;
> +
> +	clk = provnode->data;
> +
> +	of_node_put(provnode);
> +
> +	return clk;
> +}
> +
> +static inline struct clk *mx5_get_source_clk(struct device_node *node)
> +{
> +	return mx5_prop_name_to_clk(node, "clock-source");
> +}
> +
> +static inline struct clk *mx5_get_depend_clk(struct device_node *node)
> +{
> +	return mx5_prop_name_to_clk(node, "clock-depend");
> +}

Ditto here.  'clock-depend' seems to be Linux specifc.  I need to look
at the usage model for these properties.

>  
> -		rc = of_clk_add_provider(node, mx5_dt_clk_get, clk);
> -		if (rc)
> -			pr_err("error adding fixed clk %s\n", node->name);
> +static __init int mx5_add_uart_clk(struct device_node *node)
> +{
> +	const __be32 *reg;
> +	int id;
> +
> +	ALLOC_CLK_LOOKUP();
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg) {
> +		ret = -ENOENT;
> +		goto out_kfree;
> +	}
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2) {
> +		ret = -EINVAL;
> +		goto out_kfree;
> +	}
> +
> +	clk->id = id;
> +	clk->parent = mx5_get_source_clk(node);
> +	clk->secondary = mx5_get_depend_clk(node);
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +	clk->enable_reg = MXC_CCM_CCGR1;
> +
> +	switch (id) {
> +	case 0:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG4_OFFSET;
> +		break;
> +	case 1:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG6_OFFSET;
> +		break;
> +	case 2:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG8_OFFSET;
> +	}
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_uart_root_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->get_rate = clk_uart_get_rate;
> +	clk->set_parent = clk_uart_set_parent;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_uart_ipg_clk(struct device_node *node)
> +{
> +	const __be32 *reg;
> +	int id;
> +
> +	ALLOC_CLK_LOOKUP();
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg) {
> +		ret = -ENOENT;
> +		goto out_kfree;
>  	}
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2) {
> +		ret = -EINVAL;
> +		goto out_kfree;
> +	}
> +
> +	clk->id = id;
> +	clk->enable_reg = MXC_CCM_CCGR1;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +
> +	switch (id) {
> +	case 0:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG3_OFFSET;
> +		break;
> +	case 1:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG5_OFFSET;
> +		break;
> +	case 2:
> +		clk->enable_shift = MXC_CCM_CCGRx_CG7_OFFSET;
> +	}
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_gpt_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG9_OFFSET;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_gpt_ipg_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->enable_reg = MXC_CCM_CCGR2;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG10_OFFSET;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_aips_tz_clk(struct device_node *node)
> +{
> +	const __be32 *reg;
> +	int id;
> +
> +	ALLOC_CLK_LOOKUP();
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg) {
> +		ret = -ENOENT;
> +		goto out_kfree;
> +	}
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 1) {
> +		ret = -EINVAL;
> +		goto out_kfree;
> +	}
> +
> +	clk->id = id;
> +	clk->enable_reg = MXC_CCM_CCGR0;
> +	clk->enable_shift = id ? MXC_CCM_CCGRx_CG12_OFFSET :
> +				 MXC_CCM_CCGRx_CG13_OFFSET;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable_inwait;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_ahb_max_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->enable_reg = MXC_CCM_CCGR0;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG14_OFFSET;
> +	clk->enable = _clk_max_enable;
> +	clk->disable = _clk_max_disable;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_spba_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->enable_reg = MXC_CCM_CCGR5;
> +	clk->enable_shift = MXC_CCM_CCGRx_CG0_OFFSET;
> +	clk->enable = _clk_ccgr_enable;
> +	clk->disable = _clk_ccgr_disable;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_ipg_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->get_rate = clk_ipg_get_rate;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_ahb_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->get_rate = clk_ahb_get_rate;
> +	clk->set_rate = _clk_ahb_set_rate;
> +	clk->round_rate = _clk_ahb_round_rate;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_main_bus_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->set_parent = _clk_main_bus_set_parent;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_lp_apm_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->set_parent = _clk_lp_apm_set_parent;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_pll_switch_clk(struct device_node *node)
> +{
> +	const __be32 *reg;
> +	int id;
> +
> +	ALLOC_CLK_LOOKUP();
> +
> +	reg = of_get_property(node, "reg", NULL);
> +	if (!reg) {
> +		ret = -ENOENT;
> +		goto out_kfree;
> +	}
> +
> +	id = be32_to_cpu(*reg);
> +	if (id < 0 || id > 2) {
> +		ret = -EINVAL;
> +		goto out_kfree;
> +	}
> +
> +	clk->id = id;
> +
> +	switch (id) {
> +	case 0:
> +		clk->get_rate = clk_pll1_sw_get_rate;
> +		clk->set_parent = _clk_pll1_sw_set_parent;
> +		break;
> +	case 1:
> +		clk->get_rate = clk_pll_get_rate;
> +		clk->set_rate = _clk_pll_set_rate;
> +		clk->enable = _clk_pll_enable;
> +		clk->disable = _clk_pll_disable;
> +		clk->set_parent = _clk_pll2_sw_set_parent;
> +		clk->pll_base = MX51_DPLL2_BASE;
> +		break;
> +	case 2:
> +		clk->get_rate = clk_pll_get_rate;
> +		clk->set_rate = _clk_pll_set_rate;
> +		clk->enable = _clk_pll_enable;
> +		clk->disable = _clk_pll_disable;
> +		clk->pll_base = MX51_DPLL3_BASE;
> +	}
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_add_pll1_main_clk(struct device_node *node)
> +{
> +	ALLOC_CLK_LOOKUP();
> +
> +	clk->get_rate = clk_pll_get_rate;
> +	clk->enable = _clk_pll_enable;
> +	clk->disable = _clk_pll_disable;
> +	clk->pll_base = MX51_DPLL1_BASE;
> +
> +	ADD_CLK_LOOKUP();
> +}
> +
> +static __init int mx5_dt_scan_clks(void)
> +{
> +	struct device_node *node;
> +	int ret;
> +
> +	ret = mx5_scan_fixed_clks();
> +	if (ret) {
> +		pr_err("%s: fixed-clock failed %d\n", __func__, ret);
> +		return ret;
> +	}
> +
> +	for_each_compatible_node(node, NULL, "clock") {
> +		if (!strcmp(node->name, "pll1_main"))
> +			ret = mx5_add_pll1_main_clk(node);
> +		else if (!strcmp(node->name, "pll_switch"))
> +			ret = mx5_add_pll_switch_clk(node);
> +		else if (!strcmp(node->name, "lp_apm"))
> +			ret = mx5_add_lp_apm_clk(node);
> +		else if (!strcmp(node->name, "main_bus"))
> +			ret = mx5_add_main_bus_clk(node);
> +		else if (!strcmp(node->name, "ahb"))
> +			ret = mx5_add_ahb_clk(node);
> +		else if (!strcmp(node->name, "ipg"))
> +			ret = mx5_add_ipg_clk(node);
> +		else if (!strcmp(node->name, "spba"))
> +			ret = mx5_add_spba_clk(node);
> +		else if (!strcmp(node->name, "ahb_max"))
> +			ret = mx5_add_ahb_max_clk(node);
> +		else if (!strcmp(node->name, "aips_tz"))
> +			ret = mx5_add_aips_tz_clk(node);
> +		else if (!strcmp(node->name, "gpt_ipg"))
> +			ret = mx5_add_gpt_ipg_clk(node);
> +		else if (!strcmp(node->name, "gpt"))
> +			ret = mx5_add_gpt_clk(node);
> +		else if (!strcmp(node->name, "uart_ipg"))
> +			ret = mx5_add_uart_ipg_clk(node);
> +		else if (!strcmp(node->name, "uart_root"))
> +			ret = mx5_add_uart_root_clk(node);
> +		else if (!strcmp(node->name, "uart"))
> +			ret = mx5_add_uart_clk(node);

You can simplify this whole table is you take advantage of the .data
field in struct of_device_id, and use for_each_matching_node() to
search for relevant nodes.

> +		else
> +			pr_warn("%s: unknown clock node %s\n",
> +				__func__, node->name);
> +
> +		if (ret) {
> +			pr_err("%s: clock %s failed %d\n",
> +				__func__, node->name, ret);
> +			break;
> +		}
> +	}
> +
> +	return ret;
>  }
>  
>  void __init mx5_clk_dt_init(void)
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> linaro-dev mailing list
> linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
> http://lists.linaro.org/mailman/listinfo/linaro-dev
