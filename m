From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 1/3] ARM: dts: Add MFC clock entry for 5250
Date: Wed, 19 Jun 2013 14:22:47 +0530
Message-ID: <1371631969-10076-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, k.debski@samsung.com, s.nawrocki@samsung.com, arunkk.samsung@gmail.com
List-Id: devicetree@vger.kernel.org

The patch adds the MFC clock entry for the 5250 SoC

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d04ab0a..9c6cda6 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -168,6 +168,8 @@
 		reg = <0x11000000 0x10000>;
 		interrupts = <0 96 0>;
 		samsung,power-domain = <&pd_mfc>;
+		clocks = <&clock 266>;
+		clock-names = "mfc";
 	};
 
 	rtc {
-- 
1.7.9.5
