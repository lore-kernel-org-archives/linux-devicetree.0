From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add display clock controller driver for SDM845
Date: Tue, 19 Jun 2018 08:22:09 -0700
Message-ID: <152942172986.16708.14472226838173862978@swboyd.mtv.corp.google.com>
References: <1528098985-3676-1-git-send-email-tdas@codeaurora.org>
 <1528098985-3676-3-git-send-email-tdas@codeaurora.org>
 <152879014163.16708.9093599796057889104@swboyd.mtv.corp.google.com>
 <a397c3f9-1e4e-b6db-299b-0ecfd1726226@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a397c3f9-1e4e-b6db-299b-0ecfd1726226@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>, robh@kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-06-13 02:18:59)
> Hello Stephen,
> =

> Thanks for review.
> =

> On 6/12/2018 1:25 PM, Stephen Boyd wrote:
> > Quoting Taniya Das (2018-06-04 00:56:25)
> >> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispc=
c-sdm845.c
> >> new file mode 100644
> >> index 0000000..317ab33
> >> --- /dev/null
> >> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> =

> >> +#include "common.h"
> >> +#include "gdsc.h"
> >> +#include "reset.h"
> >> +
> >> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> > =

> > We really need to move this into the header file.
> > =

> > $ git grep '#define F(' -- drivers/clk/qcom/ | wc -l
> > 13
> > =

> Sure, will move this in a header and submit the patch.

Thanks!

> >> +
> >> +static struct clk_alpha_pll disp_cc_pll0 =3D {
> >> +       .offset =3D 0x0,
> >> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> >> +       .clkr =3D {
> >> +               .hw.init =3D &(struct clk_init_data){
> >> +                       .name =3D "disp_cc_pll0",
> >> +                       .parent_names =3D (const char *[]){ "bi_tcxo" =
},
> >> +                       .num_parents =3D 1,
> >> +                       .ops =3D &clk_alpha_pll_fabia_ops,
> >> +               },
> >> +       },
> >> +};
> > [...]
> >> +
> >> +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src =3D {
> >> +       .cmd_rcgr =3D 0x2058,
> >> +       .mnd_width =3D 8,
> >> +       .hid_width =3D 5,
> >> +       .parent_map =3D disp_cc_parent_map_4,
> >> +       .clkr.hw.init =3D &(struct clk_init_data){
> >> +               .name =3D "disp_cc_mdss_pclk0_clk_src",
> >> +               .parent_names =3D disp_cc_parent_names_4,
> >> +               .num_parents =3D 4,
> >> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> > =

> > Why is the nocache flag needed? Applies to all clks in this file.
> > =

> =

> This flag is required for all RCGs whose PLLs are controlled outside the =

> clock controller. The display code would require the recalculated rate =

> always.

That doesn't really answer the question. It seems to describe some sort
of problem with the PLL being controlled outside the clk controller/clk
framework. Please add more details and comments into the code here.

> =

> >> +               .ops =3D &clk_pixel_ops,
> >> +       },
> >> +};
> >> +
> >> +static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src =3D {
> >> +       .cmd_rcgr =3D 0x2070,
> >> +       .mnd_width =3D 8,
> >> +       .hid_width =3D 5,
> >> +       .parent_map =3D disp_cc_parent_map_4,
> >> +       .clkr.hw.init =3D &(struct clk_init_data){
> > [...]
> >> +
> >> +static const struct regmap_config disp_cc_sdm845_regmap_config =3D {
> >> +       .reg_bits       =3D 32,
> >> +       .reg_stride     =3D 4,
> >> +       .val_bits       =3D 32,
> >> +       .max_register   =3D 0x10000,
> > =

> > This seems arbitrarily large. List the actual end?
> > =

> The actual end is larger than this :( , I have listed the range till the =

> register offset are used here.

Ok.

> =

> >> +       .fast_io        =3D true,
> >> +};
> >> +
> >> +static const struct qcom_cc_desc disp_cc_sdm845_desc =3D {
> >> +       .config =3D &disp_cc_sdm845_regmap_config,
> >> +       .clks =3D disp_cc_sdm845_clocks,
> >> +       .num_clks =3D ARRAY_SIZE(disp_cc_sdm845_clocks),
> >> +       .resets =3D disp_cc_sdm845_resets,
> >> +       .num_resets =3D ARRAY_SIZE(disp_cc_sdm845_resets),
> >> +       .gdscs =3D disp_cc_sdm845_gdscs,
> >> +       .num_gdscs =3D ARRAY_SIZE(disp_cc_sdm845_gdscs),
> >> +};
> >> +
> >> +static const struct of_device_id disp_cc_sdm845_match_table[] =3D {
> >> +       { .compatible =3D "qcom,sdm845-dispcc" },
> >> +       { }
> >> +};
> >> +MODULE_DEVICE_TABLE(of, disp_cc_sdm845_match_table);
> >> +
> >> +static int disp_cc_sdm845_probe(struct platform_device *pdev)
> >> +{
> >> +       struct regmap *regmap;
> >> +
> >> +       regmap =3D qcom_cc_map(pdev, &disp_cc_sdm845_desc);
> >> +       if (IS_ERR(regmap))
> >> +               return PTR_ERR(regmap);
> >> +
> >> +       clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_c=
onfig);
> >> +
> >> +       /* Enable clock gating for DSI and MDP clocks */
> > =

> > Hardware clock gating? What does this mean.
> > =

> These are used for deciding whether to enable HW based Clock gating or =

> not. Setting these bit will enable HW based Clock gating.

Please state it's hardware clock gating then in the comment.

> =

> >> +       regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
> >> +
> >> +       return qcom_cc_really_probe(pdev, &disp_cc_sdm845_desc, regmap=
);
> >> +}
>=20
