From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: dts: sun8i: Add board dts file for Banana Pi M2 Ultra
Date: Wed, 23 Aug 2017 08:58:24 +0800
Message-ID: <56568491-37A8-4ACE-BABB-43C320D54ABC@aosc.io>
References: <20170822061742.40869-1-icenowy@aosc.io> <20170822061742.40869-2-icenowy@aosc.io> <20170822201043.vdweyevkxvjbzrwt@flea.home>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170822201043.vdweyevkxvjbzrwt-YififvaboMKzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org



于 2017年8月23日 GMT+08:00 上午4:10:43, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> 写到:
>Hi,
>
>On Tue, Aug 22, 2017 at 02:17:41PM +0800, Icenowy Zheng wrote:
>> From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> 
>> The Banana Pi M2 Ultra is an SBC based on the Allwinner R40 SoC. The
>> form factor and position of various connectors, leds and buttons is
>> similar to the Banana Pi M1+, Banana Pi M3, and is exactly the same
>> as the latest Banana Pi M64.
>> 
>> It features:
>> 
>>   - X-Powers AXP221s PMIC connected to i2c0
>>   - 2 GB DDR3 DRAM
>>   - 8 GB eMMC
>>   - micro SD card slot
>>   - DC power jack
>>   - HDMI output
>>   - MIPI DSI connector
>>   - 2x USB 2.0 hosts
>>   - 1x USB 2.0 OTG
>>   - gigabit ethernet with Realtek RTL8211E transceiver
>>   - WiFi/Bluetooth with AP6212 chip, with external antenna connector
>>   - SATA and power connectors for native SATA support
>>   - camera sensor connector
>>   - consumer IR receiver
>>   - audio out headphone jack
>>   - onboard microphone
>>   - red, green, and blue LEDs
>>   - debug UART pins
>>   - Li-Po battery connector
>>   - Raspberry Pi B+ compatible GPIO header
>>   - power, reset, and boot control buttons
>> 
>> This patch adds a dts file that enables UART, MMC and PMIC support.
>> 
>> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/Makefile                        |   1 +
>>  arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts | 181
>++++++++++++++++++++++
>>  2 files changed, 182 insertions(+)
>>  create mode 100644 arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> 
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 570e107bf702..e0b1ed3e2e24 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -927,6 +927,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
>>  	sun8i-h3-orangepi-plus2e.dtb \
>>  	sun8i-r16-bananapi-m2m.dtb \
>>  	sun8i-r16-parrot.dtb \
>> +	sun8i-r40-bananapi-m2-ultra.dtb \
>>  	sun8i-v3s-licheepi-zero.dtb \
>>  	sun8i-v3s-licheepi-zero-dock.dtb
>>  dtb-$(CONFIG_MACH_SUN9I) += \
>> diff --git a/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> new file mode 100644
>> index 000000000000..daf55556036f
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/sun8i-r40-bananapi-m2-ultra.dts
>> @@ -0,0 +1,181 @@
>> +/*
>> + * Copyright (C) 2017 Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
>> + * Copyright (C) 2017 Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>> + *
>> + * This file is dual-licensed: you can use it either under the terms
>> + * of the GPL or the X11 license, at your option. Note that this
>dual
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This file is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License
>as
>> + *     published by the Free Software Foundation; either version 2
>of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This file is distributed in the hope that it will be useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty
>of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated
>documentation
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom
>the
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall
>be
>> + *     included in all copies or substantial portions of the
>Software.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
>KIND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
>WARRANTIES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +#include "sun8i-r40.dtsi"
>> +#include "sunxi-common-regulators.dtsi"
>> +
>> +/ {
>> +	model = "Banana Pi BPI-M2-Ultra";
>> +	compatible = "sinovoip,bpi-m2-ultra", "allwinner,sun8i-r40";
>> +
>> +	aliases {
>> +		serial0 = &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path = "serial0:115200n8";
>> +	};
>
>Missing newline
>
>> +	leds {
>> +		compatible = "gpio-leds";
>> +
>> +		pwr-led {
>> +			label = "bananapi:red:pwr";
>> +			gpios = <&pio 7 20 GPIO_ACTIVE_HIGH>;
>> +			default-state = "on";
>> +		};
>> +
>> +		user-led-green {
>> +			label = "bananapi:green:user";
>> +			gpios = <&pio 7 21 GPIO_ACTIVE_HIGH>;
>> +		};
>> +
>> +		user-led-blue {
>> +			label = "bananapi:blue:user";
>> +			gpios = <&pio 7 22 GPIO_ACTIVE_HIGH>;
>> +		};
>> +	};
>> +
>> +	wifi_pwrseq: wifi_pwrseq {
>> +		compatible = "mmc-pwrseq-simple";
>> +		reset-gpios = <&pio 6 10 GPIO_ACTIVE_LOW>; /* PG10 WIFI_EN */
>> +	};
>> +};
>> +
>> +&i2c0 {
>> +	status = "okay";
>> +
>> +	axp22x: pmic@34 {
>> +		compatible = "x-powers,axp221";
>> +		reg = <0x34>;
>> +		interrupt-parent = <&nmi_intc>;
>> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>> +	};
>> +};
>> +
>> +#include "axp22x.dtsi"
>> +
>> +&reg_aldo3 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt = <2700000>;
>> +	regulator-max-microvolt = <3300000>;
>> +	regulator-name = "avcc";
>> +};
>> +
>> +&reg_dcdc1 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt = <3000000>;
>> +	regulator-max-microvolt = <3000000>;
>> +	regulator-name = "vcc-3v0";
>> +};
>> +
>> +&reg_dcdc2 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt = <1000000>;
>> +	regulator-max-microvolt = <1300000>;
>> +	regulator-name = "vdd-cpu";
>> +};
>> +
>> +&reg_dcdc3 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt = <1000000>;
>> +	regulator-max-microvolt = <1300000>;
>> +	regulator-name = "vdd-sys";
>> +};
>> +
>> +&reg_dcdc5 {
>> +	regulator-always-on;
>> +	regulator-min-microvolt = <1500000>;
>> +	regulator-max-microvolt = <1500000>;
>> +	regulator-name = "vcc-dram";
>> +};
>> +
>> +&reg_dldo1 {
>> +	regulator-min-microvolt = <1800000>;
>> +	regulator-max-microvolt = <3300000>;
>> +	regulator-name = "vcc-wifi-io";
>> +};
>> +
>> +&reg_dldo2 {
>> +	regulator-min-microvolt = <3300000>;
>> +	regulator-max-microvolt = <3300000>;
>> +	regulator-name = "vcc-wifi";
>> +};
>> +
>> +&reg_vcc5v0 {
>> +	gpio = <&pio 7 23 GPIO_ACTIVE_HIGH>; /* PH23 */
>> +	enable-active-high;
>> +};
>
>That regulator is unused, and the GPIO is marked to be unused on the
>schematics.

It's a change in newer revision board.

I got this infomation directly from BPi people, not from schematics.

>
>> +&mmc0 {
>> +	vmmc-supply = <&reg_dcdc1>;
>> +	bus-width = <4>;
>> +	cd-gpios = <&pio 7 13 GPIO_ACTIVE_HIGH>; /* PH13 */
>> +	cd-inverted;
>> +	status = "okay";
>> +};
>> +
>> +&mmc1 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc1_pg_pins>;
>> +	vmmc-supply = <&reg_dldo2>;
>> +	vqmmc-supply = <&reg_dldo1>;
>> +	mmc-pwrseq = <&wifi_pwrseq>;
>> +	bus-width = <4>;
>> +	non-removable;
>> +	status = "okay";
>> +};
>> +
>> +&mmc2 {
>> +	vmmc-supply = <&reg_dcdc1>;
>> +	vqmmc-supply = <&reg_dcdc1>;
>
>You don't need vqmmc here.
>
>Maxime
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
