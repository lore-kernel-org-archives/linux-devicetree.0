From: Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] PCI: qcom: add missing supplies required for msm8996
Date: Tue, 23 Jan 2018 12:14:35 +0200
Message-ID: <1a3cc92e-545e-a703-7130-6a9c58854e03@mm-sol.com>
References: <20171208092053.4417-1-srinivas.kandagatla@linaro.org>
 <65e01829-198e-f549-174d-c8368c5ee193@mm-sol.com>
 <92e2808b-4b2d-8591-9ed7-6600d7a3357b@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <92e2808b-4b2d-8591-9ed7-6600d7a3357b-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stanimir Varbanov <svarbanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

On 01/23/2018 11:46 AM, Srinivas Kandagatla wrote:
> 
> 
> On 23/01/18 09:23, Stanimir Varbanov wrote:
>> Hey Srini,
>>
>> As there are no comments I'd propose to change the endpoint supplies to
>> more generic names.
>>
> Sure, I will respin this with your suggestions, except the 3v3 and 1v5
> suffix due to the reasons below:
>>> +- vdda-1p8-supply:
>>> +    Usage: required for msm8996
>>> +    Value type: <phandle>
>>> +    Definition: A phandle to the 1.8v analog power supply
>>> +
>>
>> This should be dropped, because it is part of the phy.
> Yep.
> 
>>
>>>   - vdda_phy-supply:
>>>       Usage: required for ipq/apq8064
>>>       Value type: <phandle>
>>> @@ -189,6 +194,15 @@
>>>       Value type: <phandle>
>>>       Definition: A phandle to the analog power supply for IC which
>>> generates
>>>               reference clock
>>> +- vddpe-supply:
>>> +    Usage: optional
>>> +    Value type: <phandle>
>>> +    Definition: A phandle to the PCIe endpoint power supply
>>
>> vddpe_3v3-supply
> Why do we need suffix here? AFAIU, It does not add any value, instead it
> would confuse the users.

vddpe and vddpe1 is already confusing as well.

Lets imagine that powering up the endpointX needs some specific sequence
between 3v3 and 1v5 and endpointY (which could be connected on the same
PCIe lane) has different power sequence, how we would handle that in the
qcom pcie host driver?

> 
> These are power supplies for endpoint which could be of any voltage. In

I don't think that could be any values see PCIe mini card
electromechanical specification. There on the connector are provided 3v3
and 1v5.

> this case both endpoint supplies are 3v3, these could be 1.8 or 5v or
> 12v in some other cases.

If we see hw designs with 5v and 12v we could extend the binding and the
driver with support for them. I want to be exact in the names and
voltages in the driver and bindings.

-- 
regards,
Stan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
