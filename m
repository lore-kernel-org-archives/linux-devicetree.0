From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 2/2] input: ti_am33x_tsc: make the documentation for the ti,wire-config parameter clear
Date: Thu, 19 Dec 2013 17:25:51 +0100
Message-ID: <1387470351-4696-2-git-send-email-bigeasy@linutronix.de>
References: <1387470351-4696-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1387470351-4696-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Felipe Balbi <balbi@ti.com>, devicetree@vger.kernel.org, Rob Herring <rob.herring@calxeda.com>, Kumar Gala <galak@codeaurora.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Landley <rob@landley.net>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
List-Id: devicetree@vger.kernel.org

The document says "first four bits" and means the upper nibble. Most
people would probably agree that the first four bits are bits 0=E2=80=A6=
3 and
that is the lower nibble.
This patch updates the documentation so it is clear what is meant.

Acked-by: Kumar Gala <galak@codeaurora.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 .../devicetree/bindings/input/touchscreen/ti-tsc-adc.txt    | 13 +++++=
+++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti-tsc=
-adc.txt b/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-a=
dc.txt
index 878549b..fa15500 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.tx=
t
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.tx=
t
@@ -17,13 +17,16 @@
 				remaining 4 can be used by the ADC.
 	ti,wire-config: Different boards could have a different order for
 			connecting wires on touchscreen. We need to provide an
-			8 bit number where in the 1st four bits represent the
-			analog lines and the next 4 bits represent positive/
-			negative terminal on that input line. Notations to
-			represent the input lines and terminals resoectively
-			is as follows:
+			8 bit number where the most significant nibble represent
+			the analog lines and the least significant nibble
+			represent positive/ negative terminal on that input
+			line. Notations to represent the input lines and
+			terminals resoectively is as follows:
 			AIN0 =3D 0, AIN1 =3D 1 and so on till AIN7 =3D 7.
 			XP  =3D 0, XN =3D 1, YP =3D 2, YN =3D 3.
+
+			Example: ti,wire-config =3D <0x71>;
+			=3D> line AIN7, configuration XN
 - child "adc"
 	ti,adc-channels: List of analog inputs available for ADC.
 			 AIN0 =3D 0, AIN1 =3D 1 and so on till AIN7 =3D 7.
--=20
1.8.5.1
