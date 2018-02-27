From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 1/2] dt-bindings: soc: Add ZynqMP PM bindings
Date: Tue, 27 Feb 2018 15:24:25 -0800
Message-ID: <1519773866-18196-2-git-send-email-jollys@xilinx.com>
References: <1519773866-18196-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1519773866-18196-1-git-send-email-jollys@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthias.bgg@gmail.com, andy.gross@linaro.org, shawnguo@kernel.org, geert+renesas@glider.be, bjorn.andersson@linaro.org, sean.wang@mediatek.com, m.szyprowski@samsung.com, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add documentation to describe Xilinx ZynqMP power management
bindings.

Signed-off-by: Jolly Shah <jollys@xilinx.com>
Signed-off-by: Rajan Vaja <rajanv@xilinx.com>
---
 .../bindings/soc/xilinx/xlnx,zynqmp-power.txt      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt

diff --git a/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt
new file mode 100644
index 0000000..5b7d963
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/xilinx/xlnx,zynqmp-power.txt
@@ -0,0 +1,28 @@
+Xilinx Zynq MPSoC Power Management Device Tree Bindings
+
+The zynqmp-power node describes the power management configurations.
+
+Required properties:
+ - compatible	: Must contain:  "xlnx,zynqmp-power"
+ - mbox-names	: Name given to channels seen in the 'mboxes' property.
+		  "rx" - Mailbox corresponding to receive path
+		  "tx" - Mailbox corresponding to transmit path
+ - mboxes	: Standard property to specify a Mailbox. Each value of
+		  the mboxes property should contain a phandle to the
+		  mailbox controller device node and an args specifier
+		  that will be the phandle to the intended sub-mailbox
+		  child node to be used for communication. See
+		  Documentation/devicetree/bindings/mailbox/mailbox.txt
+		  for more details about the generic mailbox controller
+		  and client driver bindings. Also see
+		  Documentation/devicetree/bindings/mailbox/ \
+		  xlnx,zynqmp-ipi-mailbox.txt for typical controller that
+		  is used to communicate with this System controllers.
+
+Examples:
+	zynqmp_power: zynqmp-power {
+		compatible = "xlnx,zynqmp-power";
+		mboxes = <&ipi_mailbox_pmu0 0>,
+			 <&ipi_mailbox_pmu0 1>;
+		mbox-names = "tx", "rx";
+	};
-- 
2.7.4
