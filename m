From: thor.thayer@linux.intel.com
Subject: [PATCHv2 0/6] Add SOCFPGA System Manager
Date: Thu, 20 Dec 2018 18:23:16 -0600
Message-ID: <1545351802-4354-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, dinguyen@kernel.org, arnd@arndb.de, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, bjorn.andersson@linaro.org, olof@lixom.net, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <thor.thayer@linux.intel.com>

Add MFD driver for SOCFPGA System Manager to handle
System Manager calls differently for ARM32 vs ARM64.
The SOCFPGA System Manager includes registers from several
SOC peripherals.

On ARM32, syscon handles this aggregated register grouping.
Implement System Manager calls as regmap_mmio similar to syscon
for ARM32 SOCFPGA systems.

The ARM64 System Manager can only be accessed from priority
level EL3 so this new MFD driver handles the calls to EL3.

Thor Thayer (6):
  mfd: altera-sysmgr: Add SOCFPGA System Manager
  Documentation: dt: socfpga: Add S10 System Manager binding
  ARM: socfpga_defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
  arm64: defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
  net: stmmac: socfpga: Use shared System Manager driver
  arm64: dts: stratix10: New System Manager compatible

 .../bindings/arm/altera/socfpga-system.txt         |  12 +
 MAINTAINERS                                        |   6 +
 arch/arm/configs/socfpga_defconfig                 |   1 +
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   2 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/altera-sysmgr.c                        | 263 +++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   4 +-
 include/linux/mfd/altera-sysmgr.h                  | 113 +++++++++
 10 files changed, 411 insertions(+), 2 deletions(-)
 create mode 100644 drivers/mfd/altera-sysmgr.c
 create mode 100644 include/linux/mfd/altera-sysmgr.h

-- 
2.7.4
