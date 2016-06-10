From: Sriram Dash <sriram.dash@nxp.com>
Subject: [PATCH] powerpc: dts: t1040si: Change T1040si USB controller version
Date: Fri, 10 Jun 2016 13:36:56 +0530
Message-ID: <1465546016-22073-1-git-send-email-sriram.dash@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: robh@kernel.org, benh@kernel.crashing.org, rajesh.bhagat@nxp.com, Sriram Dash <sriram.dash@freescale.com>, Sriram Dash <sriram.dash@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Sriram Dash <sriram.dash@freescale.com>

Change USB controller version name to 2.5 in compatible string for T1040

Signed-off-by: Sriram Dash <sriram.dash@nxp.com>
---
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
index 507649e..d3fbe72 100644
--- a/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
+++ b/arch/powerpc/boot/dts/fsl/t1040si-post.dtsi
@@ -607,7 +607,7 @@
 /include/ "qoriq-gpio-3.dtsi"
 /include/ "qoriq-usb2-mph-0.dtsi"
 		usb0: usb@210000 {
-			compatible = "fsl-usb2-mph-v2.4", "fsl-usb2-mph";
+			compatible = "fsl-usb2-mph-v2.5", "fsl-usb2-mph";
 			fsl,iommu-parent = <&pamu0>;
 			fsl,liodn-reg = <&guts 0x520>; /* USB1LIODNR */
 			phy_type = "utmi";
@@ -615,7 +615,7 @@
 		};
 /include/ "qoriq-usb2-dr-0.dtsi"
 		usb1: usb@211000 {
-			compatible = "fsl-usb2-dr-v2.4", "fsl-usb2-dr";
+			compatible = "fsl-usb2-dr-v2.5", "fsl-usb2-dr";
 			fsl,iommu-parent = <&pamu0>;
 			fsl,liodn-reg = <&guts 0x524>; /* USB2LIODNR */
 			dr_mode = "host";
-- 
2.6.2.198.g614a2ac
