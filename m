From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH] arm64: dts: exynos7: Fix wrong base address of i2c7 bus
Date: Fri, 19 Dec 2014 19:03:20 +0530
Message-ID: <1418996000-15735-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

I2C7 base address corrected.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index db7058a..84a57c8 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -386,9 +386,9 @@
 			status = "disabled";
 		};
 
-		hsi2c_7: hsi2c@13e10000 {
+		hsi2c_7: hsi2c@14e10000 {
 			compatible = "samsung,exynos7-hsi2c";
-			reg = <0x13e10000 0x1000>;
+			reg = <0x14e10000 0x1000>;
 			interrupts = <0 462 0>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
1.7.4.4
