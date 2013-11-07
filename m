From: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH 3/3] powerpc/p1010rdb:update mtd of nand to adapt to both old  and   new p1010rdb
Date: Thu, 7 Nov 2013 10:29:29 +0800
Message-ID: <1383791369-29324-3-git-send-email-B45475@freescale.com>
References: <1383791369-29324-1-git-send-email-B45475@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383791369-29324-1-git-send-email-B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: bcousson-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

P1010rdb-pa and p1010rdb-pb have different mtd of nand.
So update dts to adapt to both p1010rdb-pa and p1010rdb-pb.

Move the nand-mtd from p1010rdb.dtsi to p1010rdb-pa*.dts.
Remove nand-mtd for p1010rdb-pb, whick will use mtdparts
from u-boot instead of nand-mtd in device tree.

Signed-off-by: Zhao Qiang <B45475-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 arch/powerpc/boot/dts/p1010rdb-pa.dts     | 14 +----
 arch/powerpc/boot/dts/p1010rdb-pa.dtsi    | 85 +++++++++++++++++++++++++++++++
 arch/powerpc/boot/dts/p1010rdb-pa_36b.dts | 14 +----
 arch/powerpc/boot/dts/p1010rdb.dtsi       | 40 +--------------
 4 files changed, 88 insertions(+), 65 deletions(-)
 create mode 100644 arch/powerpc/boot/dts/p1010rdb-pa.dtsi

diff --git a/arch/powerpc/boot/dts/p1010rdb-pa.dts b/arch/powerpc/boot/dts/p1010rdb-pa.dts
index 8a74700..767d4c0 100644
--- a/arch/powerpc/boot/dts/p1010rdb-pa.dts
+++ b/arch/powerpc/boot/dts/p1010rdb-pa.dts
@@ -19,17 +19,5 @@
 };
 
 /include/ "p1010rdb.dtsi"
-
-&phy0 {
-	interrupts = <3 1 0 0>;
-};
-
-&phy1 {
-	interrupts = <2 1 0 0>;
-};
-
-&phy2 {
-	interrupts = <2 1 0 0>;
-};
-
+/include/ "p1010rdb-pa.dtsi"
 /include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb-pa.dtsi b/arch/powerpc/boot/dts/p1010rdb-pa.dtsi
new file mode 100644
index 0000000..4c5a7bf
--- /dev/null
+++ b/arch/powerpc/boot/dts/p1010rdb-pa.dtsi
@@ -0,0 +1,85 @@
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
+&ifc_nand {
+	partition@0 {
+		/* This location must not be altered  */
+		/* 1MB for u-boot Bootloader Image */
+		reg = <0x0 0x00100000>;
+		label = "NAND U-Boot Image";
+		read-only;
+	};
+
+	partition@100000 {
+		/* 1MB for DTB Image */
+		reg = <0x00100000 0x00100000>;
+		label = "NAND DTB Image";
+	};
+
+	partition@200000 {
+		/* 4MB for Linux Kernel Image */
+		reg = <0x00200000 0x00400000>;
+		label = "NAND Linux Kernel Image";
+	};
+
+	partition@600000 {
+		/* 4MB for Compressed Root file System Image */
+		reg = <0x00600000 0x00400000>;
+		label = "NAND Compressed RFS Image";
+	};
+
+	partition@a00000 {
+		/* 15MB for JFFS2 based Root file System */
+		reg = <0x00a00000 0x00f00000>;
+		label = "NAND JFFS2 Root File System";
+	};
+
+	partition@1900000 {
+		/* 7MB for User Area */
+		reg = <0x01900000 0x00700000>;
+		label = "NAND User area";
+	};
+};
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
diff --git a/arch/powerpc/boot/dts/p1010rdb-pa_36b.dts b/arch/powerpc/boot/dts/p1010rdb-pa_36b.dts
index 2004ee7..3033371 100644
--- a/arch/powerpc/boot/dts/p1010rdb-pa_36b.dts
+++ b/arch/powerpc/boot/dts/p1010rdb-pa_36b.dts
@@ -42,17 +42,5 @@
 };
 
 /include/ "p1010rdb.dtsi"
-
-&phy0 {
-	interrupts = <3 1 0 0>;
-};
-
-&phy1 {
-	interrupts = <2 1 0 0>;
-};
-
-&phy2 {
-	interrupts = <2 1 0 0>;
-};
-
+/include/ "p1010rdb-pa.dtsi"
 /include/ "fsl/p1010si-post.dtsi"
diff --git a/arch/powerpc/boot/dts/p1010rdb.dtsi b/arch/powerpc/boot/dts/p1010rdb.dtsi
index 4853399..ea534ef 100644
--- a/arch/powerpc/boot/dts/p1010rdb.dtsi
+++ b/arch/powerpc/boot/dts/p1010rdb.dtsi
@@ -69,49 +69,11 @@
 		};
 	};
 
-	nand@1,0 {
+	ifc_nand: nand@1,0 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		compatible = "fsl,ifc-nand";
 		reg = <0x1 0x0 0x10000>;
-
-		partition@0 {
-			/* This location must not be altered  */
-			/* 1MB for u-boot Bootloader Image */
-			reg = <0x0 0x00100000>;
-			label = "NAND U-Boot Image";
-			read-only;
-		};
-
-		partition@100000 {
-			/* 1MB for DTB Image */
-			reg = <0x00100000 0x00100000>;
-			label = "NAND DTB Image";
-		};
-
-		partition@200000 {
-			/* 4MB for Linux Kernel Image */
-			reg = <0x00200000 0x00400000>;
-			label = "NAND Linux Kernel Image";
-		};
-
-		partition@600000 {
-			/* 4MB for Compressed Root file System Image */
-			reg = <0x00600000 0x00400000>;
-			label = "NAND Compressed RFS Image";
-		};
-
-		partition@a00000 {
-			/* 15MB for JFFS2 based Root file System */
-			reg = <0x00a00000 0x00f00000>;
-			label = "NAND JFFS2 Root File System";
-		};
-
-		partition@1900000 {
-			/* 7MB for User Area */
-			reg = <0x01900000 0x00700000>;
-			label = "NAND User area";
-		};
 	};
 
 	cpld@3,0 {
-- 
1.8.4


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
