From: Lee Jones <lee.jones@linaro.org>
Subject: [GIT PULL] Immutable branch between MFD, ARM and Net due for the 5.2
 merge window
Date: Tue, 2 Apr 2019 07:43:17 +0100
Message-ID: <20190402064317.GA4187@dell>
References: <1552342688-6663-1-git-send-email-thor.thayer@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552342688-6663-1-git-send-email-thor.thayer@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thor.thayer@linux.intel.com
Cc: arnd@arndb.de, dinguyen@kernel.org, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com, olof@lixom.net, davem@davemloft.net, mcoquelin.stm32@gmail.com, mchehab+samsung@kernel.org, mark.rutland@arm.com, bjorn.andersson@linaro.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Enjoy!

The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-arm-net-5.2

for you to fetch changes up to 8f4ebe9b331ef3d39c8375ff38c623f26dbc1735:

  arm64: dts: stratix10: New System Manager compatible (2019-04-02 07:38:27 +0100)

----------------------------------------------------------------
Immutable branch between MFD, ARM and Net due for the 5.2 merge window

----------------------------------------------------------------
Thor Thayer (6):
      mfd: altera-sysmgr: Add SOCFPGA System Manager
      dt-bindings: arm: socfpga: Add S10 System Manager binding
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
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
