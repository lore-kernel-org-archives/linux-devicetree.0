From: thor.thayer@linux.intel.com
Subject: [PATCHv4 0/6] Add SOCFPGA System Manager
Date: Thu, 14 Feb 2019 14:44:12 -0600
Message-ID: <1550177058-1860-1-git-send-email-thor.thayer@linux.intel.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: lee.jones@linaro.org, arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, olof@lixom.net
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Thor Thayer <thor.thayer@linux.intel.com>
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

v2 Changes:
Change socfpga_is_s10() to check compatible string.
Add new compatible string for Stratix10 in bindings
    and add proper detection method.
Replace base cast with resource_size_t member.
Change s10_sysmgr_regmap_cfg to altr_sysmgr_regmap_cfg to
    be generic.
Always use 4 byte width.
Initialize the .reg_read and .reg_write in S10 case only.
Remove call to syscon in 32bit ARM case and handle both
    ARM32 and ARM64 in of_sysmgr_register().
Replace IS_ERR_OR_NULL() with IS_ERR().
Remove compatible check functions except phandle function.

v3 Changes:
Create and register regmap in probe().
Lookup functions find registered regmap.
Cleanup of header file.
Fix copyright dates.
Replace global pointer with traditional probe() methodology.

v4 Changes:
Add missing of_node_put().
Add Reviewed-by from v2.

Thor Thayer (6):
  mfd: altera-sysmgr: Add SOCFPGA System Manager
  Documentation: dt: socfpga: Add S10 System Manager binding
  ARM: socfpga_defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
  arm64: defconfig: Enable CONFIG_MTD_ALTERA_SYSMGR
  net: stmmac: socfpga: Use shared System Manager driver
  arm64: dts: stratix10: New System Manager compatible

 .../bindings/arm/altera/socfpga-system.txt         |  12 ++
 MAINTAINERS                                        |   6 +
 arch/arm/configs/socfpga_defconfig                 |   1 +
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi  |   2 +-
 arch/arm64/configs/defconfig                       |   1 +
 drivers/mfd/Kconfig                                |  10 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/altera-sysmgr.c                        | 211 +++++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   5 +-
 include/linux/mfd/altera-sysmgr.h                  |  29 +++
 10 files changed, 275 insertions(+), 3 deletions(-)
 create mode 100644 drivers/mfd/altera-sysmgr.c
 create mode 100644 include/linux/mfd/altera-sysmgr.h

-- 
2.7.4
