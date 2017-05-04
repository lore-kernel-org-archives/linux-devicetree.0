From: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Subject: [v2, 3/5] arm64: dts: ls208xa: support SD UHS-I on RDB and eMMC HS200 on QDS
Date: Thu, 4 May 2017 18:48:58 +0800
Message-ID: <1493894940-47452-4-git-send-email-yangbo.lu@nxp.com>
References: <1493894940-47452-1-git-send-email-yangbo.lu@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493894940-47452-1-git-send-email-yangbo.lu-3arQi8VN3Tc@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>
Cc: Xiaobo Xie <xiaobo.xie-3arQi8VN3Tc@public.gmane.org>, Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch is to enable SD UHS-I mode on LS208xRDB and eMMC HS200
mode on LS208xQDS in dts. Also, the eSDHC peripheral clock must be
used instead of platform clock to support these modes.

Signed-off-by: Yangbo Lu <yangbo.lu-3arQi8VN3Tc@public.gmane.org>
---
Changes for v2:
	- None.
---
 arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi | 1 +
 arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi | 4 ++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi     | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
index c4282d9..b237446 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-qds.dtsi
@@ -46,6 +46,7 @@
  */
 
 &esdhc {
+	mmc-hs200-1_8v;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
index 9a1d0d2..29af54b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa-rdb.dtsi
@@ -46,6 +46,10 @@
  */
 
 &esdhc {
+	sd-uhs-sdr104;
+	sd-uhs-sdr50;
+	sd-uhs-sdr25;
+	sd-uhs-sdr12;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 6e531b9..94cdd30 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -472,7 +472,7 @@
 			compatible = "fsl,ls2080a-esdhc", "fsl,esdhc";
 			reg = <0x0 0x2140000 0x0 0x10000>;
 			interrupts = <0 28 0x4>; /* Level high type */
-			clock-frequency = <0>;	/* Updated by bootloader */
+			clocks = <&clockgen 4 1>;
 			voltage-ranges = <1800 1800 3300 3300>;
 			sdhci,auto-cmd12;
 			little-endian;
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
