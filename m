From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH 0/2] ARM: Exynos: Add DT based I/O mapping for Chip-ID controller
Date: Mon, 18 Feb 2013 13:24:57 +0530
Message-ID: <1361174099-18749-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, t.figa@samsung.com, sylvester.nawrocki@gmail.com
List-Id: devicetree@vger.kernel.org

This patch series allows device tree enabled platforms to setup a runtime
I/O mapping for the chip-id controller. This helps to remove statically
defined I/O mapping for the Chip-ID controller.

Thomas Abraham (2):
  ARM: Exynos: Create virtual I/O mapping for Chip-ID controller using device tree
  ARM: dts: Add chip-id controller node on Exynos4/5 SoC

 .../arm/samsung/samsung,exynos4210-chipid.txt      |   15 ++++++
 arch/arm/boot/dts/exynos4.dtsi                     |    5 ++
 arch/arm/boot/dts/exynos5250.dtsi                  |    5 ++
 arch/arm/mach-exynos/common.c                      |   53 +++++++++++---------
 arch/arm/mach-exynos/include/mach/map.h            |    1 -
 5 files changed, 55 insertions(+), 24 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung,exynos4210-chipid.txt

-- 
1.7.5.4
