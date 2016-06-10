From: Rajesh Bhagat <rajesh.bhagat@nxp.com>
Subject: [PATCH 1/3] arm: dts: ls1021a: Add dis_rxdet_inp3_quirk property to USB3 node
Date: Fri, 10 Jun 2016 11:53:44 +0530
Message-ID: <1465539826-5519-2-git-send-email-rajesh.bhagat@nxp.com>
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
 arch/arm/boot/dts/ls1021a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 5ae8e92..368e219 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -626,6 +626,7 @@
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
 			dr_mode = "host";
 			snps,quirk-frame-length-adjustment = <0x20>;
+			snps,dis_rxdet_inp3_quirk;
 		};
 
 		pcie@3400000 {
-- 
2.6.2.198.g614a2ac
