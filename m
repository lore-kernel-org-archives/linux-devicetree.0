From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v7 4/5] clk: Provide critical clock support
Date: Mon, 17 Aug 2015 13:43:55 +0800
Message-ID: <CAGsJ_4zKn-o4ZxZ0-xzCStvuTkdC5xqD9FneWna-0dNVgp=1DQ@mail.gmail.com>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org> <1437570255-21049-5-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437570255-21049-5-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

2015-07-22 21:04 GMT+08:00 Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>:
> Lots of platforms contain clocks which if turned off would prove fatal.
> The only way to recover from these catastrophic failures is to restart
> the board(s).  Now, when a clock provider is registered with the
> framework it is possible for a list of critical clocks to be supplied
> which must be kept ungated.  Each clock mentioned in the newly
> introduced 'critical-clock' property will be clk_prepare_enable()d
> where the normal references will be taken.  This will prevent the
> common clk framework from attempting to gate them during the normal
> clk_disable_unused() and disable_clock() procedures.
>
> Note that it will still be possible for knowledgeable drivers to turn
> these clocks off using clk_{enable,disable}_critical() calls.
>
> Signed-off-by: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

hi Lee,
i have another email about this. i am wondering whether
CLK_IGNORE_UNUSE is still useful after your patch. another solution
for your patch might be extending the current CLK_IGNORE_UNUSE to
runtime?


copy the mail here:
currently we can set a CLK_IGNORE_UNUSE flag to  a clock to stop
clk_disable_unused()  from disabling it at the boot stage:

static void clk_disable_unused_subtree(struct clk_core *core)
{
...

if (core->flags & CLK_IGNORE_UNUSED)
goto unlock_out;
}

static int clk_disable_unused(void)
{
...

clk_unprepare_unused_subtree(core);
...
 return 0;
}

late_initcall_sync(clk_disable_unused);

so if there are two clocks A and B, A is the parent of B, and A is
marked as CLK_IGNORE_UNUSED.

in boot stage if there is nobody using A and B, Linux will disable B
due to clk_disable_unused() , but keep A being enabled since A has
CLK_IGNORE_UNUSED.

but in Linux runtime, we might frequently disable /enable B in runtime
power management, this will cause A disabled since Linux will not
check CLK_IGNORE_UNUSED for runtime disabling clk .

 so this makes CLK_IGNORE_UNUSE only work if we don't disable its
sub-clock at runtime. this looks making no sense.

 i am thinking whether we should do some changes to make it have side
affect for runtime clk disable. otherwise, why do we want to stop it
from being disabled during boot stage?

 I am not sure whether i missed something in clk core level support.

-barry

> ---
>  drivers/clk/clk-conf.c | 45 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-conf.c b/drivers/clk/clk-conf.c
> index aad4796..f83c1c2 100644
> --- a/drivers/clk/clk-conf.c
> +++ b/drivers/clk/clk-conf.c
> @@ -116,6 +116,45 @@ static int __set_clk_rates(struct device_node *node, bool clk_supplier)
>         return 0;
>  }
>
> +static int __set_critical_clocks(struct device_node *node, bool clk_supplier)
> +{
> +       struct of_phandle_args clkspec;
> +       struct clk *clk;
> +       struct property *prop;
> +       const __be32 *cur;
> +       uint32_t index;
> +       int ret;
> +
> +       if (!clk_supplier)
> +               return 0;
> +
> +       of_property_for_each_u32(node, "critical-clock", prop, cur, index) {
> +               clkspec.np = node;
> +               clkspec.args_count = 1;
> +               clkspec.args[0] = index;
> +
> +               clk = of_clk_get_from_provider(&clkspec);
> +               if (IS_ERR(clk)) {
> +                       pr_err("clk: couldn't get clock %u for %s\n",
> +                               index, node->full_name);
> +                       return PTR_ERR(clk);
> +               }
> +
> +               clk_init_critical(clk);
> +
> +               ret = clk_prepare_enable(clk);
> +               if (ret) {
> +                       pr_err("Failed to enable clock %u for %s: %d\n",
> +                              index, node->full_name, ret);
> +                       return ret;
> +               }
> +
> +               pr_debug("Setting clock as critical %pC\n", clk);
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * of_clk_set_defaults() - parse and set assigned clocks configuration
>   * @node: device node to apply clock settings for
> @@ -139,6 +178,10 @@ int of_clk_set_defaults(struct device_node *node, bool clk_supplier)
>         if (rc < 0)
>                 return rc;
>
> -       return __set_clk_rates(node, clk_supplier);
> +       rc = __set_clk_rates(node, clk_supplier);
> +       if (rc < 0)
> +               return rc;
> +
> +       return __set_critical_clocks(node, clk_supplier);
>  }
>  EXPORT_SYMBOL_GPL(of_clk_set_defaults);
> --
> 1.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
