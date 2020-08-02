Return-Path: <SRS0=9TIE=BM=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C7BC433DF
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 19:21:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E39720738
	for <linux-devicetree@archiver.kernel.org>; Sun,  2 Aug 2020 19:21:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUNB3I6Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgHBTVJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 2 Aug 2020 15:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgHBTVJ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 2 Aug 2020 15:21:09 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEBAAC06174A
        for <devicetree@vger.kernel.org>; Sun,  2 Aug 2020 12:21:08 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c2so19896388edx.8
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2020 12:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Z6RLRVYGgII8dGriZ8OaLnBgnGmeqPLnHi6ovP/yK3g=;
        b=YUNB3I6QSpfSWI61bSWRe43+jbSegUObpvzhWyatDwN7P3R6bD2DWMytzs6ft02cp1
         lGPZlHa2GatvZGXjKucjba+zeFnbtI4ic3oSPLj7luIQ312Pf3iPYdxakvDVoBp2SOT4
         MVWWUotuVcdQWmv4sVWB+zRrXCOPrR4Aihdv6zqMI7JszfHPP3d7pUo9WjMdkBB0Ggtp
         owxQ3Jy0C7tiOysGvImlgCwwKLX+3de0xUaVGK4+GwILQxDGTkEDmZCtSxDA8n55tUjZ
         sEWUxO4PrB7i3dvrONHTnxZQZyX3pT7zTW9wPjkXwxDhkFt8dx6G0ADnkUbAfEQ692dJ
         CV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Z6RLRVYGgII8dGriZ8OaLnBgnGmeqPLnHi6ovP/yK3g=;
        b=Ux0cjs/AiUu4+QkMoqboNbjD263p9ZHA8fmt912gvm6IffB+zDM9fcYy3beZmmmKs+
         qfbw25cBsGlYpqJlw1KJ2OPxur/3JdygAu2d3ittA8byZyAXutui9qbPpyKjIZKLjune
         sIdqPQSkyPiGK7Knz5o9wqK+n0j7EKI1WZiidF9hqjyxDt9e4Y/Bxzu3g5XcL4S4M4Es
         doQk+FKgIvK2Ai+AeC9AOC772ldMyPuPHn7Qrx0NeP+Oh2lBTVGp1ViEgRRJZaXb+8Vu
         LwOOwLQIi7cOQr1PWp9duoodQYHQG1NoBNIAJuXrPZewFnAeG5xz/4fj1UyDCc1RJVkJ
         U9tQ==
X-Gm-Message-State: AOAM533bB45F24q+o2g6ytypvXP25gPEO2uuln8CueJTmqz8cXhHFOUF
        /1TcL8tdtpcUwssTVKazvck=
X-Google-Smtp-Source: ABdhPJw9ypgKhXJqG3ytB2QRURYpSgMCZcwiKfQkvofMjH34jmMEgz6S7LioP5RL1i/LOHnxlv6BEQ==
X-Received: by 2002:a05:6402:3121:: with SMTP id dd1mr13176339edb.72.1596396067544;
        Sun, 02 Aug 2020 12:21:07 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id j11sm4255692edr.71.2020.08.02.12.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2020 12:21:07 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] rockchip: rk3328: Add support for FriendlyARM
 NanoPi R2S
To:     David Bauer <mail@david-bauer.net>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko@sntech.de>,
        Rob Herring <robh+dt@kernel.org>
References: <20200730232054.286381-1-mail@david-bauer.net>
 <20200730232054.286381-2-mail@david-bauer.net>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <36925164-7613-4b0c-b45e-23804587c999@gmail.com>
Date:   Sun, 2 Aug 2020 21:21:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200730232054.286381-2-mail@david-bauer.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi David,

Add more maintainers and mail lists for all patches in this serie.

./scripts/get_maintainer.pl --noroles --norolestats --nogit-fallback
--nogit <patch1 patch2>

git send-email --suppress-cc all --annotate --to <..> --cc <..> <patch1
patch2>

On 7/31/20 1:20 AM, David Bauer wrote:
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
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
> 
> Changes in v2:
>  - Use aligned memory for ethernet
>  - Fix GPO for sdio regulator
> 
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   | 334 ++++++++++++++++++
>  2 files changed, 335 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index b87b1f773083..20055c51e150 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -5,6 +5,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3308-roc-cc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3326-odroid-go2.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-a1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-evb.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-nanopi-r2s.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-rock64.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3328-roc-cc.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-evb-act8846.dtb
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

