From: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: Re: [PATCH v4 5/5] [RFC] clk: shmobile: r8a7795: Add new CPG/MSSR driver
Date: Tue, 20 Oct 2015 14:31:12 +0200
Message-ID: <CAMuHMdUT=fZKCOCdkn+=grZ0wYATghQhmbX-Y6WJ9+ViZ0cidA@mail.gmail.com>
References: <1444999760-15750-1-git-send-email-geert+renesas@glider.be>
	<1444999760-15750-6-git-send-email-geert+renesas@glider.be>
	<20151020122448.20687.11926@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151020122448.20687.11926@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Magnus Damm <damm+renesas-yzvPICuk2ACczHhG9Qg4qA@public.gmane.org>, Simon Horman <horms+renesas-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-clk <linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux-sh list <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Mike,

On Tue, Oct 20, 2015 at 2:24 PM, Michael Turquette
<mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org> wrote:
> Quoting Geert Uytterhoeven (2015-10-16 05:49:20)
>> +static void __init r8a7795_cpg_mssr_init(struct device_node *np)
>> +{
>> +       struct regmap *regmap;
>> +       u32 reg, cpg_mode;
>> +
>> +       regmap =3D syscon_regmap_lookup_by_phandle(np, "renesas,mode=
mr");
>> +       if (IS_ERR(regmap) ||
>> +           of_property_read_u32_index(np, "renesas,modemr", 1, &reg=
) ||
>> +           regmap_read(regmap, reg, &cpg_mode)) {
>> +               pr_err("%s: failed to parse renesas,modemr\n", np->f=
ull_name);
>> +               return;
>> +       }
>> +
>> +       cpg_pll_config =3D &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg=
_mode)];
>> +       if (!cpg_pll_config->extal_div) {
>> +               pr_err("%s: Prohibited setting (cpg_mode=3D0x%x)\n",
>> +                      __func__, cpg_mode);
>> +               return;
>> +       }
>> +
>> +       cpg_mssr_probe(np, &r8a7795_cpg_mssr_info);
>> +}
>> +CLK_OF_DECLARE(r8a7795_cpg_mssr, "renesas,r8a7795-cpg-mssr",
>> +              r8a7795_cpg_mssr_init);
>
> Is CLK_OF_DECLARE needed? Is it possible to make this a real
> platform_driver =C3=A0 la drivers/clk/qcom/gcc-apq8084.c?

I tried making it a real platform driver, but it failed: devices that a=
re
part of the Clock Domain failed to get their clock (error -2, IIRC, whi=
ch is
-ENOENT), and thus couldn't be instantiated.
I didn't look deeper at that time.

[... reading code ...]

Aha, this may be caused by __of_clk_get_from_provider() returning
hardcoded -ENOENT instead of propagating the error returned by
__clk_create_clk()?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
