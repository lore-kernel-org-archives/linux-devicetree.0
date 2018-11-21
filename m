Return-Path: <SRS0=tAzC=OA=partner.samsung.com=k.konieczny@kernel.org>
From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: [PATCH 0/4] Add imem clock for Exynos 5433
Date: Wed, 21 Nov 2018 13:05:05 +0100
Message-Id: <20181121120509.18892-1-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
References: <CGME20181121120522eucas1p2ecd03f848bc4ea3be3d517b40b78b084@eucas1p2.samsung.com>
To: k.konieczny@partner.samsung.com, linux-samsung-soc@vger.kernel.org
Cc: linux-clk@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Add imem clock for Exynos 5433. This will allow to use SSS and SlimSSS
(Security SubSystem) with crypto functions.

Kamil Konieczny (4):
  clk: samsung: exynos5433: fix name typos
  arm64: dts: bindings: document imem clock
  arm64: dts: exynos: add imem clock
  clk: samsung: exynos5433: add imem clock

 .../bindings/clock/exynos5433-clock.txt       |  23 ++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi    |  15 ++
 drivers/clk/samsung/clk-exynos5433.c          | 129 +++++++++++++++++-
 include/dt-bindings/clock/exynos5433.h        |  57 +++++++-
 4 files changed, 220 insertions(+), 4 deletions(-)

-- 
2.19.1
