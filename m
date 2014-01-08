From: Nicolin Chen <Guangyu.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 1/2] Revert "ARM: dts: imx: use dual-fifo sdma script for ssi"
Date: Wed, 8 Jan 2014 16:45:55 +0800
Message-ID: <1389170756-22351-2-git-send-email-Guangyu.Chen@freescale.com>
References: <1389170756-22351-1-git-send-email-Guangyu.Chen@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389170756-22351-1-git-send-email-Guangyu.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This reverts commit b1d27c79c8377df1880447375deffa3bb82c7bd3.

Previously we switched the SSI scriprt to dual-fifo mode to reduce playback
underrun issue, which is only included by SDMA firmware version 2. However,
there are quite a lot people still using version 1 or default firmware in
the ROM code of SoC while these two kinds of firmwares do not support the
dual-fifo script and the audio function on their platform would be broken.

Thus this patch provisionally reverts the dual-fifo script to the original
single fifo script to meet all kinds of users' requirements, including the
version 1/2 or inner ROM firmware.

Reported-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Nicolin Chen <Guangyu.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/arm/boot/dts/imx51.dtsi   |  4 ++--
 arch/arm/boot/dts/imx53.dtsi   |  4 ++--
 arch/arm/boot/dts/imx6qdl.dtsi | 12 ++++++------
 arch/arm/boot/dts/imx6sl.dtsi  | 12 ++++++------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/imx51.dtsi b/arch/arm/boot/dts/imx51.dtsi
index 5be2837..4bcdd3a 100644
--- a/arch/arm/boot/dts/imx51.dtsi
+++ b/arch/arm/boot/dts/imx51.dtsi
@@ -159,8 +159,8 @@
 					reg = <0x70014000 0x4000>;
 					interrupts = <30>;
 					clocks = <&clks 49>;
-					dmas = <&sdma 24 22 0>,
-					       <&sdma 25 22 0>;
+					dmas = <&sdma 24 1 0>,
+					       <&sdma 25 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					fsl,ssi-dma-events = <25 24 23 22>; /* TX0 RX0 TX1 RX1 */
diff --git a/arch/arm/boot/dts/imx53.dtsi b/arch/arm/boot/dts/imx53.dtsi
index 7208fde..4307e80 100644
--- a/arch/arm/boot/dts/imx53.dtsi
+++ b/arch/arm/boot/dts/imx53.dtsi
@@ -153,8 +153,8 @@
 					reg = <0x50014000 0x4000>;
 					interrupts = <30>;
 					clocks = <&clks 49>;
-					dmas = <&sdma 24 22 0>,
-					       <&sdma 25 22 0>;
+					dmas = <&sdma 24 1 0>,
+					       <&sdma 25 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					fsl,ssi-dma-events = <25 24 23 22>; /* TX0 RX0 TX1 RX1 */
diff --git a/arch/arm/boot/dts/imx6qdl.dtsi b/arch/arm/boot/dts/imx6qdl.dtsi
index e9534f2..fb28b2e 100644
--- a/arch/arm/boot/dts/imx6qdl.dtsi
+++ b/arch/arm/boot/dts/imx6qdl.dtsi
@@ -236,8 +236,8 @@
 					reg = <0x02028000 0x4000>;
 					interrupts = <0 46 0x04>;
 					clocks = <&clks 178>;
-					dmas = <&sdma 37 22 0>,
-					       <&sdma 38 22 0>;
+					dmas = <&sdma 37 1 0>,
+					       <&sdma 38 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					fsl,ssi-dma-events = <38 37>;
@@ -249,8 +249,8 @@
 					reg = <0x0202c000 0x4000>;
 					interrupts = <0 47 0x04>;
 					clocks = <&clks 179>;
-					dmas = <&sdma 41 22 0>,
-					       <&sdma 42 22 0>;
+					dmas = <&sdma 41 1 0>,
+					       <&sdma 42 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					fsl,ssi-dma-events = <42 41>;
@@ -262,8 +262,8 @@
 					reg = <0x02030000 0x4000>;
 					interrupts = <0 48 0x04>;
 					clocks = <&clks 180>;
-					dmas = <&sdma 45 22 0>,
-					       <&sdma 46 22 0>;
+					dmas = <&sdma 45 1 0>,
+					       <&sdma 46 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					fsl,ssi-dma-events = <46 45>;
diff --git a/arch/arm/boot/dts/imx6sl.dtsi b/arch/arm/boot/dts/imx6sl.dtsi
index 7b57fec..28558f1 100644
--- a/arch/arm/boot/dts/imx6sl.dtsi
+++ b/arch/arm/boot/dts/imx6sl.dtsi
@@ -199,8 +199,8 @@
 					reg = <0x02028000 0x4000>;
 					interrupts = <0 46 0x04>;
 					clocks = <&clks IMX6SL_CLK_SSI1>;
-					dmas = <&sdma 37 22 0>,
-					       <&sdma 38 22 0>;
+					dmas = <&sdma 37 1 0>,
+					       <&sdma 38 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					status = "disabled";
@@ -211,8 +211,8 @@
 					reg = <0x0202c000 0x4000>;
 					interrupts = <0 47 0x04>;
 					clocks = <&clks IMX6SL_CLK_SSI2>;
-					dmas = <&sdma 41 22 0>,
-					       <&sdma 42 22 0>;
+					dmas = <&sdma 41 1 0>,
+					       <&sdma 42 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					status = "disabled";
@@ -223,8 +223,8 @@
 					reg = <0x02030000 0x4000>;
 					interrupts = <0 48 0x04>;
 					clocks = <&clks IMX6SL_CLK_SSI3>;
-					dmas = <&sdma 45 22 0>,
-					       <&sdma 46 22 0>;
+					dmas = <&sdma 45 1 0>,
+					       <&sdma 46 1 0>;
 					dma-names = "rx", "tx";
 					fsl,fifo-depth = <15>;
 					status = "disabled";
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
