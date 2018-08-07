Return-Path: <SRS0=Ch3o=KW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mga12.intel.com ([192.55.52.136]:31302 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726630AbeHHASA (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 7 Aug 2018 20:18:00 -0400
Reply-To: thor.thayer@linux.intel.com
Subject: Re: [PATCH] Change timer interrupt to edge sensitive
References: <1533210074-4996-1-git-send-email-silvan.murer@gmail.com>
 <1389dc3f-080f-cbea-8db0-76ad6b0628c3@gmail.com>
From: Thor Thayer <thor.thayer@linux.intel.com>
Message-ID: <5b224914-48b8-19d8-53da-52c8121bb723@linux.intel.com>
Date: Tue, 7 Aug 2018 17:03:54 -0500
MIME-Version: 1.0
In-Reply-To: <1389dc3f-080f-cbea-8db0-76ad6b0628c3@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
To: Silvan Murer <silvan.murer@gmail.com>, devicetree@vger.kernel.org
Cc: dinguyen@kernel.org
List-ID: <devicetree@vger.kernel.org>

Hi Silvan,

On 08/07/2018 02:23 PM, Silvan Murer wrote:
> Hi Thor,
> 
> Did you saw my patch? I think the default configuration for the timer interrupt should be <1 13 0xf01>
> 
> Otherwise, the driver get the error "GIC: PPI13 is secure or misconfigured"
> 
> Base on the ARM documentation it is a edge sensitive trigger:
> http://infocenter.arm.com/help/topic/com.arm.doc.ddi0407f/CCHEIGIC.html
> 
> Or do I understand something wrong?
> 
This looks correct. In fact, our socfpga.dtsi base file uses the rising 
edge.

> Best regards,
> Silvan
> 
> 
> On 02.08.2018 13:41, Silvan Murer wrote:
>> Signed-off-by: Silvan Murer <silvan.murer@gmail.com>
>> ---
>>   arch/arm/boot/dts/socfpga_arria10.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
>> index 791ca15..52a7025 100644
>> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
>> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
>> @@ -748,7 +748,7 @@
>>   		timer@ffffc600 {
>>   			compatible = "arm,cortex-a9-twd-timer";
>>   			reg = <0xffffc600 0x100>;
>> -			interrupts = <1 13 0xf04>;
>> +			interrupts = <1 13 0xf01>;
>>   			clocks = <&mpu_periph_clk>;
>>   		};
>>   
> 
Reviewed-by: Thor Thayer <thor.thayer@linux.intel.com>

