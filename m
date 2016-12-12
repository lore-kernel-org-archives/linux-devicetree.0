From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
Subject: [PATCH v4 3/4] mtd: spi-nor: bindings for the Aspeed memory controllers
Date: Mon, 12 Dec 2016 16:40:51 +0100
Message-ID: <1481557252-13656-4-git-send-email-clg@kaod.org>
References: <1481557252-13656-1-git-send-email-clg@kaod.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1481557252-13656-1-git-send-email-clg-Bxea+6Xhats@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg-Bxea+6Xhats@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Cédric Le Goater <clg-Bxea+6Xhats@public.gmane.org>
---
 .../devicetree/bindings/mtd/aspeed-smc.txt         | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/aspeed-smc.txt

diff --git a/Documentation/devicetree/bindings/mtd/aspeed-smc.txt b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
new file mode 100644
index 000000000000..49f6528ef547
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/aspeed-smc.txt
@@ -0,0 +1,51 @@
+* Aspeed Firmware Memory controller
+* Aspeed SPI Flash Memory Controller
+
+The Firmware Memory Controller in the Aspeed AST2500 SoC supports
+three chip selects, two of which are always of SPI type and the third
+can be SPI or NOR type flash. These bindings only describe SPI.
+
+The two SPI flash memory controllers in the AST2500 each support two
+chip selects.
+
+Required properties:
+  - compatible : Should be one of
+	"aspeed,ast2400-fmc" for the AST2400 Firmware Memory Controller
+	"aspeed,ast2400-spi" for the AST2400 SPI Flash memory Controller
+	"aspeed,ast2500-fmc" for the AST2500 Firmware Memory Controller
+	"aspeed,ast2500-spi" for the AST2500 SPI flash memory controllers
+
+  - reg : the first contains the control register location and length,
+          the second contains the memory window mapping address and length
+  - #address-cells : must be 1 corresponding to chip select child binding
+  - #size-cells : must be 0 corresponding to chip select child binding
+
+Optional properties:
+  - interrupts : Should contain the interrupt for the dma device if an
+    FMC
+
+The child nodes are the SPI flash modules which must have a compatible
+property as specified in bindings/mtd/jedec,spi-nor.txt
+
+Optionally, the child node can contain properties for SPI mode (may be
+ignored):
+  - spi-max-frequency - max frequency of spi bus
+
+
+Example:
+fmc: fmc@1e620000 {
+	compatible = "aspeed,ast2500-fmc";
+	reg = < 0x1e620000 0x94
+		0x20000000 0x02000000 >;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	interrupts = <19>;
+	flash@0 {
+		reg = < 0 >;
+		compatible = "jedec,spi-nor";
+		/* spi-max-frequency = <>; */
+		/* m25p,fast-read; */
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+};
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
