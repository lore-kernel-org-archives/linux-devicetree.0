From: Jeffrey Hugo <jhugo@codeaurora.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: msm8998-mtp: Add external SD
Date: Thu, 15 Nov 2018 13:11:43 -0700
Message-ID: <837878fb-6285-f71f-ad10-5c1a1a781c6e@codeaurora.org>
References: <1542302291-6864-1-git-send-email-jhugo@codeaurora.org>
 <1542302291-6864-5-git-send-email-jhugo@codeaurora.org>
 <20181115190559.GA17484@hector>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181115190559.GA17484@hector>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: david.brown@linaro.org, bjorn.andersson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 11/15/2018 12:05 PM, Andy Gross wrote:
> On Thu, Nov 15, 2018 at 10:18:11AM -0700, Jeffrey Hugo wrote:
>> The externally accessible SD card slot on the MTP is driven by SDCC2.
>> Wire it up for use.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 13 +++++++++++++
>>   arch/arm64/boot/dts/qcom/msm8998.dtsi     |  1 +
>>   2 files changed, 14 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
>> index b4276da..a90b427 100644
>> --- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
>> @@ -241,3 +241,16 @@
>>   		};
>>   	};
>>   };
>> +
>> +&sdhc2 {
>> +	status = "okay";
>> +        cd-gpios = <&tlmm 95 GPIO_ACTIVE_LOW>;
>> +
>> +        vmmc-supply = <&vreg_l21a_2p95>;
>> +        vqmmc-supply = <&vreg_l13a_2p95>;
>> +
>> +        pinctrl-names = "default", "sleep";
>> +        pinctrl-0 = <&sdc2_clk_on  &sdc2_cmd_on  &sdc2_data_on  &sdc2_cd_on>;
>> +        pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off &sdc2_cd_off>;
> 
> Fix to use tabs instead of spaces.

Doh.  Nice catch.  I see I didn't commit that change in my tree.
I'll send out a V2 with this and any other fixes folks comment on.


-- 
Jeffrey Hugo
Qualcomm Datacenter Technologies as an affiliate of Qualcomm 
Technologies, Inc.
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
