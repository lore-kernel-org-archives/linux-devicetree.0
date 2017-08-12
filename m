From: icenowy-h8G6r0blFSE@public.gmane.org
Subject: Re: [PATCH v4] arm64: allwinner: a64: Add initial NanoPi A64 support
Date: Sat, 12 Aug 2017 08:06:48 +0800
Message-ID: <d58da4b4b40ce8208882608b29cb271a@aosc.io>
References: <1502454711-8389-1-git-send-email-jteki@openedev.com>
 <CAD6G_RT4TyViJDmbtMaFtqdpMK3c04XvraEB7ACS3_4N6hvY6g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD6G_RT4TyViJDmbtMaFtqdpMK3c04XvraEB7ACS3_4N6hvY6g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

在 2017-08-12 01:42，Jagan Teki 写道：
> On Fri, Aug 11, 2017 at 6:01 PM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 
> wrote:
>> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> 
>> NanoPi A64 is a new board of high performance with low cost
>> designed by FriendlyElec., using the Allwinner A64 SOC.
>> 
>> Nanopi A64 features
>> - Allwinner A64, 64-bit Quad-core Cortex-A53@648MHz to 1.152GHz, DVFS
>> - 1GB DDR3 RAM
>> - MicroSD
>> - Gigabit Ethernet (RTL8211E)
>> - Wi-Fi 802.11b/g/n
>> - IR receiver
>> - Audio In/Out
>> - Video In/Out
>> - Serial Debug Port
>> - microUSB 5V 2A DC power-supply
>> 
>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> ---
>> Changes for v4:
>> - Rebased and droped wi-fi related nodes, since it require
>>   other changes to taken care.
>> Changes for v3:
>> - Fix to use mmc1 for SDIO instead of mmc2
>> - Replace buswidth by 4 instead of 8 mmc1
>> - Drop cap-mmc-hw-reset for mmc1
>> Changes for v2:
>> - Added ohci0, ehci0, ohic1, ehci1, usbphy.
>> - Tested on A64
>> 
>>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>>  .../boot/dts/allwinner/sun50i-a64-nanopi-a64.dts   | 114 
>> +++++++++++++++++++++
>>  2 files changed, 115 insertions(+)
>>  create mode 100644 
>> arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
>> 
>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile 
>> b/arch/arm64/boot/dts/allwinner/Makefile
>> index 108f12c..c997b5c 100644
>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> @@ -1,4 +1,5 @@
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
>> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb 
>> sun50i-a64-pine64.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts 
>> b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
>> new file mode 100644
>> index 0000000..e4c121a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-nanopi-a64.dts
>> @@ -0,0 +1,114 @@
>> +/*
>> + * Copyright (C) 2017 Jagan Teki <jteki-oRp2ZoJdM/RWk0Htik3J/w@public.gmane.org>
>> + *
>> + * This file is dual-licensed: you can use it either under the terms
>> + * of the GPL or the X11 license, at your option. Note that this dual
>> + * licensing only applies to this file, and not this project as a
>> + * whole.
>> + *
>> + *  a) This library is free software; you can redistribute it and/or
>> + *     modify it under the terms of the GNU General Public License as
>> + *     published by the Free Software Foundation; either version 2 of 
>> the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This library is distributed in the hope that it will be 
>> useful,
>> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + *     GNU General Public License for more details.
>> + *
>> + * Or, alternatively,
>> + *
>> + *  b) Permission is hereby granted, free of charge, to any person
>> + *     obtaining a copy of this software and associated documentation
>> + *     files (the "Software"), to deal in the Software without
>> + *     restriction, including without limitation the rights to use,
>> + *     copy, modify, merge, publish, distribute, sublicense, and/or
>> + *     sell copies of the Software, and to permit persons to whom the
>> + *     Software is furnished to do so, subject to the following
>> + *     conditions:
>> + *
>> + *     The above copyright notice and this permission notice shall be
>> + *     included in all copies or substantial portions of the 
>> Software.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY 
>> KIND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE 
>> WARRANTIES
>> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
>> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
>> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
>> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>> + *     OTHER DEALINGS IN THE SOFTWARE.
>> + */
>> +
>> +/dts-v1/;
>> +
>> +#include "sun50i-a64.dtsi"
>> +
>> +#include <dt-bindings/gpio/gpio.h>
>> +
>> +/ {
>> +       model = "FriendlyARM NanoPi A64";
>> +       compatible = "friendlyarm,nanopi-a64", "allwinner,sun50i-a64";
>> +
>> +       aliases {
>> +               serial0 = &uart0;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = "serial0:115200n8";
>> +       };
>> +
>> +       reg_vcc3v3: vcc3v3 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc3v3";
>> +               regulator-min-microvolt = <3300000>;
>> +               regulator-max-microvolt = <3300000>;
>> +       };
> 
> Able to build the RSB with CONFIG_SUNXI_RSB and CONFIG_MFD_AXP20X_RSB
> and when I replace the above regulator with axp308 dcdc1 for mmc the
> SD card is not detecting and the same issue with pine64 as well.

For MFD devices, you need not only the MFD driver, but also drivers for
MFD cells.

For AXP803 currently PEK and regulator cells are supported. The PEK
driver is CONFIG_INPUT_AXP20X_PEK and the regulator driver is
CONFIG_REGULATOR_AXP20X.

I think you missed the CONFIG_REGULATOR_AXP20X driver.

> 
> [    0.315257] sunxi-rsb 1f03400.rsb: RSB running at 3000000 Hz
> [    0.315680] axp20x-rsb sunxi-rsb-3a3: AXP20x variant AXP803 found
> [    0.317782] axp20x-rsb sunxi-rsb-3a3: AXP20X driver loaded
> 
> thanks!
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
