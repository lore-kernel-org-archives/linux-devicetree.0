From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 02/13] ARM: dts: Add pinctrl entries for Exynos4x12 FIMC-IS
 peripherals
Date: Mon, 01 Jul 2013 17:22:24 +0200
Message-ID: <1372692155-17653-3-git-send-email-s.nawrocki@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

Add pinctrl nodes for the ISP I2C0, ISP I2C1 and ISP UART devices.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12-pinctrl.dtsi |   21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
index 55ff73b..99b26df 100644
--- a/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos4x12-pinctrl.dtsi
@@ -848,6 +848,27 @@
 			samsung,pin-pud = <0>;
 			samsung,pin-drv = <0>;
 		};
+
+		fimc_is_i2c0: fimc-is-i2c0 {
+			samsung,pins = "gpm4-0", "gpm4-1";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		fimc_is_i2c1: fimc-is-i2c1 {
+			samsung,pins = "gpm4-2", "gpm4-3";
+			samsung,pin-function = <2>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
+
+		fimc_is_uart: fimc-is-uart {
+			samsung,pins = "gpm3-5", "gpm3-7";
+			samsung,pin-function = <3>;
+			samsung,pin-pud = <0>;
+			samsung,pin-drv = <0>;
+		};
 	};
 
 	pinctrl@03860000 {
-- 
1.7.9.5
