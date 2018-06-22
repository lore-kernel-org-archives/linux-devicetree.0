From: Dinh Nguyen <dinguyen@kernel.org>
Subject: Re: [PATCH 1/2] ARM: dts: Fix SPI node for Arria10
Date: Fri, 22 Jun 2018 13:54:56 -0500
Message-ID: <589fb018-b157-f19d-0dc4-0ee951ff6672@kernel.org>
References: <1527617319-1936-1-git-send-email-thor.thayer@linux.intel.com>
 <7dee7b62-5473-d107-dc18-b2638b7aace5@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <7dee7b62-5473-d107-dc18-b2638b7aace5@linux.intel.com>
Content-Language: en-US
Sender: stable-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, stable@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 06/21/2018 01:27 PM, Thor Thayer wrote:
> Hi Dinh,
> 
> On 05/29/2018 01:08 PM, thor.thayer@linux.intel.com wrote:
>> From: Thor Thayer <thor.thayer@linux.intel.com>
>>
>> Remove the unused bus-num node and change num-chipselect
>> to num-cs to match SPI bindings.
>>
>> Fixes: f2d6f8f817814 ("ARM: dts: socfpga: Add SPI Master1 for Arria10
>> SR chip")
>> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>
>> Cc: stable@vger.kernel.org
>> ---
>>   arch/arm/boot/dts/socfpga_arria10.dtsi | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi
>> b/arch/arm/boot/dts/socfpga_arria10.dtsi
>> index bead79e4b2aa..9138f834bad4 100644
>> --- a/arch/arm/boot/dts/socfpga_arria10.dtsi
>> +++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
>> @@ -593,8 +593,7 @@
>>               #size-cells = <0>;
>>               reg = <0xffda5000 0x100>;
>>               interrupts = <0 102 4>;
>> -            num-chipselect = <4>;
>> -            bus-num = <0>;
>> +            num-cs = <4>;
>>               /*32bit_access;*/
>>               tx-dma-channel = <&pdma 16>;
>>               rx-dma-channel = <&pdma 17>;
>>
> Any update on this patch?

I've applied both patches.

Thanks,
Dinh
