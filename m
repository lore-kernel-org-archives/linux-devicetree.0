From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 6/8] ARM64: dts: amlogic: Add Tronsmart Vega S95 configs
Date: Tue,  1 Mar 2016 00:44:23 +0100
Message-ID: <1456789465-2962-7-git-send-email-afaerber@suse.de>
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

Add Device Trees for Tronsmart Vega S95 Pro, Meta and Telos TV boxes.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm64/boot/dts/amlogic/Makefile               |  4 ++
 .../boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts  | 55 ++++++++++++++=
++
 .../boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts   | 55 ++++++++++++++=
++
 .../boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts | 55 ++++++++++++++=
++
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 73 ++++++++++++++=
++++++++
 5 files changed, 242 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-met=
a.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro=
=2Edts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-tel=
os.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dts=
i

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts=
/amlogic/Makefile
index 1b06c28c67eb..eb672f38f89e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -1,3 +1,7 @@
+dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-vega-s95-pro.dtb
+dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-vega-s95-meta.dtb
+dtb-$(CONFIG_ARCH_MESON) +=3D meson-gxbb-vega-s95-telos.dtb
+
 always		:=3D $(dtb-y)
 subdir-y	:=3D $(dts-dirs)
 clean-files	:=3D *.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts b=
/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
new file mode 100644
index 000000000000..399aff9e7975
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-meta.dts
@@ -0,0 +1,55 @@
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
+/dts-v1/;
+
+#include "meson-gxbb-vega-s95.dtsi"
+
+/ {
+	compatible =3D "tronsmart,vega-s95-meta", "tronsmart,vega-s95", "amlo=
gic,meson-gxbb";
+	model =3D "Tronsmart Vega S95 Meta";
+
+	memory {
+		device_type =3D "memory";
+		reg =3D <0x0 0x0 0x0 0x80000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts b/=
arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
new file mode 100644
index 000000000000..ac5a241b5ec2
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-pro.dts
@@ -0,0 +1,55 @@
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
+/dts-v1/;
+
+#include "meson-gxbb-vega-s95.dtsi"
+
+/ {
+	compatible =3D "tronsmart,vega-s95-pro", "tronsmart,vega-s95", "amlog=
ic,meson-gxbb";
+	model =3D "Tronsmart Vega S95 Pro";
+
+	memory {
+		device_type =3D "memory";
+		reg =3D <0x0 0x0 0x0 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts =
b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
new file mode 100644
index 000000000000..fff7bfa2aa39
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95-telos.dts
@@ -0,0 +1,55 @@
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
+/dts-v1/;
+
+#include "meson-gxbb-vega-s95.dtsi"
+
+/ {
+	compatible =3D "tronsmart,vega-s95-telos", "tronsmart,vega-s95", "aml=
ogic,meson-gxbb";
+	model =3D "Tronsmart Vega S95 Telos";
+
+	memory {
+		device_type =3D "memory";
+		reg =3D <0x0 0x0 0x0 0x80000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arc=
h/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
new file mode 100644
index 000000000000..f8c78beb4376
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -0,0 +1,73 @@
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
+#include "meson-gxbb.dtsi"
+
+/ {
+	compatible =3D "tronsmart,vega-s95", "amlogic,meson-gxbb";
+
+	aliases {
+		serial0 =3D &uart_AO;
+		serial1 =3D &uart_A;
+	};
+
+	chosen {
+		stdout-path =3D "serial0:115200n8";
+	};
+
+	soc {
+		uart_A: serial@c11084c0 {
+			compatible =3D "amlogic,meson-uart";
+			reg =3D <0x0 0xc11084c0 0x0 0x14>;
+			interrupts =3D <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
+			clocks =3D <&xtal>;
+			status =3D "disabled";
+		};
+
+		uart_AO: serial@c81004c0 {
+			compatible =3D "amlogic,meson-uart";
+			reg =3D <0x0 0xc81004c0 0x0 0x14>;
+			interrupts =3D <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>;
+			clocks =3D <&xtal>;
+		};
+	};
+};
--=20
2.6.2
