From: Tero Kristo <t-kristo@ti.com>
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am654: Add McSPI DT nodes
Date: Thu, 13 Dec 2018 17:08:06 +0200
Message-ID: <723772e0-162b-edfb-75ab-0461925a9930@ti.com>
References: <20181209102222.7624-1-vigneshr@ti.com>
 <20181209102222.7624-2-vigneshr@ti.com>
 <7b718f70-bb74-0530-9566-d621371c3d13@ti.com>
 <3420b087-673b-b5be-ed5a-bf8d95ecc4dc@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3420b087-673b-b5be-ed5a-bf8d95ecc4dc@ti.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Vignesh R <vigneshr@ti.com>, Nishanth Menon <nm@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On 13/12/2018 17:03, Vignesh R wrote:
> 
> 
> On 13-Dec-18 8:29 PM, Tero Kristo wrote:
>> On 09/12/2018 12:22, Vignesh R wrote:
>>> There are 3 instances of McSPI in MCU domain and 4 instances in Main
>>> domain.
>>> Add DT nodes for all McSPI instances present on AM654 SoC.
>>>
>>> Signed-off-by: Vignesh R <vigneshr@ti.com>
>>> ---
>>>    arch/arm64/boot/dts/ti/k3-am65-main.dtsi | 52 ++++++++++++++++++++++++
>>>    arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi  | 30 ++++++++++++++
>>>    2 files changed, 82 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>>> b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>>> index 0a0a8fc5df64..6c71e67b8988 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-am65-main.dtsi
>>> @@ -138,4 +138,56 @@
>>>            clocks = <&k3_clks 39 0>;
>>>            clock-names = "fck";
>>>        };
>>> +
>>> +    main_spi0: spi@2100000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>
>> WARNING: DT compatible string "ti,am654-mcspi" appears un-documented --
>> check ../../Documentation/devicetree/bindings/
>> #63: FILE: arch/arm64/boot/dts/ti/k3-am65-main.dtsi:143:
>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>
>> Same for the rest of the nodes.
>>
>> Did you forget documentation part?
>>
> 
> Documentation patch as been accepted into SPI tree and part of linux-next:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=abc61f47a70f7c8331f00eff1ccb6557a9d4c224

Ok thanks for the info.

-Tero

> 
> Regards
> Vignesh
> 
>> -Tero
>>
>>> +        reg = <0x0 0x2100000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 137 1>;
>>> +        power-domains = <&k3_pds 137>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +    };
>>> +
>>> +    main_spi1: spi@2110000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>> +        reg = <0x0 0x2110000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 138 1>;
>>> +        power-domains = <&k3_pds 138>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        assigned-clocks = <&k3_clks 137 1>;
>>> +        assigned-clock-rates = <48000000>;
>>> +    };
>>> +
>>> +    main_spi2: spi@2120000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>> +        reg = <0x0 0x2120000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 139 1>;
>>> +        power-domains = <&k3_pds 139>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +    };
>>> +
>>> +    main_spi3: spi@2130000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>> +        reg = <0x0 0x2130000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 140 1>;
>>> +        power-domains = <&k3_pds 140>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +    };
>>> +
>>> +    main_spi4: spi@2140000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>> +        reg = <0x0 0x2140000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 141 1>;
>>> +        power-domains = <&k3_pds 141>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +    };
>>>    };
>>> diff --git a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
>>> b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
>>> index 1fd027748e1f..1aeae52fb239 100644
>>> --- a/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
>>> +++ b/arch/arm64/boot/dts/ti/k3-am65-mcu.dtsi
>>> @@ -26,4 +26,34 @@
>>>            clocks = <&k3_clks 114 1>;
>>>            power-domains = <&k3_pds 114>;
>>>        };
>>> +
>>> +    mcu_spi0: spi@40300000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>> +        reg = <0x0 0x40300000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 560 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 142 1>;
>>> +        power-domains = <&k3_pds 142>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +    };
>>> +
>>> +    mcu_spi1: spi@40310000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>> +        reg = <0x0 0x40310000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 561 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 143 1>;
>>> +        power-domains = <&k3_pds 143>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +    };
>>> +
>>> +    mcu_spi2: spi@40320000 {
>>> +        compatible = "ti,am654-mcspi","ti,omap4-mcspi";
>>> +        reg = <0x0 0x40320000 0x0 0x400>;
>>> +        interrupts = <GIC_SPI 562 IRQ_TYPE_LEVEL_HIGH>;
>>> +        clocks = <&k3_clks 144 1>;
>>> +        power-domains = <&k3_pds 144>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +    };
>>>    };
>>>
>>
>> -- 

--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
