From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 0/3] ARM: Exynos: Add support for MSHC controller
Date: Wed, 29 Aug 2012 16:31:09 +0530
Message-ID: <1346238072-7324-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, girish.shivananjappa@linaro.org, jh80.chung@samsung.com, tgih.jun@samsung.com, patches@linaro.org
List-Id: devicetree@vger.kernel.org

This patch series adds Exynos5250 platform support for MSHC controllers.

Thomas Abraham (3):
  ARM: Samsung: Add support for MSHC controller clocks
  ARM: Exynos5: Add AUXDATA support for MSHC controllers
  ARM: dts: Add nodes for dw_mmc controllers for Samsung Exynos5250 platforms

 arch/arm/boot/dts/exynos5250-smdk5250.dts |   55 +++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi         |   32 +++++++++++++++++
 arch/arm/mach-exynos/clock-exynos5.c      |   45 ++++++++---------------
 arch/arm/mach-exynos/include/mach/map.h   |    4 ++
 arch/arm/mach-exynos/mach-exynos5-dt.c    |    8 ++++
 5 files changed, 115 insertions(+), 29 deletions(-)
