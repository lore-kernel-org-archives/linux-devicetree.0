From: Guillaume La Roque <glaroque@baylibre.com>
Subject: [PATCH v5 1/7] dt-bindings: thermal: Add DT bindings documentation
 for Amlogic Thermal
Date: Fri, 27 Sep 2019 14:47:42 +0200
Message-ID: <20190927124750.12467-2-glaroque@baylibre.com>
References: <20190927124750.12467-1-glaroque@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190927124750.12467-1-glaroque@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: amit.kucheria@linaro.org, rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adding the devicetree binding documentation for the Amlogic temperature
sensor found in the Amlogic Meson G12A and G12B SoCs.

Reviewed-by: Rob Herring <robh@kernel.org>
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 .../bindings/thermal/amlogic,thermal.yaml     | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
new file mode 100644
index 000000000000..f761681e4c0d
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/thermal/amlogic,thermal.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Amlogic Thermal
+
+maintainers:
+  - Guillaume La Roque <glaroque@baylibre.com>
+
+description: Binding for Amlogic Thermal
+
+properties:
+  compatible:
+      items:
+        - enum:
+            - amlogic,g12a-cpu-thermal
+            - amlogic,g12a-ddr-thermal
+        - const: amlogic,g12a-thermal
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  amlogic,ao-secure:
+    description: phandle to the ao-secure syscon
+    $ref: '/schemas/types.yaml#/definitions/phandle'
+
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - amlogic,ao-secure
+
+examples:
+  - |
+        cpu_temp: temperature-sensor@ff634800 {
+                compatible = "amlogic,g12a-cpu-thermal",
+                             "amlogic,g12a-thermal";
+                reg = <0xff634800 0x50>;
+                interrupts = <0x0 0x24 0x0>;
+                clocks = <&clk 164>;
+                #thermal-sensor-cells = <0>;
+                amlogic,ao-secure = <&sec_AO>;
+        };
+...
-- 
2.17.1
