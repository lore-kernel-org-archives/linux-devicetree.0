From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCHv4 0/4] mmc: fixed the mmc_of_parse for dwmmc
Date: Thu, 05 Jun 2014 11:22:06 +0900
Message-ID: <1401934928-7300-1-git-send-email-jh80.chung@samsung.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: linux-mmc@vger.kernel.org
Cc: chris@printf.net, ulf.hansson@linaro.org, tgih.jun@samsung.com, devicetree@vger.kernel.org, heiko@sntech.de, dinguyen@altera.com, mark.rutland@arm.com, tushar.behera@linaro.org, Jaehoon Chung <jh80.chung@samsung.com>
List-Id: devicetree@vger.kernel.org

This patch-set is fixed the dw-mmc controller problem.
dw-mmc controller have the slot, but mmc_of_parse didn't parse the slot sub-node.
So dw-mmc controller didn't work correctly.

Jaehoon Chung (2):
  mmc: dw_mmc: replace "disable-wp" from slot's quirk to host's quirk
  ARM: dts: unuse the slot-node and deprecated support-highspeed for
    dw-mmc.

Changelog V4:
	- Drop "mmc: host: add slot argument to mmc_of_parse"
	- Drop "mmc: dw_mmc: remove the "supports-highspeed" property.
	- Rename patch's subject.
	- Remove the slot-node for dw-mmc controller.

 .../devicetree/bindings/mmc/exynos-dw-mshc.txt     |   17 ++++--------
 .../devicetree/bindings/mmc/k3-dw-mshc.txt         |   12 ++++-----
 .../devicetree/bindings/mmc/synopsys-dw-mshc.txt   |   12 ++++-----
 arch/arm/boot/dts/exynos4412-odroidx.dts           |    8 ++----
 arch/arm/boot/dts/exynos4412-origen.dts            |    8 ++----
 arch/arm/boot/dts/exynos4412-trats2.dts            |    8 ++----
 arch/arm/boot/dts/exynos5250-arndale.dts           |   18 ++++---------
 arch/arm/boot/dts/exynos5250-cros-common.dtsi      |   27 +++++---------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |   18 ++++---------
 arch/arm/boot/dts/exynos5250-snow.dts              |    6 ++---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |   16 +++---------
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |   16 +++---------
 arch/arm/boot/dts/rk3066a-bqcurie2.dts             |   16 +++---------
 arch/arm/boot/dts/socfpga_arria5.dtsi              |    5 ++--
 arch/arm/boot/dts/socfpga_cyclone5.dtsi            |    9 +++----
 arch/arm/boot/dts/socfpga_vt.dts                   |    9 +++----
 drivers/mmc/host/dw_mmc.c                          |   10 +++-----
 17 files changed, 65 insertions(+), 150 deletions(-)

-- 
1.7.9.5

