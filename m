From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH v6 5/9] clk: mediatek: Fix rate and dependency of MT8173
 clocks
Date: Wed, 5 Aug 2015 08:53:41 +0200
Message-ID: <20150805065341.GA18700@pengutronix.de>
References: <1438676218-11310-1-git-send-email-jamesjj.liao@mediatek.com>
 <1438676218-11310-6-git-send-email-jamesjj.liao@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1438676218-11310-6-git-send-email-jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Heiko Stubner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Ricky Liang <jcliang-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Aug 04, 2015 at 04:16:54PM +0800, James Liao wrote:
> Remove the dependency from clk_null, and give all root clocks a
> typical rate, include clkph_mck_o, usb_syspll_125m and hdmitx_dig_cts.
> 
> dpi_ck was removed due to no clock reference to it.
> 
> Replace parent clock of infra_cpum with cpum_ck, which is an external
> clock and can be defined in the device tree.
> 
> Signed-off-by: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/clk/mediatek/clk-mt8173.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173.c b/drivers/clk/mediatek/clk-mt8173.c
> index 361fe32..f37ace6 100644
> --- a/drivers/clk/mediatek/clk-mt8173.c
> +++ b/drivers/clk/mediatek/clk-mt8173.c
> @@ -22,10 +22,9 @@
>  
>  static DEFINE_SPINLOCK(mt8173_clk_lock);
>  
> -static const struct mtk_fixed_factor root_clk_alias[] __initconst = {
> -	FACTOR(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk_null", 1, 1),
> -	FACTOR(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk_null", 1, 1),
> -	FACTOR(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts", "clk_null", 1, 1),
> +static const struct mtk_fixed_clk fixed_clks[] __initconst = {
> +	FIXED_CLK(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk26m", 400 * MHZ),
> +	FIXED_CLK(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk26m", 125 * MHZ),

Hm, it seems you hide PLLs in fixed factor clock. Are you sure that
there is a PLL in the system generating 125MHz from 26MHz which is in no
way configurable? Or is this really some clock derived from the syspll
as the clock name suggests?

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
