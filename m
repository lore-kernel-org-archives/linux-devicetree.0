From: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 2/3] powerpc/p1010rdb:update dts to adapt to both old and  new p1010rdb
Date: Thu, 7 Nov 2013 10:29:28 +0800
Message-ID: <1383791369-29324-2-git-send-email-B45475@freescale.com>
References: <1383791369-29324-1-git-send-email-B45475@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383791369-29324-1-git-send-email-B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

P1010rdb-pa and p1010rdb-pb have different phy interrupts.
So update dts to adapt to both p1010rdb-pa and p1010rdb-pb.

Signed-off-by: Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Signed-off-by: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/p1010rdb-pa.dts     | 35 ++++++++++++
 arch/powerpc/boot/dts/p1010rdb-pa_36b.dts | 58 ++++++++++++++++++++
 arch/powerpc/boot/dts/p1010rdb-pb.dts     | 35 ++++++++++++
 arch/powerpc/boot/dts/p1010rdb-pb_36b.dts | 58 ++++++++++++++++++++
 arch/powerpc/boot/dts/p1010rdb.dts        | 66 -----------------------
 arch/powerpc/boot/dts/p1010rdb.dtsi       |  3 --
 arch/powerpc/boot/dts/p1010rdb_32b.dtsi   | 79 +++++++++++++++++++++++++++
 arch/powerpc/boot/dts/p1010rdb_36b.dts    | 89 -------------------------------
 arch/powerpc/boot/dts/p1010rdb_36b.dtsi   | 79 +++++++++++++++++++++++++++
 9 files changed, 344 insertions(+), 158 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/p1010rdb-pa.dts
 create mode 100644 arch/powerpc/boot/dts/p1010rdb-pa_36b.dts
 create mode 100644 arch/powerpc/boot/dts/p1010rdb-pb.dts
 create mode 100644 arch/powerpc/boot/dts/p1010rdb-pb_36b.dts
 delete mode 100644 arch/powerpc/boot/dts/p1010rdb.dts
 create mode 100644 arch/powerpc/boot/dts/p1010rdb_32b.dtsi
 delete mode 100644 arch/powerpc/boot/dts/p1010rdb_36b.dts
 create mode 100644 arch/powerpc/boot/dts/p1010rdb_36b.dtsi

