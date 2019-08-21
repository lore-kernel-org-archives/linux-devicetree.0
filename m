From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/5] dt-bindings: power: add Amlogic Everything-Else power domains bindings
Date: Wed, 21 Aug 2019 13:41:17 +0200
Message-ID: <20190821114121.10430-2-narmstrong@baylibre.com>
References: <20190821114121.10430-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821114121.10430-1-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: khilman@baylibre.com, ulf.hansson@linaro.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add the bindings for the Amlogic Everything-Else power domains,
controlling the Everything-Else peripherals power domains.

The bindings targets the Amlogic G12A and SM1 compatible SoCs,
support for earlier SoCs will be added later.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/power/amlogic,meson-ee-pwrc.yaml | 93 +++++++++++++++++++
 include/dt-bindings/power/meson-g12a-power.h  | 13 +++
 include/dt-bindings/power/meson-sm1-power.h   | 18 ++++
 3 files changed, 124 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
 create mode 100644 include/dt-bindings/power/meson-g12a-power.h
 create mode 100644 include/dt-bindings/power/meson-sm1-power.h

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
new file mode 100644
index 000000000000..aab70e8b681e
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-ee-pwrc.yaml
@@ -0,0 +1,93 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/power/amlogic,meson-ee-pwrc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Everything-Else Power Domains
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |+
+  The Everything-Else Power Domains node should be the child of a syscon
+  node with the required property:
+
+  - compatible: Should be the following:
+                "amlogic,meson-gx-hhi-sysctrl", "simple-mfd", "syscon"
+
+  Refer to the the bindings described in
+  Documentation/devicetree/bindings/mfd/syscon.txt
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-g12a-pwrc
+      - amlogic,meson-sm1-pwrc
+
+  clocks:
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: vpu
+      - const: vapb
+
+  resets:
+    minItems: 11
+
+  reset-names:
+    items:
+      - const: viu
+      - const: venc
+      - const: vcbus
+      - const: bt656
+      - const: rdma
+      - const: venci
+      - const: vencp
+      - const: vdac
+      - const: vdi6
+      - const: vencl
+      - const: vid_lock
+
+  "#power-domain-cells":
+    const: 1
+
+  amlogic,ao-sysctrl:
+    description: phandle to the AO sysctrl node
+    allOf:
+      - $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - clocks
+  - clock-names
+  - resets
+  - reset-names
+  - "#power-domain-cells"
+  - amlogic,ao-sysctrl
+
+examples:
+  - |
+    pwrc: power-controller {
+          compatible = "amlogic,meson-sm1-pwrc";
+          #power-domain-cells = <1>;
+          amlogic,ao-sysctrl = <&rti>;
+          resets = <&reset_viu>,
+                   <&reset_venc>,
+                   <&reset_vcbus>,
+                   <&reset_bt656>,
+                   <&reset_rdma>,
+                   <&reset_venci>,
+                   <&reset_vencp>,
+                   <&reset_vdac>,
+                   <&reset_vdi6>,
+                   <&reset_vencl>,
+                   <&reset_vid_lock>;
+          reset-names = "viu", "venc", "vcbus", "bt656",
+                        "rdma", "venci", "vencp", "vdac",
+                        "vdi6", "vencl", "vid_lock";
+          clocks = <&clk_vpu>, <&clk_vapb>;
+          clock-names = "vpu", "vapb";
+    };
diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
new file mode 100644
index 000000000000..bb5e67a842de
--- /dev/null
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON_G12A_POWER_H
+#define _DT_BINDINGS_MESON_G12A_POWER_H
+
+#define PWRC_G12A_VPU_ID		0
+#define PWRC_G12A_ETH_ID		1
+
+#endif
diff --git a/include/dt-bindings/power/meson-sm1-power.h b/include/dt-bindings/power/meson-sm1-power.h
new file mode 100644
index 000000000000..a020ab00c134
--- /dev/null
+++ b/include/dt-bindings/power/meson-sm1-power.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0+ or MIT) */
+/*
+ * Copyright (c) 2019 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ */
+
+#ifndef _DT_BINDINGS_MESON_SM1_POWER_H
+#define _DT_BINDINGS_MESON_SM1_POWER_H
+
+#define PWRC_SM1_VPU_ID		0
+#define PWRC_SM1_NNA_ID		1
+#define PWRC_SM1_USB_ID		2
+#define PWRC_SM1_PCIE_ID	3
+#define PWRC_SM1_GE2D_ID	4
+#define PWRC_SM1_AUDIO_ID	5
+#define PWRC_SM1_ETH_ID		6
+
+#endif
-- 
2.22.0
