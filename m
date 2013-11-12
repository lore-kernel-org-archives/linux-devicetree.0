From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH] input: ti_am33x_tsc: make the documentation for the ti,wire-config parameter clear
Date: Tue, 12 Nov 2013 17:22:03 +0100
Message-ID: <1384273323-15329-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-input-owner@vger.kernel.org>
Sender: linux-input-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, devicetree@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
List-Id: devicetree@vger.kernel.org

The document says "first four bits" and means the upper nibble. Most
people would probably agree that the first four bits are bits 0=E2=80=A6=
3 and
that is the lower nibble.
This patch updates the documentation so it is clear what is meant.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.txt | 4=
 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/ti-tsc=
-adc.txt b/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-a=
dc.txt
index 491c97b..0fcd430 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.tx=
t
+++ b/Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.tx=
t
@@ -17,8 +17,8 @@
 				remaining 4 can be used by the ADC.
 	ti,wire-config: Different boards could have a different order for
 			connecting wires on touchscreen. We need to provide an
-			8 bit number where in the 1st four bits represent the
-			analog lines and the next 4 bits represent positive/
+			8 bit number where the upper nibble represent the
+			analog lines and the lower nibble represent positive/
 			negative terminal on that input line. Notations to
 			represent the input lines and terminals resoectively
 			is as follows:
--=20
1.8.4.2

--
To unsubscribe from this list: send the line "unsubscribe linux-input" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
