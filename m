From: Yixun Lan <yixun.lan@amlogic.com>
Subject: [PATCH 2/2] arm64: dts: meson-axg: add clock DT info for Meson AXG SoC
Date: Mon, 6 Nov 2017 15:32:04 +0800
Message-ID: <20171106073204.14548-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Yixun Lan <yixun.lan@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>, Rob Herring <robh+dt@kernel.org>, Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Qiufang Dai <qiufang.dai@amlogic.com>

Try to add Hiubus DT info, and also enable clock DT info
for the Amlogic's Meson-AXG SoC.

Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 003832890d2b..4a07fc7daa99 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -7,6 +7,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/axg-clkc.h>
+#include <dt-bindings/clock/gxbb-aoclkc.h>
 
 / {
 	compatible = "amlogic,meson-axg";
@@ -148,6 +150,20 @@
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
2.14.1
