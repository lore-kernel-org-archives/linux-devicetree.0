From: Chris Lew <clew@codeaurora.org>
Subject: Re: [PATCH 1/3] dt-bindings: soc: qcom: Support GLINK intents
Date: Mon, 23 Oct 2017 11:37:56 -0700
Message-ID: <e0f84c80-6e43-e241-c83a-9fe4f4ab2040@codeaurora.org>
References: <1508375418-15611-1-git-send-email-clew@codeaurora.org>
 <1508375418-15611-2-git-send-email-clew@codeaurora.org>
 <CAOCOHw75mrusG6XPXwKV7UDUt2gFZfU_MyUZxryk4YziCGinNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <CAOCOHw75mrusG6XPXwKV7UDUt2gFZfU_MyUZxryk4YziCGinNg@mail.gmail.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arun Kumar Neelakantam <aneela@codeaurora.org>, smaliyap@codeaurora.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, devicetree <devicetree@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org



On 10/19/2017 10:00 PM, Bjorn Andersson wrote:
> On Wed 18 Oct 18:10 PDT 2017, Chris Lew wrote:
> 
>> Virtual GLINK channels may know what throughput to expect from a
>> remoteproc. An intent advertises to the remoteproc this channel is
>> ready to receive data. Allow a channel to define the size and amount of
>> intents to be prequeued.
>>
>> Signed-off-by: Chris Lew <clew@codeaurora.org>
>> ---
>>   Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
>> index b277eca861f7..6c21f76822ca 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,glink.txt
>> @@ -39,6 +39,14 @@ of these nodes are defined by the individual bindings for the specific function
>>    Definition: a list of channels tied to this function, used for matching
>>       the function to a set of virtual channels
>>
>> +- intents:
> 
> qcom,intents or qcom,default-intents
> 

Will use "qcom,intents".

>> + Usage: optional
>> + Value type: <prop-encoded-array>
>> + Definition: a list of size,amount pairs describing what intents should
>> +    be preallocated for this virtual channel. If a GLINK node
>> +    supports intents, an intent advertises this channel is ready
>> +    to receive data.
> 
> Rather than describing what a GLINK intent is I would suggest that you
> replace this second sentence with something like "This can be used to
> tweak the default intents available for the channel to meet expectations
> of the remote."
>

Sounds good, will change.

>> +
>>   = EXAMPLE
>>   The following example represents the GLINK RPM node on a MSM8996 device, with
>>   the function for the "rpm_request" channel defined, which is used for
>> @@ -69,6 +77,8 @@ regualtors and root clocks.
>>    compatible = "qcom,rpm-msm8996";
>>    qcom,glink-channels = "rpm_requests";
>>
>> + intents = <0x400 5
>> +   0x800 1>;
>>    ...
>>    };
>>    };
> 
> Regards,
> Bjorn
> 

Thanks,
Chris

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
