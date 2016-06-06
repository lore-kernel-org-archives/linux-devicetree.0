From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 1/2] ARM: BCM5301X: Specify NAND chip select and ECC in separated files
Date: Mon,  6 Jun 2016 09:43:49 +0200
Message-ID: <1465199036-24366-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Using separated file with common chip select parameters will allow us
adding other ECC setups without code duplication.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
 arch/arm/boot/dts/bcm5301x-nand-cs0-bch8.dtsi | 16 +++++-----------
 arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi      | 18 ++++++++++++++++++
 2 files changed, 23 insertions(+), 11 deletions(-)
 create mode 100644 arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi

diff --git a/arch/arm/boot/dts/bcm5301x-nand-cs0-bch8.dtsi b/arch/arm/b=
oot/dts/bcm5301x-nand-cs0-bch8.dtsi
index d10781e..9a9630d 100644
--- a/arch/arm/boot/dts/bcm5301x-nand-cs0-bch8.dtsi
+++ b/arch/arm/boot/dts/bcm5301x-nand-cs0-bch8.dtsi
@@ -9,16 +9,10 @@
  * Licensed under the GNU/GPL. See COPYING for details.
  */
=20
-/ {
-	nand@18028000 {
-		nandcs@0 {
-			compatible =3D "brcm,nandcs";
-			reg =3D <0>;
-			#address-cells =3D <1>;
-			#size-cells =3D <1>;
+#include "bcm5301x-nand-cs0.dtsi"
=20
-			nand-ecc-strength =3D <8>;
-			nand-ecc-step-size =3D <512>;
-		};
-	};
+&nandcs {
+	nand-ecc-algo =3D "bch";
+	nand-ecc-strength =3D <8>;
+	nand-ecc-step-size =3D <512>;
 };
diff --git a/arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi b/arch/arm/boot/d=
ts/bcm5301x-nand-cs0.dtsi
new file mode 100644
index 0000000..1684951
--- /dev/null
+++ b/arch/arm/boot/dts/bcm5301x-nand-cs0.dtsi
@@ -0,0 +1,18 @@
+/*
+ * Broadcom Northstar NAND.
+ *
+ * Copyright (C) 2015 Hauke Mehrtens <hauke@hauke-m.de>
+ *
+ * Licensed under the GNU/GPL. See COPYING for details.
+ */
+
+/ {
+	nand@18028000 {
+		nandcs: nandcs@0 {
+			compatible =3D "brcm,nandcs";
+			reg =3D <0>;
+			#address-cells =3D <1>;
+			#size-cells =3D <1>;
+		};
+	};
+};
--=20
1.8.4.5
