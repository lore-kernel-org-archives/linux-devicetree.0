From: Piotr Sroka <piotrs@cadence.com>
Subject: [PATCH 2/2] dt-bindings: nand: Add Cadence NAND controller driver
Date: Tue, 29 Jan 2019 16:10:40 +0000
Message-ID: <20190129161040.20299-1-piotrs@cadence.com>
References: <20190129160337.24350-1-piotrs@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129160337.24350-1-piotrs@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: David Woodhouse <dwmw2@infradead.org>, BrianNorris <computersforpeace@gmail.com>, Boris Brezillon <bbrezillon@kernel.org>, Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, Piotr Sroka <piotrs@cadence.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Piotr Sroka <piotrs@cadence.com>
---
 .../devicetree/bindings/mtd/cadence-nand.txt       | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/cadence-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/cadence-nand.txt b/Documentation/devicetree/bindings/mtd/cadence-nand.txt
new file mode 100644
index 000000000000..82afa34d5652
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cadence-nand.txt
@@ -0,0 +1,35 @@
+* Cadence NAND controller
+
+Required properties:
+  - compatible : "cdns,hpnfc-nand"
+  - reg : Contains two entries, each of which is a tuple consisting of a
+	  physical address and length. The first entry is the address and
+	  length of the controller register set. The second entry is the
+	  address and length of the Slave DMA data port.
+  - interrupts : The interrupt number.
+  - clocks: phandle of the controller core clock (nf_clk).
+
+Optional properties:
+Driver calculates controller timings base on NAND flash memory timings and
+the following delays in picoseconds.
+  - cdns,if-skew : Skew value of the output signals of the NAND Flash interface
+  - cdns,nand2-delay : Delay value of one NAND2 gate from which
+    the delay element is build
+  - cdns,board-delay : Estimated Board delay. The value includes the total
+    round trip delay for the signals and is used for deciding on values
+    associated with data read capture. The example formula for SDR mode is
+    the following:
+    board_delay = RE#PAD_delay + PCB trace to device + PCB trace from device
+    + DQ PAD delay
+
+Example
+
+nand: nand@60000000 {
+	  compatible = "cdns,hpnfc-nand";
+	  reg = <0x60000000 0x10000>, <0x80000000 0x10000>;
+	  clocks = <&nf_clk>;
+	  cdns,if-skew = <50>;
+	  cdns,nand2-delay = <37>;
+	  cdns,board-delay = <4830>;
+	  interrupts = <2 0>;
+};
-- 
2.15.0
