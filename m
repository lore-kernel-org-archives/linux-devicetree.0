From: Xiaowei Bao <xiaowei.bao@nxp.com>
Subject: [PATCH] powerpc: dts: Fix the bug that intx interrupt not work in P1010RDB-PB
Date: Mon, 20 May 2019 13:53:08 +0800
Message-ID: <20190520055308.43907-1-xiaowei.bao@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, minghuan.lian@nxp.com, mingkai.hu@nxp.com, zhiqiang.hou@nxp.com, leoyang.li@nxp.com
Cc: Xiaowei Bao <xiaowei.bao@nxp.com>
List-Id: devicetree@vger.kernel.org

Due to the INTA is shared with the active-low PHY2 interrupt on P1010RDB-PA
board, so configure P1010RDB-PA's INTA with polarity as active-low, the
P1010RDB-PB board is used separately, so configure P1010RDB-PB's INTA with
polarity as active-high.
The INTX in P1010RDB-PB do not work because of the pcie@0 node fixup will be
overwrited by p1010si-post.dtsi file, so we move the pcie@0 node fixup to
p1010rdb-pb.dts and p1010rdb-pb_36b.dts.

Signed-off-by: Xiaowei Bao <xiaowei.bao@nxp.com>
---
 arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts     |   16 ++++++++++++++++
 arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts |   16 ++++++++++++++++
 arch/powerpc/boot/dts/fsl/p1010rdb.dtsi       |   16 ----------------
 3 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts b/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
index 37681fd..6d75e5f 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb.dts
@@ -33,3 +33,19 @@
 };
 
 /include/ "p1010si-post.dtsi"
+
+&pci0 {
+	pcie@0 {
+		interrupt-map = <
+			/* IDSEL 0x0 */
+			/*
+			 *irq[4:5] are active-high
+			 *irq[6:7] are active-low
+			 */
+			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
+			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
+			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
+			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
+			>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
index 4cf255f..8359035 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dts
@@ -56,3 +56,19 @@
 };
 
 /include/ "p1010si-post.dtsi"
+
+&pci0 {
+	pcie@0 {
+		interrupt-map = <
+			/* IDSEL 0x0 */
+			/*
+			 *irq[4:5] are active-high
+			 *irq[6:7] are active-low
+			 */
+			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
+			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
+			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
+			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
+			>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
index 2ca9cee..ef49a7d 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb.dtsi
@@ -215,19 +215,3 @@
 		phy-connection-type = "sgmii";
 	};
 };
-
-&pci0 {
-	pcie@0 {
-		interrupt-map = <
-			/* IDSEL 0x0 */
-			/*
-			 *irq[4:5] are active-high
-			 *irq[6:7] are active-low
-			 */
-			0000 0x0 0x0 0x1 &mpic 0x4 0x2 0x0 0x0
-			0000 0x0 0x0 0x2 &mpic 0x5 0x2 0x0 0x0
-			0000 0x0 0x0 0x3 &mpic 0x6 0x1 0x0 0x0
-			0000 0x0 0x0 0x4 &mpic 0x7 0x1 0x0 0x0
-			>;
-	};
-};
-- 
1.7.1
