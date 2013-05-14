From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 2/2] ARM: dts: Add LCD backlight and LCD enable gpios pins to dp-controller DT node
Date: Tue, 14 May 2013 18:25:52 +0530
Message-ID: <1368536152-13370-3-git-send-email-vikas.sajjan@linaro.org>
References: <1368536152-13370-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1368536152-13370-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: jg1.han@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Adds gpios pins for LCD backlight and LCD enable for dp-controller DT
node in exynos5250-smdk5250.dts

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5250-smdk5250.dts |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 26d856b..82e7621 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -224,6 +224,9 @@
 		samsung,color-depth = <1>;
 		samsung,link-rate = <0x0a>;
 		samsung,lane-count = <4>;
+
+		lcd_bl_gpio = <&gpb2 0 1>;
+		lcd_en_gpio = <&gpx1 5 1>;
 	};
 
 	display-timings {
-- 
1.7.9.5
