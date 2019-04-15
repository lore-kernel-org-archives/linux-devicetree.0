From: Yash Shah <yash.shah@sifive.com>
Subject: [PATCH 0/3] L2 cache controller and EDAC support for SiFive SoCs
Date: Mon, 15 Apr 2019 17:10:40 +0530
Message-ID: <1555328443-30874-1-git-send-email-yash.shah@sifive.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, palmer@sifive.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com, bp@alien8.de, mchehab@kernel.org, james.morse@arm.com, sachin.ghadi@sifive.com, Yash Shah <yash.shah@sifive.com>
List-Id: devicetree@vger.kernel.org

This patch series adds an L2 cache controller driver with DT documentation
and an EDAC platform driver for SiFive SoCs.

The EDAC platform driver registers for notifier events from the L2 cache
controller driver for L2 ECC events.

This patchset is based on Linux 5.1-rc2 and tested on HiFive Unleashed
board with additional board related patches needed for testing can be found
at dev/yashs/L2_cache_controller branch of:
https://github.com/yashshah7/riscv-linux.git

Yash Shah (3):
  RISC-V: Add DT documentation for SiFive L2 Cache Controller
  RISC-V: sifive_l2_cache: Add L2 cache controller driver for SiFive
    SoCs
  edac: sifive: Add EDAC platform driver for SiFive SoCs

 .../devicetree/bindings/riscv/sifive-l2-cache.txt  |  53 +++++
 arch/riscv/Kconfig                                 |   1 +
 arch/riscv/mm/Makefile                             |   1 +
 arch/riscv/mm/sifive_l2_cache.c                    | 224 +++++++++++++++++++++
 drivers/edac/Kconfig                               |   6 +
 drivers/edac/Makefile                              |   1 +
 drivers/edac/sifive_edac.c                         | 121 +++++++++++
 7 files changed, 407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/sifive-l2-cache.txt
 create mode 100644 arch/riscv/mm/sifive_l2_cache.c
 create mode 100644 drivers/edac/sifive_edac.c

-- 
1.9.1
