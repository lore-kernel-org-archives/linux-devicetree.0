From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/3] RPMPD for QCS404
Date: Thu, 28 Feb 2019 11:32:42 +0530
Message-ID: <9eb3dc7ee6e871e62c34aaa804d8971e@codeaurora.org>
References: <20190221064434.2760-1-bjorn.andersson@linaro.org>
 <c4b2a60c-80a5-8491-38fb-1fed3dee2e8a@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c4b2a60c-80a5-8491-38fb-1fed3dee2e8a@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2019-02-25 18:18, Rajendra Nayak wrote:
> On 2/21/2019 12:14 PM, Bjorn Andersson wrote:
>> Reworkd the macros of the rpmpd driver and add qcs404 power domains, 
>> then add
>> this to the dts.
> 
> For the entire series,
> 
> Reviewed-by: Rajendra Nayak <rnayak@codeaurora.org>

I'll post v2 of this series with support
for msm8998 and a few fixes.

> 
>> 
>> Bjorn Andersson (3):
>>    soc: qcom: rpmpd: Modify corner defining macros
>>    soc: qcom: rpmpd: Add QCS404 corners
>>    arm64: dts: qcom: qcs404: Add rpmpd node
>> 
>>   .../devicetree/bindings/power/qcom,rpmpd.txt  |  1 +
>>   arch/arm64/boot/dts/qcom/qcs404.dtsi          | 35 +++++++++++
>>   drivers/soc/qcom/rpmpd.c                      | 63 
>> +++++++++++++------
>>   include/dt-bindings/power/qcom-rpmpd.h        |  9 +++
>>   4 files changed, 88 insertions(+), 20 deletions(-)
>> 

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
