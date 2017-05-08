From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: Re: [PATCH 4/5] arm64: dts: Add ipq8074 SoC and MTP board support
Date: Mon, 8 May 2017 13:02:20 +0530
Message-ID: <a63b7ccf-51a6-5d10-47e1-aac9a27a1516@codeaurora.org>
References: <1493373403-23462-1-git-send-email-varada@codeaurora.org>
 <1493373403-23462-5-git-send-email-varada@codeaurora.org>
 <20170428185825.75usyll55p3aclnm@latitude>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170428185825.75usyll55p3aclnm@latitude>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org, linus.walleij@linaro.org, andy.gross@linaro.org, david.brown@linaro.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sricharan@codeaurora.org, absahu@codeaurora.org, sjaganat@codeaurora.org, Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
List-Id: devicetree@vger.kernel.org



On 4/29/2017 12:28 AM, Jonathan Neuschäfer wrote:
> Hi,
> 
> On Fri, Apr 28, 2017 at 03:26:42PM +0530, Varadarajan Narayanan wrote:
>> Subject: [PATCH 4/5] arm64: dts: Add ipq8074 SoC and MTP board support
> 
> s/MTP/HK01/ ?

Have posted v2 with MTP changed as HK01. Please refer to
https://www.spinics.net/lists/arm-kernel/msg579470.html.

Thanks
Varada

> 
>> Add initial device tree support for the Qualcomm IPQ8074 SoC and
>> HK01 evaluation board.
>>
>> Signed-off-by: Manoharan Vijaya Raghavan <mraghava@codeaurora.org>
>> Signed-off-by: Abhishek Sahu <absahu@codeaurora.org>
>> Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
>> ---
>>   arch/arm64/boot/dts/qcom/Makefile         |   1 +
>>   arch/arm64/boot/dts/qcom/ipq8074-hk01.dts |  48 ++++++++++
>>   arch/arm64/boot/dts/qcom/ipq8074.dtsi     | 153 ++++++++++++++++++++++++++++++
>>   3 files changed, 202 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/qcom/ipq8074-hk01.dts
>>   create mode 100644 arch/arm64/boot/dts/qcom/ipq8074.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index cc0f02d..7c6963e 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -4,6 +4,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-bullhead-rev-101.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> 
> Maybe this list should be alphabetically sorted ('i' before 'm').
> (I have no strong preference)
> 
> 
> Thanks,
> Jonathan Neuschäfer
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum, a Linux Foundation Collaborative Project
