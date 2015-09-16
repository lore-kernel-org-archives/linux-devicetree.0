From: Alex Smith <alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org>
Subject: [PATCH v6 2/4] dt-bindings: binding for jz4780-{nand,bch}
Date: Wed, 16 Sep 2015 12:36:55 +0100
Message-ID: <1442403417-5288-3-git-send-email-alex@alex-smith.me.uk>
References: <1442403417-5288-1-git-send-email-alex@alex-smith.me.uk>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1442403417-5288-1-git-send-email-alex-oucj9GSTHrKwpo/f3jThPQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Alex Smith <alex.smith-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, Zubair Lutfullah Kakakhel <Zubair.Kakakhel-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
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
---
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
---
 .../bindings/mtd/ingenic,jz4780-nand.txt           | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
new file mode 100644
index 0000000..568e502
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/ingenic,jz4780-nand.txt
@@ -0,0 +1,57 @@
+* Ingenic JZ4780 NAND/BCH
+
+This file documents the device tree bindings for NAND flash devices on the
+JZ4780. NAND devices are connected to the NEMC controller (described in
+memory-controllers/ingenic,jz4780-nemc.txt), and thus NAND device nodes must
+be children of the NEMC node.
+
+Required NAND device properties:
+- compatible: Should be set to "ingenic,jz4780-nand".
+- reg: For each bank with a NAND chip attached, should specify a bank number,
+  an offset of 0 and a size of 0x1000000 (i.e. the whole NEMC bank).
+
+Optional NAND device properties:
+- ingenic,bch-controller: To make use of the hardware BCH controller, this
+  property must contain a phandle for the BCH controller node. The required
+  properties for this node are described below. If this is not specified,
+  software BCH will be used instead.
+- nand-ecc-step-size: ECC block size in bytes.
+- nand-ecc-strength: ECC strength (max number of correctable bits).
+- rb-gpios: GPIO specifier for the busy pin.
+- wp-gpios: GPIO specifier for the write protect pin.
+
+Example:
+
+nemc: nemc@13410000 {
+	...
+
+	nand: nand@1 {
+		compatible = "ingenic,jz4780-nand";
+		reg = <1 0 0x1000000>;	/* Bank 1 */
+
+		ingenic,bch-controller = <&bch>;
+		nand-ecc-step-size = <1024>;
+		nand-ecc-strength = <24>;
+
+		rb-gpios = <&gpa 20 GPIO_ACTIVE_LOW>;
+		wp-gpios = <&gpf 22 GPIO_ACTIVE_LOW>;
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
2.5.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