sort

> +		regulator-name = "vcc_sd";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_io>;
> +	};
> +
> +	vcc_sdio: sdmmcio-regulator {
> +		compatible = "regulator-gpio";
> +		gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		states = <1800000 0x1
> +			  3300000 0x0>;

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdio_vcc_pin>;

sort

> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;

> +		regulator-name = "vcc_sdio";

move regulator-name above regulator-always-on

> +		regulator-settling-time-us = <5000>;
> +		regulator-type = "voltage";
> +		vin-supply = <&vcc_io>;
> +	};
> +
> +	vcc_sys: vcc-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};

sort node names
move regulators below

> +
> +	leds {
> +		compatible = "gpio-leds";

> +

remove empty line

> +		pinctrl-names = "default";

sort pinctrl-names below pinctrl-0

> +		pinctrl-0 = <&led_pins>;

use separate pinctrl nodes with consistent node names
	pinctrl-0 = <&lan_led_pin, &sys_led_pin, &wan_led_pin>;
> +
> +		sys {

sort node names/label

The prefered node name is '^led-[0-9a-f]$'.

sys_led: led-1 {

> +			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:red:sys";
> +		};
> +

> +		lan {

lan_led: led-0 {

> +			gpios = <&gpio2 RK_PB7 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:green:lan";
> +		};
> +

> +		wan {

wan_led: led-2 {

> +			gpios = <&gpio2 RK_PC2 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:green:wan";
> +		};
> +	};
> +

> +	gpio_keys {

sort node name

> +		compatible = "gpio-keys-polled";
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

sort

> +	snps,aal;
> +	snps,reset-gpio = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	snps,reset-delays-us = <0 10000 50000>;
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

interrupts, reset ?

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
> +		#clock-cells = <1>;
> +		clock-output-names = "xin32k", "rk805-clkout2";
> +		gpio-controller;
> +		#gpio-cells = <2>;

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int_l>;

sort

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
> +				regulator-name = "vdd_logic";
> +				regulator-min-microvolt = <712500>;
> +				regulator-max-microvolt = <1450000>;
> +				regulator-ramp-delay = <12500>;
> +				regulator-always-on;
> +				regulator-boot-on;

empty line between a node

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

same

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

same

> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_io: DCDC_REG4 {
> +				regulator-name = "vcc_io";
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;

same

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

same

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

same

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

same

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

status below

> +
> +	vccio1-supply = <&vcc_io>;
> +	vccio2-supply = <&vcc18_emmc>;
> +	vccio3-supply = <&vcc_sdio>;
> +	vccio4-supply = <&vcc_18>;
> +	vccio5-supply = <&vcc_io>;
> +	vccio6-supply = <&vcc_io>;

> +	pmuio-supply = <&vcc_io>;

sort properties, move this to top

> +};
> +
> +&pinctrl {

> +	leds {

sort node names

> +		led_pins: led-pins {

use a separate sub node for each led
use a consistent node name

	lan_led_pin: lan-led-pin {}
        sys_led_pin: sys-led-pin {}
        wan_led_pin: wan-led-pin {}
> +			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>,
> +							<2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>,
> +							<2 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;

(fix alignment)

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

> +&sdmmc {
> +	bus-width = <4>;

> +	cap-mmc-highspeed;

remove
board has only micro SD card

> +	cap-sd-highspeed;
> +	disable-wp;

> +	max-frequency = <150000000>;

already in dtsi

> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_dectn &sdmmc0_bus4>;

sort

> +	vmmc-supply = <&vcc_sd>;
> +	vqmmc-supply = <&vcc_sdio>;
> +	status = "okay";
> +};

	sdmmc: mmc@ff500000 {
		compatible = "rockchip,rk3328-dw-mshc", "rockchip,rk3288-dw-mshc";
		reg = <0x0 0xff500000 0x0 0x4000>;
		interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
		clocks = <&cru HCLK_SDMMC>, <&cru SCLK_SDMMC>,
			 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
		clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
		fifo-depth = <0x100>;
		max-frequency = <150000000>;
		status = "disabled";
	};

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

sort node names

> +	status = "okay";
> +
> +	u2phy_host: host-port {
> +		status = "okay";
> +	};

u2phy_otg ?

> +};
> +

&usb20_otg {               ?
	dr_mode = "host";  ?
	status = "okay";   ?
};

Do we need this as well?

> +&usb_host0_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host0_ohci {
> +	status = "okay";
> +};
> 

