From: Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] arm64: allwinner: a64: Add A64-OLinuXino
 initial support
Date: Mon, 14 Aug 2017 13:04:54 +0530
Message-ID: <CAD6G_RRMHMrm1wPGJCxQgmOuwhEqVK_zTZF1Fsv9az4tZ1uvBg@mail.gmail.com>
References: <1502560442-17715-1-git-send-email-jteki@openedev.com> <CAGb2v66Scd69iBNxhvYbkqjt7K_5m+S4nYG633O3wYAW_3CyLQ@mail.gmail.com>
Reply-To: jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCV4FV5N34IRBH5FYXGAKGQEUZ3Q5JI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66Scd69iBNxhvYbkqjt7K_5m+S4nYG633O3wYAW_3CyLQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Michael Trimarchi <michael-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>, Support - OLIMEX Ltd <support-kyXcfZUBQGPQT0dZR+AlfA@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Aug 14, 2017 at 12:38 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> Hi,
>
> On Sun, Aug 13, 2017 at 1:54 AM, Jagan Teki <jagannadh.teki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> From: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>>
>> OLimex A64-OLinuXino is an open-source hardware board
>> using the Allwinner A64 SOC.
>>
>> OLimex A64-OLinuXino has
>> - A64 Quad-core Cortex-A53 64bit
>> - 1GB or 2GB RAM DDR3L @ 672Mhz
>> - microSD slot and 4/8/16GB eMMC
>> - Debug TTL UART
>> - HDMI
>> - LCD
>> - IR receiver
>> - 5V DC power supply
>
> Have you tried out Ethernet?

Not, tested yet. Will send separate patch.

>
>>
>> Signed-off-by: Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
>> ---
>> Changes for v2:
>> - Tested on board
>> - Added AXP803 regulator
>>
>>  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
>>  .../boot/dts/allwinner/sun50i-a64-olinuxino.dts    | 221 +++++++++++++++++++++
>>  2 files changed, 222 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
>>
>> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
>> index c997b5c..19c3fbd 100644
>> --- a/arch/arm64/boot/dts/allwinner/Makefile
>> +++ b/arch/arm64/boot/dts/allwinner/Makefile
>> @@ -1,5 +1,6 @@
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-bananapi-m64.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-nanopi-a64.dtb
>> +dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-olinuxino.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-orangepi-win.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-pine64-plus.dtb sun50i-a64-pine64.dtb
>>  dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
>> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
>> new file mode 100644
>> index 0000000..0b9e742
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-olinuxino.dts
>> @@ -0,0 +1,221 @@
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
>> + *     published by the Free Software Foundation; either version 2 of the
>> + *     License, or (at your option) any later version.
>> + *
>> + *     This library is distributed in the hope that it will be useful,
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
>> + *     included in all copies or substantial portions of the Software.
>> + *
>> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
>> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
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
>> +       model = "Olimex A64-Olinuxino";
>> +       compatible = "olimex,a64-olinuxino", "allwinner,sun50i-a64";
>> +
>> +       aliases {
>> +               serial0 = &uart0;
>> +       };
>> +
>> +       chosen {
>> +               stdout-path = "serial0:115200n8";
>> +       };
>> +
>> +       reg_vcc1v8: vcc1v8 {
>> +               compatible = "regulator-fixed";
>> +               regulator-name = "vcc1v8";
>> +               regulator-min-microvolt = <1800000>;
>> +               regulator-max-microvolt = <1800000>;
>> +       };
>> +};
>> +
>> +&i2c1 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&i2c1_pins>;
>> +       status = "okay";
>
> Please add a note saying what this is for. There should be a good reason
> to enable a non or only semi discoverable bus.
>
>> +};
>> +
>> +&i2c1_pins {
>> +       bias-pull-up;
>> +};
>> +
>> +&mmc0 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&mmc0_pins>;
>> +       vmmc-supply = <&reg_dcdc1>;
>> +       cd-gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>;
>> +       cd-inverted;
>> +       disable-wp;
>> +       bus-width = <4>;
>> +       status = "okay";
>> +};
>> +
>> +&r_rsb {
>> +       status = "okay";
>> +
>> +       axp803: pmic@3a3 {
>> +               compatible = "x-powers,axp803";
>> +               reg = <0x3a3>;
>> +               interrupt-parent = <&r_intc>;
>> +               interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
>> +       };
>> +};
>> +
>> +&uart0 {
>> +       pinctrl-names = "default";
>> +       pinctrl-0 = <&uart0_pins_a>;
>> +       status = "okay";
>> +};
>> +
>> +#include "axp803.dtsi"
>> +
>> +&reg_aldo1 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <2800000>;
>> +       regulator-max-microvolt = <2800000>;
>> +       regulator-name = "vcc-pe";
>> +};
>> +
>> +&reg_aldo2 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <3300000>;
>> +       regulator-max-microvolt = <3300000>;
>
> Schematic says 1.8V?

I saw ALD02 VCC-PL=3.3v on schematic.

>
>> +       regulator-name = "vcc-pl";
>> +};
>> +
>> +&reg_aldo3 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <3000000>;
>> +       regulator-max-microvolt = <3000000>;
>> +       regulator-name = "vcc-pll-avcc";
>> +};
>> +
>> +&reg_dcdc1 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <3300000>;
>> +       regulator-max-microvolt = <3300000>;
>> +       regulator-name = "vcc-3v3";
>> +};
>> +
>> +&reg_dcdc2 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <1100000>;
>> +       regulator-max-microvolt = <1100000>;
>
> The SoC has a wider range than a fixed voltage for the CPUs.

So, max 1.1v can't enough CPUs? thought similar behavior with pine64?

>
>> +       regulator-name = "vddfb-cpux";
>> +};
>> +
>> +&reg_dcdc3 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <1100000>;
>> +       regulator-max-microvolt = <1100000>;
>> +       regulator-name = "vddfb-cpuxx";
>> +};
>
> It looks like DCDC3 is tied to DCDC2 in poly-phase mode? Please check.

Yes, will chage

>
>> +
>> +&reg_dcdc5 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <1500000>;
>> +       regulator-max-microvolt = <1500000>;
>> +       regulator-name = "vcc-ddr3";
>> +};
>> +
>> +&reg_dcdc6 {
>> +       regulator-always-on;
>> +       regulator-min-microvolt = <1100000>;
>> +       regulator-max-microvolt = <1100000>;
>> +       regulator-name = "vdd-sys";
>> +};
>> +
>> +&reg_dldo1 {
>> +       regulator-min-microvolt = <3300000>;
>> +       regulator-max-microvolt = <3300000>;
>> +       regulator-name = "vcc-hdmi";
>> +};
>> +
>> +&reg_dldo2 {
>> +       regulator-min-microvolt = <3300000>;
>> +       regulator-max-microvolt = <3300000>;
>> +       regulator-name = "vcc-mipi";
>> +};
>> +
>> +&reg_dldo3 {
>> +       regulator-min-microvolt = <2800000>;
>> +       regulator-max-microvolt = <2800000>;
>> +       regulator-name = "vcc-avdd-csi";
>> +};
>> +
>> +&reg_dldo4 {
>> +       regulator-min-microvolt = <3300000>;
>> +       regulator-max-microvolt = <3300000>;
>> +       regulator-name = "vcc-wifiio";
>
> "wifi-io" is more readable.

OK

thanks!
-- 
Jagan Teki
Free Software Engineer | www.openedev.com
U-Boot, Linux | Upstream Maintainer
Hyderabad, India.
