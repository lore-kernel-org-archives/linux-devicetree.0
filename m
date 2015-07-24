From: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 5/7] clk: mediatek: Add subsystem clocks of MT8173
Date: Fri, 24 Jul 2015 19:18:43 +0800
Message-ID: <CAGS+omB6LpttP_67iJsGrgLv6=B28FHq7RGbcRw_LaOd4LzCLQ@mail.gmail.com>
References: <1437706925-3222-1-git-send-email-jamesjj.liao@mediatek.com> <1437706925-3222-6-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1437706925-3222-6-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, srv_heupstream <srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Jul 24, 2015 at 11:02 AM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Most multimedia subsystem clocks will be accessed by multiple
> drivers, so it's a better way to manage these clocks in CCF.
> This patch adds clock support for MM, IMG, VDEC, VENC and VENC_LT
> subsystems.
>
> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/clk/mediatek/clk-mt8173.c      | 267 +++++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/mt8173-clk.h |  97 +++++++++++-
>  2 files changed, 361 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index a72ce82..2cf6620 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -27,6 +27,10 @@ static DEFINE_SPINLOCK(mt8173_clk_lock);
>  static const struct mtk_fixed_clk fixed_clks[] __initconst = {
>         FIXED_CLK(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk26m", 400 * MHZ),
>         FIXED_CLK(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk26m", 125 * MHZ),
> +       FIXED_CLK(CLK_TOP_DSI0_DIG, "dsi0_dig", "clk26m", 130 * MHZ),
> +       FIXED_CLK(CLK_TOP_DSI1_DIG, "dsi1_dig", "clk26m", 130 * MHZ),
> +       FIXED_CLK(CLK_TOP_LVDS_PXL, "lvds_pxl", "lvdspll", 148.5 * MHZ),
> +       FIXED_CLK(CLK_TOP_LVDS_CTS, "lvds_cts", "lvdspll", 51.975 * MHZ),
>  };
>
>  static const struct mtk_fixed_factor top_divs[] __initconst = {
> @@ -699,6 +703,183 @@ static const struct mtk_composite peri_clks[] __initconst = {
>         MUX(CLK_PERI_UART3_SEL, "uart3_ck_sel", uart_ck_sel_parents, 0x40c, 3, 1),
>  };
>
> +static const struct mtk_gate_regs cg_regs_4_8_0 = {

All of these regs tables can be __initconst.

Otherwise:
Reviewed-by: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

-Dan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
