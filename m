Return-Path: <SRS0=e0GZ=ON=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v3 4/5] arm64: dts: exynos: add imem clock
Date: Tue,  4 Dec 2018 17:52:47 +0100
Message-Id: <20181204165248.17572-5-k.konieczny@partner.samsung.com>
In-Reply-To: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
	<CGME20181204165317eucas1p18cd6168fdefb2aa57259b9ec73438275@eucas1p1.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add description for imem clock in the Samsung Exynos5433. The users can use
compatibility "samsung,exynos5433-cmu-imem".

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 2131f12364cb..378cd3d87ff0 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -544,6 +544,21 @@
 			power-domains = <&pd_cam1>;
 		};
 
+		cmu_imem: clock-controller@11060000 {
+			compatible = "samsung,exynos5433-cmu-imem";
+			reg = <0x11060000 0x1000>;
+			#clock-cells = <1>;
+
+			clock-names = "oscclk",
+				"aclk_imem_sssx_266",
+				"aclk_imem_266",
+				"aclk_imem_200";
+			clocks = <&xxti>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_SSSX_266>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_266>,
+				<&cmu_top CLK_DIV_ACLK_IMEM_200>;
+		};
+
 		pd_gscl: power-domain@105c4000 {
 			compatible = "samsung,exynos5433-pd";
 			reg = <0x105c4000 0x20>;
-- 
2.19.1
