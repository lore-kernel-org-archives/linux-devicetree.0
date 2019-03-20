From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 0/2] EDAC Support for SiFive SoCs
Date: Wed, 20 Mar 2019 17:22:06 +0530
Message-ID: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-riscv@lists.infradead.org, linux-edac@vger.kernel.org, palmer@sifive.com, paul.walmsley@sifive.com
Cc: linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, aou@eecs.berkeley.edu, bp@alien8.de, mchehab@kernel.org, devicetree@vger.kernel.org, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

This patch series adds an EDAC driver and DT documentation
for FU540-C000 chip.

Initially L2 Cache controller is added as a subcomponent to this driver.

This patchset is based on Linux 5.0-rc8 and tested on HiFive Unleashed
board with additional board related patches needed for testing can be
found at dev/yashs/L2_cache_controller branch of:
https://github.com/yashshah7/riscv-linux.git

Yash Shah (2):
  edac: sifive: Add DT documentation for SiFive EDAC driver and
    subcomponent
  edac: sifive: Add EDAC driver for SiFive FU540-C000 chip

 .../devicetree/bindings/edac/sifive-edac.txt       |  40 +++
 arch/riscv/Kconfig                                 |   1 +
 drivers/edac/Kconfig                               |  13 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/sifive_edac.c                         | 297 +++++++++++++++++++++
 5 files changed, 352 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/edac/sifive-edac.txt
 create mode 100644 drivers/edac/sifive_edac.c

-- 
1.9.1
