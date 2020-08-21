Return-Path: <SRS0=+ed7=B7=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B33D7C433E1
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 09:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88422207DE
	for <linux-devicetree@archiver.kernel.org>; Fri, 21 Aug 2020 09:42:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DV6XLZpS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbgHUJm2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 21 Aug 2020 05:42:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgHUJm1 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Aug 2020 05:42:27 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F0AEC061385
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 02:42:27 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id md23so779564ejb.6
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2020 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=/hABwfngtak2dQq7NULZDy7Hu9K8EnmwH4xm+nSGjI4=;
        b=DV6XLZpSCpOY2XqPrppTtVvNBmZqA14GV4ADeYW3PeL3znE/HOwQnZ7rcfW2bhVM7X
         KhpY5o7EbwwTxTMr9EebAQ/gG9H8gfAJ77EsnnHwrI2apWIB7ldkcLsNbXDFIm4lnfpa
         NBTlX5Uxg0PrpgQG9Eju1nks7aBd8whfiJnjWBy1XswUJByRbwslCNBoIyJLB8dlD/GS
         ylpkTVcpN3EojLRNcLnfBOAsZwVwBgeusp0Ygz5sgKqTR/e5ky5UecwVi58BrsET2T0c
         GBRNj+UPFqxujFfX9LRXeZR7D0JG05fEHi8XjFSxhLYCWo8SHKOQ0Kz2wCEqnlUJXvA5
         Lrew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/hABwfngtak2dQq7NULZDy7Hu9K8EnmwH4xm+nSGjI4=;
        b=rHERVCQgwrerr9O9JdyMn9zTKMq/xR3jnWZYLHavwySfYSPnRMpE5/C6kLbOr84X4m
         nAQgRN7ZMSJkb6qi+2E7Yy1AG8epMqWTxOpcYTmWAFG80Ws0C2ndYlWM12ct6LfvYLrB
         kRMHTmLvxaQZOmQePZa/XWS6AnUUkxgCWTe1NT1n9T8RmqrgZtsnZ1GHITSwB3bJewZM
         j5rI6myf/DsyTI4l/QXrdtCZIX/1OI2BbLH4Whq3cdhbz6jau0iWr8SIvxruhIN166YC
         cauo8YrBi+XIIu2iO4WnT055r4pCX8nqeqhvzTfpRUytTd67Df1I/wcw2m3FuFcV76LL
         9y0g==
X-Gm-Message-State: AOAM531EC5xXLn2nK+UZeZ3nmE9txKOSNxva7oxpY1RhNu4KfhsXKxh3
        wl5Gi73Lrk2/ArV0/1UHX5Q=
X-Google-Smtp-Source: ABdhPJx2CNLenYuQQ+HYDkZ4C8iaU9oeFbp8b5/aJ9WanOMcaTLt1lL93zAFa6YUgFjveQLz7dIf0g==
X-Received: by 2002:a17:906:a18e:: with SMTP id s14mr2033446ejy.168.1598002945727;
        Fri, 21 Aug 2020 02:42:25 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id v13sm988883ejq.59.2020.08.21.02.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2020 02:42:25 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] rockchip: rk3328: Add support for FriendlyARM
 NanoPi R2S
To:     David Bauer <mail@david-bauer.net>, robh+dt@kernel.org,
        heiko@sntech.de, andy.yan@rock-chips.com,
        jagan@amarulasolutions.com, robin.murphy@arm.com,
        kever.yang@rock-chips.com, m.reichl@fivetechno.de,
        t.schramm@manjaro.org, pgwipeout@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
References: <20200820214409.34957-1-mail@david-bauer.net>
 <20200820214409.34957-2-mail@david-bauer.net>
From:   Johan Jonker <jbx6244@gmail.com>
Message-ID: <6efeeb03-8141-bfc4-d3aa-1971d4498699@gmail.com>
Date:   Fri, 21 Aug 2020 11:42:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200820214409.34957-2-mail@david-bauer.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi David,

