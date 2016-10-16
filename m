From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 1/3] arm64: dts: uniphier: switch over to PSCI enable method
Date: Sun, 16 Oct 2016 23:59:16 +0900
Message-ID: <1476629958-25368-2-git-send-email-yamada.masahiro@socionext.com>
References: <1476629958-25368-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476629958-25368-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

At the first system bring-up, I chose to use spin-table because ARM
Trusted Firmware was not ready for this platform at that moment.

Actually, these SoCs are equipped with EL3 and able to provide PSCI.
Now I finished porting the ATF BL31 for the UniPhier platform, so it
is ready to migrate to PSCI enable method.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 13 ++++++++-----
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 19 ++++++++++---------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index da3cdd8..73e0acf 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -43,7 +43,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
-/memreserve/ 0x80000000 0x00000008;	/* cpu-release-addr */
+/memreserve/ 0x80000000 0x00080000;
 
 / {
 	compatible = "socionext,uniphier-ld11";
@@ -70,19 +70,22 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x000>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000000>;
+			enable-method = "psci";
 		};
 
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x001>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000000>;
+			enable-method = "psci";
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
 	clocks {
 		refclk: ref {
 			compatible = "fixed-clock";
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index efb47ea..6f48e82 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -43,7 +43,7 @@
  *     OTHER DEALINGS IN THE SOFTWARE.
  */
 
-/memreserve/ 0x80000000 0x00000008;	/* cpu-release-addr */
+/memreserve/ 0x80000000 0x00080000;
 
 / {
 	compatible = "socionext,uniphier-ld20";
@@ -79,35 +79,36 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a72", "arm,armv8";
 			reg = <0 0x000>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000000>;
+			enable-method = "psci";
 		};
 
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a72", "arm,armv8";
 			reg = <0 0x001>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000000>;
+			enable-method = "psci";
 		};
 
 		cpu2: cpu@100 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x100>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000000>;
+			enable-method = "psci";
 		};
 
 		cpu3: cpu@101 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x101>;
-			enable-method = "spin-table";
-			cpu-release-addr = <0 0x80000000>;
+			enable-method = "psci";
 		};
 	};
 
+	psci {
+		compatible = "arm,psci-1.0";
+		method = "smc";
+	};
+
 	clocks {
 		refclk: ref {
 			compatible = "fixed-clock";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
