From: Amit Nischal <anischal@codeaurora.org>
Subject: Re: [PATCH v1 0/2] Add QCOM video clock controller driver
Date: Mon, 07 May 2018 16:16:53 +0530
Message-ID: <09ac2bd5eab25cfc70a1c5dc7b0f90ed@codeaurora.org>
References: <1525350925-16006-1-git-send-email-anischal@codeaurora.org>
 <152545146453.138124.2471609033510400995@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152545146453.138124.2471609033510400995@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2018-05-04 22:01, Stephen Boyd wrote:
> Quoting Amit Nischal (2018-05-03 05:35:23)
>> Changes in v1:
>>    https://lkml.org/lkml/2018/4/24/545
>> Addressed below review comments given by Rob
>> - Change the compatible property as per '<vendor>,<soc>-<block>' 
>> format.
>> - Add header definitions for resets and power-domain cells.
> 
> You didn't add any reset definitions though?

We haven't added the reset definitions for videocc as there is no
video reset client.

> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
