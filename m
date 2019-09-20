From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC)
 driver for SC7180
Date: Fri, 20 Sep 2019 10:14:06 +0530
Message-ID: <9c6a3aa5-5e89-4fe0-9e35-16b031aca899@codeaurora.org>
References: <20190918095018.17979-1-tdas@codeaurora.org>
 <20190918095018.17979-4-tdas@codeaurora.org>
 <74643831-1a58-e279-aca3-8753f5fcbe04@codeaurora.org>
 <28d2670d-a8bb-50d6-2154-79278db64bca@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <28d2670d-a8bb-50d6-2154-79278db64bca@codeaurora.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Taniya Das <tdas@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt@kernel.org
Cc: David Brown <david.brown@linaro.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 9/20/2019 9:30 AM, Taniya Das wrote:
> Hi Rajendra,
> 
> Please pick the patch in the series : https://patchwork.kernel.org/patch/11150013/

ah, right, not sure how I missed the PATCH 1/3 in the series.
Sorry about the noise.

> 
> On 9/19/2019 4:38 PM, Rajendra Nayak wrote:
>> []..
>>
>>> +static struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s2_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s3_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s4_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s5_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s0_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s1_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s2_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s3_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s4_clk_src),
>>> +    DEFINE_RCG_DFS(gcc_qupv3_wrap1_s5_clk_src),
>>> +};
>>
>> this fails to build..
>>
>> In file included from drivers/clk/qcom/gcc-sc7180.c:17:0:
>> drivers/clk/qcom/gcc-sc7180.c:2429:17: error: ‘gcc_qupv3_wrap0_s0_clk_src_src’ undeclared here (not in a function)
>>    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s0_clk_src),
>>                   ^
>> drivers/clk/qcom/clk-rcg.h:171:12: note: in definition of macro ‘DEFINE_RCG_DFS’
>>    { .rcg = &r##_src, .init = &r##_init }
>>              ^
>> drivers/clk/qcom/gcc-sc7180.c:2430:17: error: ‘gcc_qupv3_wrap0_s1_clk_src_src’ undeclared here (not in a function)
>>    DEFINE_RCG_DFS(gcc_qupv3_wrap0_s1_clk_src),
>>                   ^
>> drivers/clk/qcom/clk-rcg.h:171:12: note: in definition of macro ‘DEFINE_RCG_DFS’
>>    { .rcg = &r##_src, .init = &r##_init }
>>              ^
>> Perhaps you should drop _src here and in the clk_init_data names.
>>
>>> +
>>> +static const struct regmap_config gcc_sc7180_regmap_config = {
>>> +    .reg_bits = 32,
>>> +    .reg_stride = 4,
>>> +    .val_bits = 32,
>>> +    .max_register = 0x18208c,
>>> +    .fast_io = true,
>>> +};
>>> +
>>> +static const struct qcom_cc_desc gcc_sc7180_desc = {
>>> +    .config = &gcc_sc7180_regmap_config,
>>> +    .clk_hws = gcc_sc7180_hws,
>>> +    .num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
>>> +    .clks = gcc_sc7180_clocks,
>>> +    .num_clks = ARRAY_SIZE(gcc_sc7180_clocks),
>>> +    .resets = gcc_sc7180_resets,
>>> +    .num_resets = ARRAY_SIZE(gcc_sc7180_resets),
>>> +    .gdscs = gcc_sc7180_gdscs,
>>> +    .num_gdscs = ARRAY_SIZE(gcc_sc7180_gdscs),
>>> +};
>>> +
>>> +static const struct of_device_id gcc_sc7180_match_table[] = {
>>> +    { .compatible = "qcom,gcc-sc7180" },
>>> +    { }
>>> +};
>>> +MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
>>> +
>>> +static int gcc_sc7180_probe(struct platform_device *pdev)
>>> +{
>>> +    struct regmap *regmap;
>>> +    int ret;
>>> +
>>> +    regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
>>> +    if (IS_ERR(regmap))
>>> +        return PTR_ERR(regmap);
>>> +
>>> +    /*
>>> +     * Disable the GPLL0 active input to MM blocks, NPU
>>> +     * and GPU via MISC registers.
>>> +     */
>>> +    regmap_update_bits(regmap, GCC_MMSS_MISC, 0x3, 0x3);
>>> +    regmap_update_bits(regmap, GCC_NPU_MISC, 0x3, 0x3);
>>> +    regmap_update_bits(regmap, GCC_GPU_MISC, 0x3, 0x3);
>>> +
>>> +    ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
>>> +                    ARRAY_SIZE(gcc_dfs_clocks));
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return qcom_cc_really_probe(pdev, &gcc_sc7180_desc, regmap);
>>> +}
>>> +
>>> +static struct platform_driver gcc_sc7180_driver = {
>>> +    .probe = gcc_sc7180_probe,
>>> +    .driver = {
>>> +        .name = "gcc-sc7180",
>>> +        .of_match_table = gcc_sc7180_match_table,
>>> +    },
>>> +};
>>> +
>>> +static int __init gcc_sc7180_init(void)
>>> +{
>>> +    return platform_driver_register(&gcc_sc7180_driver);
>>> +}
>>> +subsys_initcall(gcc_sc7180_init);
>>> +
>>> +static void __exit gcc_sc7180_exit(void)
>>> +{
>>> +    platform_driver_unregister(&gcc_sc7180_driver);
>>> +}
>>> +module_exit(gcc_sc7180_exit);
>>> +
>>> +MODULE_DESCRIPTION("QTI GCC SC7180 Driver");
>>> +MODULE_LICENSE("GPL v2");
>>> -- 
>>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>>
>>
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
