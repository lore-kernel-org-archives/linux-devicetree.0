From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v9 2/2] clk: qcom: Add lpass clock controller driver for
 SDM845
Date: Thu, 22 Nov 2018 13:20:43 +0530
Message-ID: <b95df0d3-8504-0eef-c0f3-0ff2e4176b69@codeaurora.org>
References: <1541814256-23254-1-git-send-email-tdas@codeaurora.org>
 <1541814256-23254-3-git-send-email-tdas@codeaurora.org>
 <154282725690.88331.797718066164707366@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154282725690.88331.797718066164707366@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

Hello Stephen,

On 11/22/2018 12:37 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-11-09 17:44:16)
>> diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
>> index f133b7f..ba8ff99 100644
>> --- a/drivers/clk/qcom/gcc-sdm845.c
>> +++ b/drivers/clk/qcom/gcc-sdm845.c
>> @@ -3153,6 +3153,34 @@ enum {
>>          },
>>   };
>>
>> +static struct clk_branch gcc_lpass_q6_axi_clk = {
>> +       .halt_reg = 0x47000,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x47000,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_lpass_q6_axi_clk",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>> +static struct clk_branch gcc_lpass_sway_clk = {
>> +       .halt_reg = 0x47008,
>> +       .halt_check = BRANCH_HALT,
>> +       .clkr = {
>> +               .enable_reg = 0x47008,
>> +               .enable_mask = BIT(0),
>> +               .hw.init = &(struct clk_init_data){
>> +                       .name = "gcc_lpass_sway_clk",
>> +                       .flags = CLK_IS_CRITICAL,
>> +                       .ops = &clk_branch2_ops,
>> +               },
>> +       },
>> +};
>> +
>>   static struct gdsc pcie_0_gdsc = {
>>          .gdscr = 0x6b004,
>>          .pd = {
>> @@ -3453,6 +3481,8 @@ enum {
>>          [GCC_QSPI_CORE_CLK_SRC] = &gcc_qspi_core_clk_src.clkr,
>>          [GCC_QSPI_CORE_CLK] = &gcc_qspi_core_clk.clkr,
>>          [GCC_QSPI_CNOC_PERIPH_AHB_CLK] = &gcc_qspi_cnoc_periph_ahb_clk.clkr,
>> +       [GCC_LPASS_Q6_AXI_CLK] = &gcc_lpass_q6_axi_clk.clkr,
>> +       [GCC_LPASS_SWAY_CLK] = &gcc_lpass_sway_clk.clkr,
> 
> Sigh, more coordination with sdm845 mtp problems here due to the
> clks being protected by firmware. I guess I can just merge this and the
> mtp dts bits will land in Andy's tree during the same merge window? Or I
> may need to take the dts bits for this into clk tree so that the broken
> time is only between two commits.
> 
>>   };
>>
>>   static const struct qcom_reset_map gcc_sdm845_resets[] = {
>> diff --git a/drivers/clk/qcom/lpasscc-sdm845.c b/drivers/clk/qcom/lpasscc-sdm845.c
>> new file mode 100644
>> index 0000000..2ef7f2a
>> --- /dev/null
>> +++ b/drivers/clk/qcom/lpasscc-sdm845.c
>> @@ -0,0 +1,192 @@
> [...]
>> +
>> +static const struct of_device_id lpass_cc_sdm845_match_table[] = {
>> +       { .compatible = "qcom,sdm845-lpasscc" },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, lpass_cc_sdm845_match_table);
> 
> Move this down to the before the driver structure please.
> 

Would do it in the next patch.

>> +
>> +static int lpass_cc_sdm845_probe(struct platform_device *pdev)
>> +{
>> +       const struct qcom_cc_desc *desc;
>> +       int ret;
>> +
>> +       lpass_regmap_config.name = "cc";
>> +       desc = &lpass_cc_sdm845_desc;
>> +
>> +       ret = lpass_clocks_sdm845_probe(pdev, 0, desc);
>> +       if (ret)
>> +               return ret;
>> +
>> +       lpass_regmap_config.name = "qdsp6ss";
>> +       desc = &lpass_qdsp6ss_sdm845_desc;
>> +
>> +       return lpass_clocks_sdm845_probe(pdev, 1, desc);
>> +}
>> +
>> +static struct platform_driver lpass_cc_sdm845_driver = {
>> +       .probe          = lpass_cc_sdm845_probe,
>> +       .driver         = {
>> +               .name   = "sdm845-lpasscc",
>> +               .of_match_table = lpass_cc_sdm845_match_table,
>> +       },
>> +};
>> +
>> +static int __init lpass_cc_sdm845_init(void)
>> +{
>> +       return platform_driver_register(&lpass_cc_sdm845_driver);
>> +}
>> +subsys_initcall(lpass_cc_sdm845_init);
>> +
>> +static void __exit lpass_cc_sdm845_exit(void)
>> +{
>> +       platform_driver_unregister(&lpass_cc_sdm845_driver);
>> +}
>> +module_exit(lpass_cc_sdm845_exit);
>> +
>> +MODULE_LICENSE("GPL v2");
> 
> MODULE_DESCRIPTION?
> 
Would add it in the next patch.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
