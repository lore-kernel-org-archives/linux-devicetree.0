Return-Path: <SRS0=h+hQ=K6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51984 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729347AbeHOSDy (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Wed, 15 Aug 2018 14:03:54 -0400
Subject: Re: [PATCH] Change timer interrupt to edge sensitive
References: <1533210074-4996-1-git-send-email-silvan.murer@gmail.com>
 <1389dc3f-080f-cbea-8db0-76ad6b0628c3@gmail.com>
 <5b224914-48b8-19d8-53da-52c8121bb723@linux.intel.com>
From: Dinh Nguyen <dinguyen@kernel.org>
Message-ID: <e772272a-b433-e33c-e40d-bf12408aa77d@kernel.org>
Date: Wed, 15 Aug 2018 10:11:20 -0500
MIME-Version: 1.0
In-Reply-To: <5b224914-48b8-19d8-53da-52c8121bb723@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: thor.thayer@linux.intel.com, Silvan Murer <silvan.murer@gmail.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>



On 08/07/2018 05:03 PM, Thor Thayer wrote:
> Hi Silvan,
> 
> On 08/07/2018 02:23 PM, Silvan Murer wrote:
>> Hi Thor,
>>
>> Did you saw my patch? I think the default configuration for the timer
>> interrupt should be <1 13 0xf01>
>>
>> Otherwise, the driver get the error "GIC: PPI13 is secure or
>> misconfigured"
>>
>> Base on the ARM documentation it is a edge sensitive trigger:
>> http://infocenter.arm.com/help/topic/com.arm.doc.ddi0407f/CCHEIGIC.html
>>
>> Or do I understand something wrong?
>>
> This looks correct. In fact, our socfpga.dtsi base file uses the rising
> edge.
> 
>> Best regards,
>> Silvan
>>
>>
>> On 02.08.2018 13:41, Silvan Murer wrote:
>>> Signed-off-by: Silvan Murer <silvan.murer@gmail.com>
>>> ---
>>>   arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi
>>> b/arch/arm/boot/dts/socfpga_arria10.dtsi
>>> index 791ca15..52a7025 100644
>>> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
>>> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
>>> @@ -748,7 +748,7 @@
>>>           timer@ffffc600 {
>>>               compatible = "arm,cortex-a9-twd-timer";
>>>               reg = <0xffffc600 0x100>;
>>> -            interrupts = <1 13 0xf04>;
>>> +            interrupts = <1 13 0xf01>;
>>>               clocks = <&mpu_periph_clk>;
>>>           };
>>>   
>>
> Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>
> 

Applied!

Thanks,
Dinh
