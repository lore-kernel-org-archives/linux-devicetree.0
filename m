Return-Path: <SRS0=YPSF=QI=samsung.com=s.nawrocki@kernel.org>
Subject: Re: [PATCH v5 0/5] Add imem clock for Exynos 5433
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <b4bee5f1-8063-28d8-da56-31338581896c@samsung.com>
Date: Fri, 01 Feb 2019 14:30:49 +0100
MIME-version: 1.0
In-reply-to: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
Content-type: text/plain; charset="utf-8"
Content-language: en-GB
Content-transfer-encoding: 7bit
References: <CGME20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500@eucas1p1.samsung.com>
	<20190122090232.29194-1-k.konieczny@partner.samsung.com>
To: Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Hi,

I applied whole series with minor commit message edits and change as
below squashed to patch 4/5.

diff --git a/include/dt-bindings/clock/exynos5433.h b/include/dt-bindings/clock/exynos5433.h
index 52652aaabc06..25ffa53573a5 100644
--- a/include/dt-bindings/clock/exynos5433.h
+++ b/include/dt-bindings/clock/exynos5433.h
@@ -1410,6 +1410,6 @@
 #define CLK_ACLK_SLIMSSS               2
 #define CLK_PCLK_SLIMSSS               35
 
-#define IMEM_NR_CLK                    52
+#define IMEM_NR_CLK                    36
 
 #endif /* _DT_BINDINGS_CLOCK_EXYNOS5433_H */


-- 
Thanks,
Sylwester
