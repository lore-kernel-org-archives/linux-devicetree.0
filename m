From: Sekhar Nori <nsekhar@ti.com>
Subject: Re: [PATCH v2 5/5] ARM: dts: Add LEGO MINDSTORMS EV3 dts
Date: Thu, 12 Jan 2017 13:09:30 +0530
Message-ID: <7d48023a-f6b3-c543-0ec5-131f1f1e99b8@ti.com>
References: <1483677228-2325-1-git-send-email-david@lechnology.com>
 <1483677228-2325-6-git-send-email-david@lechnology.com>
 <e8136b8a-b8f7-7b1b-693a-955dc17f1de9@ti.com>
 <1dd57ac3-554f-7d66-97b0-b76c3ddc7854@lechnology.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1dd57ac3-554f-7d66-97b0-b76c3ddc7854@lechnology.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Lechner <david@lechnology.com>
Cc: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On Wednesday 11 January 2017 09:55 PM, David Lechner wrote:

>>> +&spi0 {
>>> +    status = "okay";
>>> +    pinctrl-names = "default";
>>> +    pinctrl-0 = <&spi0_pins>, <&spi0_cs0_pin>, <&spi0_cs3_pin>;
>>> +
>>> +    flash@0 {
>>> +        compatible = "n25q128a13", "jedec,spi-nor";
>>> +        reg = <0>;
>>> +        spi-max-frequency = <50000000>;
>>> +        ti,spi-wdelay = <8>;
>>> +
>>> +        /* Partitions are based on the official firmware from LEGO */
>>> +        partitions {
>>> +            #address-cells = <1>;
>>> +            #size-cells = <1>;
>>> +            partition@0 {
>>> +                label = "U-Boot";
>>> +                reg = <0 0x40000>;
>>> +            };
>>> +
>>> +            partition@40000 {
>>> +                label = "U-Boot Env";
>>> +                reg = <0x40000 0x10000>;
>>> +            };
>>> +
>>> +            partition@50000 {
>>> +                label = "Kernel";
>>> +                reg = <0x50000 0x200000>;
>>> +            };
>>> +
>>> +            partition@250000 {
>>> +                label = "Filesystem";
>>> +                reg = <0x250000 0xa50000>;
>>> +            };
>>> +
>>> +            partition@cb0000 {
>>> +                label = "Storage";
>>> +                reg = <0xcb0000 0x2f0000>;
>>> +            };
>>> +        };
>>> +    };
>>> +
>>> +    adc@3 {
>>> +        compatible = "ti-ads7957";
>>
>> So looks like this works because of_register_spi_device() sets up
>> modalias of spi device from compatible string. I am fine with it, just
>> highlighting it here to make sure this is acceptable practice. I did not
>> really find any precedence for using SPI device name as compatible
>> property in existing DTS files.
> 
> Indeed. It looks like this sort of "trivial" device binding is just used
> for i2c devices. I will submit some patches to add proper device tree
> bindings and change this to "ti,ads7957".

Alright, if you are going to do that, then I suggest you respin this
patch with the adc node dropped for now. That way we can ensure basic
board support in v4.11. If dependencies pan out, the adc can go in too
as a separate patch.

Thanks,
Sekhar
