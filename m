From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] ARM: BCM5301X: Add DT entry for SPI controller and NOR flash
Date: Tue, 19 Apr 2016 08:56:46 +0200
Message-ID: <1461049006-22818-1-git-send-email-zajec5@gmail.com>
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

Controller is present on every BCM4708* board but only few devices have
serial flash attached so mark it as disabled by default.

Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts  |  4 ++++
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts |  4 ++++
 arch/arm/boot/dts/bcm5301x.dtsi               | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts b/arch/arm/bo=
ot/dts/bcm4708-luxul-xwc-1000.dts
index c973f768..1c7e53d 100644
--- a/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
+++ b/arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts
@@ -59,3 +59,7 @@
 &uart0 {
 	status =3D "okay";
 };
+
+&spi_nor {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts b/arch/arm/b=
oot/dts/bcm4708-smartrg-sr400ac.dts
index 4d610ff..8b0c440 100644
--- a/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
+++ b/arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts
@@ -122,3 +122,7 @@
 &uart0 {
 	status =3D "okay";
 };
+
+&spi_nor {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/bcm5301x.dtsi b/arch/arm/boot/dts/bcm530=
1x.dtsi
index 9c06d91..7d4d29b 100644
--- a/arch/arm/boot/dts/bcm5301x.dtsi
+++ b/arch/arm/boot/dts/bcm5301x.dtsi
@@ -225,6 +225,20 @@
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
 		};
+
+		spi@29000 {
+			reg =3D <0x00029000 0x1000>;
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+
+			spi_nor: spi-nor@0 {
+				compatible =3D "jedec,spi-nor";
+				reg =3D <0>;
+				spi-max-frequency =3D <20000000>;
+				linux,part-probe =3D "ofpart", "bcm47xxpart";
+				status =3D "disabled";
+			};
+		};
 	};
=20
 	lcpll0: lcpll0@1800c100 {
--=20
1.8.4.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
