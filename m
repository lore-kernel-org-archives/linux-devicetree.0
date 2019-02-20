From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v4 3/3] arm64: dts: Add USB DT nodes for Stingray SoC
Date: Wed, 20 Feb 2019 16:04:02 +0530
Message-ID: <1550658842-19167-4-git-send-email-srinath.mannam@broadcom.com>
References: <1550658842-19167-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550658842-19167-1-git-send-email-srinath.mannam@broadcom.com>
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
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../boot/dts/broadcom/stingray/stingray-usb.dtsi   | 95 ++++++++++++++++++++++
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |  1 +
 2 files changed, 96 insertions(+)
 create mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
new file mode 100644
index 0000000..c0748ee
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi
@@ -0,0 +1,95 @@
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
+			status = "disabled";
+
+			usb0_phy0: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+			usb0_phy1: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+		};
+
+		xhci0: usb@1000 {
+			compatible = "generic-xhci";
+			reg = <0x00001000 0x1000>;
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb0_phy1>, <&usb0_phy0>;
+			phy-names = "phy0", "phy1";
+			dma-coherent;
+			status = "disabled";
+		};
+
+		bdc0: usb@2000 {
+			compatible = "brcm,bdc-v0.16";
+			reg = <0x00002000 0x1000>;
+			interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb0_phy1>, <&usb0_phy0>;
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
+			status = "disabled";
+
+			usb1_phy0: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+			usb1_phy1: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
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
+			phys = <&usb1_phy1>, <&usbphy2>, <&usb1_phy0>;
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
