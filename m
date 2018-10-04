From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v5 2/2] clk: qcom: Add lpass clock controller driver for
 SDM845
Date: Thu, 4 Oct 2018 17:31:27 +0530
Message-ID: <66fc65d8-92ec-f32c-6edb-ad4952695395@codeaurora.org>
References: <1537266338-18661-1-git-send-email-tdas@codeaurora.org>
 <1537266338-18661-3-git-send-email-tdas@codeaurora.org>
 <153816066933.119890.2976485722156069351@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <153816066933.119890.2976485722156069351@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org


On 9/29/2018 12:21 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-09-18 03:25:38)
>> @@ -3469,6 +3495,8 @@ enum {
>>          [GCC_QSPI_CORE_CLK_SRC] = &gcc_qspi_core_clk_src.clkr,
>>          [GCC_QSPI_CORE_CLK] = &gcc_qspi_core_clk.clkr,
>>          [GCC_QSPI_CNOC_PERIPH_AHB_CLK] = &gcc_qspi_cnoc_periph_ahb_clk.clkr,
>> +       [GCC_LPASS_Q6_AXI_CLK] = NULL,
>> +       [GCC_LPASS_SWAY_CLK] = NULL,
>>   };
>>   
>>   static const struct qcom_reset_map gcc_sdm845_resets[] = {
>> @@ -3583,6 +3611,13 @@ static int gcc_sdm845_probe(struct platform_device *pdev)
>>          if (ret)
>>                  return ret;
>>   
>> +       if (of_property_read_bool(pdev->dev.of_node, "qcom,lpass-protected")) {
> 
> Shouldn't this be negated? So that we only add the clks when lpass isn't
> protected?
>

I was of the opinion to add the flag only when LPASS clocks are 
required. But I am fine negating it too.

>> +               gcc_sdm845_clocks[GCC_LPASS_Q6_AXI_CLK] =
>> +                       &gcc_lpass_q6_axi_clk.clkr;
>> +               gcc_sdm845_clocks[GCC_LPASS_SWAY_CLK] =
>> +                       &gcc_lpass_sway_clk.clkr;
>> +       }
>> +
>>          return qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
