From: Taniya Das <tdas@codeaurora.org>
Subject: Re: [[PATCH v2] 1/2] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Sat, 14 Apr 2018 07:32:59 +0530
Message-ID: <cba2a99f-fa6f-42d8-9063-8a642bea6f2c@codeaurora.org>
References: <1523183533-23171-1-git-send-email-tdas@codeaurora.org>
 <1523183533-23171-2-git-send-email-tdas@codeaurora.org>
 <20180413163705.io4xbukerjkzjmri@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180413163705.io4xbukerjkzjmri@rob-hp-laptop>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Odelu Kukatla <okukatla@codeaurora.org>, Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, David Collins <collinsd@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Hello Rob,

Thank you for the review comments.

On 4/13/2018 10:07 PM, Rob Herring wrote:
> On Sun, Apr 08, 2018 at 04:02:12PM +0530, Taniya Das wrote:
>> From: Amit Nischal <anischal@codeaurora.org>
>>
>> Add the RPMh clock driver to control the RPMh managed clock resources on
>> some of the Qualcomm Technologies, Inc. SoCs.
>>
>> Signed-off-by: David Collins <collinsd@codeaurora.org>
>> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   drivers/clk/qcom/Kconfig              |   9 +
>>   drivers/clk/qcom/Makefile             |   1 +
>>   drivers/clk/qcom/clk-rpmh.c           | 394 ++++++++++++++++++++++++++++++++++
> 
>>   include/dt-bindings/clock/qcom,rpmh.h |  25 +++
> 
> This goes with the binding patch which should come first in the series.
> 

I would make the change in the next patch series.

>>   4 files changed, 429 insertions(+)
>>   create mode 100644 drivers/clk/qcom/clk-rpmh.c
>>   create mode 100644 include/dt-bindings/clock/qcom,rpmh.h

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
