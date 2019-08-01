From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC 1/9] dt-bindings: mailbox: meson-mhu: convert to yaml
Date: Thu,  1 Aug 2019 15:56:36 +0200
Message-ID: <20190801135644.12843-2-narmstrong@baylibre.com>
References: <20190801135644.12843-1-narmstrong@baylibre.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190801135644.12843-1-narmstrong@baylibre.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, jassisinghbrar@gmail.com, linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/mailbox/meson-mhu.txt | 34 ------------
 .../bindings/mailbox/meson-mhu.yaml           | 53 +++++++++++++++++++
 2 files changed, 53 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.txt
 create mode 100644 Documentation/devicetree/bindings/mailbox/meson-mhu.yaml

diff --git a/Documentation/devicetree/bindings/mailbox/meson-mhu.txt b/Documentation/devicetree/bindings/mailbox/meson-mhu.txt
deleted file mode 100644
index a530310772b9..000000000000
--- a/Documentation/devicetree/bindings/mailbox/meson-mhu.txt
+++ /dev/null
@@ -1,34 +0,0 @@
-Amlogic Meson MHU Mailbox Driver
-================================
-
-The Amlogic's Meson SoCs Message-Handling-Unit (MHU) is a mailbox controller
-that has 3 independent channels/links to communicate with remote processor(s).
-MHU links are hardwired on a platform. A link raises interrupt for any
-received data. However, there is no specified way of knowing if the sent
-data has been read by the remote. This driver assumes the sender polls
-STAT register and the remote clears it after having read the data.
-
-Mailbox Device Node:
-====================
-
-Required properties:
---------------------
-- compatible:		Shall be "amlogic,meson-gxbb-mhu"
-- reg:			Contains the mailbox register address range (base
-			address and length)
-- #mbox-cells		Shall be 1 - the index of the channel needed.
-- interrupts:		Contains the interrupt information corresponding to
-			each of the 2 links of MHU.
-
-Example:
---------
-
-	mailbox: mailbox@c883c404 {
-		#mbox-cells = <1>;
-		compatible = "amlogic,meson-gxbb-mhu";
-		reg = <0 0xc883c404 0 0x4c>;
-		interrupts = <0 208 IRQ_TYPE_EDGE_RISING>,
-			     <0 209 IRQ_TYPE_EDGE_RISING>,
-			     <0 210 IRQ_TYPE_EDGE_RISING>;
-		#mbox-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/mailbox/meson-mhu.yaml b/Documentation/devicetree/bindings/mailbox/meson-mhu.yaml
new file mode 100644
index 000000000000..b84c4c05e176
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/meson-mhu.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2019 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mailbox/meson-mhu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic Meson Message-Handling-Unit Controller
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+description: |
+  The Amlogic's Meson SoCs Message-Handling-Unit (MHU) is a mailbox controller
+  that has 3 independent channels/links to communicate with remote processor(s).
+  MHU links are hardwired on a platform. A link raises interrupt for any
+  received data. However, there is no specified way of knowing if the sent
+  data has been read by the remote. This driver assumes the sender polls
+  STAT register and the remote clears it after having read the data.
+
+properties:
+  compatible:
+    enum:
+      - amlogic,meson-gxbb-mhu
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 3
+    maxItems: 3
+    description:
+      Contains the interrupt information corresponding to each of the 3 links
+      of MHU.
+
+  "#mbox-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - "#mbox-cells"
+
+examples:
+  - |
+    mailbox@c883c404 {
+          compatible = "amlogic,meson-gxbb-mhu";
+          reg = <0xc883c404 0x4c>;
+          interrupts = <208>, <209>, <210>;
+          #mbox-cells = <1>;
+    };
+
-- 
2.22.0
