From: James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: mt8173: add clock_null
Date: Fri, 3 Jul 2015 15:45:12 +0800
Message-ID: <1435909512.3526.71.camel@mtksdaap41>
References: <1434605351-64592-1-git-send-email-eddie.huang@mediatek.com>
	 <8860488.JuX1EN5tWB@diego> <1435132455.28866.21.camel@mtksdaap41>
	 <1510058.fTE6dlSRsH@diego> <1435655229.19330.15.camel@mtksdaap41>
	 <20150701064935.GC18611@pengutronix.de>
	 <CAGS+omBdz2df7ykYpx5Gh1B2Ym+XhpOPOOUu0a_qg7tJKqOy6A@mail.gmail.com>
	 <1435806379.3526.31.camel@mtksdaap41>
	 <CAGS+omCk50Q5b=ey5v1z2gha5Ybc+Fus0Ls+S=5n08xu7Svacw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGS+omCk50Q5b=ey5v1z2gha5Ybc+Fus0Ls+S=5n08xu7Svacw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:OPEN FIRMWARE AND..." <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ted.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eddie Huang <eddie.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, 2015-07-02 at 12:23 +0800, Daniel Kurtz wrote:
> On Thu, Jul 2, 2015 at 11:06 AM, James Liao <jamesjj.liao-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> > These clocks such as clkph_mck_o are configured by other modules before
> > kernel init, and their rates may different among platforms.
> 
> What other modules?
> Do you mean the rates are configured by firmware?
> How are the rates set?
> Are there registers that configure its rate?
> If so, why can't the kernel read these registers and compute the current rate?

CLKPH_MCK_O for example, it's a DRAM related clock, and initialized in
preloader (before kernel init). It's setting may be different because
using different DRAM module. And the setting may be changed dynamically
in runtime.

We don't care CLKPH_MCK_O's rate in CCF because we don't need to change
mem_sel's setting in kernel, and there is not driver need to know
mem_sel's rate.

> 
> For mt8173, we are essentially discussing the following clocks (whose
> sole parent is clk_null):
> 
> FACTOR(CLK_TOP_CLKPH_MCK_O, "clkph_mck_o", "clk_null", 1, 1),
> FACTOR(CLK_TOP_DPI, "dpi_ck", "clk_null", 1, 1),
> FACTOR(CLK_TOP_USB_SYSPLL_125M, "usb_syspll_125m", "clk_null", 1, 1),
> FACTOR(CLK_TOP_HDMITX_DIG_CTS, "hdmitx_dig_cts", "clk_null", 1, 1),
> GATE_ICG(CLK_INFRA_CPUM, "infra_cpum", "clk_null", 15),
> GATE_MM1(CLK_MM_DSI0_DIGITAL, "mm_dsi0_digital", "clk_null", 5),
> GATE_MM1(CLK_MM_DSI1_DIGITAL, "mm_dsi1_digital", "clk_null", 7),
> GATE_MM1(CLK_MM_DPI1_PIXEL, "mm_dpi1_pixel", "clk_null", 10),
> GATE_MM1(CLK_MM_LVDS_PIXEL, "mm_lvds_pixel", "clk_null", 16),
> GATE_MM1(CLK_MM_LVDS_CTS, "mm_lvds_cts", "clk_null", 17),
> 
> clkph_mck_o - This is the parent for dmpll_*, which are themselves
> (potential) parent clocks for nearly every subsystem.
> In fact, as shown above, the dmpll_* is the selected parent for
> several other clocks, which all end up with an unknown rate.
> So, I think it is worth investigating a little more how to properly
> read or otherwise specify the rate for clkph_mck_o.

Please see above.

> dpi_ck, infra_cpum, mm_dsi0_digital, mm_dsi1_digital, mm_lvds_cts -
> These are a dead-end (internal?) clock.
> It is probably fine if their rates are unknown (0 Hz).
> 
> usb_syspll_125m - This sounds like a fixed 125 MHz clock.  It is also
> a possible parent usb30 clock, so its value will propagate.
> 
> hdmitx_dig_cts - This is the root clock for the tree leading to
> mm_hdmi_pllck, which includes hdmitxpll_d* and hdmi_sel.
> However, I don't know how "mm_hdmi_pllck" is used.
> 
> mm_dpi1_pixel, mm_lvds_pixel - These two look very suspicious.  The
> similar "mm_dpi0_pixel" and "mm_hdmi_pixel" have parent dpi0_sel.
> It looks like maybe they should have "dpi1_sel" or "dpilvds_sel" as
> parents, but the _sel are not hooked up.

Subsystem clocks with parent clk_null may have different reasons. I'll
get back to you later.


Best regards,

James





--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
