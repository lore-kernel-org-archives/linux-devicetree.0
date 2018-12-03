From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 29/34] dt-bindings: arm: Convert ST STi board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:18 -0600
Message-ID: <20181203213223.16986-30-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Patrice Chotard <patrice.chotard@st.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Convert ST STi SoC bindings to DT schema format using json-schema.

Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/sti.txt | 23 -------------------
 .../devicetree/bindings/arm/sti.yaml          | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 23 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/sti.txt
 create mode 100644 Documentation/devicetree/bindings/arm/sti.yaml

diff --git a/Documentation/devicetree/bindings/arm/sti.txt b/Documentation/devicetree/bindings/arm/sti.txt
deleted file mode 100644
index 8d27f6b084c7..000000000000
--- a/Documentation/devicetree/bindings/arm/sti.txt
+++ /dev/null
@@ -1,23 +0,0 @@
-ST STi Platforms Device Tree Bindings
----------------------------------------
-
-Boards with the ST STiH415 SoC shall have the following properties:
-Required root node property:
-compatible = "st,stih415";
-
-Boards with the ST STiH416 SoC shall have the following properties:
-Required root node property:
-compatible = "st,stih416";
-
-Boards with the ST STiH407 SoC shall have the following properties:
-Required root node property:
-compatible = "st,stih407";
-
-Boards with the ST STiH410 SoC shall have the following properties:
-Required root node property:
-compatible = "st,stih410";
-
-Boards with the ST STiH418 SoC shall have the following properties:
-Required root node property:
-compatible = "st,stih418";
-
diff --git a/Documentation/devicetree/bindings/arm/sti.yaml b/Documentation/devicetree/bindings/arm/sti.yaml
new file mode 100644
index 000000000000..47f9b8eebaa0
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/sti.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/sti.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST STi Platforms Device Tree Bindings
+
+maintainers:
+  - Patrice Chotard <patrice.chotard@st.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - st,stih415
+          - st,stih416
+          - st,stih407
+          - st,stih410
+          - st,stih418
+...
-- 
2.19.1
