From: "Z.q. Hou" <zhiqiang.hou@nxp.com>
Subject: [PATCHv3 4/4] arm64: dts: layerscape: removed compatible string
 "snps,dw-pcie"
Date: Wed, 7 Nov 2018 05:35:32 +0000
Message-ID: <20181107053500.13575-5-Zhiqiang.Hou@nxp.com>
References: <20181107053500.13575-1-Zhiqiang.Hou@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181107053500.13575-1-Zhiqiang.Hou@nxp.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Leo Li <leoyang.li@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "bhelgaas@google.com" <bhelgaas@google.com>, Mingkai Hu <mingkai.hu@nxp.com>, "M.h. Lian" <minghuan.lian@nxp.com>
Cc: "Z.q. Hou" <zhiqiang.hou@nxp.com>
List-Id: devicetree@vger.kernel.org

From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Removed the wrong compatible string "snps,dw-pcie", in case
match incorrect driver.

Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
---
V3:
 - Reworded the subject.

 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi |  6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi |  6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi |  6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi |  8 ++++----
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 12 ++++--------
 6 files changed, 18 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1012a.dtsi
index 5da732f82fa0..028a6daa5597 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -475,7 +475,7 @@
 		};
=20
 		pcie@3400000 {
-			compatible =3D "fsl,ls1012a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1012a-pcie";
 			reg =3D <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 			       0x40 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1043a.dtsi
index 3fed504b5381..5480d6c4c548 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -661,7 +661,7 @@
 		};
=20
 		pcie@3400000 {
-			compatible =3D "fsl,ls1043a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1043a-pcie";
 			reg =3D <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 			       0x40 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
@@ -686,7 +686,7 @@
 		};
=20
 		pcie@3500000 {
-			compatible =3D "fsl,ls1043a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1043a-pcie";
 			reg =3D <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 			       0x48 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
@@ -711,7 +711,7 @@
 		};
=20
 		pcie@3600000 {
-			compatible =3D "fsl,ls1043a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1043a-pcie";
 			reg =3D <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 			       0x50 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1046a.dtsi
index 51cbd50012d6..519315c5d507 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -630,7 +630,7 @@
 		};
=20
 		pcie@3400000 {
-			compatible =3D "fsl,ls1046a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1046a-pcie";
 			reg =3D <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 			       0x40 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
@@ -655,7 +655,7 @@
 		};
=20
 		pcie@3500000 {
-			compatible =3D "fsl,ls1046a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1046a-pcie";
 			reg =3D <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 			       0x48 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
@@ -680,7 +680,7 @@
 		};
=20
 		pcie@3600000 {
-			compatible =3D "fsl,ls1046a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1046a-pcie";
 			reg =3D <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 			       0x50 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls1088a.dtsi
index a07f612ab56b..10b253c88a16 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -512,7 +512,7 @@
 		};
=20
 		pcie@3400000 {
-			compatible =3D "fsl,ls1088a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1088a-pcie";
 			reg =3D <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 			       0x20 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
@@ -536,7 +536,7 @@
 		};
=20
 		pcie@3500000 {
-			compatible =3D "fsl,ls1088a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1088a-pcie";
 			reg =3D <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 			       0x28 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
@@ -560,7 +560,7 @@
 		};
=20
 		pcie@3600000 {
-			compatible =3D "fsl,ls1088a-pcie", "snps,dw-pcie";
+			compatible =3D "fsl,ls1088a-pcie";
 			reg =3D <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 			       0x30 0x00000000 0x0 0x00002000>; /* configuration space */
 			reg-names =3D "regs", "config";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls2088a.dtsi
index 7c882da3f6b0..a5f668d786b8 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
@@ -119,7 +119,7 @@
 };
=20
 &pcie1 {
-	compatible =3D "fsl,ls2088a-pcie", "snps,dw-pcie";
+	compatible =3D "fsl,ls2088a-pcie";
 	reg =3D <0x00 0x03400000 0x0 0x00100000   /* controller registers */
 	       0x20 0x00000000 0x0 0x00002000>; /* configuration space */
=20
@@ -128,7 +128,7 @@
 };
=20
 &pcie2 {
-	compatible =3D "fsl,ls2088a-pcie", "snps,dw-pcie";
+	compatible =3D "fsl,ls2088a-pcie";
 	reg =3D <0x00 0x03500000 0x0 0x00100000   /* controller registers */
 	       0x28 0x00000000 0x0 0x00002000>; /* configuration space */
=20
@@ -137,7 +137,7 @@
 };
=20
 &pcie3 {
-	compatible =3D "fsl,ls2088a-pcie", "snps,dw-pcie";
+	compatible =3D "fsl,ls2088a-pcie";
 	reg =3D <0x00 0x03600000 0x0 0x00100000   /* controller registers */
 	       0x30 0x00000000 0x0 0x00002000>; /* configuration space */
=20
@@ -146,7 +146,7 @@
 };
=20
 &pcie4 {
-	compatible =3D "fsl,ls2088a-pcie", "snps,dw-pcie";
+	compatible =3D "fsl,ls2088a-pcie";
 	reg =3D <0x00 0x03700000 0x0 0x00100000   /* controller registers */
 	       0x38 0x00000000 0x0 0x00002000>; /* configuration space */
=20
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/bo=
ot/dts/freescale/fsl-ls208xa.dtsi
index d188774a36e8..80cc40f76a4a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -630,8 +630,7 @@
 		};
=20
 		pcie1: pcie@3400000 {
-			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
-				     "snps,dw-pcie";
+			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie";
 			reg-names =3D "regs", "config";
 			interrupts =3D <0 108 0x4>; /* Level high type */
 			interrupt-names =3D "intr";
@@ -651,8 +650,7 @@
 		};
=20
 		pcie2: pcie@3500000 {
-			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
-				     "snps,dw-pcie";
+			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie";
 			reg-names =3D "regs", "config";
 			interrupts =3D <0 113 0x4>; /* Level high type */
 			interrupt-names =3D "intr";
@@ -672,8 +670,7 @@
 		};
=20
 		pcie3: pcie@3600000 {
-			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
-				     "snps,dw-pcie";
+			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie";
 			reg-names =3D "regs", "config";
 			interrupts =3D <0 118 0x4>; /* Level high type */
 			interrupt-names =3D "intr";
@@ -693,8 +690,7 @@
 		};
=20
 		pcie4: pcie@3700000 {
-			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie",
-				     "snps,dw-pcie";
+			compatible =3D "fsl,ls2080a-pcie", "fsl,ls2085a-pcie";
 			reg-names =3D "regs", "config";
 			interrupts =3D <0 123 0x4>; /* Level high type */
 			interrupt-names =3D "intr";
--=20
2.17.1
