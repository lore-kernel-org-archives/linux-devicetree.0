From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 4/5] Documentation: dt-bindings: phy: add YAML generic PHY binding
Date: Fri, 28 Aug 2015 01:23:52 -0400
Message-ID: <1440739433-6799-5-git-send-email-mporter@konsulko.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Convert the generic phy-bindings.txt binding to standard YAML
DT binding format.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 .../devicetree/bindings/phy/phy-bindings.yaml      | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/phy-bindings.yaml

diff --git a/Documentation/devicetree/bindings/phy/phy-bindings.yaml b/Documentation/devicetree/bindings/phy/phy-bindings.yaml
new file mode 100644
index 0000000..9b164d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/phy-bindings.yaml
@@ -0,0 +1,89 @@
+%YAML 1.2
+---
+id: phy-device
+
+title: PHY device
+
+description: >
+  This document explains only the device tree data binding.  For general
+  information about PHY subsystem refer to Documentation/phy.txt
+
+required:
+  - name: "#phy-cells"
+    description: >
+      number of cells in a PHY specifier. The meaning of all those
+      cells is defined by the binding for the phy node. The PHY
+      provider can use the values in cells to find the appropriate
+      PHY.
+
+optional:
+  - name: "phy-supply"
+    description: >
+      phandle to a regulator that provides power to the PHY. This
+      regulator will be managed during the PHY power on/off sequence.
+
+example:
+  - dts: |
+      phys: phy {
+          compatible = "xxx";
+          reg = <...>;
+          .
+          .
+          #phy-cells = <1>;
+          .
+          .
+      };
+    description: >
+      Describes an IP block (PHY provider) that implements 2 different
+      PHYs. In order to differentiate between these 2 PHYs, an
+      additional specifier should be given while trying to get a
+      reference to it.
+...
+
+---
+id: phy-user
+
+title: PHY user
+
+required:
+  - name: "phys"
+    description: >
+      the phandle for the PHY device (used by the PHY subsystem)
+  - name: "phy-names"
+    description: >
+      the names of the PHY corresponding to the PHYs present in the
+      *phys* phandle
+
+example:
+  - dts: |
+      usb1: usb_otg_ss@xxx {
+          compatible = "xxx";
+          reg = <xxx>;
+          .
+          .
+          phys = <&usb2_phy>, <&usb3_phy>;
+          phy-names = "usb2phy", "usb3phy";
+          .
+          .
+      };
+    description: >
+       Represents a controller that uses two PHYs, one for usb2 and one
+       for usb3.
+
+  - dts: |
+      usb2: usb_otg_ss@xxx {
+          compatible = "xxx";
+          reg = <xxx>;
+          .
+          .
+          phys = <&phys 1>;
+          phy-names = "usbphy";
+          .
+          .
+      };
+    description: >
+      Represents a controller that uses one of the PHYs of the PHY
+      provider device defined previously. Note that the phy handle
+      has an additional specifier "1" to differentiate between the
+      two PHYs.
+...
-- 
2.1.4
