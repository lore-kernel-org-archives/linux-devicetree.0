From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
Subject: [PATCH] Fix documentation for adp1653 DT
Date: Sat, 26 Dec 2015 00:37:16 +0100
Message-ID: <1451086636-3621-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Pavel Machek <pavel@ucw.cz>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Sakari Ailus <sakari.ailus@iki.fi>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>
List-Id: devicetree@vger.kernel.org

Property names do not match real names needed by driver itself.
This patch fix this problem.

Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
---
 .../devicetree/bindings/media/i2c/adp1653.txt      |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/adp1653.txt b/=
Documentation/devicetree/bindings/media/i2c/adp1653.txt
index 5ce66f2..4cce0de 100644
--- a/Documentation/devicetree/bindings/media/i2c/adp1653.txt
+++ b/Documentation/devicetree/bindings/media/i2c/adp1653.txt
@@ -12,12 +12,13 @@ There are two LED outputs available - flash and ind=
icator. One LED is
 represented by one child node, nodes need to be named "flash" and "ind=
icator".
=20
 Required properties of the LED child node:
-- max-microamp : see Documentation/devicetree/bindings/leds/common.txt
+- led-max-microamp : see Documentation/devicetree/bindings/leds/common=
=2Etxt
=20
 Required properties of the flash LED child node:
=20
 - flash-max-microamp : see Documentation/devicetree/bindings/leds/comm=
on.txt
 - flash-timeout-us : see Documentation/devicetree/bindings/leds/common=
=2Etxt
+- led-max-microamp : see Documentation/devicetree/bindings/leds/common=
=2Etxt
=20
 Example:
=20
@@ -29,9 +30,9 @@ Example:
 		flash {
 			flash-timeout-us =3D <500000>;
 			flash-max-microamp =3D <320000>;
-			max-microamp =3D <50000>;
+			led-max-microamp =3D <50000>;
 		};
 		indicator {
-			max-microamp =3D <17500>;
+			led-max-microamp =3D <17500>;
 		};
 	};
--=20
1.7.9.5
