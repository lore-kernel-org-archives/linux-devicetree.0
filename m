Return-Path: <SRS0=w1PK=P2=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v4 4/5] dt-bindings: clk: exynos5433: add imem clock
Date: Fri, 18 Jan 2019 14:16:38 +0100
Message-Id: <20190118131639.17578-5-k.konieczny@partner.samsung.com>
In-Reply-To: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <20190118131639.17578-1-k.konieczny@partner.samsung.com>
	<CGME20190118131713eucas1p21e6deb9c80627cbf2e09c5b578cd410a@eucas1p2.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add DT bindings to describe imem clocks for SSS (Security SubSystem) and
SlimSSS in Exynos5433.

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 include/dt-bindings/clock/exynos5433.h | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 87bb2b017143..cc6153a0b5f7 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -1406,4 +1406,59 @@
 
 #define CAM1_NR_CLK					113
 
+/* CMU_IMEM */
+#define CLK_ACLK_SSS			1
+#define CLK_ACLK_SLIMSSS		2
+#define CLK_ACLK_RTIC			3
+#define CLK_ACLK_XIU_SSSX		4
+#define CLK_ACLK_ASYNCAHBM_SSS_ATLAS	5
+#define CLK_ACLK_ASYNCAXI_SSSX		6
+#define CLK_ACLK_BTS_SSS_CCI		7
+#define CLK_ACLK_BTS_SSS_DRAM		8
+#define CLK_ACLK_BTS_SLIMSSS		9
+#define CLK_ACLK_SMMU_SSS_CCI		10
+#define CLK_ACLK_SMMU_SSS_DRAM		11
+#define CLK_ACLK_SMMU_SLIMSSS		12
+#define CLK_ACLK_SMMU_RTIC		13
+#define CLK_ACLK_IMEMND_266		14
+#define CLK_ACLK_ALB_IMEM		15
+#define CLK_ACLK_XIU_IMEMX		16
+#define CLK_ACLK_AXIUS_IMEMX		17
+#define CLK_ACLK_ASYNCAXI_IMEMX		18
+#define CLK_ACLK_ARBG_TX		19
+#define CLK_ACLK_BTS_ARBG_TX		20
+#define CLK_ACLK_SMMU_ARBG_TX		21
+#define CLK_ACLK_GIC			22
+#define CLK_ACLK_INT_MEM		23
+#define CLK_ACLK_XIU_PIMEMX		24
+#define CLK_ACLK_AXI2APB_IMEM0P		25
+#define CLK_ACLK_AXI2APB_IMEM1P		26
+#define CLK_ACLK_ASYNCAXIS_MIF_PIMEMX	27
+#define CLK_ACLK_AXIDS_PIMEMX_GIC	28
+#define CLK_ACLK_AXIDS_PIMEMX_IMEM0P	29
+#define CLK_ACLK_AXIDS_PIMEMX_IMEM1P	30
+#define CLK_ACLK_SROMC			31
+#define CLK_ACLK_AXIDS_SROMC		32
+#define CLK_ACLK_AXI2AHB_IMEMH		33
+#define CLK_PCLK_SSS			34
+#define CLK_PCLK_SLIMSSS		35
+#define CLK_PCLK_RTIC			36
+#define CLK_PCLK_SYSREG_IMEM		37
+#define CLK_PCLK_PMU_IMEM		38
+#define CLK_PCLK_ALB_IMEM		39
+#define CLK_PCLK_BTS_SSS_CCI		40
+#define CLK_PCLK_BTS_SSS_DRAM		41
+#define CLK_PCLK_BTS_SLIMSSS		42
+#define CLK_PCLK_SMMU_SSS_CCI		43
+#define CLK_PCLK_SMMU_SSS_DRAM		44
+#define CLK_PCLK_SMMU_SLIMSSS		45
+#define CLK_PCLK_SMMU_RTIC		46
+#define CLK_PCLK_ASYNCAPB_ARBG_TX	47
+#define CLK_PCLK_BTS_ARBG_TX		48
+#define CLK_PCLK_SMMU_ARBG_TX		49
+#define CLK_PCLK_ASYNCAXI_IMEMX		50
+#define CLK_PCLK_GPIO_IMEM		51
+
+#define IMEM_NR_CLK			52
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
-- 
2.20.0
