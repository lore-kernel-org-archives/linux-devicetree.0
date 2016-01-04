From: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v11 1/3] dt-bindings: binding for jz4780-{nand,bch}
Date: Mon, 4 Jan 2016 12:34:42 +0000
Message-ID: <1451910884-18710-2-git-send-email-harvey.hunt@imgtec.com>
References: <1451910884-18710-1-git-send-email-harvey.hunt@imgtec.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1451910884-18710-1-git-send-email-harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org, Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>

Add DT bindings for NAND devices connected to the NEMC on JZ4780 SoCs,
as well as the hardware BCH controller, used by the jz4780_{nand,bch}
drivers.

Signed-off-by: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Signed-off-by: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Reviewed-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
v10 -> v11:
 - Added Boris Brezillon's Reviewed-By.

v9 -> v10:
 - Added Rob Herring's Acked-by.

v8 -> v9:
 - Document that partitions are represented as a child node of a NAND chip.

v7 -> v8:
 - Describe how NAND chips are now child nodes of the NAND controller.

v6 -> v7:
 - Add nand-ecc-mode to DT bindings.
 - Add nand-on-flash-bbt to DT bindings.

v5 -> v6:
 - No change.

v4 -> v5:
 - Rename ingenic,bch-device to ingenic,bch-controller to fit with
   existing convention.

v3 -> v4:
 - No change

v2 -> v3:
 - Rebase to 4.0-rc6
 - Changed ingenic,ecc-size to common nand-ecc-step-size
 - Changed ingenic,ecc-strength to common nand-ecc-strength
 - Changed ingenic,busy-gpio to common rb-gpios
 - Changed ingenic,wp-gpio to common wp-gpios

v1 -> v2:
 - Rebase to 4.0-rc3

 .../bindings/mtd/ingenic,jz4780-nand.txt           | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
new file mode 100644
index 0000000..29ea585
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -0,0 +1,86 @@
+* Ingenic JZ4780 NAND/BCH
+
+This file documents the device tree bindings for NAND flash devices on the
+JZ4780. NAND devices are connected to the NEMC controller (described in
+memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
+be children of the NEMC node.
+
+Required NAND controller device properties:
+- compatible: Should be set to "ingenic,jz4780-nand".
+- reg: For each bank with a NAND chip attached, should specify a bank number,
+  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
+
+Optional NAND controller device properties:
+- ingenic,bch-controller: To make use of the hardware BCH controller, this
+  property must contain a phandle for the BCH controller node. The required
+  properties for this node are described below. If this is not specified,
+  software BCH will be used instead.
+
+Optional children nodes:
+- Individual NAND chips are children of the NAND controller node.
+
+Required children node properties:
+- reg: An integer ranging from 1 to 6 representing the CS line to use.
+
+Optional children node properties:
+- nand-ecc-step-size: ECC block size in bytes.
+- nand-ecc-strength: ECC strength (max number of correctable bits).
+- nand-ecc-mode: String, operation mode of the NAND ecc mode. "hw" by default
+- nand-on-flash-bbt: boolean to enable on flash bbt option, if not present false
+- rb-gpios: GPIO specifier for the busy pin.
+- wp-gpios: GPIO specifier for the write protect pin.
+
+Optional child node of NAND chip nodes:
+- partitions: see Documentation/devicetree/bindings/mtd/partition.txt
+
+Example:
+
+nemc: nemc@13410000 {
+	...
+
+	nandc: nand-controller@1 {
+		compatible = "ingenic,jz4780-nand";
+		reg = <1 0 0x1000000>;	/* Bank 1 */
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ingenic,bch-controller = <&bch>;
+
+		nand@1 {
+			reg = <1>;
+
+			nand-ecc-step-size = <1024>;
+			nand-ecc-strength = <24>;
+			nand-ecc-mode = "hw";
+			nand-on-flash-bbt;
+
+			rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
+			wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
+
+			partitions {
+				#address-cells = <2>;
+				#size-cells = <2>;
+				...
+			}
+		};
+	};
+};
+
+The BCH controller is a separate SoC component used for error correction on
+NAND devices. The following is a description of the device properties for a
+BCH controller.
+
+Required BCH properties:
+- compatible: Should be set to "ingenic,jz4780-bch".
+- reg: Should specify the BCH controller registers location and length.
+- clocks: Clock for the BCH controller.
+
+Example:
+
+bch: bch@134d0000 {
+	compatible = "ingenic,jz4780-bch";
+	reg = <0x134d0000 0x10000>;
+
+	clocks = <&cgu JZ4780_CLK_BCH>;
+};
-- 
2.6.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
