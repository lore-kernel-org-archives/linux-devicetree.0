From: Peng Ma <peng.ma@nxp.com>
Subject: [PATCH] arm64: dts: ls1028a: Enable sata.
Date: Fri, 24 May 2019 15:30:22 +0800
Message-ID: <20190524073022.32174-1-peng.ma@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Peng Ma <peng.ma@nxp.com>
List-Id: devicetree@vger.kernel.org

Change the sata node to enable sata.

Signed-off-by: Peng Ma <peng.ma@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts |    4 ++++
 arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts |    4 ++++
 2 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
index b359068..4ed1828 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dts
@@ -153,3 +153,7 @@
 &sai1 {
 	status = "okay";
 };
+
+&sata {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
index f9c272f..4a203f7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dts
@@ -151,3 +151,7 @@
 &sai4 {
 	status = "okay";
 };
+
+&sata {
+	status = "okay";
+};
-- 
1.7.1
