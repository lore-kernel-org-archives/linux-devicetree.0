From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v7 2/4] soc: qcom: Add AOSS QMP driver
Date: Thu, 23 May 2019 12:09:25 -0700
Message-ID: <20190523190925.GU31438@minitux>
References: <20190501043734.26706-1-bjorn.andersson@linaro.org>
 <20190501043734.26706-3-bjorn.andersson@linaro.org>
 <CAD=FV=VVxKSp6e=j8YM8JBrhsF+T=0=8xDjd_817hphOMWHVFA@mail.gmail.com>
 <5ce6e0cd.1c69fb81.9a03e.0260@mx.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5ce6e0cd.1c69fb81.9a03e.0260@mx.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Doug Anderson <dianders@chromium.org>, Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Thu 23 May 11:05 PDT 2019, Stephen Boyd wrote:

> Quoting Doug Anderson (2019-05-23 09:38:13)
> > Hi,
> > 
> > On Tue, Apr 30, 2019 at 9:38 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > 
> > > +static int qmp_qdss_clk_add(struct qmp *qmp)
> > > +{
> > > +       struct clk_init_data qdss_init = {
> > > +               .ops = &qmp_qdss_clk_ops,
> > > +               .name = "qdss",
> > > +       };
> > 
> > Can't qdss_init be "static const"?  That had the advantage of not
> > needing to construct it on the stack and also of it having a longer
> > lifetime.  It looks like clk_register() stores the "hw" pointer in its
> > structure and the "hw" structure will have a pointer here.  While I
> > can believe that it never looks at it again, it's nice if that pointer
> > doesn't point somewhere on an old stack.
> > 
> > I suppose we could go the other way and try to mark more stuff in this
> > module as __init and __initdata, but even then at least the pointer
> > won't be onto a stack.  ;-)
> > 
> 
> Const would be nice, but otherwise making it static isn't a good idea.
> The clk_init_data structure is all copied over, although we do leave a
> dangling pointer to it stored inside the clk_hw structure we don't use
> it after clk registration. Maybe we should overwrite the pointer with
> NULL once we're done in clk_register() so that clk providers can't use
> it. It might break somebody but would at least clarify this point.
> 

I had to read through the clock code to conclude that this was indeed
the design, so I'm happy with your patch of ensuring that this is
followed. Perhaps add a statement in the kerneldoc for struct clk_hw as
well to state that init won't be accessed past the return of
clk_register.

> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index aa51756fd4d6..56997a974408 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -3438,9 +3438,9 @@ static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
>  	return 0;
>  }
>  
> -static int clk_core_populate_parent_map(struct clk_core *core)
> +static int clk_core_populate_parent_map(struct clk_core *core,
> +					const struct clk_init_data *init)
>  {
> -	const struct clk_init_data *init = core->hw->init;
>  	u8 num_parents = init->num_parents;
>  	const char * const *parent_names = init->parent_names;
>  	const struct clk_hw **parent_hws = init->parent_hws;
> @@ -3520,6 +3520,14 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  {
>  	int ret;
>  	struct clk_core *core;
> +	const struct clk_init_data *init = hw->init;
> +
> +	/*
> +	 * The init data is not supposed to be used outside of registration path.
> +	 * Set it to NULL so that provider drivers can't use it either and so that
> +	 * we catch use of hw->init early on in the core.
> +	 */
> +	hw->init = NULL;
>  
>  	core = kzalloc(sizeof(*core), GFP_KERNEL);
>  	if (!core) {
> @@ -3527,17 +3535,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  		goto fail_out;
>  	}
>  
> -	core->name = kstrdup_const(hw->init->name, GFP_KERNEL);
> +	core->name = kstrdup_const(init->name, GFP_KERNEL);
>  	if (!core->name) {
>  		ret = -ENOMEM;
>  		goto fail_name;
>  	}
>  
> -	if (WARN_ON(!hw->init->ops)) {
> +	if (WARN_ON(!init->ops)) {
>  		ret = -EINVAL;
>  		goto fail_ops;
>  	}
> -	core->ops = hw->init->ops;
> +	core->ops = init->ops;
>  
>  	if (dev && pm_runtime_enabled(dev))
>  		core->rpm_enabled = true;
> @@ -3546,13 +3554,13 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
>  	if (dev && dev->driver)
>  		core->owner = dev->driver->owner;
>  	core->hw = hw;
> -	core->flags = hw->init->flags;
> -	core->num_parents = hw->init->num_parents;
> +	core->flags = init->flags;
> +	core->num_parents = init->num_parents;
>  	core->min_rate = 0;
>  	core->max_rate = ULONG_MAX;
>  	hw->core = core;
>  
> -	ret = clk_core_populate_parent_map(core);
> +	ret = clk_core_populate_parent_map(core, init);
>  	if (ret)
>  		goto fail_parents;
>  

I've reviewed this and it looks good!

Regards,
Bjorn

> 
> > 
> > 
> > > +static void qmp_pd_remove(struct qmp *qmp)
> > > +{
> > > +       struct genpd_onecell_data *data = &qmp->pd_data;
> > > +       struct device *dev = qmp->dev;
> > > +       int i;
> > > +
> > > +       of_genpd_del_provider(dev->of_node);
> > > +
> > > +       for (i = 0; i < data->num_domains; i++)
> > > +               pm_genpd_remove(data->domains[i]);
> > 
> > Still feels like the above loop would be better as:
> >   for (i = data->num_domains - 1; i >= 0; i--)
> > 
> 
> Reason being to remove in reverse order? Otherwise this looks like an
> opinion.
