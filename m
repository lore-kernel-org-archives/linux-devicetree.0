From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 3/4] arm64: dts: marvell: Clean up armada-7040-db
Date: Wed, 23 Mar 2016 23:24:20 +0100
Message-ID: <1458771861-12392-4-git-send-email-afaerber@suse.de>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Instead of duplicating the node hierarchy, reference the nodes by label=
,
adding labels where necessary.

Drop some trailing or inconsistent white lines while at it.

=46ixes: ec7e5a569bce ("arm64: dts: marvell: add Device Tree files for =
Armada 7K/8K")
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 Is it intentional that there are no aliases for the two serial nodes a=
nd no /chosen/stdout-path?
=20
 arch/arm64/boot/dts/marvell/armada-7040-db.dts     | 52 ++++++++++----=
--------
 arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi |  1 -
 arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi |  2 -
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi      |  7 +--
 4 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-7040-db.dts b/arch/arm6=
4/boot/dts/marvell/armada-7040-db.dts
index 064a251346dd..ee5778395bea 100644
--- a/arch/arm64/boot/dts/marvell/armada-7040-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-7040-db.dts
@@ -55,38 +55,34 @@
 		device_type =3D "memory";
 		reg =3D <0x0 0x0 0x0 0x80000000>;
 	};
+};
=20
-	ap806 {
-		config-space {
-			spi@510600 {
-				status =3D "okay";
-
-				spi-flash@0 {
-					#address-cells =3D <1>;
-					#size-cells =3D <1>;
-					compatible =3D "n25q128a13";
-					reg =3D <0>; /* Chip select 0 */
-					spi-max-frequency =3D <10000000>;
+&i2c0 {
+	status =3D "okay";
+	clock-frequency =3D <100000>;
+};
=20
-					partition@0 {
-						label =3D "U-Boot";
-						reg =3D <0 0x200000>;
-					};
-					partition@400000 {
-						label =3D "Filesystem";
-						reg =3D <0x200000 0xce0000>;
-					};
-				};
-			};
+&spi0 {
+	status =3D "okay";
=20
-			i2c@511000 {
-				status =3D "okay";
-				clock-frequency =3D <100000>;
-			};
+	spi-flash@0 {
+		#address-cells =3D <1>;
+		#size-cells =3D <1>;
+		compatible =3D "n25q128a13";
+		reg =3D <0>; /* Chip select 0 */
+		spi-max-frequency =3D <10000000>;
=20
-			serial@512000 {
-				status =3D "okay";
-			};
+		partition@0 {
+			label =3D "U-Boot";
+			reg =3D <0 0x200000>;
+		};
+		partition@400000 {
+			label =3D "Filesystem";
+			reg =3D <0x200000 0xce0000>;
 		};
 	};
 };
+
+&uart0 {
+	status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi b/arch/=
arm64/boot/dts/marvell/armada-ap806-dual.dtsi
index f25c5c17fad7..95a1ff60f6c1 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806-dual.dtsi
@@ -68,4 +68,3 @@
 		};
 	};
 };
-
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi b/arch/=
arm64/boot/dts/marvell/armada-ap806-quad.dtsi
index baa7d9a516b3..ba43a4357b89 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806-quad.dtsi
@@ -79,6 +79,4 @@
 			enable-method =3D "psci";
 		};
 	};
-
 };
-
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64=
/boot/dts/marvell/armada-ap806.dtsi
index 556a92bcc2f6..3ecf9b1798fa 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -59,7 +59,6 @@
 		method =3D "smc";
 	};
=20
-
 	ap806 {
 		#address-cells =3D <2>;
 		#size-cells =3D <2>;
@@ -190,7 +189,7 @@
 				status =3D "disabled";
 			};
=20
-			serial@512000 {
+			uart0: serial@512000 {
 				compatible =3D "snps,dw-apb-uart";
 				reg =3D <0x512000 0x100>;
 				reg-shift =3D <2>;
@@ -200,7 +199,7 @@
 				status =3D "disabled";
 			};
=20
-			serial@512100 {
+			uart1: serial@512100 {
 				compatible =3D "snps,dw-apb-uart";
 				reg =3D <0x512100 0x100>;
 				reg-shift =3D <2>;
@@ -232,6 +231,4 @@
 			};
 		};
 	};
-
 };
-
--=20
2.6.2
