From: Yuan Yao <yao.yuan@freescale.com>
Subject: [PATCH v3 3/4] dts/ls2080a: update the DTS for QSPI and DSPI support
Date: Thu, 21 Jan 2016 15:09:17 +0800
Message-ID: <1453360158-34236-3-git-send-email-yao.yuan@freescale.com>
References: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1453360158-34236-1-git-send-email-yao.yuan@freescale.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, robh@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, galak@codeaurora.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, yao.yuan@nxp.com
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
Changed in v3:
No changes.

Changed in v2:
Update my email to <yao.yuan@nxp.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts | 9 ++++++++-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi    | 4 ++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
index 4cb996d..e8801fa 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a-qds.dts
@@ -178,7 +178,14 @@
 
 &qspi {
 	status = "okay";
-	qflash0: s25fl008k {
+	flash0: s25fl256s1@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "st,m25p80";
+		spi-max-frequency = <20000000>;
+		reg = <0>;
+	};
+	flash2: s25fl256s1@2 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "st,m25p80";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 2b23d03..65e612a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -318,7 +318,7 @@
 
 		dspi: dspi@2100000 {
 			status = "disabled";
-			compatible = "fsl,vf610-dspi";
+			compatible = "fsl,ls2080a-dspi", "fsl,ls2085a-dspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x2100000 0x0 0x10000>;
@@ -444,7 +444,7 @@
 
 		qspi: quadspi@20c0000 {
 			status = "disabled";
-			compatible = "fsl,vf610-qspi";
+			compatible = "fsl,ls2080a-qspi", "fsl,ls1021a-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x20c0000 0x0 0x10000>,
-- 
2.1.0.27.g96db324
