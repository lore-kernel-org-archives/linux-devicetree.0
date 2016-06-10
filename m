From: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Subject: [PATCH 3/3] arm: dts: ls1043a: Add dis_rxdet_inp3_quirk property to USB3 node
Date: Fri, 10 Jun 2016 11:53:46 +0530
Message-ID: <1465539826-5519-4-git-send-email-rajesh.bhagat@nxp.com>
References: <1465539826-5519-1-git-send-email-rajesh.bhagat@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465539826-5519-1-git-send-email-rajesh.bhagat@nxp.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: shawnguo@kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, sriram.dash@nxp.com, Rajesh Bhagat <rajesh.bhagat@nxp.com>
List-Id: devicetree@vger.kernel.org

Add "dis_rxdet_inp3_quirk" boolean property to USB3 node. This property
is used to disable rx detection in P3 PHY mode.

Signed-off-by: Rajesh Bhagat <rajesh.bhagat@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index de0323b..ba30f02 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -422,6 +422,7 @@
 			interrupts = <0 60 0x4>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		usb1: usb3@3000000 {
@@ -430,6 +431,7 @@
 			interrupts = <0 61 0x4>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		usb2: usb3@3100000 {
@@ -438,6 +440,7 @@
 			interrupts = <0 63 0x4>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		sata: sata@3200000 {
-- 
2.6.2.198.g614a2ac
