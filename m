From: Jon Mason <jon.mason@broadcom.com>
Subject: [PATCH v2 6/6] arm64: dts: ns2: Add USB3 Support
Date: Wed, 26 Jul 2017 18:56:27 -0400
Message-ID: <1501109787-15489-7-git-send-email-jon.mason@broadcom.com>
References: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501109787-15489-1-git-send-email-jon.mason@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>

Add USB3 support to the Northstar2 Device tree files

Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Signed-off-by: Jon Mason <jon.mason@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/ns2-svk.dts | 16 +++++++++
 arch/arm64/boot/dts/broadcom/ns2-xmc.dts |  8 +++++
 arch/arm64/boot/dts/broadcom/ns2.dtsi    | 59 ++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/ns2-svk.dts b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
index ec19fbf928a1..7cd2ef77103f 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-svk.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-svk.dts
@@ -234,3 +234,19 @@
 		};
 	};
 };
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&usb3_phy1 {
+	status = "okay";
+};
+
+&xhci0 {
+	status = "okay";
+};
+
+&xhci1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/ns2-xmc.dts b/arch/arm64/boot/dts/broadcom/ns2-xmc.dts
index ab4ae1a32fab..8e8feb7db4ba 100644
--- a/arch/arm64/boot/dts/broadcom/ns2-xmc.dts
+++ b/arch/arm64/boot/dts/broadcom/ns2-xmc.dts
@@ -189,3 +189,11 @@
 &uart3 {
 	status = "okay";
 };
+
+&usb3_phy0 {
+	status = "okay";
+};
+
+&xhci0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/ns2.dtsi b/arch/arm64/boot/dts/broadcom/ns2.dtsi
index 35c8457e3d1f..838010f8e58b 100644
--- a/arch/arm64/boot/dts/broadcom/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/ns2.dtsi
@@ -343,6 +343,11 @@
 			      <0x660009b0 0x40>;
 		};
 
+		cdru_usb3_ctrl: cdru_usb3_ctrl@6501d144 {
+			compatible = "brcm,cdru-usb3-ctrl";
+			reg = <0x6501d144 0x4>;
+		};
+
 		gpio_aon: gpio@65024800 {
 			compatible = "brcm,iproc-gpio";
 			reg = <0x65024800 0x50>,
@@ -460,6 +465,11 @@
 			};
 		};
 
+		icfg_usb3: icfg_usb3@66000900 {
+			compatible = "brcm,icfg-usb";
+			reg = <0x66000900 0x60>;
+		};
+
 		usbdrd_phy: phy@66000960 {
 			#phy-cells = <0>;
 			compatible = "brcm,ns2-drd-phy";
@@ -501,6 +511,31 @@
 				};
 			};
 
+			mdio@1 {
+				reg = <0x1>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				usb3_phy: usb3_phy@0 {
+					compatible = "brcm,ns2-usb3-phy";
+					reg = <0x0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					usb3_phy0: usb3_phy@0 {
+						reg = <0>;
+						#phy-cells = <0>;
+						status = "disabled";
+					};
+
+					usb3_phy1: usb_phy@1 {
+						reg = <1>;
+						#phy-cells = <0>;
+						status = "disabled";
+					};
+				};
+			};
+
 			mdio@7 {
 				reg = <0x7>;
 				#address-cells = <1>;
@@ -666,6 +701,26 @@
 			reg = <0x66220000 0x28>;
 		};
 
+		xhci0: usb@66300000 {
+			compatible = "generic-xhci";
+			reg = <0x66300000 0x1000>;
+			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb3_phy0>;
+			phy-names = "usb";
+			dma-coherent;
+			status = "disabled";
+		};
+
+		xhci1: usb@66310000 {
+			compatible = "generic-xhci";
+			reg = <0x66310000 0x1000>;
+			interrupts = <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>;
+			phys = <&usb3_phy1>;
+			phy-names = "usb";
+			dma-coherent;
+			status = "disabled";
+		};
+
 		sata_phy: sata_phy@663f0100 {
 			compatible = "brcm,iproc-ns2-sata-phy";
 			reg = <0x663f0100 0x1f00>,
@@ -761,5 +816,9 @@
 			#size-cells = <0>;
 		};
 
+		usb3_idm: idm@67000000 {
+			compatible = "brcm,usb3-idm";
+			reg = <0x67000000 0x2000>;
+		};
 	};
 };
-- 
2.7.4
