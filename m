From: Imran Khan <kimran@codeaurora.org>
Subject: Re: [PATCH] soc: qcom: Add SoC info driver
Date: Wed, 2 Nov 2016 13:19:47 +0530
Message-ID: <ee68877b-6837-1c35-b440-2a12bb4e1225@codeaurora.org>
References: <1476972386-28655-1-git-send-email-kimran@codeaurora.org>
 <4173870.AkctyO62lp@wuerfel>
 <fd34e299-a3c2-e981-a92e-b61638a98e5f@codeaurora.org>
 <9172138.R1PTFlLtP9@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <9172138.R1PTFlLtP9@wuerfel>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: andy.gross@linaro.org, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, "open list:ARM/QUALCOMM SUPPORT" <linux-soc@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On 10/27/2016 7:11 PM, Arnd Bergmann wrote:
> On Thursday, October 27, 2016 6:40:27 PM CEST Imran Khan wrote:
>> On 10/26/2016 8:16 PM, Arnd Bergmann wrote:
>>> On Wednesday, October 26, 2016 7:42:08 PM CEST Imran Khan wrote:
>>>> On 10/26/2016 7:35 PM, Arnd Bergmann wrote:
>>>>>>> As we are talking about generic soc_device_attribute fields, I was hoping that
>>>>>>> having a vendor field would be helpful as along with family it would provide
>>>>>>> a more thorough information. Also as more than one foundries may be used for 
>>>>>>> a soc, can we have a field say foundry_id to provide this information.
>>>>> My first feeling is that this 'vendor' information can should be
>>>>> derived from the family. It's also not clear what would happen
>>>>> to this when a company gets bought. E.g. the Oxnas product family
>>>>> was subsequently owned by Oxford, PLX, Avago and Broadcom, and the
>>>>> mxs family was Sigmatel, Freescale, now NXP and might soon be
>>>>> Qualcomm. What would you put in there in this case?
>>>>
>>>> Okay, not having vendor field is fine for me. Could you also suggest
>>>> something about the foundry_id field.
>>>
>>> This one seems more well-defined, so it's probably ok to add. What
>>> would be the use case of reading this? Would you want to read it
>>> just from user space or also from the kernel?
>>>
>>
>> As of now the use case I can think of, only involve reading this from user
>> space. For example for the same soc, coming from different foundries with
>> different manufacturing process, we may have a situation where some inconsistent
>> h/w behavior is being observed only on parts received from a certain foundry
>> and in those cases this information may help in segregation of problematic socs
>> and may also be used in testing these socs under a different set of settings like
>> voltage, frequency etc.
>>
>>> Maybe this can be combined with a manufacturing process, which probably
>>> falls into a similar category, so we could have something like
>>> "TSMC 28ULP" as a string in there.
>>>
>>
>> Yes. Having a manufacturing process as part of foundry-id can provide a more
>> thorough information.
> 
> Ok, sounds good. Let's do it like this. We can always add support for
> in-kernel matching of this string if needed later.
>

Thanks for the feedback. So how should I proceed now, should I 

i. send one patch first that adds the serial_number and foundry_id fields
in generic soc_dev_attribute structure and then send my modified socinfo 
driver as per new soc_dev_attribute structure

or 

ii. send both the changes as 2 separate patches of the same patch set.

or 

iii. Continue with the current soc_dev_attribute structure and modify
the socinfo driver once soc_dev_attribute structure has serial_number
and foundry_id fields.

 
> 	Arnd
> 


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a\nmember of the Code Aurora Forum, hosted by The Linux Foundation
