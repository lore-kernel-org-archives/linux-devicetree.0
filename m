From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/4] arm64: dts: uniphier: use macros in dt-bindings header
Date: Fri, 17 Nov 2017 14:24:47 +0900
Message-ID: <1510896288-31212-3-git-send-email-yamada.masahiro@socionext.com>
References: <1510896288-31212-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1510896288-31212-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

The dt-bindings header was applied to the driver subsystem.  I had to
wait for a merge window to use it from DT.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi    | 3 ++-
 arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts | 2 +-
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi    | 3 ++-
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi    | 3 ++-
 5 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
index 6bdefb2..54c5317 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11-ref.dts
@@ -50,7 +50,7 @@
 &gpio {
 	xirq0 {
 		gpio-hog;
-		gpios = <120 0>;
+		gpios = <UNIPHIER_GPIO_IRQ(0) 0>;
 		input;
 	};
 };
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 1c63d0a..ce40eb5 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/uniphier-gpio.h>
 
 /memreserve/ 0x80000000 0x02000000;
 
@@ -100,7 +101,7 @@
 
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
-		reset-gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio UNIPHIER_GPIO_PORT(3, 2) GPIO_ACTIVE_LOW>;
 	};
 
 	timer {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
index 254d679..6933710 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20-ref.dts
@@ -50,7 +50,7 @@
 &gpio {
 	xirq0 {
 		gpio-hog;
-		gpios = <120 0>;
+		gpios = <UNIPHIER_GPIO_IRQ(0) 0>;
 		input;
 	};
 };
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 5c81070..8a3276b 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/uniphier-gpio.h>
 #include <dt-bindings/thermal/thermal.h>
 
 /memreserve/ 0x80000000 0x02000000;
@@ -172,7 +173,7 @@
 
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
-		reset-gpios = <&gpio 26 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio UNIPHIER_GPIO_PORT(3, 2) GPIO_ACTIVE_LOW>;
 	};
 
 	timer {
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 48e7331..d2beadd 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -8,6 +8,7 @@
  */
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/gpio/uniphier-gpio.h>
 
 /memreserve/ 0x80000000 0x02000000;
 
@@ -128,7 +129,7 @@
 
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
-		reset-gpios = <&gpio 47 GPIO_ACTIVE_LOW>;
+		reset-gpios = <&gpio UNIPHIER_GPIO_PORT(5, 7) GPIO_ACTIVE_LOW>;
 	};
 
 	timer {
-- 
2.7.4
