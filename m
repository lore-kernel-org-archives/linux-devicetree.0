From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 1/3] clk: loongson1: add configuration option for loongson1 clks
Date: Mon, 28 Jan 2019 23:20:50 +0800
Message-ID: <20190128152052.3047-2-jiaxun.yang@flygoat.com>
References: <20190125133413.4130-1-jiaxun.yang@flygoat.com>
 <20190128152052.3047-1-jiaxun.yang@flygoat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190128152052.3047-1-jiaxun.yang@flygoat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-Id: devicetree@vger.kernel.org

The patch introduces options for loongson1 clocks so we can
select the driver we need.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 drivers/clk/Kconfig            |  1 +
 drivers/clk/Makefile           |  2 +-
 drivers/clk/loongson1/Kconfig  | 27 +++++++++++++++++++++++++++
 drivers/clk/loongson1/Makefile |  7 ++++---
 4 files changed, 33 insertions(+), 4 deletions(-)
 create mode 100644 drivers/clk/loongson1/Kconfig

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index e5b2fe80eab4..136d3d73c6df 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -298,6 +298,7 @@ source "drivers/clk/imgtec/Kconfig"
 source "drivers/clk/imx/Kconfig"
 source "drivers/clk/ingenic/Kconfig"
 source "drivers/clk/keystone/Kconfig"
+source "drivers/clk/loongson1/Kconfig"
 source "drivers/clk/mediatek/Kconfig"
 source "drivers/clk/meson/Kconfig"
 source "drivers/clk/mvebu/Kconfig"
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 8a9440a97500..7d29e545caf0 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -76,7 +76,7 @@ obj-y					+= imx/
 obj-y					+= ingenic/
 obj-$(CONFIG_ARCH_K3)			+= keystone/
 obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
-obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
+obj-y					+= loongson1/
 obj-y					+= mediatek/
 obj-$(CONFIG_COMMON_CLK_AMLOGIC)	+= meson/
 obj-$(CONFIG_MACH_PIC32)		+= microchip/
diff --git a/drivers/clk/loongson1/Kconfig b/drivers/clk/loongson1/Kconfig
new file mode 100644
index 000000000000..e2220332d797
--- /dev/null
+++ b/drivers/clk/loongson1/Kconfig
@@ -0,0 +1,27 @@
+menu "Loongson-1 Clock drivers"
+	depends on MACH_LOONGSON32
+
+config LOONGSON1_CLOCK_COMMON
+	bool
+
+config LOONGSON1_CLOCK_LS1B
+	bool "Loongson 1B driver"
+	default y
+	select LOONGSON1_CLOCK_COMMON
+	help
+	  Support the clocks provided by the clock hardware on Loongson-1B
+	  and compatible SoCs.
+
+	  If building for a Loongson-1B SoC, you want to say Y here.
+
+config LOONGSON1_CLOCK_LS1C
+	bool "Loongson 1C driver"
+	default y
+	select LOONGSON1_CLOCK_COMMON
+	help
+	  Support the clocks provided by the clock hardware on Loongson-1C
+	  and compatible SoCs.
+
+	  If building for a Loongson-1C SoC, you want to say Y here.
+
+endmenu
diff --git a/drivers/clk/loongson1/Makefile b/drivers/clk/loongson1/Makefile
index b7f6a16390e0..9240189183ff 100644
--- a/drivers/clk/loongson1/Makefile
+++ b/drivers/clk/loongson1/Makefile
@@ -1,3 +1,4 @@
-obj-y				+= clk.o
-obj-$(CONFIG_LOONGSON1_LS1B)	+= clk-loongson1b.o
-obj-$(CONFIG_LOONGSON1_LS1C)	+= clk-loongson1c.o
+# SPDX-License-Identifier: GPL-2.0
+obj-$(CONFIG_LOONGSON1_CLOCK_COMMON)	+= clk.o
+obj-$(CONFIG_LOONGSON1_CLOCK_LS1B)	+= clk-loongson1b.o
+obj-$(CONFIG_LOONGSON1_CLOCK_LS1C)	+= clk-loongson1c.o
-- 
2.20.1
