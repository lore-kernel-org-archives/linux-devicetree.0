From: Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH 3/5] arm/dt: mx51: dynamically add gpt and uart related
	clocks per dt nodes
Date: Wed, 16 Mar 2011 20:04:56 +0800
Message-ID: <20110316120455.GA11658@S2100-06.ap.freescale.net>
References: <1299514932-13558-1-git-send-email-shawn.guo@linaro.org>
	<1299514932-13558-4-git-send-email-shawn.guo@linaro.org>
	<20110315073731.GG23050@angua.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20110315073731.GG23050-MrY2KI0G/OVr83L8+7iqerDks+cytr/Z@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Mar 15, 2011 at 01:37:31AM -0600, Grant Likely wrote:
> On Tue, Mar 08, 2011 at 12:22:10AM +0800, Shawn Guo wrote:
> > This patch is to change the static clock creating and registering to
> > the dynamic way, which scans dt clock nodes, associate clk with
> > device_node, and then add them to clkdev accordingly.
> > 
> > Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> > ---
> >  arch/arm/mach-mx5/clock-mx51-mx53.c |  436 +++++++++++++++++++++++++++++++++--
> >  1 files changed, 422 insertions(+), 14 deletions(-)
> > 
> > diff --git a/arch/arm/mach-mx5/clock-mx51-mx53.c b/arch/arm/mach-mx5/clock-mx51-mx53.c
> > index dedb7f9..1940171 100644
> > --- a/arch/arm/mach-mx5/clock-mx51-mx53.c
> > +++ b/arch/arm/mach-mx5/clock-mx51-mx53.c
> > @@ -135,6 +135,9 @@ static inline u32 _get_mux(struct clk *parent, struct clk *m0,
> >  
> >  static inline void __iomem *_mx51_get_pll_base(struct clk *pll)
> >  {
> > +#ifdef CONFIG_OF
> > +	return pll->pll_base;
> > +#else
> >  	if (pll == &pll1_main_clk)
> >  		return MX51_DPLL1_BASE;
> >  	else if (pll == &pll2_sw_clk)
> > @@ -145,6 +148,7 @@ static inline void __iomem *_mx51_get_pll_base(struct clk *pll)
> >  		BUG();
> >  
> >  	return NULL;
> > +#endif
> >  }
> >  
> >  static inline void __iomem *_mx53_get_pll_base(struct clk *pll)
> > @@ -1439,33 +1443,437 @@ int __init mx53_clocks_init(unsigned long ckil, unsigned long osc,
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Dynamically create and register clks per dt nodes
> > + */
> >  #ifdef CONFIG_OF
> > -static struct clk *mx5_dt_clk_get(struct device_node *np,
> > -					const char *output_id, void *data)
> > +
> > +#define ALLOC_CLK_LOOKUP()						\
> > +	struct clk_lookup *cl;						\
> > +	struct clk *clk;						\
> > +	int ret;							\
> > +									\
> > +	do {								\
> > +		cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);	\
> > +		if (!cl)						\
> > +			return -ENOMEM;					\
> > +		clk = (struct clk *) (cl + 1);				\
> > +									\
> > +		clk->parent = mx5_get_source_clk(node);			\
> > +		clk->secondary = mx5_get_source_clk(node);		\
> > +	} while (0)
> > +
> > +#define ADD_CLK_LOOKUP()						\
> > +	do {								\
> > +		node->data = clk;					\
> > +		cl->dev_id = of_get_property(node,			\
> > +				"clock-outputs", NULL);			\
> > +		cl->con_id = of_get_property(node,			\
> > +				"clock-alias", NULL);			\
> > +		if (!cl->dev_id && !cl->con_id) {			\
> > +			ret = -EINVAL;					\
> > +			goto out_kfree;					\
> > +		}							\
> > +		cl->clk = clk;						\
> > +		clkdev_add(cl);						\
> > +									\
> > +		return 0;						\
> > +									\
> > +	out_kfree:							\
> > +		kfree(cl);						\
> > +		return ret;						\
> > +	} while (0)
> 
> Yikes!  Doing this as a macro will be a nightmare for debugging.
> This needs refactoring into functions.
> 
> > +
> > +static unsigned long get_fixed_clk_rate(struct clk *clk)
> >  {
> > -	return data;
> > +	return clk->rate;
> >  }
> >  
> > -static __init void mx5_dt_scan_clks(void)
> > +static __init int mx5_scan_fixed_clks(void)
> >  {
> >  	struct device_node *node;
> > +	struct clk_lookup *cl;
> >  	struct clk *clk;
> > -	const char *id;
> > -	int rc;
> > +	const __be32 *rate;
> > +	int ret = 0;
> >  
> > -	for_each_compatible_node(node, NULL, "clock") {
> > -		id = of_get_property(node, "clock-outputs", NULL);
> > -		if (!id)
> > +	for_each_compatible_node(node, NULL, "fixed-clock") {
> > +		cl = kzalloc(sizeof(*cl) + sizeof(*clk), GFP_KERNEL);
> > +		if (!cl) {
> > +			ret = -ENOMEM;
> > +			break;
> > +		}
> > +		clk = (struct clk *) (cl + 1);
> > +
> > +		rate = of_get_property(node, "clock-frequency", NULL);
> > +		if (!rate) {
> > +			kfree(cl);
> >  			continue;
> > +		}
> > +		clk->rate = be32_to_cpu(*rate);
> > +		clk->get_rate = get_fixed_clk_rate;
> > +
> > +		node->data = clk;
> >  
> > -		clk = clk_get_sys(id, NULL);
> > -		if (IS_ERR(clk))
> > +		cl->dev_id = of_get_property(node, "clock-outputs", NULL);
> > +		cl->con_id = of_get_property(node, "clock-alias", NULL);
> 
> As discussed briefly earlier, clock-alias looks like it is encoding
> Linux-specific implementation details into the device tree, and it
> shouldn't be necessary when explicit links to clock providers are
> supplied in the device tree.
> 
> > +		if (!cl->dev_id && !cl->con_id) {
> > +			kfree(cl);
> >  			continue;
> > +		}
> > +		cl->clk = clk;
> > +		clkdev_add(cl);
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +static struct clk *mx5_prop_name_to_clk(struct device_node *node,
> > +		const char *prop_name)
> > +{
> > +	struct device_node *provnode;
> > +	struct clk *clk;
> > +	const void *prop;
> > +	u32 provhandle;
> > +
> > +	prop = of_get_property(node, prop_name, NULL);
> > +	if (!prop)
> > +		return NULL;
> > +	provhandle = be32_to_cpup(prop);
> > +
> > +	provnode = of_find_node_by_phandle(provhandle);
> > +	if (!provnode)
> > +		return NULL;
> > +
> > +	clk = provnode->data;
> > +
> > +	of_node_put(provnode);
> > +
> > +	return clk;
> > +}
> > +
> > +static inline struct clk *mx5_get_source_clk(struct device_node *node)
> > +{
> > +	return mx5_prop_name_to_clk(node, "clock-source");
> > +}
> > +
> > +static inline struct clk *mx5_get_depend_clk(struct device_node *node)
> > +{
> > +	return mx5_prop_name_to_clk(node, "clock-depend");
> > +}
> 
> Ditto here.  'clock-depend' seems to be Linux specifc.  I need to look
> at the usage model for these properties.
> 
This is not Linux but hardware specific.  Let's look at the eSDHC1
example below.

                esdhc1_clk: esdhc@0 {
                        compatible = "fsl,mxc-clock";
                        reg = <0>;
                        clock-outputs = "sdhci-esdhc-imx.0";
                        clock-source = <&pll2_sw_clk>;
                        clock-depend = <&esdhc1_ipg_clk>;
                };


We have esdhc1_clk added to clkdev standing for the clock for hardware
block eSDHC1.  This clock is actually the serial clock of eSDHC1,
while eSDHC1 internal working clock esdhc1_ipg_clk has also to be on
to get the block functional.

-- 
Regards,
Shawn
