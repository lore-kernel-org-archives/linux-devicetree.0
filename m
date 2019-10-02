From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v3 03/10] ARM: dts: exynos: Rename SysRAM node to "sram"
Date: Wed,  2 Oct 2019 18:43:09 +0200
Message-ID: <20191002164316.14905-3-krzk@kernel.org>
References: <20191002164316.14905-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002164316.14905-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Santosh Shilimkar <ssantosh@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.orgli
List-Id: devicetree@vger.kernel.org

The device node name should reflect generic class of a device so rename
the SysRAM node from "sysram" to "sram".  The child nodes stay as before
as "smp-sysram" to match their real purpose.  This will be also in sync
with upcoming DT schema.  No functional change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 arch/arm/boot/dts/exynos4210.dtsi | 2 +-
 arch/arm/boot/dts/exynos4412.dtsi | 2 +-
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 arch/arm/boot/dts/exynos54xx.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index d122fb52d3d4..cf422b48cb15 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -138,7 +138,7 @@
 		#size-cells = <1>;
 		ranges;
 
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 298b8ddc0545..554819ae1446 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -72,7 +72,7 @@
 	};
 
 	soc: soc {
-		sysram: sysram@2020000 {
+		sysram: sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x20000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 6cf0e259fb39..5022aa574b26 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -188,7 +188,7 @@
 			interrupts = <GIC_SPI 72 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x40000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index f01e3156191d..2780bf5c83c8 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -164,7 +164,7 @@
 	};
 
 	soc: soc {
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x30000>;
 			#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 06ae40a2f1e9..dff9ef3ad0ef 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -46,7 +46,7 @@
 	};
 
 	soc: soc {
-		sysram@2020000 {
+		sram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x54000>;
 			#address-cells = <1>;
-- 
2.17.1
