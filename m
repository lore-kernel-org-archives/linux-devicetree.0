From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v2 1/3] ARM: dts: Add DT node for DP controller for Arndale Board
Date: Tue, 14 May 2013 19:42:44 +0530
Message-ID: <1368540766-9818-2-git-send-email-vikas.sajjan@linaro.org>
References: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1368540766-9818-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: jg1.han@samsung.com, s.trumtrar@pengutronix.de, tomasz.figa@gmail.com, olof@lixom.net, kgene.kim@samsung.com, devicetree-discuss@lists.ozlabs.org, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Add DT node for DP controller to exynos5250 based Arndale Board

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
Reviewed-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index 02cfc76..f68b820 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -449,4 +449,14 @@
 			clock-frequency = <24000000>;
 		};
 	};
+
+	dp-controller {
+		samsung,color-space = <0>;
+		samsung,dynamic-range = <0>;
+		samsung,ycbcr-coeff = <0>;
+		samsung,color-depth = <1>;
+		samsung,link-rate = <0x0a>;
+		samsung,lane-count = <4>;
+	};
+
 };
-- 
1.7.9.5
