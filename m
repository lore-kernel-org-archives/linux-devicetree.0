From: "Nischal, Amit" <anischal@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: qcom: Add video clock controller driver for
 SDM845
Date: Wed, 2 May 2018 13:26:35 +0530
Message-ID: <d311e4d7-7ba8-0b26-93c7-5ee06db466ef@codeaurora.org>
References: <1524576771-31096-1-git-send-email-anischal@codeaurora.org>
 <1524576771-31096-3-git-send-email-anischal@codeaurora.org>
 <152521087780.138124.7623601052057968460@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152521087780.138124.7623601052057968460@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 5/2/2018 3:11 AM, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-04-24 06:32:51)
>> Add support for the video clock controller found on SDM845
>> based devices. This would allow video drivers to probe and
>> control their clocks.
>>
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> Driver looks small and good. Only concern is that there aren't resets
> defined, but the binding says there are resets. Will you add them?
Thanks for the review.
As of now, there are no resets defined for VIDEOCC. So I will move
the #reset-cells tooptional property in the dt-binding.
Same will be updated in the next patch series.
>
> I'm going to wait for the respin on the dts binding anyway.
Yes, I will send the next patch series soon.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
