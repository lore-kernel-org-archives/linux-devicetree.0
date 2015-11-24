From: "Simon Arlott" <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
Subject: [PATCH (v6) 1/2] mtd: brcmnand: Add brcm,bcm63268-nand device tree
 binding
Date: Tue, 24 Nov 2015 20:19:37 -0000
Message-ID: <afc6fb02d51a5378e315ade84a134eaf7a58a94f@8b5064a13e22126c1b9329f0dc35b8915774b7c3.invalid>
References: <56506D55.3000907@simon.arlott.org.uk>
    <20151122215945.GA5930@rob-hp-laptop>
    <56523E85.905@simon.arlott.org.uk>
    <56523EFF.9050502@simon.arlott.org.uk> <56535977.9050201@gmail.com>
    <56541BD3.4070202@simon.arlott.org.uk> <5654AF69.7040901@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5654AF69.7040901-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add device tree binding for NAND on the BCM63268.

The BCM63268 has a NAND interrupt register with combined status and enable
registers.

Signed-off-by: Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>
---
 .../devicetree/bindings/mtd/brcm,brcmnand.txt      | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
index 4ff7128..f2a71c8 100644
--- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
+++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.txt
@@ -72,6 +72,14 @@ we define additional 'compatible' properties and associated register resources w
        and enable registers
      - reg-names: (required) "nand-int-base"

+   * "brcm,nand-bcm63268"
+     - compatible: should contain "brcm,nand-bcm<soc>", "brcm,nand-bcm63268"
+     - reg: (required) the 'NAND_INTR_BASE' register range, with combined status
+       and enable registers, and boot address registers
+     - reg-names: (required) "nand-intr-base"
+     - clock: (required) reference to the clock for the NAND controller
+     - clock-names: (required) "nand"
+
    * "brcm,nand-iproc"
      - reg: (required) the "IDM" register range, for interrupt enable and APB
        bus access endianness configuration, and the "EXT" register range,
@@ -148,3 +156,30 @@ nand@f0442800 {
 		};
 	};
 };
+
+nand@10000200 {
+	compatible = "brcm,nand-bcm63168", "brcm,nand-bcm63268",
+		"brcm,brcmnand-v4.0", "brcm,brcmnand";
+	reg = <0x10000200 0x180>,
+	      <0x10000600 0x200>,
+	      <0x100000b0 0x10>;
+	reg-names = "nand", "nand-cache", "nand-intr-base";
+	interrupt-parent = <&periph_intc>;
+	interrupts = <50>;
+	clocks = <&periph_clk 20>;
+	clock-names = "nand";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	nand0: nandcs@0 {
+		compatible = "brcm,nandcs";
+		reg = <0>;
+		nand-on-flash-bbt;
+		nand-ecc-strength = <1>;
+		nand-ecc-step-size = <512>;
+
+		#address-cells = <0>;
+		#size-cells = <0>;
+	};
+};
-- 
2.1.4

-- 
Simon Arlott
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
