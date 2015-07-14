From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 4/5] clk: mediatek: add 13mhz clock for MT8173
Date: Tue, 14 Jul 2015 15:34:10 +0800
Message-ID: <CAGS+omCyfJW7YhfvRbX5as+Ta9gnSO4RQuzENrLOOy9iHnSytw@mail.gmail.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com> <1436779969-18610-5-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1436779969-18610-5-git-send-email-yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Add 13mhz clock used by GPT timer in infracfg.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/clk/mediatek/clk-mt8173.c      | 5 +++++
>  include/dt-bindings/clock/mt8173-clk.h | 3 ++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index 4b9e04c..540c5c3 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -618,6 +618,10 @@ static const struct mtk_gate infra_clks[] __initconst = {
>         GATE_ICG(CLK_INFRA_PMICWRAP, "infra_pmicwrap", "axi_sel", 23),
>  };
>
> +static const struct mtk_fixed_factor infra_divs[] __initconst = {
> +       FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
> +};
> +
>  static const struct mtk_gate_regs peri0_cg_regs = {
>         .set_ofs = 0x0008,
>         .clr_ofs = 0x0010,
> @@ -737,6 +741,7 @@ static void __init mtk_infrasys_init(struct device_node *node)
>
>         mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
>                                                 clk_data);
> +       mtk_clk_register_factors(infra_divs, ARRAY_SIZE(infra_divs), clk_data);
>
>         r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
>         if (r)
> diff --git a/include/dt-bindings/clock/mt8173-clk.h b/include/dt-bindings/clock/mt8173-clk.h
> index 4ad76ed..fa2a2bb 100644
> --- a/include/dt-bindings/clock/mt8173-clk.h
> +++ b/include/dt-bindings/clock/mt8173-clk.h
> @@ -187,7 +187,8 @@
>  #define CLK_INFRA_CEC                  9
>  #define CLK_INFRA_PMICSPI              10
>  #define CLK_INFRA_PMICWRAP             11
> -#define CLK_INFRA_NR_CLK               12
> +#define CLK_INFRA_CLK_13M              12
> +#define CLK_INFRA_NR_CLK               13

Note: this one conflicts slightly with pi-cheng's patch that adds CPU
mux clocks for cpufreq driver, since they both add more INFRA clocks:
https://patchwork.kernel.org/patch/6721511/

>
>  /* PERI_SYS */
>
> --
> 1.8.1.1.dirty
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
