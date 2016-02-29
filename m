From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 3/8] ARM64: dts: Prepare configs for Amlogic Meson GXBaby
Date: Tue,  1 Mar 2016 00:44:20 +0100
Message-ID: <1456789465-2962-4-git-send-email-afaerber@suse.de>
References: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1456789465-2962-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-meson@googlegroups.com
Cc: Carlo Caione <carlo@caione.org>, linux-arm-kernel@lists.infradead.org, Matthias Brugger <mbrugger@suse.com>, Nicolas Saenz <nicolassaenzj@gmail.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm64/boot/dts/Makefile                |   1 +
 arch/arm64/boot/dts/amlogic/Makefile        |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 128 ++++++++++++++++++++=
++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/Makefile
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefil=
e
index fd80617a9c6f..330fae966cf3 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,6 +1,7 @@
 dts-dirs +=3D al
 dts-dirs +=3D altera
 dts-dirs +=3D amd
+dts-dirs +=3D amlogic
 dts-dirs +=3D apm
 dts-dirs +=3D arm
 dts-dirs +=3D broadcom
diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts=
/amlogic/Makefile
new file mode 100644
index 000000000000..1b06c28c67eb
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -0,0 +1,3 @@
+always		:=3D $(dtb-y)
+subdir-y	:=3D $(dts-dirs)
+clean-files	:=3D *.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/b=
oot/dts/amlogic/meson-gxbb.dtsi
new file mode 100644
index 000000000000..0ae089bd1806
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -0,0 +1,128 @@
+/*
+ * Copyright (c) 2016 Andreas F=C3=A4rber
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This library is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of =
the
+ *     License, or (at your option) any later version.
+ *
+ *     This library is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible =3D "amlogic,meson-gxbb";
+	interrupt-parent =3D <&gic>;
+	#address-cells =3D <2>;
+	#size-cells =3D <2>;
+
+	cpus {
+		#address-cells =3D <0x2>;
+		#size-cells =3D <0x0>;
+
+		cpu0: cpu@0 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			reg =3D <0x0 0x0>;
+			enable-method =3D "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			reg =3D <0x0 0x1>;
+			enable-method =3D "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			reg =3D <0x0 0x2>;
+			enable-method =3D "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type =3D "cpu";
+			compatible =3D "arm,cortex-a53", "arm,armv8";
+			reg =3D <0x0 0x3>;
+			enable-method =3D "psci";
+		};
+	};
+
+	arm-pmu {
+		compatible =3D "arm,armv8-pmuv3";
+		interrupts =3D <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible =3D "arm,psci";
+		method =3D "smc";
+		cpu_suspend =3D <0xc4000001>;
+		cpu_off =3D <0x84000002>;
+		cpu_on =3D <0xc4000003>;
+		migrate =3D <0xc4000005>;
+	};
+
+	xtal: xtal-clk {
+		compatible =3D "fixed-clock";
+		clock-frequency =3D <24000000>;
+		clock-output-names =3D "xtal";
+		#clock-cells =3D <0>;
+	};
+
+	soc {
+		compatible =3D "simple-bus";
+		#address-cells =3D <2>;
+		#size-cells =3D <2>;
+		ranges;
+
+		gic: interrupt-controller@c4301000 {
+			compatible =3D "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+			reg =3D <0x0 0xc4301000 0 0x1000>,
+			      <0x0 0xc4302000 0 0x0100>;
+			interrupt-controller;
+			interrupts =3D <GIC_PPI 9
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells =3D <3>;
+			#address-cells =3D <0>;
+		};
+	};
+};
--=20
2.6.2
