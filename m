From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v3 2/6] arm64: dts: msm8998: Add xo clock to gcc node
Date: Wed, 1 May 2019 08:17:58 -0600
Message-ID: <14d71a86-4bf7-b5f1-3efa-0938bd838ce3@codeaurora.org>
References: <1556677404-29194-1-git-send-email-jhugo@codeaurora.org>
 <1556677531-29291-1-git-send-email-jhugo@codeaurora.org>
 <20190501033548.GC2938@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190501033548.GC2938@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: agross@kernel.org, david.brown@linaro.org, marc.w.gonzalez@free.fr, mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 4/30/2019 9:35 PM, Bjorn Andersson wrote:
> On Tue 30 Apr 19:25 PDT 2019, Jeffrey Hugo wrote:
> 
>> GCC is a consumer of the xo clock.  Add a reference to the clock supplier
>> to the gcc node.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> (Although I prefer clock-names following clocks)

Huh, I didn't even realize I did that until you pointed it out.  Feel 
free to adjust when you apply, or if there is another spin I'll fix it.

> 
> Regards,
> Bjorn
> 
>> ---
>>   arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 574be78..9c88801 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -709,6 +709,8 @@
>>   			#reset-cells = <1>;
>>   			#power-domain-cells = <1>;
>>   			reg = <0x100000 0xb0000>;
>> +			clock-names = "xo";
>> +			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
>>   		};
>>   
>>   		tlmm: pinctrl@3400000 {
>> -- 
>> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
