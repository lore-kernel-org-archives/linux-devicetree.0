From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: Fix more $id value mismatches filenames
Date: Fri, 26 Jul 2019 17:44:26 -0600
Message-ID: <20190726234426.16267-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The path in the schema '$id' values are wrong. Fix them.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/renesas.yaml              | 2 +-
 Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml   | 2 +-
 Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml        | 2 +-
 .../firmware/intel,ixp4xx-network-processing-engine.yaml        | 2 +-
 Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml    | 2 +-
 Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml    | 2 +-
 .../bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml   | 2 +-
 ...x-queue-manager.yaml => intel,ixp4xx-ahb-queue-manager.yaml} | 2 +-
 .../devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml      | 2 +-
 .../devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml  | 2 +-
 Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)
 rename Documentation/devicetree/bindings/misc/{intel,ixp4xx-queue-manager.yaml => intel,ixp4xx-ahb-queue-manager.yaml} (95%)

diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
index 08c923f8c257..28eb458f761a 100644
--- a/Documentation/devicetree/bindings/arm/renesas.yaml
+++ b/Documentation/devicetree/bindings/arm/renesas.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/shmobile.yaml#
+$id: http://devicetree.org/schemas/arm/renesas.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Renesas SH-Mobile, R-Mobile, and R-Car Platform Device Tree Bindings
diff --git a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
index aae53fc3cb1e..2bd519d2e855 100644
--- a/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
+++ b/Documentation/devicetree/bindings/arm/socionext/milbeaut.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/milbeaut.yaml#
+$id: http://devicetree.org/schemas/arm/socionext/milbeaut.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Milbeaut platforms device tree bindings
diff --git a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
index 4326d2cfa15d..a8765ba29476 100644
--- a/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/ti,davinci.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/ti/davinci.yaml#
+$id: http://devicetree.org/schemas/arm/ti/ti,davinci.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Texas Instruments DaVinci Platforms Device Tree Bindings
diff --git a/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml b/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
index 8cb136c376fb..4f0db8ee226a 100644
--- a/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
+++ b/Documentation/devicetree/bindings/firmware/intel,ixp4xx-network-processing-engine.yaml
@@ -2,7 +2,7 @@
 # Copyright 2019 Linaro Ltd.
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/firmware/intel-ixp4xx-network-processing-engine.yaml#"
+$id: "http://devicetree.org/schemas/firmware/intel,ixp4xx-network-processing-engine.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Intel IXP4xx Network Processing Engine
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
index 7ba167e2e1ea..c602b6fe1c0c 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl345.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/iio/accelerometers/adi,adxl345.yaml#
+$id: http://devicetree.org/schemas/iio/accel/adi,adxl345.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADXL345/ADXL375 3-Axis Digital Accelerometers
diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
index a7fafb9bf5c6..e7daffec88d3 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adxl372.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/iio/accelerometers/adi,adxl372.yaml#
+$id: http://devicetree.org/schemas/iio/accel/adi,adxl372.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Analog Devices ADXL372 3-Axis, +/-(200g) Digital Accelerometer
diff --git a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
index bae10e261fa9..507c141ea760 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/intel,ixp4xx-interrupt.yaml
@@ -2,7 +2,7 @@
 # Copyright 2018 Linaro Ltd.
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/interrupt/intel-ixp4xx-interrupt.yaml#"
+$id: "http://devicetree.org/schemas/interrupt-controller/intel,ixp4xx-interrupt.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Intel IXP4xx XScale Networking Processors Interrupt Controller
diff --git a/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml b/Documentation/devicetree/bindings/misc/intel,ixp4xx-ahb-queue-manager.yaml
similarity index 95%
rename from Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
rename to Documentation/devicetree/bindings/misc/intel,ixp4xx-ahb-queue-manager.yaml
index d2313b1d9405..0ea21a6f70b4 100644
--- a/Documentation/devicetree/bindings/misc/intel,ixp4xx-queue-manager.yaml
+++ b/Documentation/devicetree/bindings/misc/intel,ixp4xx-ahb-queue-manager.yaml
@@ -2,7 +2,7 @@
 # Copyright 2019 Linaro Ltd.
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/misc/intel-ixp4xx-ahb-queue-manager.yaml#"
+$id: "http://devicetree.org/schemas/misc/intel,ixp4xx-ahb-queue-manager.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Intel IXP4xx AHB Queue Manager
diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index d4084c149768..3fb0714e761e 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-gmac.yaml#
+$id: http://devicetree.org/schemas/net/allwinner,sun8i-a83t-emac.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A83t EMAC Device Tree Bindings
diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
index 250f9d5aabdf..fa46670de299 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun6i-a31-mipi-dphy.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/allwinner,sun6i-a31-mipi-dphy.yaml#
+$id: http://devicetree.org/schemas/phy/allwinner,sun6i-a31-mipi-dphy.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A31 MIPI D-PHY Controller Device Tree Bindings
diff --git a/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml b/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
index a36a0746c056..2807225db902 100644
--- a/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
+++ b/Documentation/devicetree/bindings/timer/intel,ixp4xx-timer.yaml
@@ -2,7 +2,7 @@
 # Copyright 2018 Linaro Ltd.
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/timer/intel-ixp4xx-timer.yaml#"
+$id: "http://devicetree.org/schemas/timer/intel,ixp4xx-timer.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
 title: Intel IXP4xx XScale Networking Processors Timers
-- 
2.20.1
