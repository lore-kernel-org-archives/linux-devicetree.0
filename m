From: Rob Herring <robh@kernel.org>
Subject: [PATCH v2 08/34] dt-bindings: arm: Convert PMU binding to json-schema
Date: Mon,  3 Dec 2018 15:31:57 -0600
Message-ID: <20181203213223.16986-9-robh@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kumar Gala <kumar.gala@linaro.org>, arm@kernel.org, Sean Hudson <darknighte@darknighte.com>, Frank Rowand <frowand.list@gmail.com>, Will Deacon <will.deacon@arm.com>, Grant Likely <grant.likely@arm.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Convert ARM PMU binding to DT schema format using json-schema.

Cc: Will Deacon <will.deacon@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/pmu.txt | 70 --------------
 .../devicetree/bindings/arm/pmu.yaml          | 91 +++++++++++++++++++
 2 files changed, 91 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/arm/pmu.txt
 create mode 100644 Documentation/devicetree/bindings/arm/pmu.yaml

diff --git a/Documentation/devicetree/bindings/arm/pmu.txt b/Documentation/devicetree/bindings/arm/pmu.txt
deleted file mode 100644
index 13611a8199bb..000000000000
--- a/Documentation/devicetree/bindings/arm/pmu.txt
+++ /dev/null
@@ -1,70 +0,0 @@
-* ARM Performance Monitor Units
-
-ARM cores often have a PMU for counting cpu and cache events like cache misses
-and hits. The interface to the PMU is part of the ARM ARM. The ARM PMU
-representation in the device tree should be done as under:-
-
-Required properties:
-
-- compatible : should be one of
-	"apm,potenza-pmu"
-	"arm,armv8-pmuv3"
-	"arm,cortex-a73-pmu"
-	"arm,cortex-a72-pmu"
-	"arm,cortex-a57-pmu"
-	"arm,cortex-a53-pmu"
-	"arm,cortex-a35-pmu"
-	"arm,cortex-a17-pmu"
-	"arm,cortex-a15-pmu"
-	"arm,cortex-a12-pmu"
-	"arm,cortex-a9-pmu"
-	"arm,cortex-a8-pmu"
-	"arm,cortex-a7-pmu"
-	"arm,cortex-a5-pmu"
-	"arm,arm11mpcore-pmu"
-	"arm,arm1176-pmu"
-	"arm,arm1136-pmu"
-	"brcm,vulcan-pmu"
-	"cavium,thunder-pmu"
-	"qcom,scorpion-pmu"
-	"qcom,scorpion-mp-pmu"
-	"qcom,krait-pmu"
-- interrupts : 1 combined interrupt or 1 per core. If the interrupt is a per-cpu
-               interrupt (PPI) then 1 interrupt should be specified.
-
-Optional properties:
-
-- interrupt-affinity : When using SPIs, specifies a list of phandles to CPU
-                       nodes corresponding directly to the affinity of
-		       the SPIs listed in the interrupts property.
-
-                       When using a PPI, specifies a list of phandles to CPU
-		       nodes corresponding to the set of CPUs which have
-		       a PMU of this type signalling the PPI listed in the
-		       interrupts property, unless this is already specified
-		       by the PPI interrupt specifier itself (in which case
-		       the interrupt-affinity property shouldn't be present).
-
-                       This property should be present when there is more than
-		       a single SPI.
-
-
-- qcom,no-pc-write : Indicates that this PMU doesn't support the 0xc and 0xd
-                     events.
-
-- secure-reg-access : Indicates that the ARMv7 Secure Debug Enable Register
-		      (SDER) is accessible. This will cause the driver to do
-		      any setup required that is only possible in ARMv7 secure
-		      state. If not present the ARMv7 SDER will not be touched,
-		      which means the PMU may fail to operate unless external
-		      code (bootloader or security monitor) has performed the
-		      appropriate initialisation. Note that this property is
-		      not valid for non-ARMv7 CPUs or ARMv7 CPUs booting Linux
-		      in Non-secure state.
-
-Example:
-
-pmu {
-        compatible = "arm,cortex-a9-pmu";
-        interrupts = <100 101>;
-};
diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
new file mode 100644
index 000000000000..3ea4abfbf276
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ARM Performance Monitor Units
+
+maintainers:
+  - Mark Rutland <mark.rutland@arm.com>
+  - Will Deacon <will.deacon@arm.com>
+
+description: |+
+  ARM cores often have a PMU for counting cpu and cache events like cache misses
+  and hits. The interface to the PMU is part of the ARM ARM. The ARM PMU
+  representation in the device tree should be done as under:-
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - apm,potenza-pmu
+              - arm,armv8-pmuv3
+              - arm,cortex-a73-pmu
+              - arm,cortex-a72-pmu
+              - arm,cortex-a57-pmu
+              - arm,cortex-a53-pmu
+              - arm,cortex-a35-pmu
+              - arm,cortex-a17-pmu
+              - arm,cortex-a15-pmu
+              - arm,cortex-a12-pmu
+              - arm,cortex-a9-pmu
+              - arm,cortex-a8-pmu
+              - arm,cortex-a7-pmu
+              - arm,cortex-a5-pmu
+              - arm,arm11mpcore-pmu
+              - arm,arm1176-pmu
+              - arm,arm1136-pmu
+              - brcm,vulcan-pmu
+              - cavium,thunder-pmu
+              - qcom,scorpion-pmu
+              - qcom,scorpion-mp-pmu
+              - qcom,krait-pmu
+      - items:
+          - const: arm,cortex-a7-pmu
+          - const: arm,cortex-a15-pmu
+
+  interrupts:
+    # Don't know how many CPUs, so no constraints to specify
+    description: 1 per-cpu interrupt (PPI) or 1 interrupt per core.
+
+  interrupt-affinity:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description:
+      When using SPIs, specifies a list of phandles to CPU
+      nodes corresponding directly to the affinity of
+      the SPIs listed in the interrupts property.
+
+      When using a PPI, specifies a list of phandles to CPU
+      nodes corresponding to the set of CPUs which have
+      a PMU of this type signalling the PPI listed in the
+      interrupts property, unless this is already specified
+      by the PPI interrupt specifier itself (in which case
+      the interrupt-affinity property shouldn't be present).
+
+      This property should be present when there is more than
+      a single SPI.
+
+  qcom,no-pc-write:
+    type: boolean
+    description:
+      Indicates that this PMU doesn't support the 0xc and 0xd events.
+
+  secure-reg-access:
+    type: boolean
+    description:
+      Indicates that the ARMv7 Secure Debug Enable Register
+      (SDER) is accessible. This will cause the driver to do
+      any setup required that is only possible in ARMv7 secure
+      state. If not present the ARMv7 SDER will not be touched,
+      which means the PMU may fail to operate unless external
+      code (bootloader or security monitor) has performed the
+      appropriate initialisation. Note that this property is
+      not valid for non-ARMv7 CPUs or ARMv7 CPUs booting Linux
+      in Non-secure state.
+
+required:
+  - compatible
+
+...
-- 
2.19.1
