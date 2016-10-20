From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: Re: [PATCH 3/4] arm64: dts: msm8996: Add SMEM DT nodes
Date: Thu, 20 Oct 2016 14:18:33 -0700
Message-ID: <1c7504f2-48ca-bcae-3eef-16589513d1aa@codeaurora.org>
References: <1476989765-7524-1-git-send-email-spjoshi@codeaurora.org>
 <1476989765-7524-3-git-send-email-spjoshi@codeaurora.org>
 <20161020195629.GM7509@tuxbot>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161020195629.GM7509@tuxbot>
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

On 10/20/2016 12:56 PM, Bjorn Andersson wrote:
> On Thu 20 Oct 11:56 PDT 2016, Sarangdhar Joshi wrote:
>
>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> Add SMEM and TCSR DT nodes on MSM8996.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
>> ---
>>  arch/arm64/boot/dts/qcom/msm8996.dtsi | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> index 949b096..0a810f5 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>> @@ -169,12 +169,31 @@
>>  		method = "smc";
>>  	};
>>
>> +	smem {
>> +		compatible = "qcom,smem";
>> +
>> +		memory-region = <&smem_mem>;
>> +
>> +		hwlocks = <&tcsr_mutex 3>;
>> +	};
>> +
>>  	soc: soc {
>>  		#address-cells = <1>;
>>  		#size-cells = <1>;
>>  		ranges = <0 0 0 0xffffffff>;
>>  		compatible = "simple-bus";
>>
>> +		tcsr_mutex_regs: syscon@740000 {
>> +			compatible = "syscon";
>> +			reg = <0x740000 0x20000>;
>> +		};
>> +
>> +		tcsr_mutex: hwlock {
>> +			compatible = "qcom,tcsr-mutex";
>> +			syscon = <&tcsr_mutex_regs 0 0x1000>;
>> +			#hwlock-cells = <1>;
>> +		};
>
> Sorry, I got this in the wrong place, the hwlock node should sit outside
> of soc {} - looks like we got this wrong in msm8916 as well.

Thanks for reviewing the patch. Do you mean to move it under / {}; (i.e. 
root)?

>
> Regards,
> Bjorn
>
>> +
>>  		intc: interrupt-controller@9bc0000 {
>>  			compatible = "arm,gic-v3";
>>  			#interrupt-cells = <3>;
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

Regards,
Sarang
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
