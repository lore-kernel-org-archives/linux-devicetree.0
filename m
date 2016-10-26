From: Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Wed, 26 Oct 2016 19:20:42 +0530
Message-ID: <aec67ab3-8e89-fe06-b385-988f8eea5f46@codeaurora.org>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
 <2349770.MVMXr64OoI@wuerfel>
 <550ace3c-f2d3-6f3a-9566-cc1f83432484@codeaurora.org>
 <3567809.JctLPjIDdk@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <3567809.JctLPjIDdk@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/26/2016 2:19 AM, Arnd Bergmann wrote:
> On Tuesday, October 25, 2016 3:23:34 PM CEST Imran Khan wrote:
>> On 10/21/2016 4:03 PM, Arnd Bergmann wrote:
>>>> +/* socinfo: sysfs functions */
>>>
>>> This seems overly verbose, having both raw and human-readable
>>> IDs is generally not necessary, pick one of the two. If you
>>> need any fields that we don't already support in soc_device,
>>> let's talk about adding them to the generic structure.
>>>
>>>
>>
>> Okay. I will go for human readable IDs. Can we add 2 more fields
>> in the generic structure.
>> These 2 fields would be:
>>
>> vendor: A string for vendor name
>> serial_number: A string containing serial number for the platform
> 
> 
> serial_number seems straightforward, adding this seems like a good
> idea. I don't understand yet what would go into the vendor field
> though. For this particular driver, is it always "Qualcomm", or
> would it be a third-party that makes a device based on that chip?
> 

As we are talking about generic soc_device_attribute fields, I was hoping that
having a vendor field would be helpful as along with family it would provide
a more thorough information. Also as more than one foundries may be used for 
a soc, can we have a field say foundry_id to provide this information.
  
> 	Arnd
> 


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a\nmember of the Code Aurora Forum, hosted by The Linux Foundation
