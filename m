From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH 02/11] dts: hisilicon: Update coresight bindings for
 hardware ports
Date: Wed, 12 Sep 2018 13:42:09 +0100
Message-ID: <22fd3ec6-bde0-87c6-673b-f95a15190bda@arm.com>
References: <1536661032-30481-1-git-send-email-suzuki.poulose@arm.com>
 <1536661032-30481-3-git-send-email-suzuki.poulose@arm.com>
 <20180912104735.GC3353@leoy-ThinkPad-X240s>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180912104735.GC3353@leoy-ThinkPad-X240s>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: leo.yan@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh@kernel.org, frowand.list@gmail.com, devicetree@vger.kernel.org, mathieu.poirier@linaro.org, arm@kernel.org, sudeep.holla@arm.com, xuwei5@hisilicon.com, lipengcheng8@huawei.com
List-Id: devicetree@vger.kernel.org

Hi Leo,

On 12/09/18 11:47, leo.yan@linaro.org wrote:
> On Tue, Sep 11, 2018 at 11:17:03AM +0100, Suzuki K Poulose wrote:
>> Switch to updated coresight bindings for hw ports.
> 
> As Shawn suggested, please change subject as "arm64: dts: hi6220:
> ...."
> 

Sure, will do.

>> Cc: xuwei5@hisilicon.com
>> Cc: lipengcheng8@huawei.com
>> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> ---
>>   .../arm64/boot/dts/hisilicon/hi6220-coresight.dtsi | 147 ++++++++++++---------
>>   1 file changed, 85 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
>> index 7afee5d..2202816 100644
>> --- a/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
>> +++ b/arch/arm64/boot/dts/hisilicon/hi6220-coresight.dtsi
> 
> [...]
> 
>> @@ -302,10 +315,12 @@
>>   
>>   			cpu = <&cpu3>;
>>   
>> -			port {
>> -				etm3_out: endpoint {
>> -					remote-endpoint =
>> -						<&acpu_funnel_in3>;
>> +			out-ports {
>> +				port {
>> +					etm3_out: endpoint {
>> +						remote-endpoint =
>> +							<&acpu_funnel_in3>;
>> +					};
>>   				};
>>   			};
>>   		};
>> @@ -319,10 +334,12 @@
>>   
>>   			cpu = <&cpu4>;
>>   
>> -			port {
>> +			out-ports {
>> +				port {
>>   				etm4_out: endpoint {
> 
> Indent?

Yes, I have fixed this locally for v2.

> 
> After applied this patch and tested on Hikey board; FWIW:
> 
> Tested-by: Leo Yan <leo.yan@linaro.org>

Thanks for the testing !

Cheers
Suzuki
