From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: BCM5301X: Enable SPI-NOR on dual flash devices
Date: Wed, 27 Apr 2016 09:05:03 +0200
Message-ID: <1461740704-21501-1-git-send-email-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "open list:BROADCOM BCM5301X ARM
	ARCHITECTURE" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 1b47b98acce2 ("ARM: BCM5301X: Add DT entry for SPI controller an=
d
NOR flash") enabled SPI-NOR device on routers using serial flash only.
However there are also devices with two flash memories:
1) Small SPI attached flash used mostly for booting
2) Bigger NAND used mostly for storing firmware
On such devices we still need SPI-NOR e.g. to access NVRAM data.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts | 4 ++++
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts       | 4 ++++
 arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts    | 4 ++++
 arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts | 4 ++++
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts     | 4 ++++
 5 files changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts b/arch/a=
rm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
index 5087aa8..9cb186e 100644
--- a/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
+++ b/arch/arm/boot/dts/bcm4708-buffalo-wzr-1750dhp.dts
@@ -147,3 +147,7 @@
 &usb3 {
 	vcc-gpio =3D <&chipcommon 10 GPIO_ACTIVE_LOW>;
 };
+
+&spi_nor {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts b/arch/arm/boo=
t/dts/bcm4708-netgear-r6250.dts
index 1049ab1..8ce39d5 100644
--- a/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
+++ b/arch/arm/boot/dts/bcm4708-netgear-r6250.dts
@@ -90,3 +90,7 @@
 &usb3 {
 	vcc-gpio =3D <&chipcommon 0 GPIO_ACTIVE_HIGH>;
 };
+
+&spi_nor {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts b/arch/arm/=
boot/dts/bcm4708-netgear-r6300-v2.dts
index 3a94606..6229ef2 100644
--- a/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
+++ b/arch/arm/boot/dts/bcm4708-netgear-r6300-v2.dts
@@ -82,3 +82,7 @@
 		};
 	};
 };
+
+&spi_nor {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts b/arch/a=
rm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
index 791d722..0653e7e 100644
--- a/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
+++ b/arch/arm/boot/dts/bcm4709-buffalo-wxr-1900dhp.dts
@@ -131,3 +131,7 @@
 &usb2 {
 	vcc-gpio =3D <&chipcommon 13 GPIO_ACTIVE_HIGH>;
 };
+
+&spi_nor {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts b/arch/arm/b=
oot/dts/bcm47094-dlink-dir-885l.dts
index ace38ef..50cf804 100644
--- a/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
+++ b/arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts
@@ -113,3 +113,7 @@
 &usb3 {
 	vcc-gpio =3D <&chipcommon 18 GPIO_ACTIVE_HIGH>;
 };
+
+&spi_nor {
+	status =3D "okay";
+};
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
