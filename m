From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 04/34] dt-bindings: altera: Convert clkmgr binding to
 json-schema
Date: Mon,  3 Dec 2018 15:31:53 -0600
Message-ID: <20181203213223.16986-5-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, Grant Likely <grant.likely@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert Altera clkmgr to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Dinh Nguyen <dinguyen@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../arm/altera/socfpga-clk-manager.txt        | 11 -------
 .../arm/altera/socfpga-clk-manager.yaml       | 31 +++++++++++++++++++
 2 files changed, 31 insertions(+), 11 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt
 create mode 100644 Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml

diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt
deleted file mode 100644
index 2c28f1d12f45..000000000000
--- a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-Altera SOCFPGA Clock Manager
-
-Required properties:
-- compatible : "altr,clk-mgr"
-- reg : Should contain base address and length for Clock Manager
-
-Example:
-	 clkmgr@ffd04000 {
-		compatible = "altr,clk-mgr";
-		reg = <0xffd04000 0x1000>;
-	};
diff --git a/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
new file mode 100644
index 000000000000..e4131fa42b26
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/altera/socfpga-clk-manager.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/altera/socfpga-clk-manager.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Altera SOCFPGA Clock Manager
+
+maintainers:
+  - Dinh Nguyen <dinguyen@kernel.org>
+
+description: test
+
+properties:
+  compatible:
+    items:
+      - const: altr,clk-mgr
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+
+examples:
+  - |
+    clkmgr@ffd04000 {
+      compatible = "altr,clk-mgr";
+      reg = <0xffd04000 0x1000>;
+    };
+
+...
-- 
2.19.1
