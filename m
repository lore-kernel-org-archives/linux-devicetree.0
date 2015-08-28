From: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH 3/5] Documentation: dt-bindings: add YAML eeprom binding
Date: Fri, 28 Aug 2015 01:23:51 -0400
Message-ID: <1440739433-6799-4-git-send-email-mporter@konsulko.com>
References: <1440739433-6799-1-git-send-email-mporter@konsulko.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1440739433-6799-1-git-send-email-mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Devicetree List <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devicetree Spec List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Behan Webster <behanw-k/hB3zQhLwledRVtV/plodBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Convert the eeprom.txt binding to standard YAML DT
binding format.

Signed-off-by: Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/eeprom.yaml | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/eeprom.yaml

diff --git a/Documentation/devicetree/bindings/eeprom.yaml b/Documentation/devicetree/bindings/eeprom.yaml
new file mode 100644
index 0000000..bf1244b
--- /dev/null
+++ b/Documentation/devicetree/bindings/eeprom.yaml
@@ -0,0 +1,44 @@
+%YAML 1.2
+---
+id: eeprom-i2c
+
+title: EEPROMs (I2C)
+
+compatible:
+  - name: "<manufacturer>,24c00"
+  - name: "<manufacturer>,24c01"
+  - name: "<manufacturer>,24c02"
+  - name: "<manufacturer>,24c04"
+  - name: "<manufacturer>,24c08"
+  - name: "<manufacturer>,24c16"
+  - name: "<manufacturer>,24c32"
+  - name: "<manufacturer>,24c64"
+  - name: "<manufacturer>,24c128"
+  - name: "<manufacturer>,24c256"
+  - name: "<manufacturer>,24c512"
+  - name: "<manufacturer>,24c1024"
+  - name: "<manufacturer>,spd"
+
+required:
+  - name: "reg"
+    description: the I2c address of the EEPROM
+
+optional:
+  - name: "pagesize"
+    description: >
+      the length of the pagesize for writing. Please consult the
+      manual of your device, that value varies a lot. A wrong value
+      may result in data loss! If not specified, a safety value of
+      '1' is used which will be very slow.
+  - name: "read-only"
+    description: >
+      this parameterless property disables writes to the eeprom
+
+example:
+  - dts: |
+      eeprom@52 {
+              compatible = "atmel,24c32";
+              reg = <0x52>;
+              pagesize = <32>;
+       };
+...
-- 
2.1.4
