From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v1 2/2] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Date: Mon, 19 Aug 2019 18:03:18 +0530
Message-ID: <a28b11cb-a12d-f717-0f27-5de6e2e28ed2@codeaurora.org>
References: <20190807181301.15326-1-tdas@codeaurora.org>
 <20190807181301.15326-3-tdas@codeaurora.org>
 <20190807222424.17549214C6@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807222424.17549214C6@mail.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

Hello Stephen,

On 8/8/2019 3:54 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2019-08-07 11:13:01)
>> Add support for the global clock controller found on SC7180
>> based devices. This should allow most non-multimedia device
>> drivers to probe and control their clocks.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> 
> Overall looks pretty good to me. Some minor nitpicks below.
> 
>> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
>> index e1ff83cc361e..9e634cf27464 100644
>> --- a/drivers/clk/qcom/Kconfig
>> +++ b/drivers/clk/qcom/Kconfig
>> @@ -323,4 +323,13 @@ config KRAITCC
>>            Support for the Krait CPU clocks on Qualcomm devices.
>>            Say Y if you want to support CPU frequency scaling.
>>
>> +config SC_GCC_7180
> 
> Can this be sorted alphabetically in this file? It's getting out of hand
> when they all get added to the end.
> 

Next patch would add them in sorted order.

>> +       tristate "SC7180 Global Clock Controller"
>> +       select QCOM_GDSC
>> +       depends on COMMON_CLK_QCOM
>> +       help
>> +         Support for the global clock controller on SC7180 devices.
>> +         Say Y if you want to use peripheral devices such as UART, SPI,
>> +         I2C, USB, UFS, SDCC, etc.
>> +
>>   endif
>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>> new file mode 100644
>> index 000000000000..004b76e69402
>> --- /dev/null
>> +++ b/drivers/clk/qcom/gcc-sc7180.c
>> @@ -0,0 +1,2496 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_device.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,gcc-sc7180.h>
>> +
>> +#include "clk-alpha-pll.h"
>> +#include "clk-branch.h"
>> +#include "clk-rcg.h"
>> +#include "clk-regmap.h"
>> +#include "common.h"
>> +#include "gdsc.h"
>> +#include "reset.h"
>> +
>> +#define GCC_MMSS_MISC          0x09ffc
>> +#define GCC_NPU_MISC           0x4d110
>> +#define GCC_GPU_MISC           0x71028
>> +
>> +enum {
>> +       P_BI_TCXO,
>> +       P_CORE_BI_PLL_TEST_SE,
>> +       P_GPLL0_OUT_EVEN,
>> +       P_GPLL0_OUT_MAIN,
>> +       P_GPLL1_OUT_MAIN,
>> +       P_GPLL4_OUT_MAIN,
>> +       P_GPLL6_OUT_MAIN,
>> +       P_GPLL7_OUT_MAIN,
>> +       P_SLEEP_CLK,
>> +};
>> +
>> +static struct clk_alpha_pll gpll0;
>> +static struct clk_alpha_pll gpll1;
>> +static struct clk_alpha_pll gpll4;
>> +static struct clk_alpha_pll gpll6;
>> +static struct clk_alpha_pll gpll7;
>> +static struct clk_alpha_pll_postdiv gpll0_out_even;
> 
> Can't we create these PLLs before the parent maps? I don't see why we
> need to forward declare the structs.
> 

Would define the PLLs earlier.

