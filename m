From: David Collins <collinsd@codeaurora.org>
Subject: Re: [PATCH v3 2/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Mon, 16 Apr 2018 14:47:42 -0700
Message-ID: <5af35710-b521-e22e-055b-798cbe343dc6@codeaurora.org>
References: <1523673401-21611-1-git-send-email-tdas@codeaurora.org>
 <1523673401-21611-3-git-send-email-tdas@codeaurora.org>
 <152390031768.51482.12790579493617671456@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <152390031768.51482.12790579493617671456@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hello Taniya,

On 04/16/2018 10:38 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-04-13 19:36:41)
>> Add the RPMh clock driver to control the RPMh managed clock resources on
>> some of the Qualcomm Technologies, Inc. SoCs.
>>
>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> 
> Your signoff chain is very confused. The first signoff should match the
> "From:" header but that doesn't seem to be the case here. And the sender
> should be the last in the chain.

It looks like the provenance of this driver go muddled during downstream
propagation between branches.  The original downstream version of the
clk-rpmh driver was written by Osvaldo Banuelos [1].  I think that the
best course of action here would be to remove my Signed-off-by, add
Osvaldo's, and add yours.

Thanks,
David

[1]:
https://source.codeaurora.org/quic/la/kernel/msm-4.9/commit/?id=11d3623c37afb945ce36755501812a44efeb6cd9

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
