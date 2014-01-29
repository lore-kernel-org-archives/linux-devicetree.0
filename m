From: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH v2 09/14] mtd: nand: add sunxi NFC dt
 bindings doc
Date: Wed, 29 Jan 2014 15:34:19 +0100
Message-ID: <1391006064-28890-10-git-send-email-b.brezillon.dev@gmail.com>
References: <1391006064-28890-1-git-send-email-b.brezillon.dev@gmail.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBDE6NB73YAMBBDNDUSLQKGQES4NGCKI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1391006064-28890-1-git-send-email-b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dev-3kdeTeqwOZ9EV1b7eY7vFQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add the sunxi NAND Flash Controller dt bindings documentation.

Signed-off-by: Boris BREZILLON <b.brezillon.dev-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 .../devicetree/bindings/mtd/sunxi-nand.txt         |   46 ++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/sunxi-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/sunxi-nand.txt b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
new file mode 100644
index 0000000..b0e55a3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/sunxi-nand.txt
@@ -0,0 +1,46 @@
+Allwinner NAND Flash Controller (NFC)
+
+Required properties:
+- compatible : "allwinner,sun4i-nand".
+- reg : shall contain registers location and length for data and reg.
+- interrupts : shall define the nand controller interrupt.
+- #address-cells: shall be set to 1. Encode the nand CS.
+- #size-cells : shall be set to 0.
+- clocks : shall reference nand controller clocks.
+- clock-names : nand controller internal clock names. Shall contain :
+    * "ahb_clk" : AHB gating clock
+    * "sclk" : nand controller clock
+
+Optional children nodes:
+Children nodes represent the available nand chips.
+
+Optional properties:
+- onfi,nand-timing-mode : mandatory if the chip does not support the ONFI
+  standard.
+- allwinner,rb : shall contain the native Ready/Busy ids.
+ or
+- rb-gpios : shall contain the gpios used as R/B pins.
+
+see Documentation/devicetree/mtd/nand.txt for generic bindings.
+
+
+Examples:
+nfc: nand@01c03000 {
+	compatible = "allwinner,sun4i-nand";
+	reg = <0x01c03000 0x1000>;
+	interrupts = <0 37 1>;
+	clocks = <&ahb_gates 13>, <&nand_clk>;
+	clock-names = "ahb_clk", "sclk";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&nand_pins_a &nand_cs0_pins_a &nand_rb0_pins_a>;
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+		allwinner,rb = <0>;
+		nand-ecc-mode = "soft_bch";
+		onfi,nand-timing-mode = <4>;
+	};
+};
-- 
1.7.9.5
