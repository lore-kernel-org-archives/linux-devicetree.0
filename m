Return-Path: <SRS0=e0GZ=ON=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v3 0/5] Add imem clock for Exynos 5433
Date: Tue,  4 Dec 2018 17:52:43 +0100
Message-Id: <20181204165248.17572-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <CGME20181204165315eucas1p1693a3d349f39c272297e5d1902c905ca@eucas1p1.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add imem clock for Exynos 5433. This will allow to use SSS and SlimSSS
(Security SubSystem) with crypto functions.

Changes since v2:
- added Reviewed-by to two first patches
- fixed subject for 3rd patch and commit message
- in patch 3 moved documentation of imem to end of clocks after CMU_CAM1
- in patch 4 moved cmu_imem declarations after cmu_cam1
- in patch 5 added newlines after clock registers, moved code after cmu_cam1,
  removed CLK_OF_DECLARE and exynos5433_cmu_imem_init, moved cmu_imem
  compatible to the end of exynos5433_cmu_of_match

Changes since v1:
- splitted typo patch into two, one of them for stable, suggested by Krzystof
  Kozlowski
- added more registers as suggested by Chanwoo Choi

Kamil Konieczny (5):
  clk: samsung: exynos5433: fix typo in imem divider
  clk: samsung: exynos5433: fix name typo in sssx
  dt-bindings: clk: exynos5433: document imem clock
  arm64: dts: exynos: add imem clock
  clk: samsung: exynos5433: add imem clocks

 .../bindings/clock/exynos5433-clock.txt       |  23 ++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  15 ++
 drivers/clk/samsung/clk-exynos5433.c          | 199 +++++++++++++++++-
 include/dt-bindings/clock/exynos5433.h        |  57 ++++-
 4 files changed, 290 insertions(+), 4 deletions(-)

-- 
2.19.1
