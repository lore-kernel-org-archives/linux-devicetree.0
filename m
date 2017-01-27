From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH RESEND 4/5] mtd: nand: atmel: Document the new DT bindings
Date: Fri, 27 Jan 2017 17:42:03 +0100
Message-ID: <1485535324-28393-5-git-send-email-boris.brezillon@free-electrons.com>
References: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1485535324-28393-1-git-send-email-boris.brezillon@free-electrons.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, dmaengine@vger.kernel.org, Nicolas Ferre <nicolas.ferre@atmel.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Wenyou Yang <wenyou.yang@atmel.com>, Josh Wu <rainyfeeling@outlook.com>, Haavard Skinnemoen <hskinnemoen@gmail.com>, Hans-Christian Egtvedt <egtvedt@samfundet.no>, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Cyrille Pitchen <cyrille.pitchen@atmel.com>, Brian Norris <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Document the new DT bindings for the Atmel NAND controller and
deprecate the old ones.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 .../devicetree/bindings/mtd/atmel-nand.txt         | 106 ++++++++++++++++++++-
 1 file changed, 105 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
index 3e7ee99d3949..2a86ef2332dc 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -1,4 +1,108 @@
-Atmel NAND flash
+Atmel NAND flash controller bindings
+
+The NAND flash controller node should be defined under the EBI bus (see
+Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt).
+One or several NAND devices can be defined under this NAND controller.
+The NAND controller might be connected to an ECC engine.
+
+* NAND controller bindings:
+
+Required properties:
+- compatible: should be one of the following
+	"atmel,at91rm9200-nand-controller"
+	"atmel,at91sam9261-nand-controller"
+	"atmel,at91sam9g45-nand-controller"
+	"atmel,sama5d3-nand-controller"
+- ranges: empty ranges property to forward EBI ranges definitions.
+- #address-cells: should be set to 2.
+- #size-cells: should be set to 1.
+- atmel,nfc-io: phandle to the NFC IO block. Only required for sama5d3
+		controllers.
+- atmel,nfc-sram: phandle to the NFC SRAM block. Only required for sama5d3
+		  controllers.
+
+Optional properties:
+- ecc-engine: phandle to the PMECC block. Only meaningful if the SoC embeds
+	      a PMECC engine.
+
+* NAND device/chip bindings:
+
+Required properties:
+- reg: describes the CS lines assigned to the NAND device. If the NAND device
+       exposes multiple CS lines (multi-dies chips), your reg property will
+       contain X tuples of 3 entries.
+       1st entry: the CS line this NAND chip is connected to
+       2nd entry: the base offset of the memory region assigned to this
+		  device (always 0)
+       3rd entry: the memory region size (always 0x800000)
+
+Optional properties:
+- rb-gpios: the GPIO(s) used to check the Ready/Busy status of the NAND.
+- cs-gpios: the GPIO(s) used to control the CS line.
+- det-gpios: the GPIO used to detect if a Smartmedia Card is present.
+- atmel,rb: an integer identifying the native Ready/Busy pin. Only meaningful
+	    on sama5 SoCs.
+
+All generic properties described in
+Documentation/devicetree/bindings/mtd/{common,nand}.txt also apply to the NAND
+device node, and NAND partitions should be defined under the NAND node as
+described in Documentation/devicetree/bindings/mtd/partition.txt.
+
+* ECC engine (PMECC) bindings:
+
+Required properties:
+- compatible: should be one of the following
+	"atmel,at91sam9g45-pmecc"
+	"atmel,sama5d4-pmecc"
+	"atmel,sama5d2-pmecc"
+- reg: should contain 2 register ranges. The first one is pointing to the PMECC
+       block, and the second one to the PMECC_ERRLOC block.
+
+Example:
+
+	pmecc: ecc-engine@ffffc070 {
+		compatible = "atmel,at91sam9g45-pmecc";
+                reg = <0xffffc070 0x490>,
+                      <0xffffc500 0x100>;
+	};
+
+	ebi: ebi@10000000 {
+		compatible = "atmel,sama5d3-ebi";
+		#address-cells = <2>;
+		#size-cells = <1>;
+		atmel,smc = <&hsmc>;
+		reg = <0x10000000 0x10000000
+		       0x40000000 0x30000000>;
+		ranges = <0x0 0x0 0x10000000 0x10000000
+			  0x1 0x0 0x40000000 0x10000000
+			  0x2 0x0 0x50000000 0x10000000
+			  0x3 0x0 0x60000000 0x10000000>;
+		clocks = <&mck>;
+
+                nand_controller: nand-controller {
+			compatible = "atmel,sama5d3-nand-controller";
+			atmel,nfc-sram = <&nfc_sram>;
+			atmel,nfc-io = <&nfc_io>;
+			ecc-engine = <&pmecc>;
+			#address-cells = <2>;
+			#size-cells = <1>;
+			ranges;
+
+			nand@3 {
+				reg = <0x3 0x0 0x800000>;
+				atmel,rb = <0>;
+
+				/*
+				 * Put generic NAND/MTD properties and
+				 * subnodes here.
+				 */
+			};
+		};
+	};
+
+-----------------------------------------------------------------------
+
+Deprecated bindings (should not be used in new device trees):
 
 Required properties:
 - compatible: The possible values are:
-- 
2.7.4
