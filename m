From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Thu, 3 May 2018 16:03:10 +0530
Message-ID: <d687230c-1178-41e4-d8e3-2c3957affb4a@codeaurora.org>
References: <1525258277-3478-1-git-send-email-tdas@codeaurora.org>
 <1525258277-3478-3-git-send-email-tdas@codeaurora.org>
 <152527500426.138124.18419525952886399750@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152527500426.138124.18419525952886399750@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Stephen,

Thanks for review.

On 5/2/2018 9:00 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-05-02 03:51:17)
>> +               ret = devm_clk_hw_register(&pdev->dev, hw_clks[i]);
>> +               if (ret) {
>> +                       dev_err(&pdev->dev, "failed to register %s\n",
>> +                                       hw_clks[i]->init->name);
>> +                       goto err;
>> +               }
>> +
>> +               rpmh_clk->dev = &pdev->dev;
>> +       }
>> +
>> +       ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_rpmh_hw_get,
>> +                                     (void *) desc);
> 
> Drop the void cast.
> 

I see a compiler warning, that is the reason to keep the void cast.
/include/linux/clk-provider.h:881:5: note: expected ‘void *’ but 
argument is of type ‘const struct clk_rpmh_desc *’

>> +       if (ret) {
>> +               dev_err(&pdev->dev, "Failed to add clock provider\n");
>> +               goto err;
>> +       }
>> +
>> +       dev_dbg(&pdev->dev, "Registered RPMh clocks\n");
>> +
>> +       return 0;
>> +err:
>> +       if (rpmh_client)
>> +               rpmh_release(rpmh_client);
>> +
>> +       return ret;
>> +}
>> +
>> +static int clk_rpmh_remove(struct platform_device *pdev)
>> +{
>> +       const struct clk_rpmh_desc *desc =
>> +                       of_device_get_match_data(&pdev->dev);
>> +       struct clk_hw **hw_clks = desc->clks;
>> +       struct clk_rpmh *rpmh_clk = to_clk_rpmh(hw_clks[0]);
>> +
>> +       rpmh_release(rpmh_clk->rpmh_client);
>> +
>> +       return 0;
>> +}
> 
> I'll review Lina's series again. Still hoping to drop the client thing.
> 

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
