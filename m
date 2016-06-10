From: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Subject: [PATCH 2/3] arm: dts: ls2080a: Add dis_rxdet_inp3_quirk property to USB3 node
Date: Fri, 10 Jun 2016 11:53:45 +0530
Message-ID: <1465539826-5519-3-git-send-email-rajesh.bhagat@nxp.com>
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
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 3187c82..09a0450 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -672,6 +672,7 @@
 			interrupts = <0 80 0x4>; /* Level high type */
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		usb1: usb3@3110000 {
@@ -681,6 +682,7 @@
 			interrupts = <0 81 0x4>; /* Level high type */
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		ccn@4000000 {
-- 
2.6.2.198.g614a2ac
