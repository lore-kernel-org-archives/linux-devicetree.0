From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v3 1/2] dt/bindings: Add bindings for PIC32 deadman timer peripheral
Date: Fri, 26 Feb 2016 10:20:21 -0700
Message-ID: <1456507226-5566-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>

Document the devicetree bindings for the deadman timer peripheral found on
Microchip PIC32 SoC class devices.

Signed-off-by: Purna Chandra Mandal <purna.mandal-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Note: Please merge this patch series through the MIPS tree.

Changes since v2: None
Changes since v1:
	- Change the example node name to be standard.
---
 .../bindings/watchdog/microchip,pic32-dmt.txt      |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
new file mode 100644
index 0000000..852f694
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/microchip,pic32-dmt.txt
@@ -0,0 +1,19 @@
+* Microchip PIC32 Deadman Timer
+
+The deadman timer is used to reset the processor in the event of a software
+malfunction. It is a free-running instruction fetch timer, which is clocked
+whenever an instruction fetch occurs until a count match occurs.
+
+Required properties:
+- compatible: must be "microchip,pic32mzda-dmt".
+- reg: physical base address of the controller and length of memory mapped
+  region.
+- clocks: phandle of parent clock (should be &PBCLK7).
+
+Example:
+
+	watchdog@1f800a00 {
+		compatible = "microchip,pic32mzda-dmt";
+		reg = <0x1f800a00 0x80>;
+		clocks = <&PBCLK7>;
+	};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
