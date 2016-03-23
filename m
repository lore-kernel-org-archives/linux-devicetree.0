From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH 1/4] arm64: dts: marvell: Clean up armada-3720-db
Date: Wed, 23 Mar 2016 23:24:18 +0100
Message-ID: <1458771861-12392-2-git-send-email-afaerber@suse.de>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458771861-12392-1-git-send-email-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Instead of duplicating the SoC's node hierarchy, including a bus node
named "internal-regs", reference the actually desired nodes by label,
like Berlin already does. Add labels where necessary.

Drop an inconsistent white line while at it.

=46ixes: adbc3695d9e4 ("arm64: dts: add the Marvell Armada 3700 family =
and a development board")
Cc: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-3720-db.dts | 35 +++++++++++-------=
--------
 arch/arm64/boot/dts/marvell/armada-372x.dtsi   |  1 -
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi   |  4 +--
 3 files changed, 17 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-3720-db.dts b/arch/arm6=
4/boot/dts/marvell/armada-3720-db.dts
index 359050154511..48f97d14b057 100644
--- a/arch/arm64/boot/dts/marvell/armada-3720-db.dts
+++ b/arch/arm64/boot/dts/marvell/armada-3720-db.dts
@@ -60,27 +60,22 @@
 		device_type =3D "memory";
 		reg =3D <0x00000000 0x00000000 0x00000000 0x20000000>;
 	};
+};
=20
-	soc {
-		internal-regs {
-			/*
-			* Exported on the micro USB connector CON32
-			* through an FTDI
-			*/
-			uart0: serial@12000 {
-				status =3D "okay";
-			};
-
-			/* CON31 */
-			usb3@58000 {
-				status =3D "okay";
-			};
+/* CON3 */
+&sata {
+	status =3D "okay";
+};
=20
-			/* CON3 */
-			sata@e0000 {
-			       status =3D "okay";
-			};
-		};
-	};
+/*
+ * Exported on the micro USB connector CON32
+ * through an FTDI
+ */
+&uart0 {
+	status =3D "okay";
 };
=20
+/* CON31 */
+&usb3 {
+	status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/marvell/armada-372x.dtsi b/arch/arm64/=
boot/dts/marvell/armada-372x.dtsi
index f292a00ce97c..5120296596c2 100644
--- a/arch/arm64/boot/dts/marvell/armada-372x.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-372x.dtsi
@@ -59,5 +59,4 @@
 			enable-method =3D "psci";
 		};
 	};
-
 };
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/=
boot/dts/marvell/armada-37xx.dtsi
index ba9df7ff2a72..4328c2408a8a 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -105,14 +105,14 @@
 				status =3D "disabled";
 			};
=20
-			usb3@58000 {
+			usb3: usb3@58000 {
 				compatible =3D "generic-xhci";
 				reg =3D <0x58000 0x4000>;
 				interrupts =3D <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 				status =3D "disabled";
 			};
=20
-			sata@e0000 {
+			sata: sata@e0000 {
 				compatible =3D "marvell,armada-3700-ahci";
 				reg =3D <0xe0000 0x2000>;
 				interrupts =3D <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
--=20
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
