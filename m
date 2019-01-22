Return-Path: <SRS0=HE6G=P6=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH v5 0/5] Add imem clock for Exynos 5433
Date: Tue, 22 Jan 2019 10:02:27 +0100
Message-Id: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <CGME20190122090249eucas1p1e464ab92e8d5a706981f8dbcb63b1500@eucas1p1.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add imem clock for Exynos 5433. This will allow to use SlimSSS (Slim
Security SubSystem) with crypto functions.

Changes since v4:
- added Acked-by to 5th patch,
- removed all clock ids except CLK_ACLK_SLIMSSS/CLK_PCLK_SLIMSSS and rewrite
  commit message.

Changes since v3:
- added Acked-by and Reviewed-by to patches 2 and 3
- dropped "[PATCH v3 4/5] arm64: dts: exynos: add imem clock" because it
  was already applied
- split "[PATCH v3 5/5] clk: samsung: exynos5433: add imem clocks"
  into two parts, first for DT bindings and second for clock driver. In
  clock driver I dropped all SSS clocks and left only two slimSSS, as I
  was unable to test SSS with crypto driver s5p-sss.

Changes since v2:
- added Reviewed-by to two first patches
- fixed subject for 3rd patch and commit message
- in patch 3 moved documentation of imem to end of clocks after CMU_CAM1
- in patch 4 moved cmu_imem declarations after cmu_cam1
- in patch 5 added newlines after clock registers, moved code after cmu_cam1,
  removed CLK_OF_DECLARE and exynos5433_cmu_imem_init, moved cmu_imem
  compatible to the end of exynos5433_cmu_of_match

Changes since v1:
- splitted typo patch into two, one of them for stable, suggested by Krzysztof
  Kozlowski
- added more registers as suggested by Chanwoo Choi

Kamil Konieczny (5):
  clk: samsung: exynos5433: fix typo in imem divider
  clk: samsung: exynos5433: fix name typo in sssx
  dt-bindings: clk: exynos5433: document imem clock
  dt-bindings: clk: exynos5433: add imem clock
  clk: samsung: exynos5433: add imem clocks

 .../bindings/clock/exynos5433-clock.txt       | 23 +++++++++++
 drivers/clk/samsung/clk-exynos5433.c          | 38 +++++++++++++++++--
 include/dt-bindings/clock/exynos5433.h        |  8 +++-
 3 files changed, 65 insertions(+), 4 deletions(-)

-- 
2.20.0
