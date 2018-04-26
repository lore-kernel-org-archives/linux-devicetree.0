From: Sibi S <sibis@codeaurora.org>
Subject: Re: [PATCH] arm64: dts: qcom: Add SDM845 SMEM nodes
Date: Thu, 26 Apr 2018 19:55:12 +0530
Message-ID: <ade07b7f-4cc6-0a96-85f7-abb5b76ce80e@codeaurora.org>
References: <20180425144631.19731-1-sibis@codeaurora.org>
 <20180425220626.GM2052@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180425220626.GM2052@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, catalin.marinas@arm.com, will.deacon@arm.com, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-soc@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Bjorn,

Thanks for the review

On 04/26/2018 03:36 AM, Bjorn Andersson wrote:
> On Wed 25 Apr 07:46 PDT 2018, Sibi Sankar wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index 9be763da0664..bea985045759 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -21,6 +21,27 @@
>>   		reg = <0 0x80000000 0 0>;
>>   	};
>>   
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		memory@85fc0000 {
>> +			reg = <0 0x85fc0000 0 0x40000>;
> 
> The region 0x85fe0000 + 0x20000 seems to be command db, which should be
> described on its own. So please reduce the size to 0x20000.
> 
>> +			no-map;
>> +		};
>> +
>> +		smem_mem: smem-mem@86000000 {
> 
> smem_mem: memory@86000000 ?

Should I update kernel docs as well to say all nodes should
have memory has default name? Just followed what was done in
msm8916 and msm8996.

> 
>> +			reg = <0x0 0x86000000 0x0 0x200000>;
>> +			no-map;
>> +		};
>> +
>> +		memory@86000000 {
> 
> memory@86200000
> 
>> +			reg = <0 0x86200000 0 0x2d00000>;
>> +			no-map;
>> +		};
>> +	};
>> +
> 
> The rest looks good.
> 
> Regards,
> Bjorn
> 

-- 
Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc, is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
