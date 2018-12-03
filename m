From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 05/34] dt-bindings: i2c: Convert i2c-gpio binding to
 json-schema
Date: Mon,  3 Dec 2018 15:31:54 -0600
Message-ID: <20181203213223.16986-6-robh@kernel.org>
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
Cc: Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, Grant Likely <grant.likely@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert the i2c-gpio binding to DT schema format using json-schema. This
serves as an example of how to include other schema (i2c-controller.yaml
in this case).

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/i2c/i2c-gpio.txt      | 46 ------------
 .../devicetree/bindings/i2c/i2c-gpio.yaml     | 73 +++++++++++++++++++
 2 files changed, 73 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-gpio.yaml

diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.txt b/Documentation/devicetree/bindings/i2c/i2c-gpio.txt
deleted file mode 100644
index 38a05562d1d2..000000000000
--- a/Documentation/devicetree/bindings/i2c/i2c-gpio.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-Device-Tree bindings for i2c gpio driver
-
-Required properties:
-	- compatible = "i2c-gpio";
-	- sda-gpios: gpio used for the sda signal, this should be flagged as
-	  active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
-	  from <dt-bindings/gpio/gpio.h> since the signal is by definition
-	  open drain.
-	- scl-gpios: gpio used for the scl signal, this should be flagged as
-	  active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
-	  from <dt-bindings/gpio/gpio.h> since the signal is by definition
-	  open drain.
-
-Optional properties:
-	- i2c-gpio,scl-output-only: scl as output only
-	- i2c-gpio,delay-us: delay between GPIO operations (may depend on each platform)
-	- i2c-gpio,timeout-ms: timeout to get data
-
-Deprecated properties, do not use in new device tree sources:
-	- gpios: sda and scl gpio, alternative for {sda,scl}-gpios
-	- i2c-gpio,sda-open-drain: this means that something outside of our
-	  control has put the GPIO line used for SDA into open drain mode, and
-	  that something is not the GPIO chip. It is essentially an
-	  inconsistency flag.
-	- i2c-gpio,scl-open-drain: this means that something outside of our
-	  control has put the GPIO line used for SCL into open drain mode, and
-	  that something is not the GPIO chip. It is essentially an
-	  inconsistency flag.
-
-Example nodes:
-
-#include <dt-bindings/gpio/gpio.h>
-
-i2c@0 {
-	compatible = "i2c-gpio";
-	sda-gpios = <&pioA 23 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-	scl-gpios = <&pioA 24 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
-	i2c-gpio,delay-us = <2>;	/* ~100 kHz */
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	rv3029c2@56 {
-		compatible = "rv3029c2";
-		reg = <0x56>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
new file mode 100644
index 000000000000..da6129090a8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-gpio.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Bindings for GPIO bitbanged I2C
+
+maintainers:
+  - Wolfram Sang <wolfram@the-dreams.de>
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: i2c-gpio
+
+  sda-gpios:
+    description:
+      gpio used for the sda signal, this should be flagged as
+      active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
+      from <dt-bindings/gpio/gpio.h> since the signal is by definition
+      open drain.
+    maxItems: 1
+
+  scl-gpios:
+    description:
+      gpio used for the scl signal, this should be flagged as
+      active high using open drain with (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)
+      from <dt-bindings/gpio/gpio.h> since the signal is by definition
+      open drain.
+    maxItems: 1
+
+  i2c-gpio,scl-output-only:
+    description: scl as output only
+    type: boolean
+
+  i2c-gpio,delay-us:
+    description: delay between GPIO operations (may depend on each platform)
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  i2c-gpio,timeout-ms:
+    description: timeout to get data
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  # Deprecated properties, do not use in new device tree sources:
+  gpios:
+    minItems: 2
+    maxItems: 2
+    description: sda and scl gpio, alternative for {sda,scl}-gpios
+
+  i2c-gpio,sda-open-drain:
+    # Generate a warning if present
+    not: true
+    description: this means that something outside of our control has put
+      the GPIO line used for SDA into open drain mode, and that something is
+      not the GPIO chip. It is essentially an inconsistency flag.
+
+  i2c-gpio,scl-open-drain:
+    # Generate a warning if present
+    not: true
+    description: this means that something outside of our control has put the
+      GPIO line used for SCL into open drain mode, and that something is not
+      the GPIO chip. It is essentially an inconsistency flag.
+
+required:
+  - compatible
+  - sda-gpios
+  - scl-gpios
+
+...
-- 
2.19.1
