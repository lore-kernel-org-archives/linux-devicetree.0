From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: interconnect: Add OSM L3 DT bindings
Date: Wed,  7 Aug 2019 16:54:31 +0530
Message-ID: <20190807112432.26521-2-sibis@codeaurora.org>
References: <20190807112432.26521-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807112432.26521-1-sibis@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, georgi.djakov@linaro.org
Cc: bjorn.andersson@linaro.org, agross@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, mark.rutland@arm.com, evgreen@chromium.org, daidavid1@codeaurora.org, saravanak@google.com, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add bindings for Operating State Manager (OSM) L3 interconnect provider
on SDM845 SoCs.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 .../bindings/interconnect/qcom,osm-l3.yaml    | 55 +++++++++++++++++++
 .../dt-bindings/interconnect/qcom,osm-l3.h    | 13 +++++
 2 files changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
 create mode 100644 include/dt-bindings/interconnect/qcom,osm-l3.h

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
new file mode 100644
index 0000000000000..51a4722e1a69f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,osm-l3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Operating State Manager (OSM) L3 Interconnect Provider
+
+maintainers:
+  - Sibi Sankar <sibis@codeaurora.org>
+
+description:
+  L3 cache bandwidth requirements on Qualcomm SoCs is serviced by the OSM.
+  The OSM L3 interconnect provider aggregates the L3 bandwidth requests
+  from CPU/GPU and relays it to the OSM.
+
+properties:
+  compatible:
+    const: "qcom,sdm845-osm-l3"
+
+  reg:
+    maxItems: 1
+    description: OSM L3 registers
+
+  clocks:
+    items:
+      - description: xo clock
+      - description: alternate clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: alternate
+
+  '#interconnect-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clocks-names
+  - '#interconnect-cells'
+
+examples:
+  - |
+    osm_l3: interconnect@17d41000 {
+      compatible = "qcom,sdm845-osm-l3";
+      reg = <0 0x17d41000 0 0x1400>;
+
+      clocks = <&rpmhcc RPMH_CXO_CLK>, <&gcc GPLL0>;
+      clock-names = "xo", "alternate";
+
+      #interconnect-cells = <1>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,osm-l3.h b/include/dt-bindings/interconnect/qcom,osm-l3.h
new file mode 100644
index 0000000000000..6662134c84248
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,osm-l3.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2019 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_OSM_L3_H
+
+#define MASTER_OSM_L3_APPS	0
+#define MASTER_OSM_L3_GPU	1
+#define SLAVE_OSM_L3		2
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
