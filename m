From: <tthayer@opensource.altera.com>
Subject: [PATCHv2 0/4] Add Altera peripheral memories to EDAC framework
Date: Fri, 17 Oct 2014 15:33:44 -0500
Message-ID: <1413578029-13205-1-git-send-email-tthayer@opensource.altera.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: bp@alien8.de, dougthompson@xmission.com, m.chehab@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, linux@arm.linux.org.uk, dinguyen@altera.com
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tthayer.linux@gmail.com, tthayer@opensource.altera.com, tthayer@altera.com
List-Id: devicetree@vger.kernel.org

From: Thor Thayer <tthayer@opensource.altera.com>

This patch adds the L2 cache and OCRAM peripherals to the EDAC framework
using the EDAC device framework. The ECC is enabled early in the boot
process in the platform specific code.

Thor Thayer (4):
  arm: socfpga: Enable L2 Cache ECC on startup.
  arm: socfpga: Enable OCRAM ECC on startup.
  edac: altera: Add Altera L2 Cache and OCRAM EDAC Support
  arm: dts: Add Altera L2 Cache and OCRAM EDAC

 .../bindings/arm/altera/socfpga-l2-edac.txt        |   15 ++
 .../bindings/arm/altera/socfpga-ocram-edac.txt     |   16 ++
 MAINTAINERS                                        |    4 +-
 arch/arm/boot/dts/socfpga.dtsi                     |   15 +-
 arch/arm/mach-socfpga/Makefile                     |    2 +
 arch/arm/mach-socfpga/l2_cache.c                   |   44 ++++
 arch/arm/mach-socfpga/l2_cache.h                   |   28 +++
 arch/arm/mach-socfpga/ocram.c                      |   90 +++++++
 arch/arm/mach-socfpga/ocram.h                      |   28 +++
 arch/arm/mach-socfpga/socfpga.c                    |   13 +-
 drivers/edac/Kconfig                               |   14 ++
 drivers/edac/Makefile                              |    3 +
 drivers/edac/altera_edac_mgr.c                     |  261 ++++++++++++++++++++
 drivers/edac/altera_edac_mgr.h                     |   56 +++++
 drivers/edac/altera_l2_edac.c                      |  130 ++++++++++
 drivers/edac/altera_ocram_edac.c                   |  107 ++++++++
 16 files changed, 823 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-l2-edac.txt
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-ocram-edac.txt
 create mode 100644 arch/arm/mach-socfpga/l2_cache.c
 create mode 100644 arch/arm/mach-socfpga/l2_cache.h
 create mode 100644 arch/arm/mach-socfpga/ocram.c
 create mode 100644 arch/arm/mach-socfpga/ocram.h
 create mode 100644 drivers/edac/altera_edac_mgr.c
 create mode 100644 drivers/edac/altera_edac_mgr.h
 create mode 100644 drivers/edac/altera_l2_edac.c
 create mode 100644 drivers/edac/altera_ocram_edac.c

-- 
1.7.9.5

