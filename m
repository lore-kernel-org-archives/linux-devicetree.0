From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Subject: [PATCH v7 1/2] mtd: nand: add tango NFC dt bindings doc
Date: Tue, 25 Oct 2016 15:15:50 +0200
Message-ID: <580F5B06.6030608@sigmadesigns.com>
References: <580F5AD2.9020909@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <580F5AD2.9020909@sigmadesigns.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: linux-mtd <linux-mtd@lists.infradead.org>, Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger <richard@nod.at>
Cc: Mark Rutland <mark.rutland@arm.com>, DT <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Sebastian Frias <sf84@laposte.net>, Mason <slash.tmp@free.fr>
List-Id: devicetree@vger.kernel.org

Add the tango NAND Flash Controller dt bindings documentation.

Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
---
 Documentation/devicetree/bindings/mtd/tango-nand.txt | 38 ++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/tango-nand.txt b/Documentation/devicetree/bindings/mtd/tango-nand.txt
new file mode 100644
index 000000000000..3cbf95d6595a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/tango-nand.txt
@@ -0,0 +1,38 @@
+Sigma Designs Tango4 NAND Flash Controller (NFC)
+
+Required properties:
+
+- compatible: "sigma,smp8758-nand"
+- reg: address/size of nfc_reg, nfc_mem, and pbus_reg
+- dmas: reference to the DMA channel used by the controller
+- dma-names: "nfc_sbox"
+- clocks: reference to the system clock
+- #address-cells: <1>
+- #size-cells: <0>
+
+Children nodes represent the available NAND chips.
+See Documentation/devicetree/bindings/mtd/nand.txt for generic bindings.
+
+Example:
+
+	nand: nand@2c000 {
+		compatible = "sigma,smp8758-nand";
+		reg = <0x2c000 0x30 0x2d000 0x800 0x20000 0x1000>;
+		dmas = <&dma0 3>;
+		dma-names = "nfc_sbox";
+		clocks = <&clkgen SYS_CLK>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand@0 {
+			reg = <0>; /* CS0 */
+			nand-ecc-strength = <14>;
+			nand-ecc-step-size = <1024>;
+		};
+
+		nand@1 {
+			reg = <1>; /* CS1 */
+			nand-ecc-strength = <14>;
+			nand-ecc-step-size = <1024>;
+		};
+	};
-- 
2.9.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
