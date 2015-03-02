From: Stefan Agner <stefan@agner.ch>
Subject: [PATCH] ARM: dts: vf610: remove unused gpio-range-cells property
Date: Mon,  2 Mar 2015 16:58:01 +0100
Message-ID: <1425311881-10767-1-git-send-email-stefan@agner.ch>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawn.guo@linaro.org, kernel@pengutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stefan@agner.ch
List-Id: devicetree@vger.kernel.org

The anyway depricated gpio-range-cells property was never used
by the pin controller driver. This patch removes it.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 arch/arm/boot/dts/vfxxx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index a29c7ce..0d95232 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -213,7 +213,6 @@
 			iomuxc: iomuxc@40048000 {
 				compatible = "fsl,vf610-iomuxc";
 				reg = <0x40048000 0x1000>;
-				#gpio-range-cells = <3>;
 			};
 
 			gpio0: gpio@40049000 {
-- 
2.3.0
