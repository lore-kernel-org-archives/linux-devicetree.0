From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/3] ARM: dts: add Exynos audio subsystem clock controller node
Date: Fri, 05 Apr 2013 11:53:48 +0530
Message-ID: <1365143029-16936-2-git-send-email-padma.v@samsung.com>
References: <1365143029-16936-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1365143029-16936-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, sangsu4u.park@samsung.com
List-Id: devicetree@vger.kernel.org

Audio subsystem introduced in exynos platforms which has a
internal clock controller. This patch adds a node for the same.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7751e69..14d454c 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -67,6 +67,12 @@
 		#clock-cells = <1>;
 	};
 
+	clock_audss: audss-clock-controller@0x03810000 {
+		compatible = "samsung,exynos-audss-clock";
+		reg = <0x03810000 0x100>;
+		#clock-cells = <1>;
+	};
+
 	gic:interrupt-controller@10481000 {
 		compatible = "arm,cortex-a9-gic";
 		#interrupt-cells = <3>;
-- 
1.7.4.4
