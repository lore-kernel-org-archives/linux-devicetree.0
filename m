From: Sriram Dash <sriram.dash@nxp.com>
Subject: [PATCH 2/2] arm64: dts: ls1043a: Enable USB 3.0 phy driver
Date: Mon, 14 Nov 2016 10:56:55 +0530
Message-ID: <1479101215-26954-3-git-send-email-sriram.dash@nxp.com>
References: <1479101215-26954-1-git-send-email-sriram.dash@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479101215-26954-1-git-send-email-sriram.dash@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, stern@rowland.harvard.edu, pku.leo@gmail.com, mathias.nyman@intel.com, gregkh@linuxfoundation.org, suresh.gupta@nxp.com, felipe.balbi@linux.intel.com, Sriram Dash <sriram.dash@nxp.com>
List-Id: devicetree@vger.kernel.org

This patch adds entries in dts to enable USB 3.0 PHY driver.

Signed-off-by: Sriram Dash <sriram.dash@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 33 ++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 97d331e..c87fc16 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -475,11 +475,40 @@
 				 <&clockgen 4 0>;
 		};
 
+		usbphy0: usb3-phy@084f0000 {
+			compatible = "fsl,qoriq-usb3-phy";
+			reg = <0x0 0x01570070 0x0 0xC>,
+			      <0x0 0x084F0000 0x0 0x5000>;
+			reg-names = "param_ctrl", "phy_base";
+			#phy-cells = <0>;
+			phy_type = "utmi";
+		};
+
+		usbphy1: usb3-phy@08500000 {
+			compatible = "fsl,qoriq-usb3-phy";
+			reg = <0x0 0x0157007C 0x0 0xC>,
+			      <0x0 0x08500000 0x0 0x5000>;
+			reg-names = "param_ctrl", "phy_base";
+			#phy-cells = <0>;
+			phy_type = "utmi";
+		};
+
+		usbphy2: usb3-phy@08510000 {
+			compatible = "fsl,qoriq-usb3-phy";
+			reg = <0x0 0x01570088 0x0 0xC>,
+			      <0x0 0x08510000 0x0 0x5000>;
+			reg-names = "param_ctrl", "phy_base";
+			#phy-cells = <0>;
+			phy_type = "utmi";
+		};
+
 		usb0: usb3@2f00000 {
 			compatible = "snps,dwc3";
 			reg = <0x0 0x2f00000 0x0 0x10000>;
 			interrupts = <0 60 0x4>;
 			dr_mode = "host";
+			phys = <&usbphy0>;
+			phy-names = "usb3-phy";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
 		};
@@ -489,6 +518,8 @@
 			reg = <0x0 0x3000000 0x0 0x10000>;
 			interrupts = <0 61 0x4>;
 			dr_mode = "host";
+			phys = <&usbphy1>;
+			phy-names = "usb3-phy";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
 		};
@@ -498,6 +529,8 @@
 			reg = <0x0 0x3100000 0x0 0x10000>;
 			interrupts = <0 63 0x4>;
 			dr_mode = "host";
+			phys = <&usbphy2>;
+			phy-names = "usb3-phy";
 			snps,quirk-frame-length-adjustment = <0x20>;
 			snps,dis_rxdet_inp3_quirk;
 		};
-- 
2.1.0
