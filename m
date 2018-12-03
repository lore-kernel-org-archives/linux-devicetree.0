From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 31/34] dt-bindings: arm: Convert VIA board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:20 -0600
Message-ID: <20181203213223.16986-32-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Tony Prisk <linux@prisktech.co.nz>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Convert VIA SoC bindings to DT schema format using json-schema.

Cc: Tony Prisk <linux@prisktech.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/vt8500.txt        | 22 ------------------
 .../devicetree/bindings/arm/vt8500.yaml       | 23 +++++++++++++++++++
 2 files changed, 23 insertions(+), 22 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/vt8500.txt
 create mode 100644 Documentation/devicetree/bindings/arm/vt8500.yaml

diff --git a/Documentation/devicetree/bindings/arm/vt8500.txt b/Documentation/devicetree/bindings/arm/vt8500.txt
deleted file mode 100644
index 87dc1ddf4770..000000000000
--- a/Documentation/devicetree/bindings/arm/vt8500.txt
+++ /dev/null
@@ -1,22 +0,0 @@
-VIA/Wondermedia VT8500 Platforms Device Tree Bindings
----------------------------------------
-
-Boards with the VIA VT8500 SoC shall have the following properties:
-Required root node property:
-compatible = "via,vt8500";
-
-Boards with the Wondermedia WM8505 SoC shall have the following properties:
-Required root node property:
-compatible = "wm,wm8505";
-
-Boards with the Wondermedia WM8650 SoC shall have the following properties:
-Required root node property:
-compatible = "wm,wm8650";
-
-Boards with the Wondermedia WM8750 SoC shall have the following properties:
-Required root node property:
-compatible = "wm,wm8750";
-
-Boards with the Wondermedia WM8850 SoC shall have the following properties:
-Required root node property:
-compatible = "wm,wm8850";
diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
new file mode 100644
index 000000000000..7b25b6fa34e9
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
@@ -0,0 +1,23 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/vt8500.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Platforms Device Tree Bindings
+
+maintainers:
+  - Tony Prisk <linux@prisktech.co.nz>
+description: test
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - via,vt8500
+          - wm,wm8505
+          - wm,wm8650
+          - wm,wm8750
+          - wm,wm8850
-- 
2.19.1
