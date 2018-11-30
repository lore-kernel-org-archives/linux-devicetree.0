From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [PATCH v10 3/3] clk: qcom: Add lpass clock controller driver for
 SDM845
Date: Fri, 30 Nov 2018 23:47:17 +0530
Message-ID: <0691834a-e2bf-20bb-fa5c-081ee6668250@codeaurora.org>
References: <1542873221-13693-1-git-send-email-tdas@codeaurora.org>
 <1542873221-13693-4-git-send-email-tdas@codeaurora.org>
 <154331006901.88331.9760589510991406736@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154331006901.88331.9760589510991406736@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
List-Id: devicetree@vger.kernel.org

Hello Stephen,

On 11/27/2018 2:44 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2018-11-21 23:53:41)
>> +
>> +static struct clk_branch lpass_qdsp6ss_core_clk = {
>> +       .halt_reg = 0x20,
>> +       /* CLK_OFF would not toggle until LPASS is not out of reset */
> 
> Is this really "CLK_OFF won't toggle until LPASS it out of reset"?
> 

Would take care of it, in the next series.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
