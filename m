From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 16/34] dt-bindings: arm: Convert Calxeda board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:05 -0600
Message-ID: <20181203213223.16986-17-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Convert Calxeda SoC bindings to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/calxeda.txt       | 15 -------------
 .../devicetree/bindings/arm/calxeda.yaml      | 22 +++++++++++++++++++
 2 files changed, 22 insertions(+), 15 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/calxeda.txt
 create mode 100644 Documentation/devicetree/bindings/arm/calxeda.yaml

diff --git a/Documentation/devicetree/bindings/arm/calxeda.txt b/Documentation/devicetree/bindings/arm/calxeda.txt
deleted file mode 100644
index 25fcf96795ca..000000000000
--- a/Documentation/devicetree/bindings/arm/calxeda.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-Calxeda Platforms Device Tree Bindings
------------------------------------------------
-
-Boards with Calxeda Cortex-A9 based ECX-1000 (Highbank) SOC shall have the
-following properties.
-
-Required root node properties:
-    - compatible = "calxeda,highbank";
-
-
-Boards with Calxeda Cortex-A15 based ECX-2000 SOC shall have the following
-properties.
-
-Required root node properties:
-    - compatible = "calxeda,ecx-2000";
diff --git a/Documentation/devicetree/bindings/arm/calxeda.yaml b/Documentation/devicetree/bindings/arm/calxeda.yaml
new file mode 100644
index 000000000000..aa5571d23c39
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/calxeda.yaml
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/calxeda.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Calxeda Platforms Device Tree Bindings
+
+maintainers:
+  - Rob Herring <robh@kernel.org>
+description: |+
+  Bindings for boards with Calxeda Cortex-A9 based ECX-1000 (Highbank) SOC
+  or Cortex-A15 based ECX-2000 SOCs
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - calxeda,highbank
+          - calxeda,ecx-2000
-- 
2.19.1
