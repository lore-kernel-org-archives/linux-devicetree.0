Return-Path: <SRS0=HE6G=P6=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v5 4/5] dt-bindings: clk: exynos5433: add imem clock
Date: Tue, 22 Jan 2019 10:02:31 +0100
Message-Id: <20190122090232.29194-5-k.konieczny@partner.samsung.com>
In-Reply-To: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
	<CGME20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76@eucas1p1.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add Exynos5433 DT bindings to describe imem clocks for SlimSSS (Slim
Security SubSystem).

Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
---
 include/dt-bindings/clock/exynos5433.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 87bb2b017143..52652aaabc06 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -1406,4 +1406,10 @@
 
 #define CAM1_NR_CLK					113
 
+/* CMU_IMEM */
+#define CLK_ACLK_SLIMSSS		2
+#define CLK_PCLK_SLIMSSS		35
+
+#define IMEM_NR_CLK			52
+
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */
-- 
2.20.0
