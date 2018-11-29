Return-Path: <SRS0=QSTz=OI=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v2 2/5] clk: samsung: exynos5433: fix name typo in sssx
Date: Thu, 29 Nov 2018 16:51:31 +0100
Message-Id: <20181129155134.19141-3-k.konieczny@partner.samsung.com>
In-Reply-To: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <20181129155134.19141-1-k.konieczny@partner.samsung.com>
	<CGME20181129155145eucas1p2bcf8fe4747d16d721ade85dc520551e4@eucas1p2.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Fix typo in sssx name, there should be three letters 's'.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 drivers/clk/samsung/clk-exynos5433.c   | 2 +-
 include/dt-bindings/clock/exynos5433.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index ea47f49abc7f..24c3360db65b 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -559,7 +559,7 @@ static const struct samsung_gate_clock top_gate_clks[] __initconst = {
 	/* ENABLE_ACLK_TOP */
 	GATE(CLK_ACLK_G3D_400, "aclk_g3d_400", "div_aclk_g3d_400",
 			ENABLE_ACLK_TOP, 30, CLK_IS_CRITICAL, 0),
-	GATE(CLK_ACLK_IMEM_SSX_266, "aclk_imem_ssx_266",
+	GATE(CLK_ACLK_IMEM_SSSX_266, "aclk_imem_sssx_266",
 			"div_aclk_imem_sssx_266", ENABLE_ACLK_TOP,
 			29, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_ACLK_BUS0_400, "aclk_bus0_400", "div_aclk_bus0_400",
diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 98bd85ce1e45..87bb2b017143 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -156,7 +156,7 @@
 #define CLK_ACLK_G2D_266		220
 #define CLK_ACLK_G2D_400		221
 #define CLK_ACLK_G3D_400		222
-#define CLK_ACLK_IMEM_SSX_266		223
+#define CLK_ACLK_IMEM_SSSX_266		223
 #define CLK_ACLK_BUS0_400		224
 #define CLK_ACLK_BUS1_400		225
 #define CLK_ACLK_IMEM_200		226
-- 
2.19.1