Increase version number for each new serie.

On 8/20/20 11:44 PM, David Bauer wrote:
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
> Changes in v2:
>  - Change model name to FriendlyElec
>  - Enable SD UHS modes
>  - Add startup delay to SDIO regulator to improve
>    issues reported with some cards
>  - Fix PMIC interrupt pin
>  - Add pinctrl node for ethernet-PHY
>  - Fix various formatting issues
> 
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   | 367 ++++++++++++++++++
>  2 files changed, 368 insertions(+)
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
> index 000000000000..51c100ea9211
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dts
> @@ -0,0 +1,367 @@
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
> +	model = "FriendlyElec NanoPi R2S";
> +	compatible = "friendlyarm,nanopi-r2s", "rockchip,rk3328";
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +

> +	gmac_clkin: external-gmac-clock {

Maybe something more consistant nodename/label combination?

> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "gmac_clkin";
> +		#clock-cells = <0>;
> +	};
> +
> +	keys {
> +		compatible = "gpio-keys";
> +		pinctrl-0 = <&reset_button_pin>;
> +		pinctrl-names = "default";
> +
> +		reset {

> +			label = "Reset Button";

This label shows up in the kernel tree.
User space scripts don't like a space in a dir name for example.
Users don't like typing mixed SHIFT-capitals.

> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_RESTART>;
> +			debounce-interval = <50>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";

> +		pinctrl-0 = <&wan_led_pin &sys_led_pin &wan_led_pin>;

&lan_led_pin                     ^

Quote by robh:
While bracketing doesn't matter for a DTB, the DT schema checks rely on
bracketing around each distinct entry.

> +		pinctrl-names = "default";
> +
> +		lan_led: led-0 {
> +			gpios = <&gpio2 RK_PB7 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:green:lan";
> +		};
> +
> +		sys_led: led-1 {
> +			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:red:sys";
> +		};
> +
> +		wan_led: led-2 {
> +			gpios = <&gpio2 RK_PC2 GPIO_ACTIVE_HIGH>;
> +			label = "nanopi-r2s:green:wan";
> +		};
> +	};
> +
> +	vcc_sd: sdmmc-regulator {
> +		compatible = "regulator-fixed";
> +		gpio = <&gpio0 RK_PD6 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&sdmmc0m1_gpio>;
> +		pinctrl-names = "default";
> +		regulator-name = "vcc_sd";
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_io_33>;
> +	};
> +

> +	vcc_io_sdio: sdmmcio-regulator {

sort nodenames

> +		compatible = "regulator-gpio";
> +		enable-active-high;
> +		gpios = <&gpio1 RK_PD4 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&sdio_vcc_pin>;
> +		pinctrl-names = "default";
> +		regulator-name = "vcc_io_sdio";
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-settling-time-us = <5000>;
> +		regulator-type = "voltage";
> +		startup-delay-us = <2000>;
> +		states = <1800000 0x1
> +			  3300000 0x0>;
> +		vin-supply = <&vcc_io_33>;
> +	};
> +
> +	vdd_5v: vdd-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vdd_5v";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
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
> +	phy-handle = <&rtl8211e>;
> +	phy-mode = "rgmii";
> +	phy-supply = <&vcc_io_33>;
> +	pinctrl-0 = <&rgmiim1_pins>;
> +	pinctrl-names = "default";
> +	rx_delay = <0x18>;
> +	snps,aal;
> +	tx_delay = <0x24>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +

> +		rtl8211e: ethernet-phy@0 {


if reg == <1> then use @1

		rtl8211e: ethernet-phy@1 {
			reg = <1>;

> +			pinctrl-0 = <&eth_phy_reset_pin>;
> +			pinctrl-names = "default";

> +			reg = <1>;

move reg below nodename

> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <50000>;
> +			reset-gpios = <&gpio1 RK_PC2 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +
> +	rk805: pmic@18 {
> +		compatible = "rockchip,rk805";

		reg = <0x18>;

> +		#clock-cells = <1>;
> +		clock-output-names = "xin32k", "rk805-clkout2";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-0 = <&pmic_int_l>;
> +		pinctrl-names = "default";

> +		reg = <0x18>;

move reg below compatible

Quote by Heiko:

But yes, since the early Chromebook project in 2014 we agreed on
doing in Rockchip dts files:

----
compatible
reg
interrupts
[alphabetical]
status [if needed]
----

> +		rockchip,system-power-controller;
> +		wakeup-source;
> +
> +		vcc1-supply = <&vdd_5v>;
> +		vcc2-supply = <&vdd_5v>;
> +		vcc3-supply = <&vdd_5v>;
> +		vcc4-supply = <&vdd_5v>;
> +		vcc5-supply = <&vcc_io_33>;
> +		vcc6-supply = <&vdd_5v>;
> +
> +		regulators {
> +			vdd_log: DCDC_REG1 {
> +				regulator-name = "vdd_log";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <712500>;
> +				regulator-max-microvolt = <1450000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1000000>;
> +				};
> +			};
> +
> +			vdd_arm: DCDC_REG2 {
> +				regulator-name = "vdd_arm";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <712500>;
> +				regulator-max-microvolt = <1450000>;
> +				regulator-ramp-delay = <12500>;
> +
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
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_io_33: DCDC_REG4 {
> +				regulator-name = "vcc_io_33";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_18: LDO_REG1 {
> +				regulator-name = "vcc_18";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcc18_emmc: LDO_REG2 {
> +				regulator-name = "vcc18_emmc";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vdd_10: LDO_REG3 {
> +				regulator-name = "vdd_10";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1000000>;
> +				regulator-max-microvolt = <1000000>;
> +
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
> +	pmuio-supply = <&vcc_io_33>;
> +	vccio1-supply = <&vcc_io_33>;
> +	vccio2-supply = <&vcc18_emmc>;
> +	vccio3-supply = <&vcc_io_sdio>;
> +	vccio4-supply = <&vcc_18>;
> +	vccio5-supply = <&vcc_io_33>;
> +	vccio6-supply = <&vcc_io_33>;
> +	status = "okay";
> +};
> +
> +&pinctrl {
> +	button {
> +		reset_button_pin: reset-button-pin {
> +			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	ethernet-phy {

> +		eth_phy_reset_pin: reset-pin {

make something more consistant label/nodename

> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
> +		};
> +	};
> +
> +	leds {
> +		lan_led_pin: lan-led-pin {
> +			rockchip,pins = <2 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		sys_led_pin: sys-led-pin {
> +			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		wan_led_pin: wan-led-pin {
> +			rockchip,pins = <2 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pmic {
> +		pmic_int_l: pmic-int-l {
> +			rockchip,pins = <1 RK_PD0 RK_FUNC_GPIO &pcfg_pull_up>;
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
> +&pwm2 {
> +	status = "okay";
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	pinctrl-0 = <&sdmmc0_clk &sdmmc0_cmd &sdmmc0_dectn &sdmmc0_bus4>;
> +	pinctrl-names = "default";
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_sd>;
> +	vqmmc-supply = <&vcc_io_sdio>;
> +	status = "okay";
> +};
> +
> +&tsadc {
> +	rockchip,hw-tshut-mode = <0>;
> +	rockchip,hw-tshut-polarity = <0>;
> +	status = "okay";
> +};
> +
> +&u2phy {
> +	status = "okay";
> +};
> +
> +&u2phy_host {
> +	status = "okay";
> +};
> +
> +&u2phy_otg {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&usb20_otg {

Question for Robin Murphy:
Do we need this here?
Does it work without, because on my rk3318 without it is not reliable?

    dr_mode = "host"; ??

> +	status = "okay";
> +};
> +
> +&usb_host0_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host0_ohci {
> +	status = "okay";
> +};
> 

