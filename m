From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 1/3] clk: ingenic: Add proper Kconfig entries
Date: Tue, 21 Aug 2018 14:38:17 +0200
Message-ID: <20180821123819.25020-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: od@zcrc.me, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: devicetree@vger.kernel.org

Previously, the CGU code corresponding to the SoC for which we're
compiling the kernel was the only one enabled, which made it impossible
to build one kernel that supports them all.

Now, it is possible to select more than one SoC to support.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  2 +-
 drivers/clk/ingenic/Kconfig  | 37 ++++++++++++++++++++++++++++++++++++
 drivers/clk/ingenic/Makefile |  8 ++++----
 4 files changed, 43 insertions(+), 5 deletions(-)
 create mode 100644 drivers/clk/ingenic/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 721572a8c429..95a9627cdf1d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -281,6 +281,7 @@ source "drivers/clk/actions/Kconfig"
 source "drivers/clk/bcm/Kconfig"
 source "drivers/clk/hisilicon/Kconfig"
 source "drivers/clk/imgtec/Kconfig"
+source "drivers/clk/ingenic/Kconfig"
 source "drivers/clk/keystone/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 0bb25dd009d1..3b3da7d84496 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -71,7 +71,7 @@ obj-$(CONFIG_H8300)			+= h8300/
 obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
 obj-y					+= imgtec/
 obj-$(CONFIG_ARCH_MXC)			+= imx/
-obj-$(CONFIG_MACH_INGENIC)		+= ingenic/
+obj-y					+= ingenic/
 obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
 obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
 obj-y					+= mediatek/
diff --git a/drivers/clk/ingenic/Kconfig b/drivers/clk/ingenic/Kconfig
new file mode 100644
index 000000000000..851a5662f119
--- /dev/null
+++ b/drivers/clk/ingenic/Kconfig
@@ -0,0 +1,37 @@
+menu "Ingenic JZ47xx CGU drivers"
+	depends on MIPS || COMPILE_TEST
+
+config INGENIC_CGU_COMMON
+	bool
+
+config INGENIC_CGU_JZ4740
+	bool "Ingenic JZ4740 CGU driver"
+	default MACH_JZ4740
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic JZ4740
+	  and compatible SoCs.
+
+	  If building for a JZ4740 SoC, you want to say Y here.
+
+config INGENIC_CGU_JZ4770
+	bool "Ingenic JZ4770 CGU driver"
+	default MACH_JZ4770
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic JZ4770
+	  and compatible SoCs.
+
+	  If building for a JZ4770 SoC, you want to say Y here.
+
+config INGENIC_CGU_JZ4780
+	bool "Ingenic JZ4780 CGU driver"
+	default MACH_JZ4780
+	select INGENIC_CGU_COMMON
+	help
+	  Support the clocks provided by the CGU hardware on Ingenic JZ4780
+	  and compatible SoCs.
+
+	  If building for a JZ4780 SoC, you want to say Y here.
+
+endmenu
diff --git a/drivers/clk/ingenic/Makefile b/drivers/clk/ingenic/Makefile
index 1456e4cdb562..8b8dc79c7ce6 100644
--- a/drivers/clk/ingenic/Makefile
+++ b/drivers/clk/ingenic/Makefile
@@ -1,4 +1,4 @@
-obj-y				+= cgu.o
-obj-$(CONFIG_MACH_JZ4740)	+= jz4740-cgu.o
-obj-$(CONFIG_MACH_JZ4770)	+= jz4770-cgu.o
-obj-$(CONFIG_MACH_JZ4780)	+= jz4780-cgu.o
+obj-$(CONFIG_INGENIC_CGU_COMMON)	+= cgu.o
+obj-$(CONFIG_INGENIC_CGU_JZ4740)	+= jz4740-cgu.o
+obj-$(CONFIG_INGENIC_CGU_JZ4770)	+= jz4770-cgu.o
+obj-$(CONFIG_INGENIC_CGU_JZ4780)	+= jz4780-cgu.o
-- 
2.18.0
