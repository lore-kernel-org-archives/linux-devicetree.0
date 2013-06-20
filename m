From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH v2 3/5] ARM: dts: Update 5250 MFC node
Date: Thu, 20 Jun 2013 12:23:40 +0530
Message-ID: <1371711222-9232-4-git-send-email-arun.kk@samsung.com>
References: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1371711222-9232-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, sachin.kamat@linaro.org, arunkk.samsung@gmail.com
List-Id: devicetree@vger.kernel.org

The patch adds the MFC clock entry for the 5250 SoC and
also moves the common params to newly added exynos5.dtsi.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi    |    5 +++++
 arch/arm/boot/dts/exynos5250.dtsi |    4 ++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index f65e124..7966a10 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -108,4 +108,9 @@
 		interrupts = <0 42 0>;
 		status = "disabled";
 	};
+
+	codec@11000000 {
+		reg = <0x11000000 0x10000>;
+		interrupts = <0 96 0>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d04ab0a..5ffdae9 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -165,9 +165,9 @@
 
 	codec@11000000 {
 		compatible = "samsung,mfc-v6";
-		reg = <0x11000000 0x10000>;
-		interrupts = <0 96 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 266>;
+		clock-names = "mfc";
 	};
 
 	rtc {
-- 
1.7.9.5
