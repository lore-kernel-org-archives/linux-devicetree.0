From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v1 3/4] clk: qcom: Add MSM8998 Multimedia Clock Controller
 (MMCC) driver
Date: Tue, 5 Feb 2019 15:12:00 -0700
Message-ID: <54750df0-245c-74ab-2a33-ce1588f3e38e@codeaurora.org>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
 <1548866171-30341-1-git-send-email-jhugo@codeaurora.org>
 <154940436246.169292.7591382350282828249@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154940436246.169292.7591382350282828249@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc: marc.w.gonzalez@free.fr, andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/5/2019 3:06 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-01-30 08:36:11)
> [..]
>> +};
>> +MODULE_DEVICE_TABLE(of, mmcc_msm8998_match_table);
>> +
>> +static int mmcc_msm8998_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       int i, ret;
>> +       struct regmap *regmap;
>> +       struct clk *c;
>> +
>> +       c = devm_clk_get(dev, "xo");
>> +       if (!IS_ERR(c))
>> +               dummy_xo_init.parent_names =
>> +                                       (const char *[]){__clk_get_name(c)};
>> +       else
>> +               return PTR_ERR(c);
>> +
>> +       c = devm_clk_get(dev, "gpll0");
>> +       if (!IS_ERR(c))
>> +               dummy_gpll0_init.parent_names =
>> +                                       (const char *[]){__clk_get_name(c)};
>> +       else
>> +               return PTR_ERR(c);
> 
> Urgh, my parent mapping series can't come be merged fast enough it
> seems!

Sorry, I'm not familiar with the context.  Something I should incorporate?

> 
>> +
>> +       regmap = qcom_cc_map(pdev, &mmcc_msm8998_desc);
>> +       if (IS_ERR(regmap))
>> +               return PTR_ERR(regmap);
>> +
>> +       for (i = 0; i < ARRAY_SIZE(mmcc_msm8998_hws); i++) {
>> +               ret = devm_clk_hw_register(dev, mmcc_msm8998_hws[i]);
> 
> I think we should make this common to the qcom_cc_desc now. Can you
> throw in an optional list of clk_hw pointers that also get registered as
> its own patch and update the existing drivers that are all doing this?

Yeah, can do.

> 
>> +               if (ret)
>> +                       return ret;
>> +       }
>> +
>> +       return qcom_cc_really_probe(pdev, &mmcc_msm8998_desc, regmap);
>> +}


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
