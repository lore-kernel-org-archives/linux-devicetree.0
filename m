From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH 6/7] ARM: dts: Add DP controller DT node to exynos5420 SoC
Date: Mon, 29 Jul 2013 19:19:30 +0530
Message-ID: <1375105771-8106-7-git-send-email-vikas.sajjan@linaro.org>
References: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <1375105771-8106-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, devicetree-discuss@lists.ozlabs.org, jg1.han@samsung.com, inki.dae@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org
List-Id: devicetree@vger.kernel.org

Adds DP controller DT node to exynos5420 SoC

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 1f659f4..948307c 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -181,6 +181,12 @@
 		clock-names = "uart", "clk_uart_baud0";
 	};
 
+	dp-controller {
+		clocks = <&clock 412>;
+		clock-names = "dp";
+		status = "okay";
+	};
+
 	fimd {
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock 147>, <&clock 421>;
-- 
1.7.9.5
