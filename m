From: Loys Ollivier <lollivier@baylibre.com>
Subject: [PATCH 1/3] arch: riscv: add config option for building SiFive's SoC resource
Date: Mon, 17 Jun 2019 21:29:48 +0200
Message-ID: <1560799790-20287-2-git-send-email-lollivier@baylibre.com>
References: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560799790-20287-1-git-send-email-lollivier@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Loys Ollivier <lollivier@baylibre.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
List-Id: devicetree@vger.kernel.org

Create a config option for building SiFive SoC specific resources
e.g. SiFive device tree, platform drivers...

Signed-off-by: Loys Ollivier <lollivier@baylibre.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
---
 arch/riscv/Kconfig                  | 2 ++
 arch/riscv/Kconfig.socs             | 8 ++++++++
 arch/riscv/boot/dts/sifive/Makefile | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/Kconfig.socs

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index ee32c66e1af3..eace5857c9e9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -94,6 +94,8 @@ config PGTABLE_LEVELS
 	default 3 if 64BIT
 	default 2
 
+source "arch/riscv/Kconfig.socs"
+
 menu "Platform type"
 
 choice
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
new file mode 100644
index 000000000000..60dae1b5f276
--- /dev/null
+++ b/arch/riscv/Kconfig.socs
@@ -0,0 +1,8 @@
+menu "SoC selection"
+
+config SOC_SIFIVE
+       bool "SiFive SoCs"
+       help
+         This enables support for SiFive SoC platform hardware.
+
+endmenu
diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
index baaeef9efdcb..6d6189e6e4af 100644
--- a/arch/riscv/boot/dts/sifive/Makefile
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-y += hifive-unleashed-a00.dtb
+dtb-$(CONFIG_SOC_SIFIVE) += hifive-unleashed-a00.dtb
-- 
2.7.4
