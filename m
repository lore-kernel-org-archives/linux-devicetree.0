Return-Path: <SRS0=9TIE=BM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1DE2C433E1
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 22:01:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D2D5204EA
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 22:01:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgHBWB6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 2 Aug 2020 18:01:58 -0400
Received: from foss.arm.com ([217.140.110.172]:50640 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbgHBWB6 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sun, 2 Aug 2020 18:01:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4E3F1FB;
        Sun,  2 Aug 2020 15:01:56 -0700 (PDT)
Received: from [10.57.35.143] (unknown [10.57.35.143])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AD883F71F;
        Sun,  2 Aug 2020 15:01:55 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] rockchip: rk3328: Add support for FriendlyARM
 NanoPi R2S
To:     David Bauer <mail@david-bauer.net>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
References: <20200730232054.286381-1-mail@david-bauer.net>
 <20200730232054.286381-2-mail@david-bauer.net>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <d0053630-1ff3-9771-eb7d-7aaf0a27dca2@arm.com>
Date:   Sun, 2 Aug 2020 23:01:55 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200730232054.286381-2-mail@david-bauer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

On 2020-07-31 00:20, David Bauer wrote:
> This adds support for the NanoPi R2S from FriendlyARM.
> 
> Rockchip RK3328 SoC
> 1GB DDR4 RAM
> Gigabit Ethernet (WAN)
> Gigabit Ethernet (USB3) (LAN)
> USB 2.0 Host Port
> MicroSD slot
> Reset button
> WAN - LAN - SYS LED

Neat! Mine turned up last week (far earlier than expected, yay!), and I 
was going to do some DT hacking, but here it is already :)

> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
> 
> Changes in v2:
>   - Use aligned memory for ethernet
>   - Fix GPO for sdio regulator
> 
>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>   .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   | 334 ++++++++++++++++++
>   2 files changed, 335 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index b87b1f773083..20055c51e150 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-roc-cc.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-odroid-go2.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-a1.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-evb.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-nanopi-r2s.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-rock64.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-roc-cc.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-evb-act8846.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> new file mode 100644
> index 000000000000..9fd148423b9d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> @@ -0,0 +1,334 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2020 David Bauer <mail@david-bauer.net>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include "rk3328.dtsi"
> +
> +/ {
> +	model = "FriendlyARM NanoPi R2S";

Same comment as for the binding.

> +	compatible = "friendlyarm,nanopi-r2s", "rockchip,rk3328";
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	gmac_clkin: external-gmac-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "gmac_clkin";
> +		#clock-cells = <0>;
> +	};
> +
> +	vcc_sd: sdmmc-regulator {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio0 RK_PD6 GPIO_ACTIVE_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdmmc0m1_gpio>;
> +		regulator-name = "vcc_sd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_io>;
> +	};
> +
> +	vcc_sdio: sdmmcio-regulator {

This is "vcc_io_sd" per the schematic.

> +		compatible = "regulator-gpio";
> +		gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		states = <1800000 0x1
> +			  3300000 0x0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdio_vcc_pin>;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-name = "vcc_sdio";
> +		regulator-settling-time-us = <5000>;
> +		regulator-type = "voltage";
> +		vin-supply = <&vcc_io>;

Strictly the supply here is vdd_5v - vcc_io is only driving the bias 
circuitry for the regulator adjustment.

> +	};
> +
> +	vcc_sys: vcc-sys {

This is "vdd_5v".

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&led_pins>;
> +
> +		sys {
> +			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:red:sys";
> +		};
> +
> +		lan {
> +			gpios = <&gpio2 RK_PB7 GPIO_ACTIVE_HIGH>;

This seems to match the schematic, however in practice the GPIO seems to 
have a mind of its own and not respond to the LED settings - are we 
missing something with the pinctrl perhaps?

> +			label = "nanopi-r2s:green:lan";
> +		};
> +
> +		wan {
> +			gpios = <&gpio2 RK_PC2 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:green:wan";
> +		};
> +	};
> +
> +	gpio_keys {
> +		compatible = "gpio-keys-polled";

Does this need to be polled? I would have thought regular 
interrupt-based gpio-keys should work, to avoid the overhead of polling 
for something (relatively) incredibly rare, but perhaps I'm wrong :/

> +		poll-interval = <100>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&button_pins>;
> +
> +		reset {
> +			label = "Reset Button";
> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_RESTART>;
> +			debounce-interval = <50>;
> +		};
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&gmac2io {
> +	assigned-clocks = <&cru SCLK_MAC2IO>, <&cru SCLK_MAC2IO_EXT>;
> +	assigned-clock-parents = <&gmac_clkin>, <&gmac_clkin>;
> +	clock_in_out = "input";
> +	phy-supply = <&vcc_io>;
> +	phy-handle = <&rtl8211e>;
> +	phy-mode = "rgmii";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmiim1_pins>;
> +	snps,aal;

Is this needed over and above the txpbl fix present in the main DTSI? I 
forget exactly where all those discussions ended up, but if it matters 
here then it probably matters for all RK3328 boards.

> +	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 10000 50000>;

Since you're describing the phy already, you can convert these to 
generic reset specifiers on the phy node itself (shame we don't have an 
interrupt wired up, oh well...)

> +	tx_delay = <0x24>;
> +	rx_delay = <0x18>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		rtl8211e: ethernet-phy@0 {
> +			reg = <0>;

Is that right? The schematic says the phy is strapped for address 1 
(although 0 probably does manage to work since it should be interpreted 
as a broadcast address).

> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	rk805: rk805@18 {
> +		compatible = "rockchip,rk805";
> +		reg = <0x18>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;

The schematic says GPIO1_D0 for this.

> +		#clock-cells = <1>;
> +		clock-output-names = "xin32k", "rk805-clkout2";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int_l>;
> +		rockchip,system-power-controller;
> +		wakeup-source;
> +
> +		vcc1-supply = <&vcc_sys>;
> +		vcc2-supply = <&vcc_sys>;
> +		vcc3-supply = <&vcc_sys>;
> +		vcc4-supply = <&vcc_sys>;
> +		vcc5-supply = <&vcc_io>;
> +		vcc6-supply = <&vcc_sys>;
> +
> +		regulators {
> +			vdd_logic: DCDC_REG1 {

This is "vdd_log".

> +				regulator-name = "vdd_logic";
> +				regulator-min-microvolt = <712500>;
> +				regulator-max-microvolt = <1450000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +
> +			vdd_arm: DCDC_REG2 {
> +				regulator-name = "vdd_arm";
> +				regulator-min-microvolt = <712500>;
> +				regulator-max-microvolt = <1450000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <950000>;
> +				};
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-name = "vcc_ddr";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_io: DCDC_REG4 {

This is "vcc_io_33".

> +				regulator-name = "vcc_io";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_18: LDO_REG1 {
> +				regulator-name = "vcc_18";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcc18_emmc: LDO_REG2 {
> +				regulator-name = "vcc18_emmc";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vdd_10: LDO_REG3 {
> +				regulator-name = "vdd_10";
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&io_domains {
> +	status = "okay";
> +
> +	vccio1-supply = <&vcc_io>;
> +	vccio2-supply = <&vcc18_emmc>;
> +	vccio3-supply = <&vcc_sdio>;
> +	vccio4-supply = <&vcc_18>;
> +	vccio5-supply = <&vcc_io>;
> +	vccio6-supply = <&vcc_io>;
> +	pmuio-supply = <&vcc_io>;
> +};
> +
> +&pinctrl {
> +	leds {
> +		led_pins: led-pins {
> +			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>,
> +							<2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>,
> +							<2 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	button {
> +		button_pins: button-pins {
> +			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pmic {
> +		pmic_int_l: pmic-int-l {
> +			rockchip,pins = <2 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	sd {
> +		sdio_vcc_pin: sdio-vcc-pin {
> +			rockchip,pins = <1 RK_PD4 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +};
> +

It shouldn't hurt to enable PWM2 from the outset to make mucking about 
with the fan easier.

> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;

How about UHS modes, since we have the requisite I/O voltage support?

> +	disable-wp;

I believe this property is only meant for full-size MMC/SD sockets where 
write-protect functionality is expected but somehow broken. For micro-SD 
sockets the SoC pin should be hard-wired to write-enable anyway and thus 
it shouldn't need to be stated.

> +	max-frequency = <150000000>;

This is in the DTSI already.

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_dectn &sdmmc0_bus4>;
> +	vmmc-supply = <&vcc_sd>;
> +	vqmmc-supply = <&vcc_sdio>;
> +	status = "okay";
> +};
> +
> +&tsadc {
> +	rockchip,hw-tshut-mode = <0>;
> +	rockchip,hw-tshut-polarity = <0>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&u2phy {
> +	status = "okay";
> +
> +	u2phy_host: host-port {

Just reference this by label directly, rather than as a child node here 
(especially since redefining the existing label is a bit confusing).

> +		status = "okay";
> +	};
> +};

No reason not to enable the OTG port either - I've hacked that in with 
g_serial for a cheeky console while powering the board from my laptop 
and it works fine.

Cheers,
Robin.

> +
> +&usb_host0_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host0_ohci {
> +	status = "okay";
> +};
> 
