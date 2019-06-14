From: Piotr Sroka <piotrs@cadence.com>
Subject: [v3 2/2] dt-bindings: nand: Add Cadence NAND controller driver
Date: Fri, 14 Jun 2019 16:13:01 +0100
Message-ID: <20190614151301.5371-1-piotrs@cadence.com>
References: <20190614150956.31244-1-piotrs@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614150956.31244-1-piotrs@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, BrianNorris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Piotr Sroka <piotrs@cadence.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Piotr Sroka <piotrs@cadence.com>
---
Changes for v3:
- add unit suffix for board_delay 
- move child description to proper place
- remove prefix cadence_ for reg and sdma fields
Changes for v2:
- remove chip dependends parameters from dts bindings
- add names for register ranges in dts bindings
- add generic bindings to describe NAND chip representation
---
 .../bindings/mtd/cadence-nand-controller.txt       | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
new file mode 100644
index 000000000000..e485b87075bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
@@ -0,0 +1,51 @@
+* Cadence NAND controller
+
+Required properties:
+  - compatible : "cdns,hpnfc"
+  - reg : Contains two entries, each of which is a tuple consisting of a
+	  physical address and length. The first entry is the address and
+	  length of the controller register set. The second entry is the
+	  address and length of the Slave DMA data port.
+  - reg-names: should contain "reg" and "sdma"
+  - interrupts : The interrupt number.
+  - clocks: phandle of the controller core clock (nf_clk).
+
+Optional properties:
+  - dmas: shall reference DMA channel associated to the NAND controller
+  - cdns,board-delay_ps : Estimated Board delay. The value includes the total
+    round trip delay for the signals and is used for deciding on values
+    associated with data read capture. The example formula for SDR mode is
+    the following:
+    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
+    + DQ PAD delay
+
+Children nodes represent the available NAND chips.
+
+Required properties of NAND chips:
+  - reg: shall contain the native Chip Select ids from 0 to max supported by
+    the cadence nand flash controller
+
+
+See Documentation/devicetree/bindings/mtd/nand.txt for more details on
+generic bindings.
+
+Example:
+
+nand_controller: nand-controller @60000000 {
+
+	  compatible = "cdns,hpnfc";
+	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
+	  reg-names = "reg", "sdma";
+	  clocks = <&nf_clk>;
+	  cdns,board-delay_ps = <4830>;
+	  interrupts = <2 0>;
+	  nand@0 {
+	      reg = <0>;
+	      label = "nand-1";
+	  };
+	  nand@1 {
+	      reg = <1>;
+	      label = "nand-2";
+	  };
+
+};
-- 
2.15.0
