From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v5 3/3] arm64: dts: Add USB DT nodes for Stingray SoC
Date: Tue, 12 Mar 2019 21:36:21 +0530
Message-ID: <1552406781-5180-4-git-send-email-srinath.mannam@broadcom.com>
References: <1552406781-5180-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1552406781-5180-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tejun Heo <tj@kernel.org>, Jayachandran C <jnair@caviumnetworks.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

Add DT nodes for
  - Two xHCI host controllers
  - Two BDC Broadcom USB device controller
  - Five USB PHY controllers

[xHCI0]      [BDC0]            [xHCI1]            [BDC1]
   |           |                  |                 |
  ---------------               -----------------------
   |           |                 |         |         |
[SS-PHY0]   [HS-PHY0]        [SS-PHY1] [HS-PHY2] [HS-PHY1]

[SS-PHY0/HS-PHY0] and [SS-PHY1/HS-PHY1] are combo PHYs has one SS and
one HS PHYs. [HS-PHY2] is a single HS PHY.

xHCI use SS-PHY to detect SS devices and HS-PHY to detect HS/FS/LS
devices. BDC use SS-PHY in SS mode and HS-PHY in HS mode.

xHCI0 port1 is SS-PHY0, port2 is HS-PHY0.
xHCI1 port1 is SS-PHY1, port2 is HS-PHY2 and port3 is HS-PHY1.

Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
---
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   | 78 ++++++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
new file mode 100644
index 0000000..a5d3354
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: (GPL-2.0 or BSD-3-Clause)
+/*
+ *Copyright(c) 2018 Broadcom
+ */
+	usb {
+		compatible = "simple-bus";
+		dma-ranges;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x68500000 0x00400000>;
+
+		usbphy0: usb-phy@0 {
+			compatible = "brcm,sr-usb-combo-phy";
+			reg = <0x00000000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		xhci0: usb@1000 {
+			compatible = "generic-xhci";
+			reg = <0x00001000 0x1000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy0 1>, <&usbphy0 0>;
+			phy-names = "phy0", "phy1";
+			dma-coherent;
+			status = "disabled";
+		};
+
+		bdc0: usb@2000 {
+			compatible = "brcm,bdc-v0.16";
+			reg = <0x00002000 0x1000>;
+			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy0 0>, <&usbphy0 1>;
+			phy-names = "phy0", "phy1";
+			dma-coherent;
+			status = "disabled";
+		};
+
+		usbphy1: usb-phy@10000 {
+			compatible = "brcm,sr-usb-combo-phy";
+			reg = <0x00010000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbphy2: usb-phy@20000 {
+			compatible = "brcm,sr-usb-hs-phy";
+			reg = <0x00020000 0x100>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		xhci1: usb@11000 {
+			compatible = "generic-xhci";
+			reg = <0x00011000 0x1000>;
+			interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy1 1>, <&usbphy2>, <&usbphy1 0>;
+			phy-names = "phy0", "phy1", "phy2";
+			dma-coherent;
+			status = "disabled";
+		};
+
+		bdc1: usb@21000 {
+			compatible = "brcm,bdc-v0.16";
+			reg = <0x00021000 0x1000>;
+			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usbphy2>;
+			phy-names = "phy0";
+			dma-coherent;
+			status = "disabled";
+		};
+	};
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index cfeaa85..21dbb12 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -287,6 +287,7 @@
 	#include "stingray-fs4.dtsi"
 	#include "stingray-sata.dtsi"
 	#include "stingray-pcie.dtsi"
+	#include "stingray-usb.dtsi"
 
 	hsls {
 		compatible = "simple-bus";
-- 
2.7.4
