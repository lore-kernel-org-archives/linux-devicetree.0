From: Keerthy <j-keerthy@ti.com>
Subject: Re: [RFC PATCH 1/3] arm64: dts: ti: am6-wakeup: Add gpio node
Date: Wed, 5 Jun 2019 12:01:35 +0530
Message-ID: <bac5737a-3924-b59f-1d90-a2a9b3a390f1@ti.com>
References: <20190605060846.25314-1-j-keerthy@ti.com>
 <20190605060846.25314-2-j-keerthy@ti.com>
 <e6ec3894-4e3d-e721-c1bc-791263b2d309@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <e6ec3894-4e3d-e721-c1bc-791263b2d309@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Lokesh Vutla <lokeshvutla@ti.com>, t-kristo@ti.com, nm@ti.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org



On 05/06/19 11:46 AM, Lokesh Vutla wrote:
> 
> 
> On 05/06/19 11:38 AM, Keerthy wrote:
>> Add gpio0 node under wakeup domain. This has 56 gpios
>> and all are capable of generating banked interrupts.
>>
>> Signed-off-by: Keerthy <j-keerthy@ti.com>
>> ---
>>   arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
>> index f1ca171abdf8..8c6c99e7c6ed 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am65-wakeup.dtsi
>> @@ -74,4 +74,19 @@
>>   		ti,sci-dst-id = <56>;
>>   		ti,sci-rm-range-girq = <0x4>;
>>   	};
>> +
>> +	wkup_gpio0: wkup_gpio0@42110000 {
>> +		compatible = "ti,k2g-gpio", "ti,keystone-gpio";
> 
> This is not k2g. Can you either create a am6 specific compatible or just use
> ti,keystone-gpio.

It seems practice is now to have separate compatible. I will add am6 
specific compatible.

> 
> Thanks and regards,
> Lokesh
> 
>> +		reg = <0x42110000 0x100>;
>> +		gpio-controller;
>> +		#gpio-cells = <2>;
>> +		interrupt-parent = <&intr_wkup_gpio>;
>> +		interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
>> +		interrupt-controller;
>> +		#interrupt-cells = <2>;
>> +		ti,ngpio = <56>;
>> +		ti,davinci-gpio-unbanked = <0>;
>> +		clocks = <&k3_clks 59 0>;
>> +		clock-names = "gpio";
>> +	};
>>   };
>>
