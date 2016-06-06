From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Subject: [PATCH 2/2] ARM: BCM5301X: Fix NAND ECC parameters for D-Link DIR-885L
Date: Mon,  6 Jun 2016 09:43:50 +0200
Message-ID: <1465199036-24366-2-git-send-email-zajec5@gmail.com>
References: <1465199036-24366-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465199036-24366-1-git-send-email-zajec5@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@armlinux.org.uk>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This device uses BCH-1 instead of BCH-8. This fixes ECC errors and make=
s
NAND usable with brcmnand.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
---
As suggested recently, the new file uses BSD-compatible license. I was
considering BSD [23]-clause license and Hauke said he likes ISC which i=
s
even simpler, so I picked this one.
---
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts |  2 +-
 arch/arm/boot/dts/bcm5301x-nand-cs0-bch1.dtsi | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/bcm5301x-nand-cs0-bch1.dtsi

diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts b/arch/arm/b=
oot/dts/bcm47094-dlink-dir-885l.dts
index 50cf804..c8c0b36 100644
--- a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
@@ -10,7 +10,7 @@
 /dts-v1/;
=20
 #include "bcm4708.dtsi"
-#include "bcm5301x-nand-cs0-bch8.dtsi"
+#include "bcm5301x-nand-cs0-bch1.dtsi"
=20
 / {
 	compatible =3D "dlink,dir-885l", "brcm,bcm47094", "brcm,bcm4708";
diff --git a/arch/arm/boot/dts/bcm5301x-nand-cs0-bch1.dtsi b/arch/arm/b=
oot/dts/bcm5301x-nand-cs0-bch1.dtsi
new file mode 100644
index 0000000..24b099c
--- /dev/null
+++ b/arch/arm/boot/dts/bcm5301x-nand-cs0-bch1.dtsi
@@ -0,0 +1,15 @@
+/*
+ * Broadcom Northstar NAND.
+ *
+ * Copyright (C) 2016 Rafa=C5=82 Mi=C5=82ecki <rafal.milecki@gmail.com=
>
+ *
+ * Licensed under the ISC license.
+ */
+
+#include "bcm5301x-nand-cs0.dtsi"
+
+&nandcs {
+	nand-ecc-algo =3D "bch";
+	nand-ecc-strength =3D <1>;
+	nand-ecc-step-size =3D <512>;
+};
--=20
1.8.4.5
