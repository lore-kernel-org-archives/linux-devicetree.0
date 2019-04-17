From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 29/31 v4] soc: ixp4xx: qmgr: Add DT bindings for IXP4xx qmgr
Date: Wed, 17 Apr 2019 20:06:21 +0200
Message-ID: <20190417180621.2818-1-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
List-Id: devicetree@vger.kernel.org

This adds device tree bindings for the Intel IXP4xx AHB
Queue Manager.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v3->v4:
- Drop #queue-cells and just use a fixed resource size.
ChangeLog v2->v3:
- Rebased on v5.1-rc1
- Drop oneOf in compatible, just list items.
- Drop description on reg, just use maxItems: 1
- Set '#queue-cells' as required
---
 .../misc/intel,ixp4xx-queue-manager.yaml      | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml

diff --git a/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml b/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
new file mode 100644
index 000000000000..d2313b1d9405
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 Linaro Ltd.
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/misc/intel-ixp4xx-ahb-queue-manager.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Intel IXP4xx AHB Queue Manager
+
+maintainers:
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: |
+  The IXP4xx AHB Queue Manager maintains queues as circular buffers in
+  an 8KB embedded SRAM along with hardware pointers. It is used by both
+  the XScale processor and the NPEs (Network Processing Units) in the
+  IXP4xx for accelerating queues, especially for networking. Clients pick
+  queues from the queue manager with foo-queue = <&qmgr N> where the
+  &qmgr is a phandle to the queue manager and N is the queue resource
+  number. The queue resources available and their specific purpose
+  on a certain IXP4xx system will vary.
+
+properties:
+  compatible:
+    items:
+      - const: intel,ixp4xx-ahb-queue-manager
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Interrupt for queues 0-31
+      - description: Interrupt for queues 32-63
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    qmgr: queue-manager@60000000 {
+         compatible = "intel,ixp4xx-ahb-queue-manager";
+         reg = <0x60000000 0x4000>;
+         interrupts = <3 IRQ_TYPE_LEVEL_HIGH>, <4 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.20.1
