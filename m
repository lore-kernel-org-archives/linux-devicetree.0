From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add display clock controller driver for SDM845
Date: Tue, 12 Jun 2018 00:55:41 -0700
Message-ID: <152879014163.16708.9093599796057889104@swboyd.mtv.corp.google.com>
References: <1528098985-3676-1-git-send-email-tdas@codeaurora.org>
 <1528098985-3676-3-git-send-email-tdas@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528098985-3676-3-git-send-email-tdas@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, robh@kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Quoting Taniya Das (2018-06-04 00:56:25)
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-s=
dm845.c
> new file mode 100644
> index 0000000..317ab33
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -0,0 +1,679 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +
> +#include <dt-bindings/clock/qcom,dispcc-sdm845.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"

Used?

> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }

We really need to move this into the header file.

$ git grep '#define F(' -- drivers/clk/qcom/ | wc -l
13

> +
[...]
> +static const char * const disp_cc_parent_names_4[] =3D {
> +       "bi_tcxo",
> +       "dsi0_phy_pll_out_dsiclk",
> +       "dsi1_phy_pll_out_dsiclk",
> +       "core_bi_pll_test_se",
> +};
> +
> +static const struct alpha_pll_config disp_cc_pll0_config =3D {
> +       .l =3D 0x2c,
> +       .alpha =3D 0xcaaa,
> +};

Any reason this can't be put on the stack in the probe function?

> +
> +static struct clk_alpha_pll disp_cc_pll0 =3D {
> +       .offset =3D 0x0,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_pll0",
> +                       .parent_names =3D (const char *[]){ "bi_tcxo" },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fabia_ops,
> +               },
> +       },
> +};
[...]
> +
> +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src =3D {
> +       .cmd_rcgr =3D 0x2058,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_pclk0_clk_src",
> +               .parent_names =3D disp_cc_parent_names_4,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,

Why is the nocache flag needed? Applies to all clks in this file.

> +               .ops =3D &clk_pixel_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src =3D {
> +       .cmd_rcgr =3D 0x2070,
> +       .mnd_width =3D 8,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
[...]
> +
> +static const struct regmap_config disp_cc_sdm845_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .val_bits       =3D 32,
> +       .max_register   =3D 0x10000,

This seems arbitrarily large. List the actual end?

> +       .fast_io        =3D true,
> +};
> +
> +static const struct qcom_cc_desc disp_cc_sdm845_desc =3D {
> +       .config =3D &disp_cc_sdm845_regmap_config,
> +       .clks =3D disp_cc_sdm845_clocks,
> +       .num_clks =3D ARRAY_SIZE(disp_cc_sdm845_clocks),
> +       .resets =3D disp_cc_sdm845_resets,
> +       .num_resets =3D ARRAY_SIZE(disp_cc_sdm845_resets),
> +       .gdscs =3D disp_cc_sdm845_gdscs,
> +       .num_gdscs =3D ARRAY_SIZE(disp_cc_sdm845_gdscs),
> +};
> +
> +static const struct of_device_id disp_cc_sdm845_match_table[] =3D {
> +       { .compatible =3D "qcom,sdm845-dispcc" },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, disp_cc_sdm845_match_table);
> +
> +static int disp_cc_sdm845_probe(struct platform_device *pdev)
> +{
> +       struct regmap *regmap;
> +
> +       regmap =3D qcom_cc_map(pdev, &disp_cc_sdm845_desc);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_conf=
ig);
> +
> +       /* Enable clock gating for DSI and MDP clocks */

Hardware clock gating? What does this mean.

> +       regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
> +
> +       return qcom_cc_really_probe(pdev, &disp_cc_sdm845_desc, regmap);
> +}
