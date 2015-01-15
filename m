From: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH v7 2/2] mtd: hisilicon: add device tree binding documentation
Date: Thu, 15 Jan 2015 17:10:31 +0800
Message-ID: <1421313031-118936-3-git-send-email-wangzhou1@hisilicon.com>
References: <1421313031-118936-1-git-send-email-wangzhou1@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421313031-118936-1-git-send-email-wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, caizhiyong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, yubingxu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch adds the related dts binding document for Hisilicon 504 NAND
controller.

Signed-off-by: Zhou Wang <wangzhou1-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 .../devicetree/bindings/mtd/hisi504-nand.txt       | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/hisi504-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
new file mode 100644
index 0000000..bee6a9f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
@@ -0,0 +1,48 @@
+Hisilicon Hip04 Soc NAND controller DT binding
+
+Required properties:
+
+- compatible:          Should be "hisilicon,504-nfc".
+- reg:                 The first contains base physical address and size of
+                       NAND controller's registers. The second contains base
+                       physical address and size of NAND controller's buffer.
+- interrupts:          Interrupt number for nfc.
+- nand-bus-width:      See nand.txt.
+- nand-ecc-mode:       Support none and hw ecc mode.
+- #address-cells:      Partition address, should be set 1.
+- #size-cells:         Partition size, should be set 1.
+
+Optional properties:
+
+- nand-ecc-strength:   Number of bits to correct per ECC step.
+- nand-ecc-step-size:  Number of data bytes covered by a single ECC step.
+
+The following ECC strength and step size are currently supported:
+
+ - nand-ecc-strength = <1>, nand-ecc-step-size = <512>
+ - nand-ecc-strength = <16>, nand-ecc-step-size = <1024>
+
+Flash chip may optionally contain additional sub-nodes describing partitions of
+the address space. See partition.txt for more detail.
+
+Example:
+
+	nand: nand@4020000 {
+		compatible = "hisilicon,504-nfc";
+		reg = <0x4020000 0x10000>, <0x5000000 0x1000>;
+		interrupts = <0 379 4>;
+		nand-bus-width = <8>;
+		nand-ecc-mode = "hw";
+		nand-ecc-strength = <16>;
+		nand-ecc-step-size = <1024>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		partition@0 {
+			label = "nand_text";
+			reg = <0x00000000 0x00400000>;
+		};
+
+		...
+
+	};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
