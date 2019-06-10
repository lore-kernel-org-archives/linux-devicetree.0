From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH v4 1/2] dt-bindings: interrupt-controller: Amazon's Annapurna Labs FIC
Date: Mon, 10 Jun 2019 11:34:42 +0300
Message-ID: <1560155683-29584-2-git-send-email-talel@amazon.com>
References: <1560155683-29584-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560155683-29584-1-git-send-email-talel@amazon.com>
Sender: linux-kernel-owner@vger.kernel.org
To: nicolas.ferre@microchip.com, jason@lakedaemon.net, marc.zyngier@arm.com, mark.rutland@arm.com, mchehab+samsung@kernel.org, robh+dt@kernel.org, davem@davemloft.net, shawn.lin@rock-chips.com, tglx@linutronix.de, devicetree@vger.kernel.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
Cc: dwmw@amazon.co.uk, benh@kernel.crashing.org, jonnyc@amazon.com, hhhawa@amazon.com, ronenk@amazon.com, hanochu@amazon.com, barakw@amazon.com, Talel Shenhar <talel@amazon.com>
List-Id: devicetree@vger.kernel.org

Document Amazon's Annapurna Labs Fabric Interrupt Controller SoC binding.

Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 .../interrupt-controller/amazon,al-fic.txt         | 29 ++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
new file mode 100644
index 0000000..4e82fd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
@@ -0,0 +1,29 @@
+Amazon's Annapurna Labs Fabric Interrupt Controller
+
+Required properties:
+
+- compatible: should be "amazon,al-fic"
+- reg: physical base address and size of the registers
+- interrupt-controller: identifies the node as an interrupt controller
+- #interrupt-cells: must be 2.
+  First cell defines the index of the interrupt within the controller.
+  Second cell is used to specify the trigger type and must be one of the
+  following:
+    - bits[3:0] trigger type and level flags
+	1 = low-to-high edge triggered
+	4 = active high level-sensitive
+- interrupt-parent: specifies the parent interrupt controller.
+- interrupts: describes which input line in the interrupt parent, this
+  fic's output is connected to. This field property depends on the parent's
+  binding
+
+Example:
+
+amazon_fic: interrupt-controller@0xfd8a8500 {
+	compatible = "amazon,al-fic";
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	reg = <0x0 0xfd8a8500 0x0 0x1000>;
+	interrupt-parent = <&gic>;
+	interrupts = <GIC_SPI 0x0 IRQ_TYPE_LEVEL_HIGH>;
+};
-- 
2.7.4
