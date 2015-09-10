From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] ARM: efm32: switch to properly namespaced location property
Date: Thu, 10 Sep 2015 10:09:51 +0200
Message-ID: <1441872592-388-2-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1441872592-388-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441872592-388-1-git-send-email-u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Since commits:

281ec367bff4 (i2c: efm32: correct namespacing of location property)
d36f47fa8419 (serial: efm32: correct namespacing of location property)
10ed7e9847b6 (spi: efm32: correct namespacing of location property)

(contained in 3.17-rc1) all drivers support the correctly
namespaced location property. So use the better names now.

Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 arch/arm/boot/dts/efm32gg-dk3750.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/efm32gg-dk3750.dts b/arch/arm/boot/dts/e=
fm32gg-dk3750.dts
index b4031fa4a567..504cf45d3cb8 100644
--- a/arch/arm/boot/dts/efm32gg-dk3750.dts
+++ b/arch/arm/boot/dts/efm32gg-dk3750.dts
@@ -26,7 +26,7 @@
 		};
=20
 		i2c@4000a000 {
-			efm32,location =3D <3>;
+			energymicro,location =3D <3>;
 			status =3D "ok";
=20
 			temp@48 {
@@ -43,7 +43,7 @@
=20
 		spi0: spi@4000c000 { /* USART0 */
 			cs-gpios =3D <&gpio 68 1>; // E4
-			location =3D <1>;
+			energymicro,location =3D <1>;
 			status =3D "ok";
=20
 			microsd@0 {
@@ -57,7 +57,7 @@
=20
 		spi1: spi@4000c400 { /* USART1 */
 			cs-gpios =3D <&gpio 51 1>; // D3
-			location =3D <1>;
+			energymicro,location =3D <1>;
 			status =3D "ok";
=20
 			ks8851@0 {
@@ -70,7 +70,7 @@
 		};
=20
 		uart4: uart@4000e400 { /* UART1 */
-			location =3D <2>;
+			energymicro,location =3D <2>;
 			status =3D "ok";
 		};
=20
--=20
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
