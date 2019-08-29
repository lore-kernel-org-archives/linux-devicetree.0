From: Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [RESEND PATCH v2 1/2] dt-bindings: reset: aoss: Add AOSS reset
 binding for SC7180 SoCs
Date: Thu, 29 Aug 2019 08:08:06 +0530
Message-ID: <4a71d26db054be636e57c4d031b0d3ec@codeaurora.org>
References: <20190824152411.21757-1-sibis@codeaurora.org>
 <20190824152411.21757-2-sibis@codeaurora.org>
 <1566808568.3842.2.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566808568.3842.2.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: robh+dt@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kernel-owner@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hey Philipp,
Thanks for the review!

On 2019-08-26 14:06, Philipp Zabel wrote:
> On Sat, 2019-08-24 at 20:54 +0530, Sibi Sankar wrote:
>> Add SC7180 AOSS reset to the list of possible bindings.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
>>  Documentation/devicetree/bindings/reset/qcom,aoss-reset.txt | 4 ++--
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
>>  	Usage: required
>>  	Value type: <string>
>> -	Definition: must be:
>> -		    "qcom,sdm845-aoss-cc"
>> +	Definition: must be one of:
>> +		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
> 
> Should this emphasize that the common sdm845 compatible always has to 
> be
> included?
> 
> +	Definition: must be:
> +		"qcom,sdm845-aoss-cc" for SDM845 or

can we drop the "or" since
we would need to keep adding
it in the future.

> +		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc" for SC7180

I prefer ^^ approach for the
reasons stated below.

> 
> or like the qcom,kpss-gcc bindings:
> 
> +	Definition: should be one of the following. The generic
> compatible
> +		"qcom,sdm845-aoss-cc" should also be
> included.
> +		"qcom,sc7180-aoss-cc", "qcom,sdm845-aoss-cc"
> +

It is extremely unlikely that
future SoCs would maintain same
number of reset lines/offsets
due to the constant flux in
remote processors being added
to the SoCs. So a generic
compatible might not make sense
here.

> 	"qcom,sdm845-aoss-cc"
> 
> regards
> Philipp

-- 
-- Sibi Sankar --
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
