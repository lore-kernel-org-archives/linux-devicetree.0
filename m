From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 0/6] Add support for Qualcomm SM8150 and SC7180 SoCs
Date: Mon, 29 Jul 2019 22:16:16 +0530
Message-ID: <e7a6a873c47f96a1ca326a50f544d35a@codeaurora.org>
References: <20190729120633.20451-1-sibis@codeaurora.org>
 <20190729153826.GT7234@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729153826.GT7234@tuxbook-pro>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: robh+dt@kernel.org, vkoul@kernel.org, aneela@codeaurora.org, mark.rutland@arm.com, agross@kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, clew@codeaurora.org
List-Id: devicetree@vger.kernel.org

Hey Bjorn,
Thanks for the review!

On 2019-07-29 21:08, Bjorn Andersson wrote:
> On Mon 29 Jul 05:06 PDT 2019, Sibi Sankar wrote:
> 
>> This patch series adds SCM, APSS shared mailbox and QMP AOSS PD/clock
>> support on SM8150 and SC7180 SoCs.
>> 
> 
> Thanks Sibi, this looks good.
> 
> Could you please update the last 5 patches to ensure/maintain sort 
> order
> of the lists they affect.

yes I'll do that

> 
> Regards,
> Bjorn
> 
>> Sibi Sankar (6):
>>   soc: qcom: smem: Update max processor count
>>   dt-bindings: firmware: scm: Add SM8150 and SC7180 support
>>   dt-bindings: mailbox: Add APSS shared for SM8150 and SC7180 SoCs
>>   mailbox: qcom: Add support for Qualcomm SM8150 and SC7180 SoCs
>>   dt-bindings: soc: qcom: aoss: Add SM8150 and SC7180 support
>>   soc: qcom: aoss: Add AOSS QMP support
>> 
>>  Documentation/devicetree/bindings/firmware/qcom,scm.txt      | 2 ++
>>  .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.txt    | 2 ++
>>  Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt | 5 
>> ++++-
>>  drivers/mailbox/qcom-apcs-ipc-mailbox.c                      | 2 ++
>>  drivers/soc/qcom/qcom_aoss.c                                 | 2 ++
>>  drivers/soc/qcom/smem.c                                      | 2 +-
>>  6 files changed, 13 insertions(+), 2 deletions(-)
>> 
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
