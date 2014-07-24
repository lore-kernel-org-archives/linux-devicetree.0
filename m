From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2 6/7] ARM: dts: rockchip: add core rk3288 dtsi
Date: Thu, 24 Jul 2014 16:06:34 -0700
Message-ID: <CAD=FV=X9Ym_1-mweR2fBNwPhfbMVUu+EKO+qsY=te+=-pUDhcw@mail.gmail.com>
References: <4868343.UFgjaXesOn@diego>
	<14646641.DlFrJR068n@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <14646641.DlFrJR068n@diego>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Eddie Cai <eddie.cai-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Heiko,

On Thu, Jul 17, 2014 at 5:21 PM, Heiko St=C3=BCbner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> w=
rote:
> Node definitions shared by all rk3288 based boards.
>
> Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> Tested-by: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/boot/dts/rk3288.dtsi | 552 ++++++++++++++++++++++++++++++++=
++++++++++
>  1 file changed, 552 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3288.dtsi

I'm not opposed to landing an spinning, but comments below.


> diff --git a/arch/arm/boot/dts/rk3288.dtsi b/arch/arm/boot/dts/rk3288=
=2Edtsi
> new file mode 100644
> index 0000000..c8e387e
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288.dtsi
> @@ -0,0 +1,552 @@
> +/*
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/clock/rk3288-cru.h>
> +#include "skeleton.dtsi"
> +
> +/ {
> +       compatible =3D "rockchip,rk3288";
> +
> +       interrupt-parent =3D <&gic>;
> +
> +       aliases {
> +               serial0 =3D &uart0;
> +               serial1 =3D &uart1;
> +               serial2 =3D &uart2;
> +               serial3 =3D &uart3;
> +               serial4 =3D &uart4;
> +               i2c0 =3D &i2c0;
> +               i2c1 =3D &i2c1;
> +               i2c2 =3D &i2c2;
> +               i2c3 =3D &i2c3;
> +               i2c4 =3D &i2c4;
> +               i2c5 =3D &i2c5;

Slight nit: alphabetize the aliases?


> +       };
> +
> +       cpus {
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               cpu@500 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a12";
> +                       reg =3D <0x500>;
> +               };
> +               cpu@501 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a12";
> +                       reg =3D <0x501>;
> +               };
> +               cpu@502 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a12";
> +                       reg =3D <0x502>;
> +               };
> +               cpu@503 {
> +                       device_type =3D "cpu";
> +                       compatible =3D "arm,cortex-a12";
> +                       reg =3D <0x503>;
> +               };
> +       };
> +
> +       xin24m: xin24m {
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <24000000>;
> +               #clock-cells =3D <0>;
> +       };

I'm no expert, but strangely every other .dts seems to have the clocks
under a "clocks" node.  That seems to contradict the suggestion made
previously that things should not be on the top level, though.

Also, _I think_ device tree suggests a more generic name for the node
like "oscillator".  You could use "xin24m" as an output name, I think.
Mike could correct me if I'm wrong.


> +       timer {
> +               compatible =3D "arm,armv7-timer";
> +               interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | =
IRQ_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IR=
Q_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IR=
Q_TYPE_LEVEL_HIGH)>,
> +                            <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IR=
Q_TYPE_LEVEL_HIGH)>;
> +               clock-frequency =3D <24000000>;
> +       };
> +
> +       i2c1: i2c@ff140000 {
> +               compatible =3D "rockchip,rk3288-i2c";
> +               reg =3D <0xff140000 0x1000>;
> +               interrupts =3D <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               clock-names =3D "i2c";
> +               clocks =3D <&cru PCLK_I2C1>;
> +               status =3D "disabled";
> +       };
> +
> +       i2c3: i2c@ff150000 {
> +               compatible =3D "rockchip,rk3288-i2c";
> +               reg =3D <0xff150000 0x1000>;
> +               interrupts =3D <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               clock-names =3D "i2c";
> +               clocks =3D <&cru PCLK_I2C3>;
> +               status =3D "disabled";
> +       };
> +
> +       i2c4: i2c@ff160000 {
> +               compatible =3D "rockchip,rk3288-i2c";
> +               reg =3D <0xff160000 0x1000>;
> +               interrupts =3D <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               clock-names =3D "i2c";
> +               clocks =3D <&cru PCLK_I2C4>;
> +               status =3D "disabled";
> +       };
> +
> +       i2c5: i2c@ff170000 {
> +               compatible =3D "rockchip,rk3288-i2c";
> +               reg =3D <0xff170000 0x1000>;
> +               interrupts =3D <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               clock-names =3D "i2c";
> +               clocks =3D <&cru PCLK_I2C5>;
> +               status =3D "disabled";
> +       };
> +
> +       uart0: serial@ff180000 {
> +               compatible =3D "rockchip,rk3288-uart", "snps,dw-apb-u=
art";
> +               reg =3D <0xff180000 0x100>;
> +               interrupts =3D <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift =3D <2>;
> +               reg-io-width =3D <4>;
> +               clocks =3D <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +               clock-names =3D "baudclk", "apb_pclk";
> +               status =3D "disabled";
> +       };
> +
> +       uart1: serial@ff190000 {
> +               compatible =3D "rockchip,rk3288-uart", "snps,dw-apb-u=
art";
> +               reg =3D <0xff190000 0x100>;
> +               interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift =3D <2>;
> +               reg-io-width =3D <4>;
> +               clocks =3D <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +               clock-names =3D "baudclk", "apb_pclk";
> +               status =3D "disabled";
> +       };
> +
> +       uart2: serial@ff690000 {
> +               compatible =3D "rockchip,rk3288-uart", "snps,dw-apb-u=
art";
> +               reg =3D <0xff690000 0x100>;
> +               interrupts =3D <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift =3D <2>;
> +               reg-io-width =3D <4>;
> +               clocks =3D <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +               clock-names =3D "baudclk", "apb_pclk";
> +               status =3D "disabled";
> +       };
> +
> +       uart3: serial@ff1b0000 {
> +               compatible =3D "rockchip,rk3288-uart", "snps,dw-apb-u=
art";
> +               reg =3D <0xff1b0000 0x100>;
> +               interrupts =3D <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift =3D <2>;
> +               reg-io-width =3D <4>;
> +               clocks =3D <&cru SCLK_UART3>, <&cru PCLK_UART3>;
> +               clock-names =3D "baudclk", "apb_pclk";
> +               status =3D "disabled";
> +       };
> +
> +       uart4: serial@ff1c0000 {
> +               compatible =3D "rockchip,rk3288-uart", "snps,dw-apb-u=
art";
> +               reg =3D <0xff1c0000 0x100>;
> +               interrupts =3D <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +               reg-shift =3D <2>;
> +               reg-io-width =3D <4>;
> +               clocks =3D <&cru SCLK_UART4>, <&cru PCLK_UART4>;
> +               clock-names =3D "baudclk", "apb_pclk";
> +               status =3D "disabled";
> +       };
> +
> +       i2c0: i2c@ff650000 {
> +               compatible =3D "rockchip,rk3288-i2c";
> +               reg =3D <0xff650000 0x1000>;
> +               interrupts =3D <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               clock-names =3D "i2c";
> +               clocks =3D <&cru PCLK_I2C0>;
> +               status =3D "disabled";
> +       };
> +
> +       i2c2: i2c@ff660000 {
> +               compatible =3D "rockchip,rk3288-i2c";
> +               reg =3D <0xff660000 0x1000>;
> +               interrupts =3D <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +               clock-names =3D "i2c";
> +               clocks =3D <&cru PCLK_I2C2>;
> +               status =3D "disabled";
> +       };
> +
> +       pmu: power-management@ff730000 {
> +               compatible =3D "rockchip,rk3288-pmu", "syscon";
> +               reg =3D <0xff730000 0x100>;
> +       };
> +
> +       sgrf: syscon@ff740000 {
> +               compatible =3D "rockchip,rk3288-sgrf", "syscon";
> +               reg =3D <0xff740000 0x1000>;
> +       };
> +
> +       cru: clock-controller@ff760000 {
> +               compatible =3D "rockchip,rk3288-cru";
> +               reg =3D <0xff760000 0x1000>;
> +               rockchip,grf =3D <&grf>;
> +               #clock-cells =3D <1>;
> +               #reset-cells =3D <1>;
> +       };
> +
> +       grf: syscon@ff770000 {
> +               compatible =3D "rockchip,rk3288-grf", "syscon";
> +               reg =3D <0xff770000 0x1000>;
> +       };
> +
> +       watchdog@ff800000 {

Could you add an alias to make it easier for boards to reference this
and enable it?


> +               compatible =3D "rockchip,rk3288-wdt", "snps,dw-wdt";
> +               reg =3D <0xff800000 0x100>;
> +               interrupts =3D <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
> +               status =3D "disabled";
> +       };
> +
> +       gic: interrupt-controller@ffc01000 {
> +               compatible =3D "arm,gic-400";
> +               interrupt-controller;
> +               #interrupt-cells =3D <3>;
> +               #address-cells =3D <0>;
> +
> +               reg =3D <0xffc01000 0x1000>,
> +                     <0xffc02000 0x1000>,
> +                     <0xffc04000 0x2000>,
> +                     <0xffc06000 0x2000>;
> +               interrupts =3D <GIC_PPI 9 0xf04>;
> +       };
> +
> +       pinctrl: pinctrl {
> +               compatible =3D "rockchip,rk3288-pinctrl";
> +               rockchip,grf =3D <&grf>;
> +               rockchip,pmu =3D <&pmu>;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               ranges;
> +
> +               gpio0: gpio0@ff750000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D   <0xff750000 0x100>;
> +                       interrupts =3D <GIC_SPI 81 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO0>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio1: gpio1@ff780000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff780000 0x100>;
> +                       interrupts =3D <GIC_SPI 82 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO1>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio2: gpio2@ff790000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff790000 0x100>;
> +                       interrupts =3D <GIC_SPI 83 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO2>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio3: gpio3@ff7a0000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff7a0000 0x100>;
> +                       interrupts =3D <GIC_SPI 84 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO3>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio4: gpio4@ff7b0000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff7b0000 0x100>;
> +                       interrupts =3D <GIC_SPI 85 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO4>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio5: gpio5@ff7c0000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff7c0000 0x100>;
> +                       interrupts =3D <GIC_SPI 86 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO5>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio6: gpio6@ff7d0000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff7d0000 0x100>;
> +                       interrupts =3D <GIC_SPI 87 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO6>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio7: gpio7@ff7e0000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff7e0000 0x100>;
> +                       interrupts =3D <GIC_SPI 88 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO7>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               gpio8: gpio8@ff7f0000 {
> +                       compatible =3D "rockchip,gpio-bank";
> +                       reg =3D <0xff7f0000 0x100>;
> +                       interrupts =3D <GIC_SPI 89 IRQ_TYPE_LEVEL_HIG=
H>;
> +                       clocks =3D <&cru PCLK_GPIO8>;
> +
> +                       gpio-controller;
> +                       #gpio-cells =3D <2>;
> +
> +                       interrupt-controller;
> +                       #interrupt-cells =3D <2>;
> +               };
> +
> +               pcfg_pull_up: pcfg_pull_up {

I think underscores in node names is discouraged.  Should be:
  pcfg_pull_up: pcfg-pull-up {
=2E..same for others


> +                       bias-pull-up;
> +               };
> +
> +               pcfg_pull_down: pcfg_pull_down {
> +                       bias-pull-down;
> +               };
> +
> +               pcfg_pull_none: pcfg_pull_none {
> +                       bias-disable;
> +               };
> +
> +               i2c0 {
> +                       i2c0_xfer: i2c0-xfer {
> +                               rockchip,pins =3D <0 15 RK_FUNC_1 &pc=
fg_pull_none>,
> +                                               <0 16 RK_FUNC_1 &pcfg=
_pull_none>;
> +                       };
> +               };
> +
> +               i2c1 {
> +                       i2c1_xfer: i2c1-xfer {
> +                               rockchip,pins =3D <8 4 RK_FUNC_1 &pcf=
g_pull_none>,
> +                                               <8 5 RK_FUNC_1 &pcfg_=
pull_none>;
> +                       };
> +               };
> +
> +               i2c2 {
> +                       i2c2_xfer: i2c2-xfer {
> +                               rockchip,pins =3D <6 9 RK_FUNC_1 &pcf=
g_pull_none>,
> +                                               <6 10 RK_FUNC_1 &pcfg=
_pull_none>;
> +                       };
> +               };
> +
> +               i2c3 {
> +                       i2c3_xfer: i2c3-xfer {
> +                               rockchip,pins =3D <2 16 RK_FUNC_1 &pc=
fg_pull_none>,
> +                                               <2 17 RK_FUNC_1 &pcfg=
_pull_none>;
> +                       };
> +               };
> +
> +               i2c4 {
> +                       i2c4_xfer: i2c4-xfer {
> +                               rockchip,pins =3D <7 17 RK_FUNC_1 &pc=
fg_pull_none>,
> +                                               <7 18 RK_FUNC_1 &pcfg=
_pull_none>;
> +                       };
> +               };
> +
> +               i2c5 {
> +                       i2c5_xfer: i2c5-xfer {
> +                               rockchip,pins =3D <7 19 RK_FUNC_1 &pc=
fg_pull_none>,
> +                                               <7 20 RK_FUNC_1 &pcfg=
_pull_none>;
> +                       };
> +               };
> +
> +               sdmmc {
> +                       sdmmc_clk: sdmmc-clk {
> +                               rockchip,pins =3D <6 20 RK_FUNC_1 &pc=
fg_pull_none>;
> +                       };
> +
> +                       sdmmc_cmd: sdmmc-cmd {
> +                               rockchip,pins =3D <6 21 RK_FUNC_1 &pc=
fg_pull_up>;
> +                       };
> +
> +                       sdmmc_cd: sdmcc-cd {
> +                               rockchip,pins =3D <6 22 RK_FUNC_1 &pc=
fg_pull_up>;
> +                       };
> +
> +                       sdmmc_bus1: sdmmc-bus1 {
> +                               rockchip,pins =3D <6 16 RK_FUNC_1 &pc=
fg_pull_up>;
> +                       };
> +
> +                       sdmmc_bus4: sdmmc-bus4 {
> +                               rockchip,pins =3D <6 16 RK_FUNC_1 &pc=
fg_pull_up>,
> +                                               <6 17 RK_FUNC_1 &pcfg=
_pull_up>,
> +                                               <6 18 RK_FUNC_1 &pcfg=
_pull_up>,
> +                                               <6 19 RK_FUNC_1 &pcfg=
_pull_up>;
> +                       };
> +               };
> +
> +               emmc {
> +                       emmc_clk: emmc-clk {
> +                               rockchip,pins =3D <3 18 RK_FUNC_2 &pc=
fg_pull_none>;
> +                       };
> +
> +                       emmc_cmd: emmc-cmd {
> +                               rockchip,pins =3D <3 16 RK_FUNC_2 &pc=
fg_pull_up>;
> +                       };
> +
> +                       emmc_pwr: emmc-pwr {
> +                               rockchip,pins =3D <3 9 RK_FUNC_2 &pcf=
g_pull_up>;
> +                       };
> +
> +                       emmc_bus1: emmc-bus1 {
> +                               rockchip,pins =3D <3 0 RK_FUNC_2 &pcf=
g_pull_up>;
> +                       };
> +
> +                       emmc_bus4: emmc-bus4 {
> +                               rockchip,pins =3D <3 0 RK_FUNC_2 &pcf=
g_pull_up>,
> +                                               <3 1 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 2 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 3 RK_FUNC_2 &pcfg_=
pull_up>;
> +                       };
> +
> +                       emmc_bus8: emmc-bus8 {
> +                               rockchip,pins =3D <3 0 RK_FUNC_2 &pcf=
g_pull_up>,
> +                                               <3 1 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 2 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 3 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 4 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 5 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 6 RK_FUNC_2 &pcfg_=
pull_up>,
> +                                               <3 7 RK_FUNC_2 &pcfg_=
pull_up>;
> +                       };
> +               };
> +
> +               uart0 {
> +                       uart0_xfer: uart0-xfer {
> +                               rockchip,pins =3D <4 16 RK_FUNC_1 &pc=
fg_pull_up>,
> +                                               <4 17 RK_FUNC_1 &pcfg=
_pull_none>;
> +                       };
> +
> +                       uart0_cts: uart0-cts {
> +                               rockchip,pins =3D <4 18 RK_FUNC_1 &pc=
fg_pull_none>;
> +                       };
> +
> +                       uart0_rts: uart0-rts {
> +                               rockchip,pins =3D <4 19 RK_FUNC_1 &pc=
fg_pull_none>;
> +                       };
> +               };
> +
> +               uart1 {
> +                       uart1_xfer: uart1-xfer {
> +                               rockchip,pins =3D <5 8 RK_FUNC_1 &pcf=
g_pull_up>,
> +                                               <5 9 RK_FUNC_1 &pcfg_=
pull_none>;
> +                       };
> +
> +                       uart1_cts: uart1-cts {
> +                               rockchip,pins =3D <5 10 RK_FUNC_1 &pc=
fg_pull_none>;
> +                       };
> +
> +                       uart1_rts: uart1-rts {
> +                               rockchip,pins =3D <5 11 RK_FUNC_1 &pc=
fg_pull_none>;
> +                       };
> +               };
> +
> +               uart2 {
> +                       uart2_xfer: uart2-xfer {
> +                               rockchip,pins =3D <7 22 RK_FUNC_1 &pc=
fg_pull_up>,
> +                                               <7 23 RK_FUNC_1 &pcfg=
_pull_none>;
> +                       };
> +                       /* no rts / cts for uart2 */
> +               };
> +
> +               uart3 {
> +                       uart3_xfer: uart3-xfer {
> +                               rockchip,pins =3D <7 7 RK_FUNC_1 &pcf=
g_pull_up>,
> +                                               <7 8 RK_FUNC_1 &pcfg_=
pull_none>;
> +                       };
> +
> +                       uart3_cts: uart3-cts {
> +                               rockchip,pins =3D <7 9 RK_FUNC_1 &pcf=
g_pull_none>;
> +                       };
> +
> +                       uart3_rts: uart3-rts {
> +                               rockchip,pins =3D <7 10 RK_FUNC_1 &pc=
fg_pull_none>;
> +                       };
> +               };
> +
> +               uart4 {
> +                       uart4_xfer: uart4-xfer {
> +                               rockchip,pins =3D <5 12 3 &pcfg_pull_=
up>,
> +                                               <5 13 3 &pcfg_pull_no=
ne>;
> +                       };
> +
> +                       uart4_cts: uart4-cts {
> +                               rockchip,pins =3D <5 14 3 &pcfg_pull_=
none>;
> +                       };
> +
> +                       uart4_rts: uart4-rts {
> +                               rockchip,pins =3D <5 15 3 &pcfg_pull_=
none>;
> +                       };
> +               };
> +       };
> +};

Tested-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

=2E..as I'm not personally opposed to landing and then spinning for the
above changes:

Reviewed-by: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Note that I didn't double-check every last pin and number for you, but
the overall structure looks good to me.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
