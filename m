From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [PATCH] MIPS: devicetree: fix cpu interrupt controller node-names
Date: Mon, 23 May 2016 14:39:00 +0300
Message-ID: <1464003540-13009-1-git-send-email-antonynpavlov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org
Cc: Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Here is the quote from [1]:

    The unit-address must match the first address specified
    in the reg property of the node. If the node has no reg property,
    the @ and unit-address must be omitted and the node-name alone
    differentiates the node from other nodes at the same level

This patch adjusts MIPS dts-files and devicetree binding
documentation in accordance with [1].

    [1] Power.org(tm) Standard for Embedded Power Architecture(tm)
        Platform Requirements (ePAPR). Version 1.1 =E2=80=93 08 April 2=
011.
        Chapter 2.2.1.1 Node Name Requirements

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: linux-mips@linux-mips.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/mips/cpu_irq.txt | 2 +-
 arch/mips/boot/dts/ingenic/jz4740.dtsi             | 2 +-
 arch/mips/boot/dts/ralink/mt7620a.dtsi             | 2 +-
 arch/mips/boot/dts/ralink/rt2880.dtsi              | 2 +-
 arch/mips/boot/dts/ralink/rt3050.dtsi              | 2 +-
 arch/mips/boot/dts/ralink/rt3883.dtsi              | 2 +-
 arch/mips/boot/dts/xilfpga/nexys4ddr.dts           | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/mips/cpu_irq.txt b/Docum=
entation/devicetree/bindings/mips/cpu_irq.txt
index fc149f3..f080f06 100644
--- a/Documentation/devicetree/bindings/mips/cpu_irq.txt
+++ b/Documentation/devicetree/bindings/mips/cpu_irq.txt
@@ -13,7 +13,7 @@ Required properties:
 - compatible : Should be "mti,cpu-interrupt-controller"
=20
 Example devicetree:
-	cpu-irq: cpu-irq@0 {
+	cpu-irq: cpu-irq {
 		#address-cells =3D <0>;
=20
 		interrupt-controller;
diff --git a/arch/mips/boot/dts/ingenic/jz4740.dtsi b/arch/mips/boot/dt=
s/ingenic/jz4740.dtsi
index 4a9c8f2..f6ae6ed 100644
--- a/arch/mips/boot/dts/ingenic/jz4740.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4740.dtsi
@@ -5,7 +5,7 @@
 	#size-cells =3D <1>;
 	compatible =3D "ingenic,jz4740";
=20
-	cpuintc: interrupt-controller@0 {
+	cpuintc: interrupt-controller {
 		#address-cells =3D <0>;
 		#interrupt-cells =3D <1>;
 		interrupt-controller;
diff --git a/arch/mips/boot/dts/ralink/mt7620a.dtsi b/arch/mips/boot/dt=
s/ralink/mt7620a.dtsi
index 08bf24f..793c0c7 100644
--- a/arch/mips/boot/dts/ralink/mt7620a.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7620a.dtsi
@@ -9,7 +9,7 @@
 		};
 	};
=20
-	cpuintc: cpuintc@0 {
+	cpuintc: cpuintc {
 		#address-cells =3D <0>;
 		#interrupt-cells =3D <1>;
 		interrupt-controller;
diff --git a/arch/mips/boot/dts/ralink/rt2880.dtsi b/arch/mips/boot/dts=
/ralink/rt2880.dtsi
index 182afde..fb2faef 100644
--- a/arch/mips/boot/dts/ralink/rt2880.dtsi
+++ b/arch/mips/boot/dts/ralink/rt2880.dtsi
@@ -9,7 +9,7 @@
 		};
 	};
=20
-	cpuintc: cpuintc@0 {
+	cpuintc: cpuintc {
 		#address-cells =3D <0>;
 		#interrupt-cells =3D <1>;
 		interrupt-controller;
diff --git a/arch/mips/boot/dts/ralink/rt3050.dtsi b/arch/mips/boot/dts=
/ralink/rt3050.dtsi
index e3203d4..d3cb57f 100644
--- a/arch/mips/boot/dts/ralink/rt3050.dtsi
+++ b/arch/mips/boot/dts/ralink/rt3050.dtsi
@@ -9,7 +9,7 @@
 		};
 	};
=20
-	cpuintc: cpuintc@0 {
+	cpuintc: cpuintc {
 		#address-cells =3D <0>;
 		#interrupt-cells =3D <1>;
 		interrupt-controller;
diff --git a/arch/mips/boot/dts/ralink/rt3883.dtsi b/arch/mips/boot/dts=
/ralink/rt3883.dtsi
index 3b131dd..3d6fc9a 100644
--- a/arch/mips/boot/dts/ralink/rt3883.dtsi
+++ b/arch/mips/boot/dts/ralink/rt3883.dtsi
@@ -9,7 +9,7 @@
 		};
 	};
=20
-	cpuintc: cpuintc@0 {
+	cpuintc: cpuintc {
 		#address-cells =3D <0>;
 		#interrupt-cells =3D <1>;
 		interrupt-controller;
diff --git a/arch/mips/boot/dts/xilfpga/nexys4ddr.dts b/arch/mips/boot/=
dts/xilfpga/nexys4ddr.dts
index 686ebd1..48d2112 100644
--- a/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
+++ b/arch/mips/boot/dts/xilfpga/nexys4ddr.dts
@@ -10,7 +10,7 @@
 		reg =3D <0x0 0x08000000>;
 	};
=20
-	cpuintc: interrupt-controller@0 {
+	cpuintc: interrupt-controller {
 		#address-cells =3D <0>;
 		#interrupt-cells =3D <1>;
 		interrupt-controller;
--=20
2.7.0
