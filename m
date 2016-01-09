From: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Subject: [PATCH v4 05/14] dt/bindings: Add bindings for PIC32/MZDA platforms
Date: Fri, 8 Jan 2016 18:40:18 -0700
Message-ID: <1452303638-21388-2-git-send-email-joshua.henderson@microchip.com>
References: <1452303638-21388-1-git-send-email-joshua.henderson@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452303638-21388-1-git-send-email-joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This adds support for the Microchip PIC32 platform along with the
specific variant PIC32MZDA on a PIC32MZDA Starter Kit.

Signed-off-by: Joshua Henderson <joshua.henderson-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>
Cc: Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
---
Changes since v3 (https://lkml.org/lkml/2016/1/7/760):
	+ Remove broken URL and use full manual name for boot protocol


 .../bindings/mips/pic32/microchip,pic32mzda.txt    |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt

diff --git a/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt b/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
new file mode 100644
index 0000000..1c8dbc4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mips/pic32/microchip,pic32mzda.txt
@@ -0,0 +1,31 @@
+* Microchip PIC32MZDA Platforms
+
+PIC32MZDA Starter Kit
+Required root node properties:
+    - compatible = "microchip,pic32mzda-sk", "microchip,pic32mzda"
+
+CPU nodes:
+----------
+A "cpus" node is required.  Required properties:
+ - #address-cells: Must be 1.
+ - #size-cells: Must be 0.
+A CPU sub-node is also required.  Required properties:
+ - device_type: Must be "cpu".
+ - compatible: Must be "mti,mips14KEc".
+Example:
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "mti,mips14KEc";
+		};
+	};
+
+Boot protocol
+--------------
+In accordance with Unified Hosting Interface Reference Manual (MD01069), the
+bootloader must pass the following arguments to the kernel:
+ - $a0: -2.
+ - $a1: KSEG0 address of the flattened device-tree blob.
--
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
