From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v3 1/3] arm64: dts: meson-axg: add AO clock driver DT info
Date: Wed, 28 Mar 2018 11:01:28 +0800
Message-ID: <20180328030130.240336-2-yixun.lan@amlogic.com>
References: <20180328030130.240336-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180328030130.240336-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>
Cc: Qiufang Dai <qiufang.dai@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>, Carlo Caione <carlo@caione.org>, Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Qiufang Dai <qiufang.dai@amlogic.com>

This add the AO (Always-On part) clock DT info for Meson-AXG SoC

Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b58808eb3cc8..b0eff7d7f771 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/axg-clkc.h>
+#include <dt-bindings/clock/axg-aoclkc.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -688,6 +689,17 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x100000>;
 
+			sysctrl_AO: sys-ctrl@0 {
+				compatible = "amlogic,meson-axg-ao-sysctrl", "syscon", "simple-mfd";
+				reg =  <0x0 0x0 0x0 0x100>;
+
+				clkc_AO: clock-controller {
+					compatible = "amlogic,meson-axg-aoclkc";
+					#clock-cells = <1>;
+					#reset-cells = <1>;
+				};
+			};
+
 			pinctrl_aobus: pinctrl@14 {
 				compatible = "amlogic,meson-axg-aobus-pinctrl";
 				#address-cells = <2>;
-- 
2.15.1
