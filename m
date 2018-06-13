From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add display clock controller driver for
 SDM845
Date: Wed, 13 Jun 2018 14:48:59 +0530
Message-ID: <a397c3f9-1e4e-b6db-299b-0ecfd1726226@codeaurora.org>
References: <1528098985-3676-1-git-send-email-tdas@codeaurora.org>
 <1528098985-3676-3-git-send-email-tdas@codeaurora.org>
 <152879014163.16708.9093599796057889104@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152879014163.16708.9093599796057889104@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh@kernel.org
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Stephen,

Thanks for review.

On 6/12/2018 1:25 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-06-04 00:56:25)
>> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
>> new file mode 100644
>> index 0000000..317ab33
>> --- /dev/null
>> +++ b/drivers/clk/qcom/dispcc-sdm845.c
>> @@ -0,0 +1,679 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/module.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/regmap.h>
>> +#include <linux/reset-controller.h>
>> +
>> +#include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-pll.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "clk-regmap-divider.h"
> 
> Used?
>
Unused ones I would clean up.

>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
> 
> We really need to move this into the header file.
> 
> $ git grep '#define F(' -- drivers/clk/qcom/ | wc -l
> 13
> 
Sure, will move this in a header and submit the patch.

>> +
> [...]
>> +static const char * const disp_cc_parent_names_4[] = {
>> +       "bi_tcxo",
>> +       "dsi0_phy_pll_out_dsiclk",
>> +       "dsi1_phy_pll_out_dsiclk",
>> +       "core_bi_pll_test_se",
>> +};
>> +
>> +static const struct alpha_pll_config disp_cc_pll0_config = {
>> +       .l = 0x2c,
>> +       .alpha = 0xcaaa,
>> +};
> 
> Any reason this can't be put on the stack in the probe function?
> 
I would move it.
>> +
>> +static struct clk_alpha_pll disp_cc_pll0 = {
>> +       .offset = 0x0,
>> +       .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
>> +       .clkr = {
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "disp_cc_pll0",
>> +                       .parent_names = (const char *[]){ "bi_tcxo" },
>> +                       .num_parents = 1,
>> +                       .ops = &clk_alpha_pll_fabia_ops,
>> +               },
>> +       },
>> +};
> [...]
>> +
>> +static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
>> +       .cmd_rcgr = 0x2058,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_4,
>> +       .clkr.hw.init = &(struct clk_init_data){
>> +               .name = "disp_cc_mdss_pclk0_clk_src",
>> +               .parent_names = disp_cc_parent_names_4,
>> +               .num_parents = 4,
>> +               .flags = CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> 
> Why is the nocache flag needed? Applies to all clks in this file.
> 

This flag is required for all RCGs whose PLLs are controlled outside the 
clock controller. The display code would require the recalculated rate 
always.

>> +               .ops = &clk_pixel_ops,
>> +       },
>> +};
>> +
>> +static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
>> +       .cmd_rcgr = 0x2070,
>> +       .mnd_width = 8,
>> +       .hid_width = 5,
>> +       .parent_map = disp_cc_parent_map_4,
>> +       .clkr.hw.init = &(struct clk_init_data){
> [...]
>> +
>> +static const struct regmap_config disp_cc_sdm845_regmap_config = {
>> +       .reg_bits       = 32,
>> +       .reg_stride     = 4,
>> +       .val_bits       = 32,
>> +       .max_register   = 0x10000,
> 
> This seems arbitrarily large. List the actual end?
> 
The actual end is larger than this :( , I have listed the range till the 
register offset are used here.

>> +       .fast_io        = true,
>> +};
>> +
>> +static const struct qcom_cc_desc disp_cc_sdm845_desc = {
>> +       .config = &disp_cc_sdm845_regmap_config,
>> +       .clks = disp_cc_sdm845_clocks,
>> +       .num_clks = ARRAY_SIZE(disp_cc_sdm845_clocks),
>> +       .resets = disp_cc_sdm845_resets,
>> +       .num_resets = ARRAY_SIZE(disp_cc_sdm845_resets),
>> +       .gdscs = disp_cc_sdm845_gdscs,
>> +       .num_gdscs = ARRAY_SIZE(disp_cc_sdm845_gdscs),
>> +};
>> +
>> +static const struct of_device_id disp_cc_sdm845_match_table[] = {
>> +       { .compatible = "qcom,sdm845-dispcc" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, disp_cc_sdm845_match_table);
>> +
>> +static int disp_cc_sdm845_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +
>> +       regmap = qcom_cc_map(pdev, &disp_cc_sdm845_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
>> +
>> +       /* Enable clock gating for DSI and MDP clocks */
> 
> Hardware clock gating? What does this mean.
> 
These are used for deciding whether to enable HW based Clock gating or 
not. Setting these bit will enable HW based Clock gating.

>> +       regmap_update_bits(regmap, 0x8000, 0x7f0, 0x7f0);
>> +
>> +       return qcom_cc_really_probe(pdev, &disp_cc_sdm845_desc, regmap);
>> +}

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
