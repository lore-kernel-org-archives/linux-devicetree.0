From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH v3 06/10] spmi: document the PMIC arbiter SPMI bindings
Date: Mon, 28 Oct 2013 13:12:35 -0500
Message-ID: <043d714725f8b6df1873047164d2d0e78778138b.1382985169.git.joshc@codeaurora.org>
References: <cover.1382985169.git.joshc@codeaurora.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <cover.1382985169.git.joshc@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, Sagar Dharia <sdharia@codeaurora.org>, Gilad Avidov <gavidov@codeaurora.org>, Michael Bohan <mbohan@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 .../bindings/spmi/qcom,spmi-pmic-arb.txt           | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
new file mode 100644
index 0000000..68949aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
@@ -0,0 +1,42 @@
+Qualcomm SPMI Controller (PMIC Arbiter)
+
+The SPMI PMIC Arbiter is found on the Snapdragon 800 Series.  It is an SPMI
+controller with wrapping arbitration logic to allow for multiple on-chip
+devices to control a single SPMI master.
+
+The PMIC Arbiter can also act as an interrupt controller, providing interrupts
+to slave devices.
+
+See spmi.txt for the generic SPMI controller binding requirements for child
+nodes.
+
+Required properties:
+- compatible : should be "qcom,spmi-pmic-arb".
+- reg-names  : should be "core", "intr", "cnfg"
+- reg : offset and length of the PMIC Arbiter Core register map.
+- reg : offset and length of the PMIC Arbiter Interrupt controller register map.
+- reg : offset and length of the PMIC Arbiter Configuration register map.
+- #address-cells : must be set to 1
+- #size-cells : must be set to 0
+- interrupt-controller : indicates the PMIC arbiter is an interrupt controller
+- #interrupt-cells = <4>:  interrupts are specified as a 4-tuple:
+    cell 1: slave ID for the requested interrupt (0-15)
+    cell 2: peripheral ID for requested interrupt (0-255)
+    cell 3: the requested peripheral interrupt (0-7)
+    cell 4: interrupt flags indicating level-sense information, as defined in
+            dt-bindings/interrupt-controller/irq.h
+
+Example:
+
+	qcom,spmi@fc4c0000 {
+		compatible = "qcom,spmi-pmic-arb";
+		reg-names = "core", "intr", "cnfg";
+		reg = <0xfc4cf000 0x1000>,
+		      <0Xfc4cb000 0x1000>,
+		      <0Xfc4ca000 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		interrupt-controller;
+		#interrupt-cells = <4>;
+	};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
