From: Jacob Chen <jacobchen110-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: dts: rockchip: Add support for phyCORE-RK3288 SoM
Date: Tue, 18 Apr 2017 18:15:14 +0800
Message-ID: <CAFLEztSQ1-WU7KAXzuB66htXiaQN4wd=XmM5XtjZcoONt77XmQ@mail.gmail.com>
References: <1491483866-18368-1-git-send-email-w.egorov@phytec.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1491483866-18368-1-git-send-email-w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi wadim,

2017-04-06 21:04 GMT+08:00 Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>:
> The phyCORE-RK3288 is a SoM (System on Module) containing a RK3288 SoC.
> The module can be connected to different carrier boards.
> It can be also equipped with different RAM, SPI flash and eMMC variants.
> The Rapid Development Kit option is using the following setup:
>
>   - 1 GB DDR3 RAM (2 Banks)
>   - 1x 4 KB EEPROM
>   - DP83867 Gigabit Ethernet PHY
>   - 16 MB SPI Flash
>   - 4 GB eMMC Flash
>
> Signed-off-by: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> ---
> Changes in v2:
> - Added a dual license which is used for all rk3288 based boards.
>
> Include minor changes from Heiko St=C3=BCbner:
> - moved phy-handle property up a bit
> - switches compatible and #address+#size-cells in mdio0
> - dropped rockchip,grf from &io_domains (grf is a simple-mfd and can
>   get the grf syscon on its own via its parent)
> - vdd_cpu: regulator@60 (from fan53555@60)
> - serial_flash: flash@0 (from m25p80@0)
>   Nodes should be named after their "category" not the actual device
>
> ---
>  arch/arm/boot/dts/rk3288-phycore-som.dtsi | 497 ++++++++++++++++++++++++=
++++++
>  1 file changed, 497 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rk3288-phycore-som.dtsi
>
> diff --git a/arch/arm/boot/dts/rk3288-phycore-som.dtsi b/arch/arm/boot/dt=
s/rk3288-phycore-som.dtsi
> new file mode 100644
> index 0000000..26cd3ad
> --- /dev/null
> +++ b/arch/arm/boot/dts/rk3288-phycore-som.dtsi
> @@ -0,0 +1,497 @@
> +/*
> + * Device tree file for Phytec phyCORE-RK3288 SoM
> + * Copyright (C) 2017 PHYTEC Messtechnik GmbH
> + * Author: Wadim Egorov <w.egorov-guT5V/WYfQezQB+pC5nmwQ@public.gmane.org>
> + *
> + * This file is dual-licensed: you can use it either under the terms
> + * of the GPL or the X11 license, at your option. Note that this dual
> + * licensing only applies to this file, and not this project as a
> + * whole.
> + *
> + *  a) This file is free software; you can redistribute it and/or
> + *     modify it under the terms of the GNU General Public License as
> + *     published by the Free Software Foundation; either version 2 of th=
e
> + *     License, or (at your option) any later version.
> + *
> + *     This file is distributed in the hope that it will be useful,
> + *     but WITHOUT ANY WARRANTY; without even the implied warranty of
> + *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + *     GNU General Public License for more details.
> + *
> + * Or, alternatively,
> + *
> + *  b) Permission is hereby granted, free of charge, to any person
> + *     obtaining a copy of this software and associated documentation
> + *     files (the "Software"), to deal in the Software without
> + *     restriction, including without limitation the rights to use,
> + *     copy, modify, merge, publish, distribute, sublicense, and/or
> + *     sell copies of the Software, and to permit persons to whom the
> + *     Software is furnished to do so, subject to the following
> + *     conditions:
> + *
> + *     The above copyright notice and this permission notice shall be
> + *     included in all copies or substantial portions of the Software.
> + *
> + *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
> + *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
> + *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
> + *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + *     OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <dt-bindings/net/ti-dp83867.h>
> +#include "rk3288.dtsi"
> +
> +/ {
> +       model =3D "Phytec RK3288 phyCORE";
> +       compatible =3D "phytec,rk3288-phycore-som", "rockchip,rk3288";
> +
> +       /*
> +        * Set the minimum memory size here and
> +        * let the bootloader set the real size.
> +        */
> +       memory {
> +               device_type =3D "memory";
> +               reg =3D <0 0x8000000>;
> +       };
> +
> +       aliases {
> +               rtc0 =3D &i2c_rtc;
> +               rtc1 =3D &rk818;
> +       };
> +
> +       ext_gmac: external-gmac-clock {
> +               compatible =3D "fixed-clock";
> +               #clock-cells =3D <0>;
> +               clock-frequency =3D <125000000>;
> +               clock-output-names =3D "ext_gmac";
> +       };
> +
> +       leds: user-leds {
> +               compatible =3D "gpio-leds";
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&user_led>;
> +
> +               user {
> +                       label =3D "green_led";
> +                       gpios =3D <&gpio7 2 GPIO_ACTIVE_HIGH>;
> +                       linux,default-trigger =3D "heartbeat";
> +                       default-state =3D "keep";
> +               };
> +       };
> +
> +       vdd_emmc_io: vdd-emmc-io {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vdd_emmc_io";
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +               vin-supply =3D <&vdd_3v3_io>;
> +       };
> +
> +       vdd_in_otg_out: vdd-in-otg-out {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vdd_in_otg_out";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <5000000>;
> +               regulator-max-microvolt =3D <5000000>;
> +       };
> +
> +       vdd_misc_1v8: vdd-misc-1v8 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "vdd_misc_1v8";
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-min-microvolt =3D <1800000>;
> +               regulator-max-microvolt =3D <1800000>;
> +       };
> +};
> +
> +&cpu0 {
> +       cpu0-supply =3D <&vdd_cpu>;
> +       operating-points =3D <
> +               /* KHz    uV */
> +               1800000 1400000
> +               1608000 1350000
> +               1512000 1300000
> +               1416000 1200000
> +               1200000 1100000
> +               1008000 1050000
> +                816000 1000000
> +                696000  950000
> +                600000  900000
> +                408000  900000
> +                312000  900000
> +                216000  900000
> +                126000  900000
> +       >;
> +};
> +
> +&emmc {
> +       status =3D "okay";
> +       bus-width =3D <8>;
> +       cap-mmc-highspeed;
> +       disable-wp;
> +       non-removable;
> +       num-slots =3D <1>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&emmc_clk &emmc_cmd &emmc_pwr &emmc_bus8>;
> +       vmmc-supply =3D <&vdd_3v3_io>;
> +       vqmmc-supply =3D <&vdd_emmc_io>;
> +};
> +
> +&gmac {
> +       assigned-clocks =3D <&cru SCLK_MAC>;
> +       assigned-clock-parents =3D <&ext_gmac>;
> +       clock_in_out =3D "input";
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&rgmii_pins &phy_rst &phy_int>;
> +       phy-handle =3D <&phy0>;
> +       phy-supply =3D <&vdd_eth_2v5>;
> +       phy-mode =3D "rgmii-id";
> +       snps,reset-active-low;
> +       snps,reset-delays-us =3D <0 10000 1000000>;
> +       snps,reset-gpio =3D <&gpio4 8 GPIO_ACTIVE_HIGH>;
> +       tx_delay =3D <0x0>;
> +       rx_delay =3D <0x0>;
> +
> +       mdio0 {
> +               compatible =3D "snps,dwmac-mdio";
> +               #address-cells =3D <1>;
> +               #size-cells =3D <0>;
> +
> +               phy0: ethernet-phy@0 {
> +                       compatible =3D "ethernet-phy-ieee802.3-c22";
> +                       reg =3D <0>;
> +                       interrupt-parent =3D <&gpio4>;
> +                       interrupts =3D <2 IRQ_TYPE_EDGE_FALLING>;
> +                       ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_=
NS>;
> +                       ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_00_=
NS>;
> +                       ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_N=
IB>;
> +                       enet-phy-lane-no-swap;
> +               };
> +       };
> +};
> +
> +&hdmi {
> +       ddc-i2c-bus =3D <&i2c5>;
> +};
> +
> +&io_domains {
> +       status =3D "okay";
> +       sdcard-supply =3D <&vdd_io_sd>;
> +       flash0-supply =3D <&vdd_emmc_io>;
> +       flash1-supply =3D <&vdd_misc_1v8>;
> +       gpio1830-supply =3D <&vdd_3v3_io>;
> +       gpio30-supply =3D <&vdd_3v3_io>;
> +       bb-supply =3D <&vdd_3v3_io>;
> +       dvp-supply =3D <&vdd_3v3_io>;
> +       lcdc-supply =3D <&vdd_3v3_io>;
> +       wifi-supply =3D <&vdd_3v3_io>;
> +       audio-supply =3D <&vdd_3v3_io>;
> +};
> +
> +&i2c0 {
> +       status =3D "okay";
> +       clock-frequency =3D <400000>;
> +
> +       rk818: pmic@1c {
> +               compatible =3D "rockchip,rk818";
> +               reg =3D <0x1c>;
> +               interrupt-parent =3D <&gpio0>;
> +               interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pmic_int>;
> +               rockchip,system-power-controller;
> +               wakeup-source;
> +               #clock-cells =3D <1>;
> +

I think you miss  "clock-output-names =3D "xin32k" here.

> +               vcc1-supply =3D <&vdd_sys>;
> +               vcc2-supply =3D <&vdd_sys>;
> +               vcc3-supply =3D <&vdd_sys>;
> +               vcc4-supply =3D <&vdd_sys>;
> +               boost-supply =3D <&vdd_in_otg_out>;
> +               vcc6-supply =3D <&vdd_sys>;
> +               vcc7-supply =3D <&vdd_misc_1v8>;
> +               vcc8-supply =3D <&vdd_misc_1v8>;
> +               vcc9-supply =3D <&vdd_3v3_io>;
> +               vddio-supply =3D <&vdd_3v3_io>;
> +
> +               regulators {
> +                       vdd_log: DCDC_REG1 {
> +                               regulator-name =3D "vdd_log";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1100000>;
> +                               regulator-max-microvolt =3D <1100000>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_gpu: DCDC_REG2 {
> +                               regulator-name =3D "vdd_gpu";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <800000>;
> +                               regulator-max-microvolt =3D <1250000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1000000>;
> +                               };
> +                       };
> +
> +                       vcc_ddr: DCDC_REG3 {
> +                               regulator-name =3D "vcc_ddr";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                               };
> +                       };
> +
> +                       vdd_3v3_io: DCDC_REG4 {
> +                               regulator-name =3D "vdd_3v3_io";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
3300000>;
> +                               };
> +                       };
> +
> +                       vdd_sys: DCDC_BOOST {
> +                               regulator-name =3D "vdd_sys";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <5000000>;
> +                               regulator-max-microvolt =3D <5000000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
5000000>;
> +                               };
> +                       };
> +
> +                       /* vcc9 */
> +                       vdd_sd: SWITCH_REG {
> +                               regulator-name =3D "vdd_sd";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                               };
> +                       };
> +
> +                       /* vcc6 */
> +                       vdd_eth_2v5: LDO_REG2 {
> +                               regulator-name =3D "vdd_eth_2v5";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <2500000>;
> +                               regulator-max-microvolt =3D <2500000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
2500000>;
> +                               };
> +                       };
> +
> +                       /* vcc7 */
> +                       vdd_1v0: LDO_REG3 {
> +                               regulator-name =3D "vdd_1v0";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1000000>;
> +                               regulator-max-microvolt =3D <1000000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1000000>;
> +                               };
> +                       };
> +
> +                       /* vcc8 */
> +                       vdd_1v8_lcd_ldo: LDO_REG4 {
> +                               regulator-name =3D "vdd_1v8_lcd_ldo";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       /* vcc8 */
> +                       vdd_1v0_lcd: LDO_REG6 {
> +                               regulator-name =3D "vdd_1v0_lcd";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1000000>;
> +                               regulator-max-microvolt =3D <1000000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1000000>;
> +                               };
> +                       };
> +
> +                       /* vcc7 */
> +                       vdd_1v8_ldo: LDO_REG7 {
> +                               regulator-name =3D "vdd_1v8_ldo";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <1800000>;
> +                               regulator-max-microvolt =3D <1800000>;
> +                               regulator-state-mem {
> +                                       regulator-off-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
1800000>;
> +                               };
> +                       };
> +
> +                       /* vcc9 */
> +                       vdd_io_sd: LDO_REG9 {
> +                               regulator-name =3D "vdd_io_sd";
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-min-microvolt =3D <3300000>;
> +                               regulator-max-microvolt =3D <3300000>;
> +                               regulator-state-mem {
> +                                       regulator-on-in-suspend;
> +                                       regulator-suspend-microvolt =3D <=
3300000>;
> +                               };
> +                       };
> +               };
> +       };
> +
> +       /* M24C32-D */
> +       i2c_eeprom: eeprom@50 {
> +               compatible =3D "atmel,24c32";
> +               reg =3D <0x50>;
> +               pagesize =3D <32>;
> +       };
> +
> +       vdd_cpu: regulator@60 {
> +               compatible =3D "fcs,fan53555";
> +               reg =3D <0x60>;
> +               fcs,suspend-voltage-selector =3D <1>;
> +               regulator-always-on;
> +               regulator-boot-on;
> +               regulator-enable-ramp-delay =3D <300>;
> +               regulator-name =3D "vdd_cpu";
> +               regulator-min-microvolt =3D <800000>;
> +               regulator-max-microvolt =3D <1430000>;
> +               regulator-ramp-delay =3D <8000>;
> +               vin-supply =3D <&vdd_sys>;
> +       };
> +};
> +
> +&pinctrl {
> +       pcfg_output_high: pcfg-output-high {
> +               output-high;
> +       };
> +
> +       emmc {
> +               /*
> +                * We run eMMC at max speed; bump up drive strength.
> +                * We also have external pulls, so disable the internal o=
nes.
> +                */
> +               emmc_clk: emmc-clk {
> +                       rockchip,pins =3D <3 18 RK_FUNC_2 &pcfg_pull_none=
_12ma>;
> +               };
> +
> +               emmc_cmd: emmc-cmd {
> +                       rockchip,pins =3D <3 16 RK_FUNC_2 &pcfg_pull_none=
_12ma>;
> +               };
> +
> +               emmc_bus8: emmc-bus8 {
> +                       rockchip,pins =3D <3 0 RK_FUNC_2 &pcfg_pull_none_=
12ma>,
> +                                       <3 1 RK_FUNC_2 &pcfg_pull_none_12=
ma>,
> +                                       <3 2 RK_FUNC_2 &pcfg_pull_none_12=
ma>,
> +                                       <3 3 RK_FUNC_2 &pcfg_pull_none_12=
ma>,
> +                                       <3 4 RK_FUNC_2 &pcfg_pull_none_12=
ma>,
> +                                       <3 5 RK_FUNC_2 &pcfg_pull_none_12=
ma>,
> +                                       <3 6 RK_FUNC_2 &pcfg_pull_none_12=
ma>,
> +                                       <3 7 RK_FUNC_2 &pcfg_pull_none_12=
ma>;
> +               };
> +       };
> +
> +       gmac {
> +               phy_int: phy-int {
> +                       rockchip,pins =3D <4 2 RK_FUNC_GPIO &pcfg_pull_up=
>;
> +               };
> +
> +               phy_rst: phy-rst {
> +                       rockchip,pins =3D <4 8 RK_FUNC_GPIO &pcfg_output_=
high>;
> +               };
> +       };
> +
> +       leds {
> +               user_led: user-led {
> +                       rockchip,pins =3D <7 2 RK_FUNC_GPIO &pcfg_output_=
high>;
> +               };
> +       };
> +
> +       pmic {
> +               pmic_int: pmic-int {
> +                       rockchip,pins =3D <RK_GPIO0 4 RK_FUNC_GPIO &pcfg_=
pull_up>;
> +               };
> +
> +               /* Pin for switching state between sleep and non-sleep st=
ate */
> +               pmic_sleep: pmic-sleep {
> +                       rockchip,pins =3D <RK_GPIO0 0 RK_FUNC_GPIO &pcfg_=
pull_up>;
> +               };
> +       };
> +};
> +
> +&pwm1 {
> +       status =3D "okay";
> +};
> +
> +&saradc {
> +       status =3D "okay";
> +       vref-supply =3D <&vdd_1v8_ldo>;
> +};
> +
> +&spi2 {
> +       status =3D "okay";
> +
> +       serial_flash: flash@0 {
> +               compatible =3D "micron,n25q128a13", "jedec,spi-nor";
> +               reg =3D <0x0>;
> +               spi-max-frequency =3D <50000000>;
> +               m25p,fast-read;
> +               #address-cells =3D <1>;
> +               #size-cells =3D <1>;
> +               status =3D "okay";
> +       };
> +};
> +
> +&tsadc {
> +       status =3D "okay";
> +       rockchip,hw-tshut-mode =3D <0>;
> +       rockchip,hw-tshut-polarity =3D <0>;
> +};
> +
> +&vopb {
> +       status =3D "okay";
> +};
> +
> +&vopb_mmu {
> +       status =3D "okay";
> +};
> +
> +&vopl {
> +       status =3D "okay";
> +};
> +
> +&vopl_mmu {
> +       status =3D "okay";
> +};
> +
> +&wdt {
> +       status =3D "okay";
> +};
> --
> 1.9.1
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
