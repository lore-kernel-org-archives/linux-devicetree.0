From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 03/17] dt-bindings: Add PLX Technology RPS IRQ Controller bindings
Date: Thu,  3 Mar 2016 12:39:56 +0100
Message-ID: <1457005210-18485-4-git-send-email-narmstrong@baylibre.com>
References: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457005210-18485-1-git-send-email-narmstrong@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Neil Armstrong <narmstrong@baylibre.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../bindings/interrupt-controller/plxtech,rps-irq.txt   | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/plxtech,rps-irq.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/plxtech,rps-irq.txt b/Documentation/devicetree/bindings/interrupt-controller/plxtech,rps-irq.txt
new file mode 100644
index 0000000..db117a0
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/plxtech,rps-irq.txt
@@ -0,0 +1,17 @@
+PLX Technology OXNAS SoCs Family RPS Interrupt Controller
+=========================================================
+
+Required properties:
+- compatible: Should be "plxtech,nas782x-rps"
+- reg : Specifies base physical address and size of the registers.
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Should be 1
+
+example:
+
+intc: interrupt-controller@0 {
+	compatible = "plxtech,nas782x-rps";
+	interrupt-controller;
+	reg = <0 0x200>;
+	#interrupt-cells = <1>;
+};
-- 
1.9.1
