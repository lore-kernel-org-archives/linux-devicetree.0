From: Rob Herring <robh@kernel.org>
Subject: [PATCH] dt-bindings: Add a guide of do's and don't's for writing bindings
Date: Wed, 13 Mar 2019 10:06:48 -0500
Message-ID: <20190313150648.32404-1-robh@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Devicetree binding reviews have a lot of repeated review comments. Much
of the guidelines aren't written down. This list of do's and don't's is
by no means an exhaustive guide for how to write bindings, but at least
the "rules" are written down in some form.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/writing-bindings.txt  | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/writing-bindings.txt

diff --git a/Documentation/devicetree/bindings/writing-bindings.txt b/Documentation/devicetree/bindings/writing-bindings.txt
new file mode 100644
index 000000000000..27dfd2d8016e
--- /dev/null
+++ b/Documentation/devicetree/bindings/writing-bindings.txt
@@ -0,0 +1,60 @@
+DOs and DON'Ts for designing and writing Devicetree bindings
+
+This is a list of common review feedback items focused on binding design. With
+every rule, there are exceptions and bindings have many gray areas.
+
+For guidelines related to patches, see
+Documentation/devicetree/bindings/submitting-patches.txt
+
+
+Overall design
+
+- DO attempt to make bindings complete even if a driver doesn't support some
+  features. For example, if a device has an interrupt, then include the
+  'interrupts' property even if the driver is only polled mode.
+
+- DON'T refer to Linux or "device driver" in bindings. Bindings should be
+  based on what the hardware has, not what an OS and driver currently support.
+
+- DO use node names matching the class of the device. Many standard names are
+  defined in the DT Spec. If there isn't one, consider adding it.
+
+- DO check that the example matches the documentation especially after making
+  review changes.
+
+- DON'T create nodes just for the sake of instantiating drivers. Multi-function
+  devices only need child nodes when the child nodes have their own DT
+  resources. A single node can be multiple providers (e.g. clocks and resets).
+
+- DON'T use 'syscon' alone without a specific compatible string. A 'syscon'
+  hardware block should have a compatible string unique enough to infer the
+  register layout of the entire block (at a minimum).
+
+
+Properties
+
+- DO make 'compatible' properties specific. DON'T use wildcards in compatible
+  strings. DO use fallback compatibles when devices are the same as or a subset
+  of prior implementations. DO add new compatibles in case there are new
+  features or bugs.
+
+- DO use a vendor prefix on device specific property names. Consider if
+  properties could be common among devices of the same class. Check other
+  existing bindings for similar devices.
+
+- DON'T redefine common properties. Just reference the definition and define
+  constraints specific to the device.
+
+- DO use common property unit suffixes for properties with scientific units.
+  See property-units.txt.
+
+- DO define properties in terms of constraints. How many entries? What are
+  possible values? What is the order?
+
+
+Board/SoC .dts Files
+
+- DO put all MMIO devices under a bus node and not at the top-level.
+
+- DO use non-empty 'ranges' to limit the size of child buses/devices. 64-bit
+  platforms don't need all devices to have 64-bit address and size.
-- 
2.19.1
