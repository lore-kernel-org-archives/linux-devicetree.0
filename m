From: Talel Shenhar <talel@amazon.com>
Subject: [PATCH 1/1] dt-bindings: interrupt-controller: al-fic: remove redundant binding
Date: Thu, 11 Jul 2019 09:38:59 +0300
Message-ID: <1562827139-1666-1-git-send-email-talel@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, marc.zyngier@arm.com, tglx@linutronix.de, jason@lakedaemon.net, mark.rutland@arm.com, nicolas.ferre@microchip.com, mchehab+samsung@kernel.org, shawn.lin@rock-chips.com, gregkh@linuxfoundation.org, dwmw@amazon.co.uk, benh@kernel.crashing.org, talel@amazon.com, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Remove dt binding description for standard binding.

Signed-off-by: Talel Shenhar <talel@amazon.com>
---
 .../bindings/interrupt-controller/amazon,al-fic.txt      | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
index 4e82fd5..c676b03 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/amazon,al-fic.txt
@@ -5,21 +5,19 @@ Required properties:
 - compatible: should be "amazon,al-fic"
 - reg: physical base address and size of the registers
 - interrupt-controller: identifies the node as an interrupt controller
-- #interrupt-cells: must be 2.
-  First cell defines the index of the interrupt within the controller.
-  Second cell is used to specify the trigger type and must be one of the
-  following:
-    - bits[3:0] trigger type and level flags
-	1 = low-to-high edge triggered
-	4 = active high level-sensitive
-- interrupt-parent: specifies the parent interrupt controller.
+- #interrupt-cells : must be 2. Specifies the number of cells needed to encode
+  an interrupt source. Supported trigger types are low-to-high edge
+  triggered and active high level-sensitive.
 - interrupts: describes which input line in the interrupt parent, this
   fic's output is connected to. This field property depends on the parent's
   binding
 
+Please refer to interrupts.txt in this directory for details of the common
+Interrupt Controllers bindings used by client devices.
+
 Example:
 
-amazon_fic: interrupt-controller@0xfd8a8500 {
+amazon_fic: interrupt-controller@fd8a8500 {
 	compatible = "amazon,al-fic";
 	interrupt-controller;
 	#interrupt-cells = <2>;
-- 
2.7.4
