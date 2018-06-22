From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: stratix10: Fix SPI nodes for Stratix10
Date: Fri, 22 Jun 2018 13:55:11 -0500
Message-ID: <4d02db71-c019-3517-8ba0-81b008cad2e2@kernel.org>
References: <1527617612-2205-1-git-send-email-thor.thayer@linux.intel.com>
 <2e12b65a-c0bf-0628-ef38-ed931935ee41@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <2e12b65a-c0bf-0628-ef38-ed931935ee41@linux.intel.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/21/2018 01:25 PM, Thor Thayer wrote:
> Hi Dinh,
> 
> On 05/29/2018 01:13 PM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> Remove the unused bus-num node and change num-chipselect
>> to num-cs to match SPI bindings.
>>
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> Fixes: 78cd6a9d8e154 ("arm64: dts: Add base stratix 10 dtsi")
>> Cc: stable@vger.kernel.org
>> ---
>>   arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>> b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>> index d8c94d5ff4b4..47fa4b450324 100644
>> --- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>> +++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
>> @@ -315,8 +315,7 @@
>>               interrupts = <0 99 4>;
>>               resets = <&rst SPIM0_RESET>;
>>               reg-io-width = <4>;
>> -            num-chipselect = <4>;
>> -            bus-num = <0>;
>> +            num-cs = <4>;
>>               status = "disabled";
>>           };
>>   @@ -328,8 +327,7 @@
>>               interrupts = <0 100 4>;
>>               resets = <&rst SPIM1_RESET>;
>>               reg-io-width = <4>;
>> -            num-chipselect = <4>;
>> -            bus-num = <0>;
>> +            num-cs = <4>;
>>               status = "disabled";
>>           };
>>  
> Any update on this patch?

I've applied both patches.

Thanks,
Dinh
