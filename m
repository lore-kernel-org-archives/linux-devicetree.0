From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [PATCH 16/18] ARM: dts: exynos5: add system register support
Date: Wed, 14 May 2014 15:27:03 +0900
Message-ID: <1400048825-6052-17-git-send-email-yj44.cho@samsung.com>
References: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1400048825-6052-1-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux-samsung-soc@vger.kernel.org, thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, s.trumtrar@pengutronix.de, kyungmin.park@samsung.com, inki.dae@samsung.com, kgene.kim@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, a.hajda@samsung.com
List-Id: devicetree@vger.kernel.org

This patch adds sysreg device node, and sysreg property to fimd device node
which is required to use I80 interface.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5.dtsi |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 79d0608..95ee496 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -81,12 +81,18 @@
 		status = "disabled";
 	};
 
+	sys_reg: syscon@10050000 {
+		compatible = "samsung,exynos5-sysreg", "syscon";
+		reg = <0x10050000 0x500>;
+	};
+
 	fimd@14400000 {
 		compatible = "samsung,exynos5250-fimd";
 		interrupt-parent = <&combiner>;
 		reg = <0x14400000 0x40000>;
 		interrupt-names = "fifo", "vsync", "lcd_sys";
 		interrupts = <18 4>, <18 5>, <18 6>;
+		samsung,sysreg = <&sys_reg>;
 		status = "disabled";
 	};
 
-- 
1.7.9.5
