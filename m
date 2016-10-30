From: Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH V3 2/2] iio: adc: spmi-vadc: Changes to support different
 scaling
Date: Sun, 30 Oct 2016 17:13:46 +0000
Message-ID: <a96141dc-6ee5-2d7c-868c-7cb282002b89@kernel.org>
References: <1477492887-1663-1-git-send-email-rphani@codeaurora.org>
 <1477492887-1663-3-git-send-email-rphani@codeaurora.org>
 <8418e7f1-55d9-2dfa-1dc7-5960f9da0305@linaro.org>
 <be7d758f-1698-1b6d-e6a1-a2910a914737@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <be7d758f-1698-1b6d-e6a1-a2910a914737@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: "Phani A, Rama Krishna" <rphani@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Cc: robh@kernel.org, linux-arm-msm@vger.kernel.org, smohanad@codeaurora.org, mgautam@codeaurora.org, sivaa@codeaurora.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, Julia.Lawall@lip6.fr
List-Id: devicetree@vger.kernel.org

On 27/10/16 18:37, Phani A, Rama Krishna wrote:
> Hi Stan,
> 
> On 27-Oct-16 4:48 PM, Stanimir Varbanov wrote:
>> Hi Rama,
>>
>> On 10/26/2016 05:41 PM, Rama Krishna Phani A wrote:
>>> Polling can also be used for End of conversion completion. Implement logic
>>> to choose either polling or interrupt for End of conversion completion.
>>> Scaling can be done on the voltage to report adc code in physical units.
>>> Add changes to support different scale functions to convert adc code to
>>> physical units.
>>>
>>> Signed-off-by: Rama Krishna Phani A <rphani@codeaurora.org>
>>> ---
>>>  .../devicetree/bindings/iio/adc/qcom,spmi-vadc.txt |  14 ++
>>>  drivers/iio/adc/qcom-spmi-vadc.c                   | 263 +++++++++++++++++----
>>>  2 files changed, 236 insertions(+), 41 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
>>> index 0fb4613..39e31c0e 100644
>>> --- a/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
>>> +++ b/Documentation/devicetree/bindings/iio/adc/qcom,spmi-vadc.txt
>>> @@ -37,6 +37,12 @@ VADC node:
>>>      Value type: <prop-encoded-array>
>>>      Definition: End of conversion interrupt.
>>>
>>> +- qcom,vadc-poll-eoc:
>>> +    Usage: optional
>>> +    Value type: <bool>
>>> +    Definition: Use polling instead of interrupts for End of Conversion
>>> +        completion.
>>
>> Why you need to add such a flag in DT?
>>
>> The DT should describe hardware details not how the driver will choose
>> pooling vs interrupt.
>>
>> On which use-case you would prefer pooling?
>>
> 
> Few PMIC's support interrupt functionality for ADC where as few
> PMIC's dont support. Based on the functionality that is supported in
> hardware we choose whether to go for polling or for interrupt.
Can't use the usual trick of an optional interrupt in DT?
If it's there we try to use it, if not then fall back to polling?


>>> +
>>>  Channel node properties:
>>>
>>>  - reg:
>>> @@ -92,6 +98,14 @@ Channel node properties:
>>>              Valid values are: 1, 2, 4, 8, 16, 32, 64, 128, 256, 512
>>>              If property is not found, 1 sample will be used.
>>>
>>> +- qcom,scale-function:
>>> +    Usage: optional
>>> +    Value type: <u32>
>>> +    Definition: Scaling function used to convert raw ADC code to
>>> +    units specific to a given channel. Scaled units can be
>>> +    microvolts, millidegC.Valid values are: 0, 1, 2, 3, 4.
>>> +    If property is not found, 0 scaling will be used.
>>
>> This shouldn't be in DT binding. Just select the scale function for each
>> channel in the driver based on compatible property.
>>
>>
> Ok ., Will remove this binding from DT, implement logic in driver and will post next patch.
> 
> Thanks,
> Ramakrishna
> 
> -- 
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
