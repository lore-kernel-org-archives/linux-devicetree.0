From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 20/34] dt-bindings: arm: Convert TI nspire board/soc bindings to json-schema
Date: Mon,  3 Dec 2018 15:32:09 -0600
Message-ID: <20181203213223.16986-21-robh@kernel.org>
References: <20181203213223.16986-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181203213223.16986-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Grant Likely <grant.likely@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Convert TI NSpire SoC bindings to DT schema format using json-schema.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/arm/nspire.txt        | 14 -----------
 .../devicetree/bindings/arm/ti/nspire.yaml    | 24 +++++++++++++++++++
 2 files changed, 24 insertions(+), 14 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/nspire.txt
 create mode 100644 Documentation/devicetree/bindings/arm/ti/nspire.yaml

diff --git a/Documentation/devicetree/bindings/arm/nspire.txt b/Documentation/devicetree/bindings/arm/nspire.txt
deleted file mode 100644
index 4d08518bd176..000000000000
--- a/Documentation/devicetree/bindings/arm/nspire.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-TI-NSPIRE calculators
-
-Required properties:
-- compatible: Compatible property value should contain "ti,nspire".
-	CX models should have "ti,nspire-cx"
-	Touchpad models should have "ti,nspire-tp"
-	Clickpad models should have "ti,nspire-clp"
-
-Example:
-
-/ {
-	model = "TI-NSPIRE CX";
-	compatible = "ti,nspire-cx";
-	...
diff --git a/Documentation/devicetree/bindings/arm/ti/nspire.yaml b/Documentation/devicetree/bindings/arm/ti/nspire.yaml
new file mode 100644
index 000000000000..e372b43da62f
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/ti/nspire.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/ti/nspire.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI-NSPIRE calculators
+
+maintainers:
+  - Daniel Tang <dt.tangr@gmail.com>
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          # CX models
+          - ti,nspire-cx
+          # Touchpad models
+          - ti,nspire-tp
+          # Clickpad models
+          - ti,nspire-clp
+...
-- 
2.19.1
