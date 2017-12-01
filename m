From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH v4 4/4] arm64: dts: meson-axg: add clock DT info for Meson AXG SoC
Date: Fri, 1 Dec 2017 09:24:52 +0800
Message-ID: <20171201012452.27086-5-yixun.lan@amlogic.com>
References: <20171201012452.27086-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171201012452.27086-1-yixun.lan@amlogic.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Qiufang Dai <qiufang.dai@amlogic.com>

Try to add Hiubus DT info, and also enable clock DT info
for the Amlogic's Meson-AXG SoC.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index b932a784b02a..36a2e98338a8 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/axg-clkc.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -148,6 +149,20 @@
 			#address-cells = <0>;
 		};
 
+		hiubus: hiubus@ff63c000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff63c000 0x0 0x1c00>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1c00>;
+
+			clkc: clock-controller@0 {
+				compatible = "amlogic,axg-clkc";
+				#clock-cells = <1>;
+				reg = <0x0 0x0 0x0 0x320>;
+			};
+		};
+
 		mailbox: mailbox@ff63dc00 {
 			compatible = "amlogic,meson-gx-mhu", "amlogic,meson-gxbb-mhu";
 			reg = <0 0xff63dc00 0 0x400>;
-- 
2.15.0
