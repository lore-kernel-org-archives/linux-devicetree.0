From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 2/5] Documentation: dt-bindings: add example DT binding document
Date: Fri, 28 Aug 2015 01:23:50 -0400
Message-ID: <1440739433-6799-3-git-send-email-mporter@konsulko.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a skeleton DT binding document that serves as the canonical
example for implementing YAML-based DT bindings documentation.
The skeleton binding illustrates use of all fields and variations
described in the dt-binding-format.txt documentation.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/skeleton.yaml | 98 +++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/skeleton.yaml

diff --git a/Documentation/devicetree/bindings/skeleton.yaml b/Documentation/devicetree/bindings/skeleton.yaml
new file mode 100644
index 0000000..175965f
--- /dev/null
+++ b/Documentation/devicetree/bindings/skeleton.yaml
@@ -0,0 +1,98 @@
+%YAML 1.2
+---
+id: skel-device
+
+title: Skeleton Device
+
+maintainer:
+  - name: Skeleton Person <skel-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
+
+description: >
+  The Skeleton Device binding represents the SK11 device produced by
+  the Skeleton Corporation. The binding can also support compatible
+  clones made by second source vendors.
+
+compatible:
+  - name: "skel,sk11"
+  - name: "faux,fx11"
+    description: A clone of the original sk11 device
+
+required:
+  - name: "reg"
+    description: chip select address of skeleton device
+    reference: spi-slave
+  - name: "spi-max-frequency"
+    description: >
+      Maximum SPI clocking speed of skeleton device in Hz, must be
+      1000000
+    reference: spi-slave
+
+optional:
+  - name: "spi-cs-high"
+    description: >
+      Set if skeleton device configuration straps are set for chip
+      select polarity high
+    reference: spi-slave
+
+deprecated:
+  - name: "skel,deprecated1"
+    description: >
+      First of two deprecated properties.
+  - name: "skel,deprecated2"
+    description: >
+      Second of two deprecated properties.
+
+example:
+  - dts: |
+      sk11@0 {
+              compatible = "skel,sk11";
+              reg = <0>;
+              spi-max-frequency = <1000000>;
+              spi-cs-high;
+      };
+...
+
+---
+id: skel-mini
+
+title: Skeleton Mini Device
+
+maintainer:
+  - name: Rogue Developer <rogue-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
+
+description: >
+  The Skeleton Mini Device binding represents the SK47x series devices
+  produced by the Skeleton Corporation.
+
+compatible:
+  - name: "skel,sk472"
+  - name: "skel,sk473"
+  - name: "skel,sk474"
+  - deprecated: "skel,sk47x"
+
+required:
+  - name: "reg"
+    description: offset and length of the registers
+
+optional:
+  - name: "skel,sync-mode"
+    description: Enable synchronous transfer mode
+
+example:
+  - dts: |
+      sk472@beef0000 {
+              compatible = "skel,sk472";
+              reg = <0xbeef0000 0x100>;
+      };
+    description: >
+      Demonstrates an SK472 in normal mode.
+
+  - dts: |
+      sk474@dead0000 {
+              compatible = "skel,sk474";
+              reg = <0xdead0000 0x100>;
+              skel,sync-mode;
+      };
+    description: >
+      Demonstrates an SK474 in synchronous mode.
+...
-- 
2.1.4
