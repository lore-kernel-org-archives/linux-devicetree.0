From: Alex <alex.g-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 5/5] ARC: DTS: Add device-tree for Anarion-based
 development board
Date: Mon, 31 Jul 2017 08:08:39 -0700
Message-ID: <6f77fffe-d9f8-58dd-951c-a38600827863@adaptrum.com>
References: <20170728220707.13960-1-alex.g@adaptrum.com>
 <20170728220707.13960-6-alex.g@adaptrum.com>
 <8576ceb3-036f-6357-fb52-b062dfe5fa57@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8576ceb3-036f-6357-fb52-b062dfe5fa57-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vineet Gupta <Vineet.Gupta1-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, "linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-snps-arc-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 07/30/2017 11:32 PM, Vineet Gupta wrote:
> On 07/29/2017 03:37 AM, Alexandru Gagniuc wrote:
>> Signed-off-by: Alexandru Gagniuc <alex.g-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org>
>> ---
>>   arch/arc/boot/dts/adaptrum_anarion.dtsi     | 107
>> ++++++++++++++++++++++++++++
>>   arch/arc/boot/dts/adaptrum_anarion_fpga.dts |  49 +++++++++++++
>>   2 files changed, 156 insertions(+)
>>   create mode 100644 arch/arc/boot/dts/adaptrum_anarion.dtsi
>>   create mode 100644 arch/arc/boot/dts/adaptrum_anarion_fpga.dts
>
> So you really need to upstream the fpga dts - if this just for initial
> bringup and you will eventually switch to silicon.
> The reason I say is every additional file is a maintenance burden so
> better to avoid things which are only temporary.
> But if you plan to support this config in long run I'm fine !
>
> Looking further it seems first one is a "common" include style dts while
> fpga is for actual platform and the SoC one will follow once you get it
> running ?

That is correct. the '_fpga.dts' is the tree for the current emulation 
board. The plan is to use the fpga platform until the actual silicon 
arrives and is brought up. I included the _fpga dts in order to have a 
way to verify that the anarion DTSI compiles. I also plan to later 
remove the fpga dts once the actual silicon works.

[snip]

>> +#include "skeleton.dtsi"
>
> Perhaps put a one liner that this is based on SNPS ARC700 cpu !

Staged for [PATCH v2].

Alex

>> +
>> +/ {
>> +    compatible = "adaptrum,anarion";
>> +    #address-cells = <1>;
>> +    #size-cells = <1>;
>> +
>> +    soc {
>> +        compatible = "simple-bus";
>> +        device_type = "soc";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges;
>> +        interrupt-parent = <&core_intc>;
>> +
>> +        core_intc: interrupt-controller {
>> +            compatible = "snps,arc700-intc";
>> +            interrupt-controller;
>> +            #interrupt-cells = <1>;
>> +        };
>> +
>> +        uart0: serial@f2202100 {
>> +            compatible = "ns16550";
>> +            reg = <0xf2202100 0x20>;
>> +            interrupts = <8>;
>> +            reg-shift = <2>;
>> +            reg-io-width = <4>;
>> +            clock-frequency = <192000000>;
>> +            status = "disabled";
>> +        };
>> +
>> +        uart1: serial@f2202200 {
>> +            compatible = "snps,dw-apb-uart";
>> +            reg = <0xf2202200 0x20>;
>> +            interrupts = <8>;
>> +            reg-shift = <2>;
>> +            reg-io-width = <4>;
>> +            clock-frequency = <192000000>;
>> +            status = "disabled";
>> +        };
>> +
>> +        uart2: serial@f2202300 {
>> +            compatible = "snps,dw-apb-uart";
>> +            reg = <0xf2202300 0x20>;
>> +            interrupts = <8>;
>> +            reg-shift = <2>;
>> +            reg-io-width = <4>;
>> +            clock-frequency = <192000000>;
>> +            status = "disabled";
>> +        };
>> +
>> +        uart3: serial@f2202400 {
>> +            compatible = "snps,dw-apb-uart";
>> +            reg = <0xf2202400 0x20>;
>> +            interrupts = <8>;
>> +            reg-shift = <2>;
>> +            reg-io-width = <4>;
>> +            clock-frequency = <192000000>;
>> +            status = "disabled";
>> +        };
>> +
>> +        qspi: qspi@f200f000 {
>> +            compatible = "adaptrum,anarion-qspi";
>> +            reg = <0xf200f000 0x1000>,
>> +                  <0x20000000 0x08000000>;
>> +
>> +            interrupts = <10>;
>> +            status = "disabled";
>> +        };
>> +
>> +        gmac0: ethernet@f2010000 {
>> +            compatible = "snps,dwmac";
>> +            reg = <0xf2010000 0x4000>;
>> +
>> +            interrupt-parent = <&core_intc>;
>> +            interrupts = <20>;
>> +            interrupt-names = "macirq";
>> +
>> +            clocks = <&core_clk>;
>> +            clock-names = "stmmaceth";
>> +
>> +            snps,pbl = <32>;
>> +            status = "disabled";
>> +        };
>> +
>> +        gmac1: ethernet@f2014000 {
>> +            compatible = "adaptrum,anarion-gmac", "snps,dwmac";
>> +            reg = <0xf2014000 0x4000>, <0xf2018100 8>;
>> +
>> +            interrupt-parent = <&core_intc>;
>> +            interrupts = <21>;
>> +            interrupt-names = "macirq";
>> +
>> +            clocks = <&core_clk>;
>> +            clock-names = "stmmaceth";
>> +
>> +            snps,pbl = <32>;
>> +            status = "disabled";
>> +        };
>> +    };
>> +};
>> diff --git a/arch/arc/boot/dts/adaptrum_anarion_fpga.dts
>> b/arch/arc/boot/dts/adaptrum_anarion_fpga.dts
>> new file mode 100644
>> index 0000000..36173b2
>> --- /dev/null
>> +++ b/arch/arc/boot/dts/adaptrum_anarion_fpga.dts
>> @@ -0,0 +1,49 @@
>> +/*
>> + * (C) Copyright 2017 Adaptrum, Inc.
>> + * Written by Alexandru Gagniuc <alex.g-JVBBi1ABkv5Wk0Htik3J/w@public.gmane.org> for Adaptrum, Inc.
>> + * Licensed under the GPLv2 or (at your option) any later version
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "adaptrum_anarion.dtsi"
>> +
>> +/ {
>> +    model = "adaptrum,anarion";
>> +    compatible = "adaptrum,anarion";
>> +
>> +    chosen {
>> +        bootargs = "earlycon console=ttyS0,115200n8";
>> +        stdout-path = "serial0:115200n8";
>> +    };
>> +
>> +    aliases {
>> +        serial0 = &uart0;
>> +    };
>> +
>> +    core_clk: core_clk {
>> +        #clock-cells = <0>;
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <12000000>;
>> +    };
>> +};
>> +
>> +&uart0 {
>> +    status = "okay";
>> +};
>> +
>> +&qspi {
>> +    status = "okay";
>> +    flash0: w25q128fvn@0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        compatible = "winbond,w25q128", "jedec,spi-nor";
>> +        spi-max-frequency = <70000000>;
>> +        m25p,fast-read;
>> +    };
>> +};
>> +
>> +&gmac1 {
>> +    phy-mode = "rgmii";
>> +    status = "okay";
>> +};
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
