Return-Path: <SRS0=NyTY=AY=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62166C433E2
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 16:17:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3591B20738
	for <linux-devicetree@archiver.kernel.org>; Mon, 13 Jul 2020 16:17:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ZQubrxGg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730094AbgGMQRV (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 13 Jul 2020 12:17:21 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:5232 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729027AbgGMQRV (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 13 Jul 2020 12:17:21 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f0c89040000>; Mon, 13 Jul 2020 09:17:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 13 Jul 2020 09:17:20 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 13 Jul 2020 09:17:20 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 13 Jul
 2020 16:17:20 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Mon, 13 Jul 2020 16:17:20 +0000
Received: from moonraker.nvidia.com (Not Verified[10.26.72.101]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f0c890e0001>; Mon, 13 Jul 2020 09:17:20 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        <devicetree@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH] arm64: tegra: Add support for Jetson Xavier NX
Date:   Mon, 13 Jul 2020 17:17:01 +0100
Message-ID: <20200713161701.30449-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200712102506.23686-2-jonathanh@nvidia.com>
References: <20200712102506.23686-2-jonathanh@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1594657028; bh=Qde7kPc2vWQWe8U6XmYFr7/fk5VSRdfOhkTtPgynSVE=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:X-NVConfidentiality:MIME-Version:
         Content-Type;
        b=ZQubrxGg7O3u0G8tqb+KfazlrG3YHmHtDc0rqM6V52t0X6AuW0B2jSJ8jzIYBg1YR
         0oM1TnzbQlNAiT7dBBQLpn/hTKEZNlz1PWfz+wIzlq0ucG2xA2mmtRBnQ9kYPcz0o1
         ANTM3a7LNIVTCux55JNU4xSIjXYda9E6X9+dqyMy4ZvZp/Ibanmje7uvUATgtu6eTR
         iesCyzFkL43pTRc/wm9xQEYqinh2xOkuEFdxCxB3mpybWAyXPoFk/Q96MIyFMWwQaI
         RAeXVecXEInLdlRHRPcW5yT6JCHBbes365nk+uDzjGnekA+WWQmRMeHvGPXKKzIBXi
         c8pqu6xPII8sQ==
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add the device-tree source files for the Tegra194 Jetson Xavier NX
Developer Kit. The Xavier NX Developer Kit consists of a small form
factor system-on-module (SOM) board (part number p3668-0000) and a
carrier board (part number p3509-0000).

The Xavier NX Developer Kit SOM features a micro-SD card slot,
however, there is also a variant of the SOM available that features a
16GB eMMC. Given that the carrier board can be used with the different
SOM variants, that have different part numbers, both the compatible
string and file name of the device-tree source file for the Developer
Kit is a concatenation of the SOM and carrier board part numbers.

This is based upon some initial work by Thierry Reding
<treding@nvidia.com>.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

I have updated the author and given credit to Thierry for doing the
initial work on the change.

 arch/arm64/boot/dts/nvidia/Makefile           |   1 +
 .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 343 ++++++++++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 296 +++++++++++++++
 3 files changed, 640 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvidia/Makefile
index bcd018c3162b..2273fc5db19c 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -8,3 +8,4 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-smaug.dtb
 dtb-$(CONFIG_ARCH_TEGRA_210_SOC) += tegra210-p2894-0050-a08.dtb
 dtb-$(CONFIG_ARCH_TEGRA_186_SOC) += tegra186-p2771-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p2972-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_194_SOC) += tegra194-p3509-0000+p3668-0000.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
new file mode 100644
index 000000000000..5b3dde25f6f8
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0000.dts
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/input/gpio-keys.h>
+
+#include "tegra194-p3668-0000.dtsi"
+
+/ {
+	model = "NVIDIA Jetson Xavier NX Developer Kit";
+	compatible = "nvidia,p3509-0000+p3668-0000", "nvidia,tegra194";
+
+	bus@0 {
+		aconnect@2900000 {
+			status = "okay";
+
+			dma-controller@2930000 {
+				status = "okay";
+			};
+
+			interrupt-controller@2a40000 {
+				status = "okay";
+			};
+		};
+
+		ddc: i2c@3190000 {
+			status = "okay";
+		};
+
+		hda@3510000 {
+			nvidia,model = "jetson-xaviernx-hda";
+			status = "okay";
+		};
+
+		padctl@3520000 {
+			status = "okay";
+
+			pads {
+				usb2 {
+					lanes {
+						usb2-1 {
+							status = "okay";
+						};
+
+						usb2-2 {
+							status = "okay";
+						};
+					};
+				};
+
+				usb3 {
+					lanes {
+						usb3-2 {
+							status = "okay";
+						};
+					};
+				};
+			};
+
+			ports {
+				usb2-1 {
+					mode = "host";
+					status = "okay";
+				};
+
+				usb2-2 {
+					mode = "host";
+					vbus-supply = <&vdd_5v0_sys>;
+					status = "okay";
+				};
+
+				usb3-2 {
+					nvidia,usb2-companion = <1>;
+					vbus-supply = <&vdd_5v0_sys>;
+					status = "okay";
+				};
+			};
+		};
+
+		usb@3610000 {
+			status = "okay";
+
+			phys =	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-2}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>;
+			phy-names = "usb2-1", "usb2-2", "usb3-2";
+		};
+
+		pwm@32d0000 {
+			status = "okay";
+		};
+
+		host1x@13e00000 {
+			display-hub@15200000 {
+				status = "okay";
+			};
+
+			dpaux@155c0000 {
+				status = "okay";
+			};
+
+			dpaux@155d0000 {
+				status = "okay";
+			};
+
+			/* DP0 */
+			sor@15b00000 {
+				status = "okay";
+
+				avdd-io-hdmi-dp-supply = <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply = <&vdd_1v8hs>;
+
+				nvidia,dpaux = <&dpaux0>;
+			};
+
+			/* HDMI */
+			sor@15b40000 {
+				status = "okay";
+
+				avdd-io-hdmi-dp-supply = <&vdd_1v0>;
+				vdd-hdmi-dp-pll-supply = <&vdd_1v8hs>;
+				hdmi-supply = <&vdd_hdmi>;
+
+				nvidia,ddc-i2c-bus = <&ddc>;
+				nvidia,hpd-gpio = <&gpio TEGRA194_MAIN_GPIO(M, 1)
+							 GPIO_ACTIVE_LOW>;
+			};
+		};
+	};
+
+	pcie@14160000 {
+		status = "okay";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		phys = <&p2u_hsio_11>;
+		phy-names = "p2u-0";
+	};
+
+	pcie@141a0000 {
+		status = "okay";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+
+		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+			    "p2u-5", "p2u-6", "p2u-7";
+	};
+
+	pcie_ep@141a0000 {
+		status = "disabled";
+
+		vddio-pex-ctl-supply = <&vdd_1v8ao>;
+
+		reset-gpios = <&gpio TEGRA194_MAIN_GPIO(GG, 1) GPIO_ACTIVE_LOW>;
+
+		nvidia,refclk-select-gpios = <&gpio_aon TEGRA194_AON_GPIO(AA, 5)
+					      GPIO_ACTIVE_HIGH>;
+
+		phys = <&p2u_nvhs_0>, <&p2u_nvhs_1>, <&p2u_nvhs_2>,
+		       <&p2u_nvhs_3>, <&p2u_nvhs_4>, <&p2u_nvhs_5>,
+		       <&p2u_nvhs_6>, <&p2u_nvhs_7>;
+
+		phy-names = "p2u-0", "p2u-1", "p2u-2", "p2u-3", "p2u-4",
+			    "p2u-5", "p2u-6", "p2u-7";
+	};
+
+	fan: fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm6 0 45334>;
+
+		cooling-levels = <0 64 128 255>;
+		#cooling-cells = <2>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		force-recovery {
+			label = "Force Recovery";
+			gpios = <&gpio TEGRA194_MAIN_GPIO(G, 0)
+				       GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_SLEEP>;
+			debounce-interval = <10>;
+		};
+
+		power {
+			label = "Power";
+			gpios = <&gpio_aon TEGRA194_AON_GPIO(EE, 4)
+					   GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_KEY>;
+			linux,code = <KEY_POWER>;
+			debounce-interval = <10>;
+			wakeup-event-action = <EV_ACT_ASSERTED>;
+			wakeup-source;
+		};
+	};
+
+	regulators {
+		vdd_5v0_sys: regulator@100 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_5V_SYS";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_3v3_sys: regulator@101 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_3V3_SYS";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_3v3_ao: regulator@102 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_3V3_AO";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_1v8: regulator@103 {
+			compatible = "regulator-fixed";
+			reg = <0>;
+
+			regulator-name = "VDD_1V8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+
+		vdd_hdmi: regulator@104 {
+			compatible = "regulator-fixed";
+			reg = <1>;
+
+			regulator-name = "VDD_5V0_HDMI_CON";
+			regulator-min-microvolt = <5000000>;
+			regulator-max-microvolt = <5000000>;
+			regulator-always-on;
+			regulator-boot-on;
+		};
+	};
+
+	thermal-zones {
+		cpu {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				cpu_trip_critical: critical {
+					temperature = <96500>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+
+				cpu_trip_hot: hot {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "hot";
+				};
+
+				cpu_trip_active: active {
+					temperature = <50000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+
+				cpu_trip_passive: passive {
+					temperature = <30000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+			};
+
+			cooling-maps {
+				cpu-critical {
+					cooling-device = <&fan 3 3>;
+					trip = <&cpu_trip_critical>;
+				};
+
+				cpu-hot {
+					cooling-device = <&fan 2 2>;
+					trip = <&cpu_trip_hot>;
+				};
+
+				cpu-active {
+					cooling-device = <&fan 1 1>;
+					trip = <&cpu_trip_active>;
+				};
+
+				cpu-passive {
+					cooling-device = <&fan 0 0>;
+					trip = <&cpu_trip_passive>;
+				};
+			};
+		};
+
+		gpu {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				gpu_alert0: critical {
+					temperature = <99000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		aux {
+			polling-delay = <0>;
+			polling-delay-passive = <500>;
+			status = "okay";
+
+			trips {
+				aux_alert0: critical {
+					temperature = <90000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
new file mode 100644
index 000000000000..4e08b2619d6d
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0000.dtsi
@@ -0,0 +1,296 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "tegra194.dtsi"
+
+#include <dt-bindings/mfd/max77620.h>
+
+/ {
+	model = "NVIDIA Jetson Xavier NX";
+	compatible = "nvidia,p3668-0000", "nvidia,tegra194";
+
+	aliases {
+		ethernet0 = "/cbb@0/ethernet@2490000";
+		i2c0 = "/bpmp/i2c";
+		i2c1 = "/cbb@0/i2c@3160000";
+		i2c2 = "/cbb@0/i2c@c240000";
+		i2c3 = "/cbb@0/i2c@3180000";
+		i2c4 = "/cbb@0/i2c@3190000";
+		i2c5 = "/cbb@0/i2c@31c0000";
+		i2c6 = "/cbb@0/i2c@c250000";
+		i2c7 = "/cbb@0/i2c@31e0000";
+		rtc0 = "/bpmp/i2c/pmic@3c";
+		rtc1 = "/rtc@c2a0000";
+		mmc0 = "/cbb@0/mmc@3460000";
+		serial0 = &tcu;
+	};
+
+	chosen {
+		bootargs = "console=ttyS0,115200n8";
+		stdout-path = "serial0:115200n8";
+	};
+
+	bus@0 {
+		ethernet@2490000 {
+			status = "okay";
+
+			phy-reset-gpios = <&gpio TEGRA194_MAIN_GPIO(R, 1) GPIO_ACTIVE_LOW>;
+			phy-handle = <&phy>;
+			phy-mode = "rgmii-id";
+
+			mdio {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				phy: phy@0 {
+					compatible = "ethernet-phy-ieee802.3-c22";
+					reg = <0x0>;
+					interrupt-parent = <&gpio>;
+					interrupts = <TEGRA194_MAIN_GPIO(G, 4) IRQ_TYPE_LEVEL_LOW>;
+				};
+			};
+		};
+
+		memory-controller@2c00000 {
+			status = "okay";
+		};
+
+		serial@c280000 {
+			status = "okay";
+		};
+
+		/* SDMMC1 (SD/MMC) */
+		mmc@3400000 {
+			status = "okay";
+			disable-wp;
+			bus-width = <4>;
+			cd-gpios = <&gpio TEGRA194_MAIN_GPIO(G, 7) GPIO_ACTIVE_LOW>;
+			vmmc-supply = <&vdd_3v3_sd>;
+		};
+
+		padctl@3520000 {
+			avdd-usb-supply = <&vdd_usb_3v3>;
+			vclamp-usb-supply = <&vdd_1v8ao>;
+
+			ports {
+				usb2-1 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb2-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb3-0 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+
+				usb3-3 {
+					vbus-supply = <&vdd_5v0_sys>;
+				};
+			};
+		};
+
+		rtc@c2a0000 {
+			status = "okay";
+		};
+
+		pmc@c360000 {
+			nvidia,invert-interrupt;
+		};
+	};
+
+	bpmp {
+		i2c {
+			status = "okay";
+
+			pmic: pmic@3c {
+				compatible = "maxim,max20024";
+				reg = <0x3c>;
+
+				interrupts = <GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>;
+				#interrupt-cells = <2>;
+				interrupt-controller;
+
+				#gpio-cells = <2>;
+				gpio-controller;
+
+				pinctrl-names = "default";
+				pinctrl-0 = <&max20024_default>;
+
+				max20024_default: pinmux {
+					gpio0 {
+						pins = "gpio0";
+						function = "gpio";
+					};
+
+					gpio1 {
+						pins = "gpio1";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio2 {
+						pins = "gpio2";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio3 {
+						pins = "gpio3";
+						function = "fps-out";
+						maxim,active-fps-source = <MAX77620_FPS_SRC_DEF>;
+					};
+
+					gpio4 {
+						pins = "gpio4";
+						function = "32k-out1";
+						drive-push-pull = <1>;
+					};
+
+					gpio6 {
+						pins = "gpio6";
+						function = "gpio";
+						drive-push-pull = <1>;
+					};
+
+					gpio7 {
+						pins = "gpio7";
+						function = "gpio";
+						drive-push-pull = <0>;
+					};
+				};
+
+				fps {
+					fps0 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us = <640>;
+					};
+
+					fps1 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN1>;
+						maxim,shutdown-fps-time-period-us = <640>;
+						maxim,device-state-on-disabled-event = <MAX77620_FPS_INACTIVE_STATE_SLEEP>;
+					};
+
+					fps2 {
+						maxim,fps-event-source = <MAX77620_FPS_EVENT_SRC_EN0>;
+						maxim,shutdown-fps-time-period-us = <640>;
+					};
+				};
+
+				regulators {
+					in-sd0-supply = <&vdd_5v0_sys>;
+					in-sd1-supply = <&vdd_5v0_sys>;
+					in-sd2-supply = <&vdd_5v0_sys>;
+					in-sd3-supply = <&vdd_5v0_sys>;
+					in-sd4-supply = <&vdd_5v0_sys>;
+
+					in-ldo0-1-supply = <&vdd_5v0_sys>;
+					in-ldo2-supply = <&vdd_5v0_sys>;
+					in-ldo3-5-supply = <&vdd_5v0_sys>;
+					in-ldo4-6-supply = <&vdd_5v0_sys>;
+					in-ldo7-8-supply = <&vdd_1v8ls>;
+
+					vdd_1v0: sd0 {
+						regulator-name = "VDDIO_SYS_1V0";
+						regulator-min-microvolt = <1000000>;
+						regulator-max-microvolt = <1000000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8hs: sd1 {
+						regulator-name = "VDDIO_SYS_1V8HS";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8ls: sd2 {
+						regulator-name = "VDDIO_SYS_1V8LS";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					vdd_1v8ao: sd3 {
+						regulator-name = "VDDIO_AO_1V8";
+						regulator-min-microvolt = <1800000>;
+						regulator-max-microvolt = <1800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					sd4 {
+						regulator-name = "VDD_DDR_1V1";
+						regulator-min-microvolt = <1100000>;
+						regulator-max-microvolt = <1100000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo0 {
+						regulator-name = "VDD_RTC";
+						regulator-min-microvolt = <800000>;
+						regulator-max-microvolt = <800000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo2 {
+						regulator-name = "VDDIO_AO_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo3 {
+						regulator-name = "VDD_EMMC_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					vdd_usb_3v3: ldo5 {
+						regulator-name = "VDD_USB_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+						regulator-always-on;
+						regulator-boot-on;
+					};
+
+					ldo6 {
+						regulator-name = "VDD_SDIO_3V3";
+						regulator-min-microvolt = <3300000>;
+						regulator-max-microvolt = <3300000>;
+					};
+
+					ldo7 {
+						regulator-name = "AVDD_CSI_1V2";
+						regulator-min-microvolt = <1200000>;
+						regulator-max-microvolt = <1200000>;
+					};
+				};
+			};
+		};
+	};
+
+	regulators {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		vdd_3v3_sd: regulator@0 {
+			compatible = "regulator-fixed";
+			reg = <2>;
+
+			regulator-name = "VDD_3V3_SD";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			gpio = <&gpio TEGRA194_MAIN_GPIO(G, 2) GPIO_ACTIVE_HIGH>;
+			regulator-boot-on;
+			enable-active-high;
+		};
+	};
+};
-- 
2.17.1

