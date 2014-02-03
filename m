From: Josh Cartwright <joshc@codeaurora.org>
Subject: [PATCH v5 5/6] spmi: document the PMIC arbiter SPMI bindings
Date: Mon,  3 Feb 2014 17:05:37 -0600
Message-ID: <1391468739-20987-6-git-send-email-joshc@codeaurora.org>
References: <1391468739-20987-1-git-send-email-joshc@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1391468739-20987-1-git-send-email-joshc@codeaurora.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-arm-msm@vger.kernel.org, Gilad Avidov <gavidov@codeaurora.org>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Michael Bohan <mbohan@codeaurora.org>, Rob Landley <rob@landley.net>, Kumar Gala <galak@codeaurora.org>, Sagar Dharia <sdharia@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Josh Cartwright <joshc@codeaurora.org>
---
 .../bindings/spmi/qcom,spmi-pmic-arb.txt           | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt

diff --git a/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
new file mode 100644
index 0000000..a0a5759
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/qcom,spmi-pmic-arb.txt
@@ -0,0 +1,60 @@
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
+See Documentation/devicetree/bindings/interrupt-controller/interrupts.txt for
+generic interrupt controller binding documentation.
+
+Required properties:
+- compatible : should be "qcom,spmi-pmic-arb".
+- reg-names  : should be "core", "intr", "cnfg"
+- reg : register specifiers, must contain:
+     "core" - core registers
+     "intr" - interrupt controller registers
+     "cnfg" - configuration registers
+- #address-cells : must be set to 2
+- #size-cells : must be set to 0
+- qcom,ee : indicates the active Execution Environment identifier (0-5)
+- qcom,channel : which of the PMIC Arb provided channels to use for accesses (0-5)
+- interrupts : interrupt list for the PMIC Arb controller, must contain a
+               single interrupt entry for the peripheral interrupt
+- interrupt-names : corresponding interrupt names for the interrupts
+                    listed in the 'interrupts' property, must contain:
+     "periph_irq" - summary interrupt for PMIC peripherals
+- interrupt-controller : boolean indicator that the PMIC arbiter is an interrupt controller
+- #interrupt-cells :  must be set to 4. Interrupts are specified as a 4-tuple:
+    cell 1: slave ID for the requested interrupt (0-15)
+    cell 2: peripheral ID for requested interrupt (0-255)
+    cell 3: the requested peripheral interrupt (0-7)
+    cell 4: interrupt flags indicating level-sense information, as defined in
+            dt-bindings/interrupt-controller/irq.h
+
+Example:
+
+	spmi {
+		compatible = "qcom,spmi-pmic-arb";
+		reg-names = "core", "intr", "cnfg";
+		reg = <0xfc4cf000 0x1000>,
+		      <0xfc4cb000 0x1000>,
+		      <0xfc4ca000 0x1000>;
+
+		interrupt-names = "periph_irq";
+		interrupts = <0 190 0>;
+
+		qcom,ee = <0>;
+		qcom,channel = <0>;
+
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		interrupt-controller;
+		#interrupt-cells = <4>;
+	};
-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
