Return-Path: <SRS0=vThj=SN=flygoat.com=jiaxun.yang@kernel.org>
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH v2 6/6] MIPS: Loongson32: dts: add ls1b & ls1c
Date: Thu, 11 Apr 2019 20:19:15 +0800
Message-Id: <20190411121915.8040-7-jiaxun.yang@flygoat.com>
In-Reply-To: <20190411121915.8040-1-jiaxun.yang@flygoat.com>
References: <20190312091520.8863-2-jiaxun.yang@flygoat.com>
 <20190411121915.8040-1-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: linux-mips@vger.kernel.org
Cc: devicetree@vger.kernel.org, paul.burton@mips.com, robh+dt@kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>
List-ID: <devicetree@vger.kernel.org>

Add devicetree skeleton for ls1b and ls1c.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 arch/mips/boot/dts/loongson/Makefile  |   6 ++
 arch/mips/boot/dts/loongson/ls1b.dts  |  30 ++++++++
 arch/mips/boot/dts/loongson/ls1c.dts  |  34 +++++++++
 arch/mips/boot/dts/loongson/ls1x.dtsi | 103 ++++++++++++++++++++++++++
 4 files changed, 173 insertions(+)
 create mode 100644 arch/mips/boot/dts/loongson/Makefile
 create mode 100644 arch/mips/boot/dts/loongson/ls1b.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls1c.dts
 create mode 100644 arch/mips/boot/dts/loongson/ls1x.dtsi

diff --git a/arch/mips/boot/dts/loongson/Makefile b/arch/mips/boot/dts/loongson/Makefile
new file mode 100644
index 000000000000..447801568f33
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_LOONGSON1_LS1B)	+= ls1b.dtb
+
+dtb-$(CONFIG_LOONGSON1_LS1B)	+= ls1c.dtb
+
+obj-$(CONFIG_BUILTIN_DTB)	+= $(addsuffix .o, $(dtb-y))
diff --git a/arch/mips/boot/dts/loongson/ls1b.dts b/arch/mips/boot/dts/loongson/ls1b.dts
new file mode 100644
index 000000000000..11b516c77d22
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls1b.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ */
+
+/dts-v1/;
+#include <ls1x.dtsi>
+
+/ {
+	model = "Loongson LS1B";
+
+	cpus {
+	#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "loongson,ls1b";
+			reg = <0>;
+		};
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
\ No newline at end of file
diff --git a/arch/mips/boot/dts/loongson/ls1c.dts b/arch/mips/boot/dts/loongson/ls1c.dts
new file mode 100644
index 000000000000..edca46234cfc
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls1c.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ */
+
+/dts-v1/;
+#include <ls1x.dtsi>
+
+/ {
+	model = "Loongson LS1C";
+
+	cpus {
+	#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "loongson,ls1c";
+			reg = <0>;
+		};
+	};
+};
+
+&platintc4 {
+	status = "okay";
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
\ No newline at end of file
diff --git a/arch/mips/boot/dts/loongson/ls1x.dtsi b/arch/mips/boot/dts/loongson/ls1x.dtsi
new file mode 100644
index 000000000000..1aca0c990fea
--- /dev/null
+++ b/arch/mips/boot/dts/loongson/ls1x.dtsi
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 Jiaxun Yang <jiaxun.yang@flygoat.com>
+ */
+
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
+
+
+/ {
+    #address-cells = <1>;
+	#size-cells = <1>;
+
+	cpu_intc: interrupt-controller {
+		#address-cells = <0>;
+		compatible = "mti,cpu-interrupt-controller";
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		compatible = "simple-bus";
+		ranges;
+
+
+		platintc0: interrupt-controller@1fd01040 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1fd01040 0x18>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <2>;
+		};
+
+		platintc1: interrupt-controller@1fd01058 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1fd01058 0x18>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <3>;
+		};
+
+		platintc2: interrupt-controller@1fd01070 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1fd01070 0x18>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <4>;
+		};
+
+		platintc3: interrupt-controller@1fd01088 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1fd01088 0x18>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <5>;
+		};
+
+		platintc4: interrupt-controller@1fd010a0 {
+			compatible = "loongson,ls1x-intc";
+			reg = <0x1fd010a0 0x18>;
+
+			interrupt-controller;
+			#interrupt-cells = <2>;
+
+			interrupt-parent = <&cpu_intc>;
+			interrupts = <6>;
+			status = "disabled";
+		};
+
+		ehci0: usb@1fe20000 {
+			compatible = "generic-ehci";
+			reg = <0x1fe20000 0x100>;
+			interrupt-parent = <&platintc1>;
+			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			};
+
+		ohci0: usb@1fe28000 {
+			compatible = "generic-ohci";
+			reg = <0x1fe28000 0x100>;
+			interrupt-parent = <&platintc1>;
+			interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			};
+
+	};
+};
-- 
2.21.0
