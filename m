Return-Path: <SRS0=UpLl=HG=ti.com=t-kristo@kernel.org>
Subject: Re: [RFC 12/13] ARM: dts: ti: add dra71-evm FIT description file
References: <1523956215-28154-1-git-send-email-t-kristo@ti.com>
 <1523956215-28154-13-git-send-email-t-kristo@ti.com>
 <20180417092924.GB20335@flint.armlinux.org.uk>
From: Tero Kristo <t-kristo@ti.com>
Message-ID: <ad5ef67d-d566-0034-a7cd-09a549cbd6d7@ti.com>
Date: Tue, 17 Apr 2018 12:34:32 +0300
MIME-Version: 1.0
In-Reply-To: <20180417092924.GB20335@flint.armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Russell King <rmk@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, frowand.list@gmail.com, mark.rutland@arm.com, wmills@ti.com, tony@atomide.com, trini@konsulko.com
List-ID: <devicetree@vger.kernel.org>

On 17/04/18 12:29, Russell King wrote:
> On Tue, Apr 17, 2018 at 12:10:14PM +0300, Tero Kristo wrote:
>> Add FIT image description file for dra71-evm, and the available
>> configurations for it.
>>
>> Signed-off-by: Tero Kristo <t-kristo@ti.com>
>> ---
>>   arch/arm/boot/dts/ti/dra71-evm.its | 62 ++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 62 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/ti/dra71-evm.its
>>
>> diff --git a/arch/arm/boot/dts/ti/dra71-evm.its b/arch/arm/boot/dts/ti/dra71-evm.its
>> new file mode 100644
>> index 0000000..8dc53cb
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/ti/dra71-evm.its
>> @@ -0,0 +1,62 @@
>> +/dts-v1/;
>> +
>> +/ {
>> +	description = "DRA71x-evm";
>> +	#address-cells = <1>;
>> +
>> +	images {
>> +		kernel@1 {
>> +			description = "Linux kernel";
>> +			data = /incbin/("../../zImage");
>> +			type = "kernel";
>> +			arch = "arm";
>> +			os = "linux";
>> +			compression = "none";
>> +			load = <0x82000000>;
>> +			entry = <0x82000000>;
>> +		};
>> +		fdt@1 {
>> +			description = "DRA71x-evm";
>> +			data = /incbin/("dra71-evm.dtb");
>> +			type = "flat_dt";
>> +			arch = "arm";
>> +			compression = "none";
>> +			load = <0x83000000>;
>> +		};
>> +		fdt@2 {
>> +			description = "DRA71x-evm LCD";
>> +			data = /incbin/("dra71-evm-lcd-auo-g101evn01.0.dtbo");
>> +			type = "flat_dt";
>> +			arch = "arm";
>> +			compression = "none";
>> +			load = <0x83100000>;
>> +		};
>> +		fdt@3 {
>> +			description = "DRA71x-evm NAND";
>> +			data = /incbin/("dra71-evm-nand.dtbo");
>> +			type = "flat_dt";
>> +			arch = "arm";
>> +			compression = "none";
>> +			load = <0x83200000>;
>> +		};
>> +	};
>> +
>> +	configurations {
>> +		default = "dra71-evm";
>> +		dra71-evm {
>> +			description = "DRA71x-evm";
>> +			kernel = "kernel@1";
>> +			fdt = "fdt@1";
>> +		};
>> +		dra71-evm-lcd-auo-g101evn01.0 {
>> +			description = "DRA71x-evm with LCD overlay";
>> +			kernel = "kernel@1";
>> +			fdt = "fdt@1", "fdt@2";
>> +		};
>> +		dra71-evm-nand {
>> +			description = "DRA71x-evm with NAND overlay";
>> +			kernel = "kernel@1";
>> +			fdt = "fdt@1", "fdt@3";
>> +		};
> 
> This strikes me as really horrid and inflexible.
> 
> Consider a platform where you have multiple choices, each one
> independent - for example, you may have the selection of two base
> DT files depending on the SoC.  Then you may have four board-level
> DT overlays to choose from.  Then you may have a selection of
> overlays depending on what hardware is connected (eg, whether a
> camera is connected and what type of camera, whether a LVDS panel
> is connected and what it is, etc.)
> 
> Before considering the optional hardware, you already have 8
> different combinations, and that multiplies up each time there
> is another variable to consider.
> 
> Exhaustively listing each combination of kernel, base dtb and
> overlays is not practical in such a scenario, and if this is what
> FIT requires, FIT is not fit for purpose.
> 

This specific dra71-evm is rather a poor example, as we have built the 
available configs as separate config entries due to limited amount of them.

In typical setup, you can boot a large number of different configs via:

bootm 0x82000000#dra71-evm#nand#lcd-auo-g101evn01.0

... assuming the configs were named like that, and assuming they would 
be compatible with each other. The am57xx-evm example provided is 
better, as you can chain the different cameras to the available evm configs.

-Tero
--
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
