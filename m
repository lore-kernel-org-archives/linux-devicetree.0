From: vincent.cheng.xh@renesas.com
Subject: [PATCH v2 1/2] dt-bindings: ptp: Add bindings doc for IDT ClockMatrix based PTP clock
Date: Thu, 26 Sep 2019 23:48:47 -0400
Message-ID: <1569556128-22212-1-git-send-email-vincent.cheng.xh@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, richardcochran@gmail.com
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, andrew@lunn.ch, Vincent Cheng <vincent.cheng.xh@renesas.com>
List-Id: devicetree@vger.kernel.org

From: Vincent Cheng <vincent.cheng.xh@renesas.com>

Add device tree binding doc for the IDT ClockMatrix PTP clock driver.

Co-developed-by: Richard Cochran <richardcochran@gmail.com>
Signed-off-by: Richard Cochran <richardcochran@gmail.com>
Signed-off-by: Vincent Cheng <vincent.cheng.xh@renesas.com>
---

Changes since v1:
 - No changes
---
 Documentation/devicetree/bindings/ptp/ptp-idtcm.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/ptp/ptp-idtcm.txt

diff --git a/Documentation/devicetree/bindings/ptp/ptp-idtcm.txt b/Documentation/devicetree/bindings/ptp/ptp-idtcm.txt
new file mode 100644
index 0000000..4eaa34d
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/ptp-idtcm.txt
@@ -0,0 +1,15 @@
+* IDT ClockMatrix (TM) PTP clock
+
+Required properties:
+
+  - compatible  Should be "idt,8a3400x-ptp" for System Synchronizer
+                Should be "idt,8a3401x-ptp" for Port Synchronizer
+                Should be "idt,8a3404x-ptp" for Universal Frequency Translator (UFT)
+  - reg         I2C slave address of the device
+
+Example:
+
+	phc@5b {
+		compatible = "idt,8a3400x-ptp";
+		reg = <0x5b>;
+	};
-- 
2.7.4
