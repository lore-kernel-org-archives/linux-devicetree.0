From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v3 2/2] clk: renesas: cpg-mssr: add R8A7743 support
Date: Wed, 26 Oct 2016 14:14:25 +0200
Message-ID: <CAMuHMdV9O97qWskZ=EWz-kSy_rV_U5rfrsRDWRHUB2WiFXAq7w@mail.gmail.com>
References: <1582226.1VeLLfmmeJ@wasted.cogentembedded.com> <5038285.9DcXKlHSpF@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5038285.9DcXKlHSpF-gHKXc3Y1Z8zGSmamagVegGFoWSdPRAKMAL8bYrjMMd8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Oct 21, 2016 at 10:17 PM, Sergei Shtylyov
<sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org> wrote:
> --- /dev/null
> +++ linux/drivers/clk/renesas/r8a7743-cpg-mssr.c
> @@ -0,0 +1,264 @@

> +static int __init r8a7743_cpg_mssr_init(struct device *dev)
> +{
> +       const struct rcar_gen2_cpg_pll_config *cpg_pll_config;
> +       u32 cpg_mode = rcar_gen2_read_modemr();

It would be good if we could appply "[PATCH v4 00/23] soc: renesas: Add R-Car
RST driver for obtaining mode pin state" first, and change this driveer to
use rcar_rst_read_mode_pins() instead.

> +       cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
> +
> +       return rcar_gen2_cpg_init(cpg_pll_config);
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
