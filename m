From: Rohit Vaswani <rvaswani-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Subject: Re: [PATCHv4 2/3] ARM: msm: Add support for APQ8074 Dragonboard
Date: Thu, 26 Sep 2013 12:17:38 -0700
Message-ID: <52448852.9050608@codeaurora.org>
References: <1379992406-3541-1-git-send-email-rvaswani@codeaurora.org> <1379992406-3541-2-git-send-email-rvaswani@codeaurora.org> <4E7868D6-56CB-4AF8-8EBF-069966899C23@codeaurora.org> <5243652F.7090408@codeaurora.org> <B0F416B8-042A-49F1-81E9-B217F02AAD1E@codeaurora.org> <52447779.3010908@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52447779.3010908-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: David Brown <davidb-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Walker <dwalker-zu3NM2574RrQT0dZR+AlfA@public.gmane.org>, Bryan Huntsman <bryanh-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 9/26/2013 11:05 AM, Rohit Vaswani wrote:
> On 9/26/2013 9:37 AM, Kumar Gala wrote:
>> <snip>
>
>> +++ b/arch/arm/boot/dts/qcom-apq8074-dragonboard.dts
>> @@ -0,0 +1,6 @@
>> +/include/ "qcom-msm8974.dtsi"
>> +
>> +/ {
>> +    model = "Qualcomm APQ8074 Dragonboard";
>> +    compatible = "qcom,apq8074-dragonboard", "qcom,apq8074";
>> +};
>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi 
>> b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> new file mode 100644
>> index 0000000..f04b643
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>> @@ -0,0 +1,35 @@
>> +/dts-v1/;
>> +
>> +/include/ "skeleton.dtsi"
>> +
>> +/ {
>> +    model = "Qualcomm MSM8974";
>> +    compatible = "qcom,msm8974";
>> +    interrupt-parent = <&intc>;
>> +
>> +    soc: soc { };
>>>> We should have a unit address here:
>>>>
>>>>       soc: soc@FOOBAR {
>>>>
>>>> also, split out the curly braces so any future patches do have to 
>>>> muck with that.
>>>>
>>>>     };
>>>>
>>> Im not sure I understand the reasoning behind the unit address for 
>>> soc ?
>> Its fairly standard practice and there is a fair amount of discussion 
>> about the lack of a unit address for memory nodes.
>>
> That still doesn't really answer anything :) - and I couldn't find any 
> discussions about this either.
> I don't see anybody in upstream adding an address to soc except sun.
> What is that address supposed to be for - what does it mean ?
> The soc is way of encapsulating meaningful blocks  for the particular 
> SoC.

I see the mail from Stephen Warren for adding a check stating that

"ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
node that has a reg property must include a unit address in its name
with value matching the first entry in its reg property. Conversely, if
a node does not have a reg property, the node name must not include a
unit address."

The soc node we have does not have a reg property ?


>
>>
>>>>> +};
>>>>> +
>>>>> +&soc {
>>>>> +    #address-cells = <1>;
>>>>> +    #size-cells = <1>;
>>>>> +    ranges;
>>>>> +    compatible = "simple-bus";
>>>>> +
>>>>> +    intc: interrupt-controller@f9000000 {
>>>>> +        compatible = "qcom,msm-qgic2";
>>>>> +        interrupt-controller;
>>>>> +        #interrupt-cells = <3>;
>>>>> +        reg = <0xf9000000 0x1000>,
>>>>> +              <0xf9002000 0x1000>;
>>>>> +    };
>>>>> +
>>>>> +    timer {
>>>>> +        compatible = "arm,armv7-timer";
>>>>> +        interrupts = <1 2 0xf08>,
>>>>> +                 <1 3 0xf08>,
>>>>> +                 <1 4 0xf08>,
>>>>> +                 <1 1 0xf08>;
>>>>> +        clock-frequency = <19200000>;
>>>>> +    };
>>>>> +};
>> - k
>>
>
>
> Thanks,
> Rohit Vaswani
>


Thanks,
Rohit Vaswani

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
