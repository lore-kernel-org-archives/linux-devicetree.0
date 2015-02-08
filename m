From: Rabin Vincent <rabin@rab.in>
Subject: [PATCH 3/4] CRIS: document CRISv32 intc bindings
Date: Sun,  8 Feb 2015 16:35:44 +0100
Message-ID: <1423409745-2230-3-git-send-email-rabin@rab.in>
References: <1423409745-2230-1-git-send-email-rabin@rab.in>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423409745-2230-1-git-send-email-rabin@rab.in>
Sender: linux-kernel-owner@vger.kernel.org
To: jesper.nilsson@axis.com
Cc: linux-cris-kernel@axis.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rabin Vincent <rabin@rab.in>
List-Id: devicetree@vger.kernel.org

Add the DT bindings documentation for the CRISV32 interrupt controller.

Signed-off-by: Rabin Vincent <rabin@rab.in>
---
 .../interrupt-controller/axis,crisv32-intc.txt         | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/axis,crisv32-intc.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/axis,crisv32-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/axis,crisv32-intc.txt
new file mode 100644
index 0000000..3726f14
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/axis,crisv32-intc.txt
@@ -0,0 +1,18 @@
+Axis CRISv32 interrupt controller
+
+Required properties:
+- compatible: Compatible property value should be "axis,cris32-intc"
+
+- reg: Physical base address of the controller and length of memory mapped
+       region.
+
+- interrupt-controller : Identifies the node as an interrupt controller
+
+Example:
+
+interrupt-controller {
+	compatible = "axis,crisv32-intc";
+	interrupt-controller;
+	reg = <0xb001c000 0x1000>;
+	#interrupt-cells = <1>;
+};
-- 
2.1.4
