From: Archit Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v3 5/5] arm: qcom: dts: Enable NAND node on IPQ8064 AP148
 platform
Date: Tue, 04 Aug 2015 20:35:10 +0530
Message-ID: <55C0D4A6.9000207@codeaurora.org>
References: <1421419702-17812-1-git-send-email-architt@codeaurora.org> <1438578498-32254-1-git-send-email-architt@codeaurora.org> <1438578498-32254-6-git-send-email-architt@codeaurora.org> <20150803193514.GA19772@qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150803193514.GA19772@qualcomm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@codeaurora.org>
Cc: linux-mtd@lists.infradead.org, dehrenberg@google.com, cernekee@gmail.com, computersforpeace@gmail.com, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 8/4/2015 1:05 AM, Andy Gross wrote:
> On Mon, Aug 03, 2015 at 10:38:18AM +0530, Archit Taneja wrote:
>> Enable the NAND controller node on the AP148 platform. Provide pinmux
>> information.
>>
>> Cc: devicetree@vger.kernel.org
>>
>> Signed-off-by: Archit Taneja <architt@codeaurora.org>
>> ---
>>   arch/arm/boot/dts/qcom-ipq8064-ap148.dts | 36 ++++++++++++++++++++++++++++++++
>>   1 file changed, 36 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
>> index 7f9ea50..2e88eff 100644
>> --- a/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
>> +++ b/arch/arm/boot/dts/qcom-ipq8064-ap148.dts
>> @@ -30,6 +30,28 @@
>>   					bias-none;
>>   				};
>>   			};
>> +			nand_pins: nand_pins {
>> +				mux {
>> +					pins = "gpio34", "gpio35", "gpio36",
>> +					       "gpio37", "gpio38", "gpio39",
>> +					       "gpio40", "gpio41", "gpio42",
>> +					       "gpio43", "gpio44", "gpio45",
>> +					       "gpio46", "gpio47";
>> +					function = "nand";
>> +					drive-strength = <10>;
>> +					bias-disable;
>> +				};
>> +				pullups {
>> +					pins = "gpio39";
>> +					bias-pull-up;
>> +				};
>> +				hold {
>> +					pins = "gpio40", "gpio41", "gpio42",
>> +					       "gpio43", "gpio44", "gpio45",
>> +					       "gpio46", "gpio47";
>> +					bias-bus-hold;
>
> Maybe split out the bias-disable into a separate set and remove that property
> from the mux.

I'll fix this.

Thanks,
Archit

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
