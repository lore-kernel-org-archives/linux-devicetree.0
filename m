From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/2] ARM: dts: uniphier: fix simple-bus unit address format
 error
Date: Sun, 14 May 2017 02:20:49 +0900
Message-ID: <1494696050-4615-1-git-send-email-yamada.masahiro@socionext.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

Compiling the UniPhier DT files with W=1, DTC warns like follows:

Warning (simple_bus_reg): Node /soc/system-bus@58c00000/support_card@1,1f00000/ethernet@00000000 simple-bus unit address format error, expected "0"
Warning (simple_bus_reg): Node /soc/system-bus@58c00000/support_card@1,1f00000/uart@000b0000 simple-bus unit address format error, expected "b0000"
Warning (simple_bus_reg): Node /soc/smpctrl@59800000 simple-bus unit address format error, expected "59801000"

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/dts/uniphier-ld4.dtsi          | 2 +-
 arch/arm/boot/dts/uniphier-pro4.dtsi         | 2 +-
 arch/arm/boot/dts/uniphier-pro5.dtsi         | 2 +-
 arch/arm/boot/dts/uniphier-pxs2.dtsi         | 2 +-
 arch/arm/boot/dts/uniphier-sld3.dtsi         | 2 +-
 arch/arm/boot/dts/uniphier-sld8.dtsi         | 2 +-
 arch/arm/boot/dts/uniphier-support-card.dtsi | 4 ++--
 7 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/uniphier-ld4.dtsi b/arch/arm/boot/dts/uniphier-ld4.dtsi
index 4f5fe15..e608895 100644
--- a/arch/arm/boot/dts/uniphier-ld4.dtsi
+++ b/arch/arm/boot/dts/uniphier-ld4.dtsi
@@ -201,7 +201,7 @@
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
diff --git a/arch/arm/boot/dts/uniphier-pro4.dtsi b/arch/arm/boot/dts/uniphier-pro4.dtsi
index 794a85a..f55708e 100644
--- a/arch/arm/boot/dts/uniphier-pro4.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro4.dtsi
@@ -233,7 +233,7 @@
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
diff --git a/arch/arm/boot/dts/uniphier-pro5.dtsi b/arch/arm/boot/dts/uniphier-pro5.dtsi
index 81605e3..9577769 100644
--- a/arch/arm/boot/dts/uniphier-pro5.dtsi
+++ b/arch/arm/boot/dts/uniphier-pro5.dtsi
@@ -320,7 +320,7 @@
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
diff --git a/arch/arm/boot/dts/uniphier-pxs2.dtsi b/arch/arm/boot/dts/uniphier-pxs2.dtsi
index bc5a1af..bf3bafc 100644
--- a/arch/arm/boot/dts/uniphier-pxs2.dtsi
+++ b/arch/arm/boot/dts/uniphier-pxs2.dtsi
@@ -304,7 +304,7 @@
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
diff --git a/arch/arm/boot/dts/uniphier-sld3.dtsi b/arch/arm/boot/dts/uniphier-sld3.dtsi
index 01d77ed..7c9f41d 100644
--- a/arch/arm/boot/dts/uniphier-sld3.dtsi
+++ b/arch/arm/boot/dts/uniphier-sld3.dtsi
@@ -216,7 +216,7 @@
 			#size-cells = <1>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
diff --git a/arch/arm/boot/dts/uniphier-sld8.dtsi b/arch/arm/boot/dts/uniphier-sld8.dtsi
index eb06fdc..19aa139 100644
--- a/arch/arm/boot/dts/uniphier-sld8.dtsi
+++ b/arch/arm/boot/dts/uniphier-sld8.dtsi
@@ -201,7 +201,7 @@
 			pinctrl-0 = <&pinctrl_system_bus>;
 		};
 
-		smpctrl@59800000 {
+		smpctrl@59801000 {
 			compatible = "socionext,uniphier-smpctrl";
 			reg = <0x59801000 0x400>;
 		};
diff --git a/arch/arm/boot/dts/uniphier-support-card.dtsi b/arch/arm/boot/dts/uniphier-support-card.dtsi
index f61dfec..fdbf0f6 100644
--- a/arch/arm/boot/dts/uniphier-support-card.dtsi
+++ b/arch/arm/boot/dts/uniphier-support-card.dtsi
@@ -53,14 +53,14 @@
 		#size-cells = <1>;
 		ranges = <0x00000000 1 0x01f00000 0x00100000>;
 
-		ethsc: ethernet@00000000 {
+		ethsc: ethernet@0 {
 			compatible = "smsc,lan9118", "smsc,lan9115";
 			reg = <0x00000000 0x1000>;
 			phy-mode = "mii";
 			reg-io-width = <4>;
 		};
 
-		serialsc: uart@000b0000 {
+		serialsc: uart@b0000 {
 			compatible = "ns16550a";
 			reg = <0x000b0000 0x20>;
 			clock-frequency = <12288000>;
-- 
2.7.4
