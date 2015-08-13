From: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Subject: [PATCH v5 1/3] clk: bcm2835: Add binding docs for the Raspberry Pi clock provider
Date: Thu, 13 Aug 2015 16:05:40 -0700
Message-ID: <1439507142-2965-2-git-send-email-eric@anholt.net>
References: <1439507142-2965-1-git-send-email-eric@anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439507142-2965-1-git-send-email-eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The hardware clocks are not controllable by the ARM, so we have to
make requests to the firmware to do so from the VPU side.  This will
let us replace fixed clocks in our DT with actual clock control (and
correct frequency information).

Signed-off-by: Eric Anholt <eric-WhKQ6XTQaPysTnJN9+BGXg@public.gmane.org>
Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Acked-by: Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---

v2: Include the dt-bindings header in this commit instead of the next
    one.  Make the clock indices match the firmware clock IDs.  Rename
    the binding's compat string.  Move the firmware phandle to be
    under a vendor-specific namespace.
v3: Mention 'clk' in the subject instead of the more generic
    dt/bindings.

 .../clock/raspberrypi,bcm2835-firmware-clocks.txt  | 25 ++++++++++++++=
++++++++
 include/dt-bindings/clk/raspberrypi.h              | 23 ++++++++++++++=
++++++
 2 files changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/raspberrypi=
,bcm2835-firmware-clocks.txt
 create mode 100644 include/dt-bindings/clk/raspberrypi.h

diff --git a/Documentation/devicetree/bindings/clock/raspberrypi,bcm283=
5-firmware-clocks.txt b/Documentation/devicetree/bindings/clock/raspber=
rypi,bcm2835-firmware-clocks.txt
new file mode 100644
index 0000000..0972602
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/raspberrypi,bcm2835-firmw=
are-clocks.txt
@@ -0,0 +1,25 @@
+Raspberry Pi firmware clock provider.
+
+The Raspberry Pi architecture doesn't provide direct access to the
+CLOCKMAN peripheral from the ARM side, so Linux has to make requests
+to the VPU firmware to program them.
+
+This binding uses the common clock binding:
+Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+Required properties:
+- compatible:		Should be "raspberrypi,bcm2835-firmware-clocks"
+
+- #clock-cells:		Shall have value <1>.  The permitted clock-specifier
+			  values can be found in
+			  include/dt-bindings/clk/raspberrypi.h.
+
+- raspberrypi,firmware:	Phandle to the firmware driver node.
+
+Example:
+
+firmware_clocks: firmware-clocks {
+	compatible =3D "raspberrypi,bcm2835-firmware-clocks";
+	#clock-cells =3D <1>;
+	raspberrypi,firmware =3D <&firmware>;
+};
diff --git a/include/dt-bindings/clk/raspberrypi.h b/include/dt-binding=
s/clk/raspberrypi.h
new file mode 100644
index 0000000..ceec90f
--- /dev/null
+++ b/include/dt-bindings/clk/raspberrypi.h
@@ -0,0 +1,23 @@
+#/*
+ *  Copyright =C2=A9 2015 Broadcom
+ *
+ * This program is free software; you can redistribute it and/or modif=
y
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _DT_BINDINGS_CLK_RASPBERRYPI_H
+#define _DT_BINDINGS_CLK_RASPBERRYPI_H
+
+#define RPI_CLOCK_EMMC	1
+#define RPI_CLOCK_UART0	2
+#define RPI_CLOCK_ARM	3
+#define RPI_CLOCK_CORE	4
+#define RPI_CLOCK_V3D	5
+#define RPI_CLOCK_H264	6
+#define RPI_CLOCK_ISP	7
+#define RPI_CLOCK_SDRAM	8
+#define RPI_CLOCK_PIXEL	9
+#define RPI_CLOCK_PWM	10
+
+#endif
--=20
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
