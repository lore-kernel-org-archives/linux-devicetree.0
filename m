From: Rajendra Nayak <rnayak@codeaurora.org>
Subject: Re: [PATCH 2/5] arm: dts: apq8064: Add thermal zones, tsens and qfprom
 nodes
Date: Mon, 18 Jul 2016 15:23:05 +0530
Message-ID: <578CA701.2070909@codeaurora.org>
References: <1468306374-24153-1-git-send-email-rnayak@codeaurora.org> <1468306374-24153-3-git-send-email-rnayak@codeaurora.org> <20160716201032.GA15946@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20160716201032.GA15946@rob-hp-laptop>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: andy.gross@linaro.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 07/17/2016 01:40 AM, Rob Herring wrote:
> On Tue, Jul 12, 2016 at 12:22:51PM +0530, Rajendra Nayak wrote:
>> TSENS is part of GCC, hence add TSENS properties as part of GCC node.
>> Also add thermal zones and qfprom nodes.
>> Update GCC bindings doc to mention the possibility of optional TSENS
>> properties that can be part of GCC node.
>>
>> Acked-by: Eduardo Valentin <edubezval@gmail.com>
>> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,gcc.txt         |  18 ++++
>>  arch/arm/boot/dts/qcom-apq8064.dtsi                | 119 +++++++++++++++++++++
>>  2 files changed, 137 insertions(+)
> 
> [...]
> 
>> diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
>> index 906bb81..e54c215 100644
>> --- a/arch/arm/boot/dts/qcom-apq8064.dtsi
>> +++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
>> @@ -86,6 +86,108 @@
>>  		};
>>  	};
>>  
>> +	thermal-zones {
>> +		cpu-thermal0 {
>> +			polling-delay-passive = <250>;
>> +			polling-delay = <1000>;
>> +
>> +			thermal-sensors = <&gcc 7>;
>> +			coefficients = <1199 0>;
>> +
>> +			trips {
>> +				cpu_alert0: trip@0 {
> 
> Compile this with W=1 and fix the warings.

Thanks Rob, will fix.

> 
>> +					temperature = <75000>;
>> +					hysteresis = <2000>;
>> +					type = "passive";
>> +				};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
