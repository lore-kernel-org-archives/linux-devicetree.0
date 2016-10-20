From: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 2/2] clk: renesas: cpg-mssr: add R8A7743 support
Date: Thu, 20 Oct 2016 22:47:23 +0300
Message-ID: <e8461bb6-6136-f589-4475-37c690ca4704@cogentembedded.com>
References: <9246696.7P1aOyyQt4@wasted.cogentembedded.com>
 <2357731.SxJodxn1PJ@wasted.cogentembedded.com>
 <CAMuHMdW_XSCfy+Kv6uz1pX7q-XFPp=nkaXSehbZJYAeOt6Rf4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAMuHMdW_XSCfy+Kv6uz1pX7q-XFPp=nkaXSehbZJYAeOt6Rf4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Cc: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-Renesas <linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello.

On 10/19/2016 12:06 PM, Geert Uytterhoeven wrote:

>> Add RZ/G1M (R8A7743) Clock  Pulse Generator / Module Standby and Software
>> Reset support, using the CPG/MSSR driver core and the common R-Car Gen2
>> (and RZ/G) code.
>>
>> Based on the proof-of-concept R8A7791 CPG/MSSR patch by Geert Uytterhoeven
>> <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
>
> Thanks a lot!
>
> With the few minor nits below fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
>
>> --- /dev/null
>> +++ renesas/drivers/clk/renesas/r8a7743-cpg-mssr.c
>
>> +static const struct mssr_mod_clk r8a7743_mod_clks[] __initconst = {
>
>> +       DEF_MOD("mmcif0",         315,  R8A7743_CLK_MMC0),
>
> "mmc0"

    There's also "mmc0" CPG clock, so I thought I'd rename this one.

>> +       DEF_MOD("audio-dmac0",    502,  R8A7743_CLK_HP),
>> +       DEF_MOD("audio-dmac1",    501,  R8A7743_CLK_HP),
>
> Please sort by numerical clock ID.

    Oops, will do.

>> +       DEF_MOD("i2c6",           926,  R8A7743_CLK_CP),
>
> "iicdvfs"

    Not sure how I missed that...

>> +static const unsigned int r8a7743_crit_mod_clks[] __initconst = {
>> +       MOD_CLK_ID(408),        /* INTC-AP (GIC) */
>
> INTC-SYS

    OK.

[...]
>> +static const struct rcar_gen2_cpg_pll_config cpg_pll_configs[8] __initconst = {
>> +       /* EXTAL div    PLL1 mult       PLL3 mult */
>> +       { 1,            208,            106,    },
>> +       { 1,            208,            88,     },
>> +       { 1,            156,            80,     },
>> +       { 1,            156,            66,     },
>> +       { 2,            240,            122,    },
>> +       { 2,            240,            102,    },
>> +       { 2,            208,            106,    },
>> +       { 2,            208,            88,     },
>> +};
>> +
>> +static int __init r8a7743_cpg_mssr_init(struct device *dev)
>> +{
>> +       const struct rcar_gen2_cpg_pll_config *cpg_pll_config;
>> +       u32 cpg_mode = rcar_gen2_read_modemr();
>> +
>> +       cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
>> +       if (!cpg_pll_config->extal_div) {
>
> This check is not needed, as extal_div is never zero in the above table.

    Indeed, will fix.

>> +               dev_err(dev, "Prohibited setting (cpg_mode=0x%x)\n", cpg_mode);
>> +               return -EINVAL;
>> +       }
>
> Gr{oetje,eeting}s,
>
>                         Geert

WBR, Sergei

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
