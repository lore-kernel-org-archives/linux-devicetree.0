From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: mt8173: add pmu nodes for mt8173
Date: Tue, 16 Apr 2019 10:57:16 +0200
Message-ID: <82f9aa3b-4621-c404-f6f6-312ca321f46a@gmail.com>
References: <20190109082143.26468-1-seiya.wang@mediatek.com>
 <38a56fc1-09fa-a35a-fcef-e265f1608b83@gmail.com>
 <1555403701.26958.1.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1555403701.26958.1.camel@mtksdaap41>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com
List-Id: devicetree@vger.kernel.org



On 16/04/2019 10:35, Seiya Wang wrote:
> On Fri, 2019-02-08 at 16:04 +0100, Matthias Brugger wrote:
>>
>> On 09/01/2019 09:21, Seiya Wang wrote:
>>> This patch adds the device nodes of ARM Performance Monitor Uint
>>> for mt8173.
>>>
>>> Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
>>> ---
>>>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 14 ++++++++++++++
>>>  1 file changed, 14 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> index 412ffd4d426b..44374c506a1c 100644
>>> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
>>> @@ -216,6 +216,20 @@
>>>  		};
>>>  	};
>>>  
>>> +	pmu_a53 {
>>> +		compatible = "arm,cortex-a53-pmu";
>>> +		interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_LOW>,
>>> +			     <GIC_SPI 9 IRQ_TYPE_LEVEL_LOW>;
>>> +		interrupt-affinity = <&cpu0>, <&cpu1>;
>>> +	};
>>> +
>>> +	pmu_a72 {
>>> +		compatible = "arm,cortex-a72-pmu";
>>> +		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_LOW>,
>>> +			     <GIC_SPI 13 IRQ_TYPE_LEVEL_LOW>;
>>> +		interrupt-affinity = <&cpu2>, <&cpu3>;
>>> +	};
>>
>> There is no a72 but a a57 CPU present.
>> Typo?
>>
>> Regards,
>> Matthias
> 
> Please also apply this (if no problems) since we have changed to ca72.
> Thanks.
> 

Pushed now to v5.1-next/dts64

Thanks for the heads up :)
