From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] arm64: dts: uniphier: add reserved-memory for secure memory
Date: Sat, 22 Jun 2019 03:00:26 +0900
Message-ID: <20190621180026.25071-1-yamada.masahiro@socionext.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The memory regions specified by /memreserve/ are passed to
early_init_dt_reserve_memory_arch() with nomap=false, so it is
not suitable for reserving memory for Trusted Firmware-A etc.

Use the more robust /reserved-memory node with the no-map property
to prevent the kernel from mapping it.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 13 +++++++++++--
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 13 +++++++++++--
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 13 +++++++++++--
 3 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index e32f8aef40bf..8ec40a0b8b1e 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -8,8 +8,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/uniphier-gpio.h>
 
-/memreserve/ 0x80000000 0x02000000;
-
 / {
 	compatible = "socionext,uniphier-ld11";
 	#address-cells = <2>;
@@ -110,6 +108,17 @@
 			     <1 10 4>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secure-memory@81000000 {
+			reg = <0x0 0x81000000 0x0 0x01000000>;
+			no-map;
+		};
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 0e1b30656fea..b658f2b641e2 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -9,8 +9,6 @@
 #include <dt-bindings/gpio/uniphier-gpio.h>
 #include <dt-bindings/thermal/thermal.h>
 
-/memreserve/ 0x80000000 0x02000000;
-
 / {
 	compatible = "socionext,uniphier-ld20";
 	#address-cells = <2>;
@@ -215,6 +213,17 @@
 		};
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secure-memory@81000000 {
+			reg = <0x0 0x81000000 0x0 0x01000000>;
+			no-map;
+		};
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index d3863157ddd9..d6f6cee4d549 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -8,8 +8,6 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/gpio/uniphier-gpio.h>
 
-/memreserve/ 0x80000000 0x02000000;
-
 / {
 	compatible = "socionext,uniphier-pxs3";
 	#address-cells = <2>;
@@ -138,6 +136,17 @@
 			     <1 10 4>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secure-memory@81000000 {
+			reg = <0x0 0x81000000 0x0 0x01000000>;
+			no-map;
+		};
+	};
+
 	soc@0 {
 		compatible = "simple-bus";
 		#address-cells = <1>;
-- 
2.17.1
