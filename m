From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 4/6] ARM64: dts: Prepare configs for Amlogic Meson GXBaby
Date: Wed,  2 Mar 2016 03:34:59 +0100
Message-ID: <1456886101-22967-5-git-send-email-afaerber@suse.de>
References: <1456886101-22967-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456886101-22967-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-meson-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Cc: Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Nicolas Saenz <nicolassaenzj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v1 -> v2:
 * Adopted "arm,cortex-a53-pmu" compatible string (Sudeep)
 * Adopted "arm,gic-400" compatible string (Andr=C3=A9, Sudeep)
 * Adopted "arm,psci-0.2" compatible string and dropped functions (Sude=
ep)
 * Squashed GIC reg extension patch, enlarged one (Andr=C3=A9)
 * Squashed arch timer patch
 * Added uart nodes and aliases (from Vega S95 .dtsi)
 * Modeled cbus, aobus and apb
=20
 arch/arm64/boot/dts/Makefile                |   1 +
 arch/arm64/boot/dts/amlogic/Makefile        |   3 +
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 183 ++++++++++++++++++++=
++++++++
 3 files changed, 187 insertions(+)
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
index 000000000000..eaa0a4553734
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -0,0 +1,183 @@
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
+	aliases {
+		serial0 =3D &uart_AO;
+		serial1 =3D &uart_A;
+	};
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
+		compatible =3D "arm,cortex-a53-pmu";
+		interrupts =3D <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity =3D <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	psci {
+		compatible =3D "arm,psci-0.2";
+		method =3D "smc";
+	};
+
+	timer {
+		compatible =3D "arm,armv8-timer";
+		interrupts =3D <GIC_PPI 13
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_RAW(0xff) | IRQ_TYPE_EDGE_RISING)>;
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
+		cbus: cbus@c1100000 {
+			compatible =3D "simple-bus";
+			reg =3D <0x0 0xc1100000 0x0 0x100000>;
+			#address-cells =3D <2>;
+			#size-cells =3D <2>;
+			ranges =3D <0x0 0x0 0x0 0xc1100000 0x0 0x100000>;
+
+			uart_A: serial@84c0 {
+				compatible =3D "amlogic,meson-uart";
+				reg =3D <0x0 0x084c0 0x0 0x14>;
+				interrupts =3D <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+				clocks =3D <&xtal>;
+				status =3D "disabled";
+			};
+		};
+
+		gic: interrupt-controller@c4301000 {
+			compatible =3D "arm,gic-400";
+			reg =3D <0x0 0xc4301000 0 0x1000>,
+			      <0x0 0xc4302000 0 0x2000>,
+			      <0x0 0xc4304000 0 0x2000>,
+			      <0x0 0xc4306000 0 0x2000>;
+			interrupt-controller;
+			interrupts =3D <GIC_PPI 9
+				(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+			#interrupt-cells =3D <3>;
+			#address-cells =3D <0>;
+		};
+
+		aobus: aobus@c8100000 {
+			compatible =3D "simple-bus";
+			reg =3D <0x0 0xc8100000 0x0 0x100000>;
+			#address-cells =3D <2>;
+			#size-cells =3D <2>;
+			ranges =3D <0x0 0x0 0x0 0xc8100000 0x0 0x100000>;
+
+			uart_AO: serial@4c0 {
+				compatible =3D "amlogic,meson-uart";
+				reg =3D <0x0 0x004c0 0x0 0x14>;
+				interrupts =3D <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
+				clocks =3D <&xtal>;
+				status =3D "disabled";
+			};
+		};
+
+		apb: apb@d0000000 {
+			compatible =3D "simple-bus";
+			reg =3D <0x0 0xd0000000 0x0 0x200000>;
+			#address-cells =3D <2>;
+			#size-cells =3D <2>;
+			ranges =3D <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
+		};
+	};
+};
--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
