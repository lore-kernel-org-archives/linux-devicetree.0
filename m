From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH 2/2] ARM: dts: add watchdog device tree node for exynos5420
Date: Tue, 27 Aug 2013 18:15:18 +0530
Message-ID: <1377607518-21882-3-git-send-email-l.krishna@samsung.com>
References: <1377607518-21882-1-git-send-email-l.krishna@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1377607518-21882-1-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, devicetree@vger.kernel.org, t.figa@samsung.com
List-Id: devicetree@vger.kernel.org

Add watchdog device tree node for exynos5420

Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index d537cd7..9fadc23 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -186,6 +186,12 @@
 		status = "okay";
 	};
 
+	watchdog@101D0000 {
+		clocks = <&clock 316>;
+		clock-names = "watchdog";
+		status = "okay";
+	};
+
 	serial@12C00000 {
 		clocks = <&clock 257>, <&clock 128>;
 		clock-names = "uart", "clk_uart_baud0";
-- 
1.7.10.4
