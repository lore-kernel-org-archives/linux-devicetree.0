From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH v1 4/4] arm64: dts: qcom: msm8998: Add mmcc node
Date: Tue, 5 Feb 2019 15:10:40 -0700
Message-ID: <966e58d7-8ebd-3871-029e-5f6eab2cc318@codeaurora.org>
References: <1548866102-30224-1-git-send-email-jhugo@codeaurora.org>
 <1548866184-30378-1-git-send-email-jhugo@codeaurora.org>
 <154940421042.169292.8494408240796466238@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154940421042.169292.8494408240796466238@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, andy.gross@linaro.org, bjorn.andersson@linaro.org, david.brown@linaro.org
Cc: marc.w.gonzalez@free.fr, mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 2/5/2019 3:03 PM, Stephen Boyd wrote:
> Quoting Jeffrey Hugo (2019-01-30 08:36:24)
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> index 7136ab1..5673a65 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
>> @@ -814,6 +814,21 @@
>>                          status = "disabled";
>>                  };
>>   
>> +               mmcc: clock-controller@c8c0000 {
>> +                       compatible = "qcom,mmcc-msm8998";
>> +                       #clock-cells = <1>;
>> +                       #reset-cells = <1>;
>> +                       #power-domain-cells = <1>;
>> +                       reg = <0x0c8c0000 0x40000>;
>> +
>> +                       clock-names =
>> +                               "xo",
> 
> Weird newline here. Please put "xo" on the same line as clock-names.
> 
>> +                               "gpll0";
>> +                       clocks =
>> +                               <&rpmcc RPM_SMD_XO_CLK_SRC>,
>> +                               <&gcc GPLL0_OUT_MAIN>;
> 
> Ah ok, so only the multimedia clks get the xo clk from rpm for now?
> 

Yes.  With this entire series, its possible to retrofit GCC, but I 
didn't tackle that since we'd need to consider backwards compatibility. 
I hope to do this moving forward though.

-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
