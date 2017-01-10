From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 0/3] arm64: dts: Fix DTC warnings for Exynos boards
Date: Tue, 10 Jan 2017 10:27:43 -0300
Message-ID: <1484054866-3988-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Hello Krzysztof,

This trivial series contains fixes for DTC warnings caused by mismatches
between unit names and reg properties in device tree nodes.

The patches shouldn't cause a functional change but have been just build
tested. I compared the generated DTB though to make sure that only these
nodes changed.

Best regards,
Javier


Javier Martinez Canillas (3):
  arm64: dts: Add missing unit name to Exynos7 SoC node
  arm64: dts: Add missing unit name to Exynos5433 SoC node
  arm64: dts: Remove unneeded unit names in Exynos5433 nodes

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 8 ++++----
 arch/arm64/boot/dts/exynos/exynos7.dtsi    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.7.4
