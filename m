From: Piotr Sroka <piotrs@cadence.com>
Subject: [v8 2/2] dt-bindings: mtd: Add Cadence NAND controller driver
Date: Thu, 26 Sep 2019 09:13:21 +0100
Message-ID: <20190926081358.24212-1-piotrs@cadence.com>
References: <20190926080924.19220-1-piotrs@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926080924.19220-1-piotrs@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: Kazuhiro Kasai <kasai.kazuhiro@socionext.com>, Piotr Sroka <piotrs@cadence.com>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, "Paul E. McKenney" <paulmck@linux.ibm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Document the bindings used by Cadence NAND controller driver

Signed-off-by: Piotr Sroka <piotrs@cadence.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes for v8:
- none
Changes for v7:
- none
Changes for v6:
- add documentation for address-cells and size-cells
- remove not needed space
- put myself as maintainer of the Cadence nand driver bindings
Changes for v5:
- replace "_" by "-" in all properties
- change compatible name from cdns,hpnfc to cdns,hp-nfc
Changes for v4:
- add commit message
Changes for v3:
- add unit suffix for board_delay 
- move child description to proper place
- remove prefix cadence_ for reg and sdma fields
Changes for v2:
- remove chip dependends parameters from dts bindings
- add names for register ranges in dts bindings
- add generic bindings to describe NAND chip representation
---
 .../bindings/mtd/cadence-nand-controller.txt       | 53 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
new file mode 100644
index 000000000000..f3893c4d3c6a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
@@ -0,0 +1,53 @@
+* Cadence NAND controller
+
+Required properties:
+  - compatible : "cdns,hp-nfc"
+  - reg : Contains two entries, each of which is a tuple consisting of a
+	  physical address and length. The first entry is the address and
+	  length of the controller register set. The second entry is the
+	  address and length of the Slave DMA data port.
+  - reg-names: should contain "reg" and "sdma"
+  - #address-cells: should be 1. The cell encodes the chip select connection.
+  - #size-cells : should be 0.
+  - interrupts : The interrupt number.
+  - clocks: phandle of the controller core clock (nf_clk).
+
+Optional properties:
+  - dmas: shall reference DMA channel associated to the NAND controller
+  - cdns,board-delay-ps : Estimated Board delay. The value includes the total
+    round trip delay for the signals and is used for deciding on values
+    associated with data read capture. The example formula for SDR mode is
+    the following:
+    board delay = RE#PAD delay + PCB trace to device + PCB trace from device
+    + DQ PAD delay
+
+Child nodes represent the available NAND chips.
+
+Required properties of NAND chips:
+  - reg: shall contain the native Chip Select ids from 0 to max supported by
+    the cadence nand flash controller
+
+See Documentation/devicetree/bindings/mtd/nand.txt for more details on
+generic bindings.
+
+Example:
+
+nand_controller: nand-controller@60000000 {
+	  compatible = "cdns,hp-nfc";
+	  #address-cells = <1>;
+	  #size-cells = <0>;
+	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
+	  reg-names = "reg", "sdma";
+	  clocks = <&nf_clk>;
+	  cdns,board-delay-ps = <4830>;
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
diff --git a/MAINTAINERS b/MAINTAINERS
index 16e16445b88b..94d78f4e29ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3584,6 +3584,7 @@ M:	Piotr Sroka <piotrs@cadence.com>
 L:	linux-mtd@lists.infradead.org
 S:	Maintained
 F:	drivers/mtd/nand/raw/cadence-nand-controller.c
+F:	Documentation/devicetree/bindings/mtd/cadence-nand-controller.txt
 
 CADET FM/AM RADIO RECEIVER DRIVER
 M:	Hans Verkuil <hverkuil@xs4all.nl>
-- 
2.15.0
