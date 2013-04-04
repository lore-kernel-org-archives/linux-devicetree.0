From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH 0/3] ARM: EXYNOS: DT-enabled support for Universal C210
Date: Thu, 04 Apr 2013 18:51:12 +0200
Message-ID: <1365094275-4811-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org, Tomasz Figa <t.figa@samsung.com>
List-Id: devicetree@vger.kernel.org

This series intends to add support for Universal C210 board using Device
Tree. Main difference from other boards based on Exynos 4210 is that
hardware revision of the SoC used on Universal C210 does not support MCT
timers and legacy PWM timers must be used instead.

First patch adds device tree node for PWM block available on Exynos 4 SoCs,
second patch adds support for Exynos4210 EVT0 SoC to mach-exynos4-dt and
third patch introduces initial device tree for Universal C210 board.

Depends on my series for PWM timers rework:
[PATCH v4 00/14] ARM: samsung-time: Prepare for multiplatform support
(http://thread.gmane.org/gmane.linux.kernel.samsung-soc/17464)

Tested on Universal C210 board.

Tomasz Figa (3):
  ARM: dts: exynos4: Add node for PWM device
  ARM: EXYNOS: Add support for Exynos4210 EVT0 SoC
  ARM: dts: exynos4210: Add basic dts file for universal_c210 board

 arch/arm/boot/dts/Makefile                      |   1 +
 arch/arm/boot/dts/exynos4.dtsi                  |   8 +
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 353 ++++++++++++++++++++++++
 arch/arm/mach-exynos/Kconfig                    |   9 +
 arch/arm/mach-exynos/mach-exynos4-dt.c          |  33 +++
 5 files changed, 404 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4210-universal_c210.dts

-- 
1.8.1.5
