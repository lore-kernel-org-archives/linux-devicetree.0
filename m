From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: [RFC 4/4] MIPS: Ingenic: Add Halley2 development board support
Date: Wed, 27 Sep 2017 20:45:27 +0530
Message-ID: <20170927151527.25570-5-prasannatsmkumar@gmail.com>
References: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, paul@crapouillou.net, malat@debian.org, dom.peklo@gmail.com
Cc: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Halley2 is a development board from Ingenic using X1000 SoC. It comes
with either 32MB or 64MB of RAM. Add support for halley2 development
board.

Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
 arch/mips/boot/dts/ingenic/Makefile    |  1 +
 arch/mips/boot/dts/ingenic/halley2.dts | 46 +++++++++++++++++++++++++
 arch/mips/configs/halley2_defconfig    | 61 ++++++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig               |  4 +++
 4 files changed, 112 insertions(+)
 create mode 100644 arch/mips/boot/dts/ingenic/halley2.dts
 create mode 100644 arch/mips/configs/halley2_defconfig

diff --git a/arch/mips/boot/dts/ingenic/Makefile b/arch/mips/boot/dts/ingenic/Makefile
index f2b864f..68e942c 100644
--- a/arch/mips/boot/dts/ingenic/Makefile
+++ b/arch/mips/boot/dts/ingenic/Makefile
@@ -1,5 +1,6 @@
 dtb-$(CONFIG_JZ4740_QI_LB60)	+= qi_lb60.dtb
 dtb-$(CONFIG_JZ4780_CI20)	+= ci20.dtb
+dtb-$(CONFIG_X1000_HALLEY2)	+= halley2.dtb
 
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
 
diff --git a/arch/mips/boot/dts/ingenic/halley2.dts b/arch/mips/boot/dts/ingenic/halley2.dts
new file mode 100644
index 0000000..9b37119
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/halley2.dts
@@ -0,0 +1,46 @@
+/*
+ * Copyright (C) 2016 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+/dts-v1/;
+
+#include "x1000.dtsi"
+
+/ {
+	compatible = "ingenic,halley2", "ingenic,x1000";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = &uart2;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x0 0x2000000>;
+	};
+};
+
+&ext {
+	clock-frequency = <24000000>;
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
diff --git a/arch/mips/configs/halley2_defconfig b/arch/mips/configs/halley2_defconfig
new file mode 100644
index 0000000..2c49fb7
--- /dev/null
+++ b/arch/mips/configs/halley2_defconfig
@@ -0,0 +1,61 @@
+CONFIG_MACH_INGENIC=y
+CONFIG_X1000_HALLEY2=y
+CONFIG_MACH_X1000=y
+
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_SERIAL_8250_NR_UARTS=3
+CONFIG_SERIAL_8250_RUNTIME_UARTS=3
+CONFIG_SERIAL_8250_INGENIC=y
+CONFIG_SERIAL_OF_PLATFORM=y
+# CONFIG_EARLY_PRINTK is not set
+CONFIG_MEMORY=y
+
+CONFIG_PRINTK_TIME=y
+CONFIG_DEBUG_INFO=y
+CONFIG_STRIP_ASM_SYMS=y
+CONFIG_DEBUG_FS=y
+CONFIG_MAGIC_SYSRQ=y
+CONFIG_LOCKUP_DETECTOR=y
+CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
+CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
+CONFIG_PANIC_ON_OOPS=y
+CONFIG_PANIC_TIMEOUT=10
+CONFIG_STACKTRACE=y
+CONFIG_CMDLINE_BOOL=y
+CONFIG_CMDLINE="earlycon console=ttyS2,115200n8 clk_ignore_unused"
+
+CONFIG_HZ_100=y
+CONFIG_HIGHMEM=y
+CONFIG_PREEMPT=y
+CONFIG_KERNEL_XZ=y
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_FHANDLE=y
+CONFIG_NO_HZ_IDLE=y
+CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
+CONFIG_MEMCG=y
+CONFIG_CGROUP_SCHED=y
+CONFIG_CGROUP_FREEZER=y
+CONFIG_CPUSETS=y
+CONFIG_CGROUP_DEVICE=y
+CONFIG_CGROUP_CPUACCT=y
+CONFIG_NAMESPACES=y
+CONFIG_USER_NS=y
+CONFIG_CC_OPTIMIZE_FOR_SIZE=y
+CONFIG_SYSCTL_SYSCALL=y
+CONFIG_KALLSYMS_ALL=y
+CONFIG_EMBEDDED=y
+CONFIG_SLAB=y
+CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
+CONFIG_DEVTMPFS=y
+CONFIG_VT_HW_CONSOLE_BINDING=y
+CONFIG_LEGACY_PTY_COUNT=2
+
+# CONFIG_SUSPEND is not set
+# CONFIG_HIBERNATION is not set
+# CONFIG_PM is not set
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 338bc3f..7c66a4b 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -11,6 +11,10 @@ config JZ4780_CI20
 	bool "MIPS Creator CI20"
 	select MACH_JZ4780
 
+config X1000_HALLEY2
+	bool "Ingenic X1000 Halley2 Development board"
+	select MACH_X1000
+
 endchoice
 
 config MACH_JZ4740
-- 
2.10.0
