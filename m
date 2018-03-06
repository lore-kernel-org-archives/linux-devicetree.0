From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v5 3/5] MIPS: mscc: add ocelot PCB123 device tree
Date: Tue,  6 Mar 2018 13:16:05 +0100
Message-ID: <20180306121607.1567-4-alexandre.belloni@bootlin.com>
References: <20180306121607.1567-1-alexandre.belloni@bootlin.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180306121607.1567-1-alexandre.belloni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: James Hogan <jhogan@kernel.org>, Ralf Baechle <ralf@linux-mips.org>
Cc: Allan Nielsen <Allan.Nielsen@microsemi.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a device tree for the Microsemi Ocelot PCB123 evaluation board.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 arch/mips/boot/dts/mscc/Makefile          |  2 ++
 arch/mips/boot/dts/mscc/ocelot_pcb123.dts | 27 +++++++++++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 arch/mips/boot/dts/mscc/ocelot_pcb123.dts

diff --git a/arch/mips/boot/dts/mscc/Makefile b/arch/mips/boot/dts/mscc/Makefile
index dd08e63a10ba..c51164537c02 100644
--- a/arch/mips/boot/dts/mscc/Makefile
+++ b/arch/mips/boot/dts/mscc/Makefile
@@ -1 +1,3 @@
+dtb-$(CONFIG_LEGACY_BOARD_OCELOT)	+= ocelot_pcb123.dtb
+
 obj-y				+= $(patsubst %.dtb, %.dtb.o, $(dtb-y))
diff --git a/arch/mips/boot/dts/mscc/ocelot_pcb123.dts b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
new file mode 100644
index 000000000000..b4e3860c6cf4
--- /dev/null
+++ b/arch/mips/boot/dts/mscc/ocelot_pcb123.dts
@@ -0,0 +1,27 @@
+//SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2017 Microsemi Corporation */
+
+/dts-v1/;
+
+#include "ocelot.dtsi"
+
+/ {
+	compatible = "mscc,ocelot-pcb123", "mscc,ocelot";
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0e000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
-- 
2.16.2
