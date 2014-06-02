From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 5/5] ARM: dts: berlin: add SMP related nodes and properties for BG2Q
Date: Mon,  2 Jun 2014 11:21:06 +0200
Message-ID: <1401700866-24804-6-git-send-email-antoine.tenart@free-electrons.com>
References: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401700866-24804-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add required nodes and properties into the Berlin BG2Q device tree to
take advantage of the newly introduced SMP support. Add the scu and
cpu-ctrl nodes along with the CPUs enable-method property.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin=
2q.dtsi
index 07452a7483fa..570f12f7e9c4 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -17,6 +17,7 @@
 	cpus {
 		#address-cells =3D <1>;
 		#size-cells =3D <0>;
+		enable-method =3D "marvell,berlin-smp";
=20
 		cpu@0 {
 			compatible =3D "arm,cortex-a9";
@@ -94,6 +95,11 @@
 			interrupts =3D <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>;
 		};
=20
+		scu: snoop-control-unit@ad0000 {
+			compatible =3D "arm,cortex-a9-scu";
+			reg =3D <0xad0000 0x58>;
+		};
+
 		gic: interrupt-controller@ad1000 {
 			compatible =3D "arm,cortex-a9-gic";
 			reg =3D <0xad1000 0x1000>, <0xad0100 0x100>;
@@ -101,6 +107,11 @@
 			#interrupt-cells =3D <3>;
 		};
=20
+		cpu-ctrl@dd0000 {
+			compatible =3D "marvell,berlin-cpu-ctrl";
+			reg =3D <0xdd0000 0x10000>;
+		};
+
 		apb@e80000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
--=20
1.9.1
