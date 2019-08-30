From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset
 binding for SC7180 SoCs
Date: Sat, 31 Aug 2019 00:04:25 +0530
Message-ID: <6e87c7d270f0714fd9f2a2f629ffac27@codeaurora.org>
References: <20190824152411.21757-1-sibis@codeaurora.org>
 <20190824152411.21757-2-sibis@codeaurora.org>
 <20190830053250.D772A21897@mail.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190830053250.D772A21897@mail.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: bjorn.andersson@linaro.org, p.zabel@pengutronix.de, robh+dt@kernel.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hey Stephen,
Thanks for the review!

On 2019-08-30 11:02, Stephen Boyd wrote:
> Quoting Sibi Sankar (2019-08-24 08:24:10)
>> Add SC7180 AOSS reset to the list of possible bindings.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
> 
> Can you convert this binding to YAML/JSON schema? Would help to 
> describe
> the 'one of' requirement below in a more structured way.

yeah converting them shouldn't
take time but 'oneof' isn't the
requirement here. We want to
specify that sc7180 should
continue to use the sdm845
compatible since the offset/
num of reset are identical.

> 
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt 
>> b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> index 510c748656ec5..3eb6a22ced4bc 100644
>> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> @@ -8,8 +8,8 @@ Required properties:
>>  - compatible:
>>         Usage: required
>>         Value type: <string>
>> -       Definition: must be:
>> -                   "qcom,sdm845-aoss-cc"
>> +       Definition: must be one of:

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