>> +
>> +static const struct parent_map gcc_parent_map_0[] = {
>> +       { P_BI_TCXO, 0 },
>> +       { P_GPLL0_OUT_MAIN, 1 },
>> +       { P_GPLL0_OUT_EVEN, 6 },
>> +       { P_CORE_BI_PLL_TEST_SE, 7 },
>> +};
>> +
>> +static const struct clk_parent_data gcc_parent_data_0[] = {
>> +       { .fw_name = "bi_tcxo", .name = "bi_tcxo" },
>> +       { .hw = &gpll0.clkr.hw },
> [...]
>> +static struct clk_branch gcc_camera_ahb_clk = {
>> +       .halt_reg = 0xb008,
>> +       .halt_check = BRANCH_HALT,
>> +       .hwcg_reg = 0xb008,
>> +       .hwcg_bit = 1,
>> +       .clkr = {
>> +               .enable_reg = 0xb008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_camera_ahb_clk",
>> +                       .flags = CLK_IS_CRITICAL,
> 
> Please add a comment for CLK_IS_CRITICAL usage explaining why clks must
> be kept on forever.
> 

Would add the comments for the CRITICAL clocks.

>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_camera_hf_axi_clk = {
>> +       .halt_reg = 0xb020,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0xb020,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
> [...]
>> +
>> +static const struct qcom_reset_map gcc_sc7180_resets[] = {
>> +       [GCC_QUSB2PHY_PRIM_BCR] = { 0x26000 },
>> +       [GCC_QUSB2PHY_SEC_BCR] = { 0x26004 },
>> +       [GCC_UFS_PHY_BCR] = { 0x77000 },
>> +       [GCC_USB30_PRIM_BCR] = { 0xf000 },
>> +       [GCC_USB3_PHY_PRIM_BCR] = { 0x50000 },
>> +       [GCC_USB3PHY_PHY_PRIM_BCR] = { 0x50004 },
>> +       [GCC_USB3_PHY_SEC_BCR] = { 0x5000c },
>> +       [GCC_USB3_DP_PHY_PRIM_BCR] = { 0x50008 },
>> +       [GCC_USB3PHY_PHY_SEC_BCR] = { 0x50010 },
>> +       [GCC_USB3_DP_PHY_SEC_BCR] = { 0x50014 },
>> +       [GCC_USB_PHY_CFG_AHB2PHY_BCR] = { 0x6a000 },
>> +};
>> +
>> +static struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk),
> 
> I was happy if you wanted to include the _src changing patch from
> earlier. Can you throw it into this series?
> 

Next patch series I would include the patch.

>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk),
>> +       DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk),
>> +};
>> +
>> +static const struct regmap_config gcc_sc7180_regmap_config = {
>> +       .reg_bits = 32,
>> +       .reg_stride = 4,
>> +       .val_bits = 32,
>> +       .max_register = 0x18208c,
>> +       .fast_io = true,
>> +};
>> +
>> +static const struct qcom_cc_desc gcc_sc7180_desc = {
>> +       .config = &gcc_sc7180_regmap_config,
>> +       .clk_hws = gcc_sc7180_hws,
>> +       .num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
>> +       .clks = gcc_sc7180_clocks,
>> +       .num_clks = ARRAY_SIZE(gcc_sc7180_clocks),
>> +       .resets = gcc_sc7180_resets,
>> +       .num_resets = ARRAY_SIZE(gcc_sc7180_resets),
>> +       .gdscs = gcc_sc7180_gdscs,
>> +       .num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
>> +};
>> +
>> +static const struct of_device_id gcc_sc7180_match_table[] = {
>> +       { .compatible = "qcom,gcc-sc7180" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
>> +
>> +static int gcc_sc7180_probe(struct platform_device *pdev)
>> +{
>> +       struct regmap *regmap;
>> +       int ret;
>> +
>> +       regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
>> +       if (IS_ERR(regmap)) {
>> +               pr_err("Failed to map the gcc registers\n");
> 
> I don't think we need this error message. Please remove it.
> 

Yes, would remove this.


>> +               return PTR_ERR(regmap);
>> +       }
>> +
>> +       /*
>> +        * Disable the GPLL0 active input to MM blocks, NPU
>> +        * and GPU via MISC registers.
>> +        */
>> +       regmap_update_bits(regmap, GCC_MMSS_MISC, 0x3, 0x3);
>> +       regmap_update_bits(regmap, GCC_NPU_MISC, 0x3, 0x3);
>> +       regmap_update_bits(regmap, GCC_GPU_MISC, 0x3, 0x3);
>> +
>> +       /* DFS clock registration */
> 
> This comment is pretty useless, please remove it.

Done, would remove it.

> 
>> +       ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>> +                                       ARRAY_SIZE(gcc_dfs_clocks));
>> +       if (ret)
>> +               return ret;
>> +
>> +       return qcom_cc_really_probe(pdev, &gcc_sc7180_desc, regmap);
>> +}

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
