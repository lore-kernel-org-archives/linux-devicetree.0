From: David Dai <daidavid1@codeaurora.org>
Subject: Re: [PATCH 2/2] arm64: dts: sdm845: Redefine interconnect provider DT
 nodes
Date: Tue, 23 Jul 2019 11:24:23 -0700
Message-ID: <0ecba781-ad08-0f09-f4a8-83473569a4c5@codeaurora.org>
References: <1563568344-1274-1-git-send-email-daidavid1@codeaurora.org>
 <1563568344-1274-3-git-send-email-daidavid1@codeaurora.org>
 <20190721191305.GI7234@tuxbook-pro>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190721191305.GI7234@tuxbook-pro>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: georgi.djakov@linaro.org, robh+dt@kernel.org, evgreen@google.com, ilina@codeaurora.org, seansw@qti.qualcomm.com, elder@linaro.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Thanks for looking over this, Bjorn.

On 7/21/2019 12:13 PM, Bjorn Andersson wrote:
> On Fri 19 Jul 13:32 PDT 2019, David Dai wrote:
>
>> Add the DT nodes for each of the Network-On-Chip interconnect
>> buses found on SDM845 based platform and redefine the rsc_hlos
>> child node as a bcm-voter device to better represent the hardware.
>>
>> Signed-off-by: David Dai <daidavid1@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 61 ++++++++++++++++++++++++++++++++++--
>>   1 file changed, 58 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> index e7d78bc..204222e 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>> @@ -610,6 +610,62 @@
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		aggre1_noc: interconnect@16e0000 {
>> +			compatible = "qcom,sdm845-aggre1_noc";
>> +			reg = <0 0x16e0000 0 0xd080>;
> Please pad the address to 8 digits and keep nodes sorted by address.
Will fix.
>> +			#interconnect-cells = <1>;
>> +			qcom,bcm-voter = <&apps_bcm_voter>;
>> +		};
>> +
>> +		aggre2_noc: interconnect@1700000 {
>> +			compatible = "qcom,sdm845-aggre2_noc";
>> +			reg = <0 0x1700000 0 0x3b100>;
>> +			#interconnect-cells = <1>;
>> +			qcom,bcm-voter = <&apps_bcm_voter>;
>> +		};
>> +
>> +		config_noc: interconnect@1500000 {
>> +			compatible = "qcom,sdm845-config_noc";
>> +			reg = <0 0x1500000 0 0x5080>;
>> +			#interconnect-cells = <1>;
>> +			qcom,bcm-voter = <&apps_bcm_voter>;
>> +		};
> [..]
>>   		qfprom@784000 {
>>   			compatible = "qcom,qfprom";
>>   			reg = <0 0x00784000 0 0x8ff>;
>> @@ -2801,9 +2857,8 @@
>>   				};
>>   			};
>>   
>> -			rsc_hlos: interconnect {
>> -				compatible = "qcom,sdm845-rsc-hlos";
>> -				#interconnect-cells = <1>;
>> +			apps_bcm_voter: bcm_voter {
> No '_' in node names, so bcm-voter.
Ok.
>
> Apart from this nits this looks good.
>
> Regards,
> Bjorn
>
>> +				compatible = "qcom,sdm845-bcm-voter";
>>   			};
>>   		};
>>   
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
