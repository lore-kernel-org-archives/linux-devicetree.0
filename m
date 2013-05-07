From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V2 2/3] ARM: dts: add Exynos audio subsystem clock controller
 node
Date: Tue, 07 May 2013 12:13:35 +0530
Message-ID: <1367909016-19657-3-git-send-email-padma.v@samsung.com>
References: <1367909016-19657-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1367909016-19657-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org
List-Id: devicetree@vger.kernel.org

Audio subsystem introduced in s5pv210 and exynos platforms
which has a internal clock controller. This patch adds a node
for the same on exynos5250.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 36c9d8d..7026de0 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -72,6 +72,12 @@
 		#clock-cells = <1>;
 	};
 
+	clock_audss: audss-clock-controller@0x03810000 {
+		compatible = "samsung,exynos5250-audss-clock";
+		reg = <0x03810000 0x0C>;
+		#clock-cells = <1>;
+	};
+
 	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
-- 
1.7.4.4
