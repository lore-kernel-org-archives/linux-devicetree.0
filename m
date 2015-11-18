From: Ray Jui <rjui@broadcom.com>
Subject: [PATCH] ARM: dts: enable PCIe PHY support for Cygnus
Date: Wed, 18 Nov 2015 10:16:59 -0800
Message-ID: <1447870619-2828-2-git-send-email-rjui@broadcom.com>
References: <1447870619-2828-1-git-send-email-rjui@broadcom.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1447870619-2828-1-git-send-email-rjui@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>
List-Id: devicetree@vger.kernel.org

Enable PCIe PHY for both PCIe root complexes on Cygnus

Signed-off-by: Ray Jui <rjui@broadcom.com>
---
 arch/arm/boot/dts/bcm-cygnus.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/bcm-cygnus.dtsi b/arch/arm/boot/dts/bcm-cygnus.dtsi
index 2778533..5df5300 100644
--- a/arch/arm/boot/dts/bcm-cygnus.dtsi
+++ b/arch/arm/boot/dts/bcm-cygnus.dtsi
@@ -91,6 +91,21 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 
+		pcie_phy: phy@0301d0a0 {
+			compatible = "brcm,cygnus-pcie-phy";
+			reg = <0x0301d0a0 0x14>;
+
+			pcie0_phy: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			pcie1_phy: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+		};
+
 		pinctrl: pinctrl@0x0301d0c8 {
 			compatible = "brcm,cygnus-pinmux";
 			reg = <0x0301d0c8 0x30>,
@@ -161,6 +176,9 @@
 			ranges = <0x81000000 0 0	  0x28000000 0 0x00010000
 				  0x82000000 0 0x20000000 0x20000000 0 0x04000000>;
 
+			phys = <&pcie0_phy>;
+			phy-names = "pcie-phy";
+
 			status = "disabled";
 		};
 
@@ -182,6 +200,9 @@
 			ranges = <0x81000000 0 0	  0x48000000 0 0x00010000
 				  0x82000000 0 0x40000000 0x40000000 0 0x04000000>;
 
+			phys = <&pcie1_phy>;
+			phy-names = "pcie-phy";
+
 			status = "disabled";
 		};
 
-- 
1.9.1