diff --git a/arch/powerpc/boot/dts/p1010rdb-pa.dts b/arch/powerpc/boot/dts/p1010rdb-pa.dts
new file mode 100644
index 0000000..8a74700
--- /dev/null
+++ b/arch/powerpc/boot/dts/p1010rdb-pa.dts
@@ -0,0 +1,35 @@
+/*
+ * P1010 RDB Device Tree Source
+ *
+ * Copyright 2011 Freescale Semiconductor Inc.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+/include/ "fsl/p1010si-pre.dtsi"
+
+/ {
+	model = "fsl,P1010RDB";
+	compatible = "fsl,P1010RDB";
+
+	/include/ "p1010rdb_32b.dtsi"
+};
+
+/include/ "p1010rdb.dtsi"
+
+&phy0 {
+	interrupts = <3 1 0 0>;
+};
+
+&phy1 {
+	interrupts = <2 1 0 0>;
+};
+
+&phy2 {
+	interrupts = <2 1 0 0>;
+};
+
+/include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb-pa_36b.dts b/arch/powerpc/boot/dts/p1010rdb-pa_36b.dts
new file mode 100644
index 0000000..2004ee7
--- /dev/null
+++ b/arch/powerpc/boot/dts/p1010rdb-pa_36b.dts
@@ -0,0 +1,58 @@
+/*
+ * P1010 RDB Device Tree Source (36-bit address map)
+ *
+ * Copyright 2011 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *       notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *       notice, this list of conditions and the following disclaimer in the
+ *       documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *       names of its contributors may be used to endorse or promote products
+ *       derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/include/ "fsl/p1010si-pre.dtsi"
+
+/ {
+	model = "fsl,P1010RDB";
+	compatible = "fsl,P1010RDB";
+
+	/include/ "p1010rdb_36b.dtsi"
+};
+
+/include/ "p1010rdb.dtsi"
+
+&phy0 {
+	interrupts = <3 1 0 0>;
+};
+
+&phy1 {
+	interrupts = <2 1 0 0>;
+};
+
+&phy2 {
+	interrupts = <2 1 0 0>;
+};
+
+/include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb-pb.dts b/arch/powerpc/boot/dts/p1010rdb-pb.dts
new file mode 100644
index 0000000..6eeb7d3
--- /dev/null
+++ b/arch/powerpc/boot/dts/p1010rdb-pb.dts
@@ -0,0 +1,35 @@
+/*
+ * P1010 RDB Device Tree Source
+ *
+ * Copyright 2011 Freescale Semiconductor Inc.
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+/include/ "fsl/p1010si-pre.dtsi"
+
+/ {
+	model = "fsl,P1010RDB-PB";
+	compatible = "fsl,P1010RDB-PB";
+
+	/include/ "p1010rdb_32b.dtsi"
+};
+
+/include/ "p1010rdb.dtsi"
+
+&phy0 {
+	interrupts = <0 1 0 0>;
+};
+
+&phy1 {
+	interrupts = <2 1 0 0>;
+};
+
+&phy2 {
+	interrupts = <1 1 0 0>;
+};
+
+/include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb-pb_36b.dts b/arch/powerpc/boot/dts/p1010rdb-pb_36b.dts
new file mode 100644
index 0000000..7ab3c90
--- /dev/null
+++ b/arch/powerpc/boot/dts/p1010rdb-pb_36b.dts
@@ -0,0 +1,58 @@
+/*
+ * P1010 RDB Device Tree Source (36-bit address map)
+ *
+ * Copyright 2011 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *       notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *       notice, this list of conditions and the following disclaimer in the
+ *       documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *       names of its contributors may be used to endorse or promote products
+ *       derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/include/ "fsl/p1010si-pre.dtsi"
+
+/ {
+	model = "fsl,P1010RDB-PB";
+	compatible = "fsl,P1010RDB-PB";
+
+	/include/ "p1010rdb_36b.dtsi"
+};
+
+/include/ "p1010rdb.dtsi"
+
+&phy0 {
+	interrupts = <0 1 0 0>;
+};
+
+&phy1 {
+	interrupts = <2 1 0 0>;
+};
+
+&phy2 {
+	interrupts = <1 1 0 0>;
+};
+
+/include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb.dts b/arch/powerpc/boot/dts/p1010rdb.dts
deleted file mode 100644
index b868d22..0000000
--- a/arch/powerpc/boot/dts/p1010rdb.dts
+++ /dev/null
@@ -1,66 +0,0 @@
-/*
- * P1010 RDB Device Tree Source
- *
- * Copyright 2011 Freescale Semiconductor Inc.
- *
- * This program is free software; you can redistribute  it and/or modify it
- * under  the terms of  the GNU General  Public License as published by the
- * Free Software Foundation;  either version 2 of the  License, or (at your
- * option) any later version.
- */
-
-/include/ "fsl/p1010si-pre.dtsi"
-
-/ {
-	model = "fsl,P1010RDB";
-	compatible = "fsl,P1010RDB";
-
-	memory {
-		device_type = "memory";
-	};
-
-	board_ifc: ifc: ifc@ffe1e000 {
-		/* NOR, NAND Flashes and CPLD on board */
-		ranges = <0x0 0x0 0x0 0xee000000 0x02000000
-			  0x1 0x0 0x0 0xff800000 0x00010000
-			  0x3 0x0 0x0 0xffb00000 0x00000020>;
-		reg = <0x0 0xffe1e000 0 0x2000>;
-	};
-
-	board_soc: soc: soc@ffe00000 {
-		ranges = <0x0 0x0 0xffe00000 0x100000>;
-	};
-
-	pci0: pcie@ffe09000 {
-		reg = <0 0xffe09000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0 0xffc10000 0x0 0x10000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0xa0000000
-				  0x2000000 0x0 0xa0000000
-				  0x0 0x20000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x100000>;
-		};
-	};
-
-	pci1: pcie@ffe0a000 {
-		reg = <0 0xffe0a000 0 0x1000>;
-		ranges = <0x2000000 0x0 0x80000000 0 0x80000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0 0xffc00000 0x0 0x10000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0x80000000
-				  0x2000000 0x0 0x80000000
-				  0x0 0x20000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x100000>;
-		};
-	};
-};
-
-/include/ "p1010rdb.dtsi"
-/include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb.dtsi b/arch/powerpc/boot/dts/p1010rdb.dtsi
index ec7c27a..4853399 100644
--- a/arch/powerpc/boot/dts/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/p1010rdb.dtsi
@@ -193,17 +193,14 @@
 
 	mdio@24000 {
 		phy0: ethernet-phy@0 {
-			interrupts = <3 1 0 0>;
 			reg = <0x1>;
 		};
 
 		phy1: ethernet-phy@1 {
-			interrupts = <2 1 0 0>;
 			reg = <0x0>;
 		};
 
 		phy2: ethernet-phy@2 {
-			interrupts = <2 1 0 0>;
 			reg = <0x2>;
 		};
 
diff --git a/arch/powerpc/boot/dts/p1010rdb_32b.dtsi b/arch/powerpc/boot/dts/p1010rdb_32b.dtsi
new file mode 100644
index 0000000..fdc19aa
--- /dev/null
+++ b/arch/powerpc/boot/dts/p1010rdb_32b.dtsi
@@ -0,0 +1,79 @@
+/*
+ * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
+ *
+ * Copyright 2013 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *       notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *       notice, this list of conditions and the following disclaimer in the
+ *       documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *       names of its contributors may be used to endorse or promote products
+ *       derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+memory {
+	device_type = "memory";
+};
+
+board_ifc: ifc: ifc@ffe1e000 {
+	/* NOR, NAND Flashes and CPLD on board */
+	ranges = <0x0 0x0 0x0 0xee000000 0x02000000
+		  0x1 0x0 0x0 0xff800000 0x00010000
+		  0x3 0x0 0x0 0xffb00000 0x00000020>;
+	reg = <0x0 0xffe1e000 0 0x2000>;
+};
+
+board_soc: soc: soc@ffe00000 {
+	ranges = <0x0 0x0 0xffe00000 0x100000>;
+};
+
+pci0: pcie@ffe09000 {
+	reg = <0 0xffe09000 0 0x1000>;
+	ranges = <0x2000000 0x0 0xa0000000 0 0xa0000000 0x0 0x20000000
+		  0x1000000 0x0 0x00000000 0 0xffc10000 0x0 0x10000>;
+	pcie@0 {
+		ranges = <0x2000000 0x0 0xa0000000
+			  0x2000000 0x0 0xa0000000
+			  0x0 0x20000000
+
+			  0x1000000 0x0 0x0
+			  0x1000000 0x0 0x0
+			  0x0 0x100000>;
+	};
+};
+
+pci1: pcie@ffe0a000 {
+	reg = <0 0xffe0a000 0 0x1000>;
+	ranges = <0x2000000 0x0 0x80000000 0 0x80000000 0x0 0x20000000
+		  0x1000000 0x0 0x00000000 0 0xffc00000 0x0 0x10000>;
+	pcie@0 {
+		ranges = <0x2000000 0x0 0x80000000
+			  0x2000000 0x0 0x80000000
+			  0x0 0x20000000
+
+			  0x1000000 0x0 0x0
+			  0x1000000 0x0 0x0
+			  0x0 0x100000>;
+	};
+};
diff --git a/arch/powerpc/boot/dts/p1010rdb_36b.dts b/arch/powerpc/boot/dts/p1010rdb_36b.dts
deleted file mode 100644
index 64776f4..0000000
--- a/arch/powerpc/boot/dts/p1010rdb_36b.dts
+++ /dev/null
@@ -1,89 +0,0 @@
-/*
- * P1010 RDB Device Tree Source (36-bit address map)
- *
- * Copyright 2011 Freescale Semiconductor Inc.
- *
- * Redistribution and use in source and binary forms, with or without
- * modification, are permitted provided that the following conditions are met:
- *     * Redistributions of source code must retain the above copyright
- *       notice, this list of conditions and the following disclaimer.
- *     * Redistributions in binary form must reproduce the above copyright
- *       notice, this list of conditions and the following disclaimer in the
- *       documentation and/or other materials provided with the distribution.
- *     * Neither the name of Freescale Semiconductor nor the
- *       names of its contributors may be used to endorse or promote products
- *       derived from this software without specific prior written permission.
- *
- *
- * ALTERNATIVELY, this software may be distributed under the terms of the
- * GNU General Public License ("GPL") as published by the Free Software
- * Foundation, either version 2 of that License or (at your option) any
- * later version.
- *
- * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
- * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
- * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
- * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
- * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
- * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
- * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
- * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
- * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- */
-
-/include/ "fsl/p1010si-pre.dtsi"
-
-/ {
-	model = "fsl,P1010RDB";
-	compatible = "fsl,P1010RDB";
-
-	memory {
-		device_type = "memory";
-	};
-
-	board_ifc: ifc: ifc@fffe1e000 {
-		/* NOR, NAND Flashes and CPLD on board */
-		ranges = <0x0 0x0 0xf 0xee000000 0x02000000
-			  0x1 0x0 0xf 0xff800000 0x00010000
-			  0x3 0x0 0xf 0xffb00000 0x00000020>;
-		reg = <0xf 0xffe1e000 0 0x2000>;
-	};
-
-	board_soc: soc: soc@fffe00000 {
-		ranges = <0x0 0xf 0xffe00000 0x100000>;
-	};
-
-	pci0: pcie@fffe09000 {
-		reg = <0xf 0xffe09000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xc0000000 0xc 0x20000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0xf 0xffc10000 0x0 0x10000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0xc0000000
-				  0x2000000 0x0 0xc0000000
-				  0x0 0x20000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x100000>;
-		};
-	};
-
-	pci1: pcie@fffe0a000 {
-		reg = <0xf 0xffe0a000 0 0x1000>;
-		ranges = <0x2000000 0x0 0xc0000000 0xc 0x20000000 0x0 0x20000000
-			  0x1000000 0x0 0x00000000 0xf 0xffc10000 0x0 0x10000>;
-		pcie@0 {
-			ranges = <0x2000000 0x0 0xc0000000
-				  0x2000000 0x0 0xc0000000
-				  0x0 0x20000000
-
-				  0x1000000 0x0 0x0
-				  0x1000000 0x0 0x0
-				  0x0 0x100000>;
-		};
-	};
-};
-
-/include/ "p1010rdb.dtsi"
-/include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb_36b.dtsi b/arch/powerpc/boot/dts/p1010rdb_36b.dtsi
new file mode 100644
index 0000000..de2fcee
--- /dev/null
+++ b/arch/powerpc/boot/dts/p1010rdb_36b.dtsi
@@ -0,0 +1,79 @@
+/*
+ * P1010 RDB Device Tree Source stub (no addresses or top-level ranges)
+ *
+ * Copyright 2013 Freescale Semiconductor Inc.
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions are met:
+ *     * Redistributions of source code must retain the above copyright
+ *       notice, this list of conditions and the following disclaimer.
+ *     * Redistributions in binary form must reproduce the above copyright
+ *       notice, this list of conditions and the following disclaimer in the
+ *       documentation and/or other materials provided with the distribution.
+ *     * Neither the name of Freescale Semiconductor nor the
+ *       names of its contributors may be used to endorse or promote products
+ *       derived from this software without specific prior written permission.
+ *
+ *
+ * ALTERNATIVELY, this software may be distributed under the terms of the
+ * GNU General Public License ("GPL") as published by the Free Software
+ * Foundation, either version 2 of that License or (at your option) any
+ * later version.
+ *
+ * THIS SOFTWARE IS PROVIDED BY Freescale Semiconductor ``AS IS'' AND ANY
+ * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
+ * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
+ * DISCLAIMED. IN NO EVENT SHALL Freescale Semiconductor BE LIABLE FOR ANY
+ * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
+ * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
+ * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
+ * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
+ * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
+ * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+memory {
+	device_type = "memory";
+};
+
+board_ifc: ifc: ifc@fffe1e000 {
+	/* NOR, NAND Flashes and CPLD on board */
+	ranges = <0x0 0x0 0xf 0xee000000 0x02000000
+		  0x1 0x0 0xf 0xff800000 0x00010000
+		  0x3 0x0 0xf 0xffb00000 0x00000020>;
+	reg = <0xf 0xffe1e000 0 0x2000>;
+};
+
+board_soc: soc: soc@fffe00000 {
+	ranges = <0x0 0xf 0xffe00000 0x100000>;
+};
+
+pci0: pcie@fffe09000 {
+	reg = <0xf 0xffe09000 0 0x1000>;
+	ranges = <0x2000000 0x0 0xc0000000 0xc 0x20000000 0x0 0x20000000
+		  0x1000000 0x0 0x00000000 0xf 0xffc10000 0x0 0x10000>;
+	pcie@0 {
+		ranges = <0x2000000 0x0 0xc0000000
+			  0x2000000 0x0 0xc0000000
+			  0x0 0x20000000
+
+			  0x1000000 0x0 0x0
+			  0x1000000 0x0 0x0
+			  0x0 0x100000>;
+	};
+};
+
+pci1: pcie@fffe0a000 {
+	reg = <0xf 0xffe0a000 0 0x1000>;
+	ranges = <0x2000000 0x0 0xc0000000 0xc 0x20000000 0x0 0x20000000
+		  0x1000000 0x0 0x00000000 0xf 0xffc10000 0x0 0x10000>;
+	pcie@0 {
+		ranges = <0x2000000 0x0 0xc0000000
+			  0x2000000 0x0 0xc0000000
+			  0x0 0x20000000
+
+			  0x1000000 0x0 0x0
+			  0x1000000 0x0 0x0
+			  0x0 0x100000>;
+	};
+};
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
