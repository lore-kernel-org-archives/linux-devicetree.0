From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: Require child nodes type to be 'object'
Date: Fri, 15 Mar 2019 19:09:34 -0500
Message-ID: <20190316000934.30776-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: devicetree@vger.kernel.org

A node is always an object (aka a dictionary), so make that explicit for
child node schemas.

A meta-schema update will enforce having 'type' specified.

Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Marc Zyngier <marc.zyngier@arm.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/cpus.yaml                  | 1 +
 .../devicetree/bindings/interrupt-controller/arm,gic.yaml        | 1 +
 Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index 298c17b327c6..de30466a399d 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -67,6 +67,7 @@ properties:
 
 patternProperties:
   '^cpu@[0-9a-f]+$':
+    type: object
     properties:
       device_type:
         const: cpu
diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
index 758fbd7128e7..54838d4ea44c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic.yaml
@@ -129,6 +129,7 @@ required:
 
 patternProperties:
   "^v2m@[0-9a-f]+$":
+    type: object
     description: |
       * GICv2m extension for MSI/MSI-x support (Optional)
 
diff --git a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
index c4ab59550fc2..b3f0fe96ff0d 100644
--- a/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
+++ b/Documentation/devicetree/bindings/timer/arm,arch_timer_mmio.yaml
@@ -59,6 +59,7 @@ properties:
 
 patternProperties:
   '^frame@[0-9a-z]*$':
+    type: object
     description: A timer node has up to 8 frame sub-nodes, each with the following properties.
     properties:
       frame-number:
-- 
2.19.1
