From: Leo Yan <leo.yan-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] clk: hisi: add stub clk driver
Date: Fri, 27 Mar 2015 10:08:42 +0800
Message-ID: <20150327020842.GD4902@leoy-linaro>
References: <1427368419-22222-1-git-send-email-leo.yan@linaro.org>
 <1427368419-22222-4-git-send-email-leo.yan@linaro.org>
 <20150326142226.GJ8656@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150326142226.GJ8656-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Dan Zhao <dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Mar 26, 2015 at 02:22:26PM +0000, Russell King - ARM Linux wrote:
> On Thu, Mar 26, 2015 at 07:13:38PM +0800, Leo Yan wrote:
> > +static unsigned long hisi_stub_clk_recalc_rate(struct clk_hw *hw,
> > +		unsigned long parent_rate)
> > +{
> ...
> > +	BUG_ON(!stub_clk->lock);
> ...
> 
> > +static int hisi_stub_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                    unsigned long parent_rate)
> > +{
> ...
> > +	BUG_ON(!stub_clk->lock);
> ...
> 
> > +static long hisi_stub_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> > +		unsigned long *parent_rate)
> > +{
> ...
> > +	BUG_ON(!stub_clk->lock);
> ...
> 
> > +static struct clk_ops hisi_stub_clk_ops = {
> > +	.recalc_rate	= hisi_stub_clk_recalc_rate,
> > +	.round_rate	= hisi_stub_clk_round_rate,
> > +	.set_rate	= hisi_stub_clk_set_rate,
> > +};
> ...
> > +static struct clk *_register_stub_clk(struct device *dev, unsigned int id,
> > +	const char *name, const char *parent_name, unsigned long flags,
> > +	spinlock_t *lock)
> > +{
> > +	struct hisi_stub_clk *stub_clk;
> > +	struct clk *clk;
> > +	struct clk_init_data init;
> > +
> > +	stub_clk = kzalloc(sizeof(*stub_clk), GFP_KERNEL);
> > +	if (!stub_clk) {
> > +		pr_err("%s: fail to alloc stub clk!\n", __func__);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	init.name = name;
> > +	init.ops = &hisi_stub_clk_ops;
> > +	init.parent_names = parent_name ? &parent_name : NULL;
> > +	init.num_parents = parent_name ? 1 : 0;
> > +	init.flags = flags;
> > +
> > +	stub_clk->hw.init = &init;
> > +	stub_clk->id = id;
> > +	stub_clk->lock = lock;
> 
> Under what scenario is it safe to call _register_stub_clk() with a NULL
> lock argument?
> 
> If lock is NULL, then every function callable via the ops structure
> will bug.
> 
> Rather than doing a test in each method function, do it in
> _register_stub_clk() - this means we aren't waiting for a NULL pointer
> deref when one of these method functions gets called.

Will fix to check lock pointer in the function _register_stub_clk().

Thanks,
Leo Yan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
