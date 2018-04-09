From: Fabien Dessenne <fabien.dessenne@st.com>
Subject: [PATCH v3 1/2] dt-bindings: mailbox: add STMicroelectronics STM32
 IPCC binding
Date: Mon, 9 Apr 2018 12:28:25 +0200
Message-ID: <1523269706-23724-2-git-send-email-fabien.dessenne@st.com>
References: <1523269706-23724-1-git-send-email-fabien.dessenne@st.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1523269706-23724-1-git-send-email-fabien.dessenne@st.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jassi Brar <jassisinghbrar@gmail.com>, Ludovic
 Barre <ludovic.barre@st.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Arnaud Pouliquen <arnaud.pouliquen@st.com>, Loic Pallardy <loic.pallardy@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>
List-Id: devicetree@vger.kernel.org

Add a binding for the STMicroelectronics STM32 IPCC block exposing a
mailbox mechanism between two processors.

Signed-off-by: Fabien Dessenne <fabien.dessenne@st.com>
Signed-off-by: Ludovic Barre <ludovic.barre@st.com>
---
 .../devicetree/bindings/mailbox/stm32-ipcc.txt     | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt

diff --git a/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt b/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
new file mode 100644
index 0000000..1d2b7fe
--- /dev/null
+++ b/Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
@@ -0,0 +1,47 @@
+* STMicroelectronics STM32 IPCC (Inter-Processor Communication Controller)
+
+The IPCC block provides a non blocking signaling mechanism to post and
+retrieve messages in an atomic way between two processors.
+It provides the signaling for N bidirectionnal channels. The number of channels
+(N) can be read from a dedicated register.
+
+Required properties:
+- compatible:   Must be "st,stm32mp1-ipcc"
+- reg:          Register address range (base address and length)
+- st,proc-id:   Processor id using the mailbox (0 or 1)
+- clocks:       Input clock
+- interrupt-names: List of names for the interrupts described by the interrupt
+                   property. Must contain the following entries:
+                   - "rx"
+                   - "tx"
+                   - "wakeup"
+- interrupts:   Interrupt specifiers for "rx channel occupied", "tx channel
+                free" and "system wakeup".
+- #mbox-cells:  Number of cells required for the mailbox specifier. Must be 1.
+                The data contained in the mbox specifier of the "mboxes"
+                property in the client node is the mailbox channel index.
+
+Optional properties:
+- wakeup-source: Flag to indicate whether this device can wake up the system
+
+
+
+Example:
+	ipcc: mailbox@4c001000 {
+		compatible = "st,stm32mp1-ipcc";
+		#mbox-cells = <1>;
+		reg = <0x4c001000 0x400>;
+		st,proc-id = <0>;
+		interrupts-extended = <&intc GIC_SPI 100 IRQ_TYPE_NONE>,
+				      <&intc GIC_SPI 101 IRQ_TYPE_NONE>,
+				      <&aiec 62 1>;
+		interrupt-names = "rx", "tx", "wakeup";
+		clocks = <&rcc_clk IPCC>;
+		wakeup-source;
+	}
+
+Client:
+	mbox_test {
+		...
+		mboxes = <&ipcc 0>, <&ipcc 1>;
+	};
-- 
2.7.4
