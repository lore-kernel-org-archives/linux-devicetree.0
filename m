From: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] dts/ls2080a: update the DTS for QSPI and DSPI support
Date: Fri, 30 Oct 2015 20:01:31 +0800
Message-ID: <1446206491-35741-1-git-send-email-yao.yuan@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mark.rutland-5wv7dgnIgG8@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, bhupesh.sharma-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Yuan Yao <yao.yuan-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
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
index e81cd48..fd82908 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -250,7 +250,7 @@
 
 		dspi: dspi@2100000 {
 			status = "disabled";
-			compatible = "fsl,vf610-dspi";
+			compatible = "fsl,ls2080a-dspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x2100000 0x0 0x10000>;
@@ -371,7 +371,7 @@
 
 		qspi: quadspi@20c0000 {
 			status = "disabled";
-			compatible = "fsl,vf610-qspi";
+			compatible = "fsl,ls2080a-qspi", "fsl,ls1021a-qspi";
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x0 0x20c0000 0x0 0x10000>,
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
