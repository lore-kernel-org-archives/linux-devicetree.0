From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 1/6] arch: riscv: add support for building DTB files from DT source data
Date: Thu, 11 Apr 2019 01:42:59 -0700
Message-ID: <20190411084304.5072-2-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Paul Walmsley <paul@pwsan.com>, Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
List-Id: devicetree@vger.kernel.org

Similar to ARM64, add support for building DTB files from DT source
data for RISC-V boards.

This patch starts with the infrastructure needed for SiFive boards.
Boards from other vendors would add support here in a similar form.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
---
 arch/riscv/Kconfig           | 2 ++
 arch/riscv/Kconfig.platforms | 8 ++++++++
 arch/riscv/boot/dts/Makefile | 2 ++
 3 files changed, 12 insertions(+)
 create mode 100644 arch/riscv/Kconfig.platforms
 create mode 100644 arch/riscv/boot/dts/Makefile

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82d8aa1..10e818816017 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -127,6 +127,8 @@ config ARCH_RV64I
 
 endchoice
 
+source "arch/riscv/Kconfig.platforms"
+
 # We must be able to map all physical memory into the kernel, but the compiler
 # is still a bit more efficient when generating code if it's setup in a manner
 # such that it can only map 2GiB of memory.
diff --git a/arch/riscv/Kconfig.platforms b/arch/riscv/Kconfig.platforms
new file mode 100644
index 000000000000..bd3d2642bcff
--- /dev/null
+++ b/arch/riscv/Kconfig.platforms
@@ -0,0 +1,8 @@
+menu "Platform selection"
+
+config ARCH_SIFIVE
+        bool "SiFive platforms"
+        help
+          This enables direct support for SiFive SoC platform hardware.
+
+endmenu
diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
new file mode 100644
index 000000000000..dcc3ada78455
--- /dev/null
+++ b/arch/riscv/boot/dts/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+subdir-y += sifive
-- 
2.20.1
