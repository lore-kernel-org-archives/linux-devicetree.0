From: Gabriel FERNANDEZ <gabriel.fernandez-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 3/4] ARM: STi: DT: add keyscan for stih41x-b2000
Date: Mon,  5 May 2014 17:38:39 +0200
Message-ID: <1399304320-18197-4-git-send-email-gabriel.fernandez@linaro.org>
References: <1399304320-18197-1-git-send-email-gabriel.fernandez@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399304320-18197-1-git-send-email-gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Srinivas Kandagatla <srinivas.kandagatla-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Maxime Coquelin <maxime.coquelin-qxv4g6HH51o@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Giuseppe Condorelli <giuseppe.condorelli-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add keyscan setup for stih415/h416 b2000.
Both have same raw/column lines number, debounce time and keymap.

Signed-off-by: Giuseppe Condorelli <giuseppe.condorelli-qxv4g6HH51o@public.gmane.org>
Signed-off-by: Gabriel Fernandez <gabriel.fernandez-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm/boot/dts/stih41x-b2000.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm/boot/dts/stih41x-b2000.dtsi b/arch/arm/boot/dts/stih41x-b2000.dtsi
index bf65c49..403bf1b 100644
--- a/arch/arm/boot/dts/stih41x-b2000.dtsi
+++ b/arch/arm/boot/dts/stih41x-b2000.dtsi
@@ -6,6 +6,7 @@
  * it under the terms of the GNU General Public License version 2 as
  * publishhed by the Free Software Foundation.
  */
+#include <dt-bindings/input/input.h>
 / {
 
 	memory{
@@ -68,5 +69,27 @@
 			snps,reset-active-low;
 			snps,reset-delays-us 	= <0 10000 10000>;
 		};
+
+		keyscan: keyscan@fe4b0000 {
+			keypad,num-rows = <4>;
+			keypad,num-columns = <4>;
+			st,debounce-us = <5000>;
+			linux,keymap = < MATRIX_KEY(0x00, 0x00, KEY_F13)
+					 MATRIX_KEY(0x00, 0x01, KEY_F9)
+					 MATRIX_KEY(0x00, 0x02, KEY_F5)
+					 MATRIX_KEY(0x00, 0x03, KEY_F1)
+					 MATRIX_KEY(0x01, 0x00, KEY_F14)
+					 MATRIX_KEY(0x01, 0x01, KEY_F10)
+					 MATRIX_KEY(0x01, 0x02, KEY_F6)
+					 MATRIX_KEY(0x01, 0x03, KEY_F2)
+					 MATRIX_KEY(0x02, 0x00, KEY_F15)
+					 MATRIX_KEY(0x02, 0x01, KEY_F11)
+					 MATRIX_KEY(0x02, 0x02, KEY_F7)
+					 MATRIX_KEY(0x02, 0x03, KEY_F3)
+					 MATRIX_KEY(0x03, 0x00, KEY_F16)
+					 MATRIX_KEY(0x03, 0x01, KEY_F12)
+					 MATRIX_KEY(0x03, 0x02, KEY_F8)
+					 MATRIX_KEY(0x03, 0x03, KEY_F4) >;
+		};
 	};
 };
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
