Return-Path: <SRS0=+0hH=WS=codeaurora.org=sibis@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 22 Aug 2019 12:09:46 +0530
From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH 1/4] dt-bindings: reset: aoss: Add AOSS reset binding for
 SC7180 SoCs
In-Reply-To: <1566383523.4193.5.camel@pengutronix.de>
References: <20190821095442.24495-1-sibis@codeaurora.org>
 <20190821095442.24495-2-sibis@codeaurora.org>
 <1566383523.4193.5.camel@pengutronix.de>
Message-ID: <f6f36181660057325742318519e541ad@codeaurora.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Hey Philipp,
Thanks for the review!

On 2019-08-21 16:02, Philipp Zabel wrote:
> On Wed, 2019-08-21 at 15:24 +0530, Sibi Sankar wrote:
>> Add SC7180 AOSS reset to the list of possible bindings.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git 
>> a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt 
>> b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> index 510c748656ec5..8f0bbdc6afd91 100644
>> --- a/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> +++ b/Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt
>> @@ -8,7 +8,8 @@ Required properties:
>>  - compatible:
>>  	Usage: required
>>  	Value type: <string>
>> -	Definition: must be:
>> +	Definition: must be one of:
>> +		    "qcom,sc7180-aoss-cc"
>>  		    "qcom,sdm845-aoss-cc"
>> 
>>  - reg:
> 
> Does sc7180 have exactly the same resets (mss, camss, venus, gpu,
> dispss, wcss, and lpass) as sdm845? If so, it could be considered
> compatible, and the driver changes wouldn't be needed at all:

Yes they are identical both
AOSS and PDC resets.

> 
> -	Definition: must be:
> +	Definition: must be one of:
> +		    "qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
> 
> 	    "qcom,sdm845-aoss-cc"
> 
> Is there a reason not to do this?

I am fine with ^^, will change
them in v2.

> 
> regards
> Philipp

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
