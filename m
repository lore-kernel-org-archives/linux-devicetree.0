From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 03/13] ARM: dts: Add ISP power domain node for Exynos4x12
Date: Mon, 01 Jul 2013 17:22:25 +0200
Message-ID: <1372692155-17653-4-git-send-email-s.nawrocki@samsung.com>
References: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-reply-to: <1372692155-17653-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, myungjoo.ham@samsung.com, m.szyprowski@samsung.com, phil.carmody@partner.samsung.com, j.anaszewski@samsung.com, kyungmin.park@samsung.com, devicetree-discuss@lists.ozlabs.org, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: devicetree@vger.kernel.org

The ISP power domain is a common power domain for FIMC-LITE
and FIMC-IS (camera ISP) devices.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos4x12.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4x12.dtsi b/arch/arm/boot/dts/exynos4x12.dtsi
index 01da194..0e24d85 100644
--- a/arch/arm/boot/dts/exynos4x12.dtsi
+++ b/arch/arm/boot/dts/exynos4x12.dtsi
@@ -28,6 +28,11 @@
 		pinctrl3 = &pinctrl_3;
 	};
 
+	pd_isp: isp-power-domain@10023CA0 {
+		compatible = "samsung,exynos4210-pd";
+		reg = <0x10023CA0 0x20>;
+	};
+
 	clock: clock-controller@0x10030000 {
 		compatible = "samsung,exynos4412-clock";
 		reg = <0x10030000 0x20000>;
-- 
1.7.9.5
