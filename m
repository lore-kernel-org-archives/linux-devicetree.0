From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH v8.1 1/6] dt-bindings: sram: describe option to reserve parts of the memory
Date: Wed, 26 Feb 2014 23:02:52 +0100
Message-ID: <2574291.evU61mFTUd@phil>
References: <21117503.1c6iOkvYSr@phil> <126672712.tufE5adZWC@phil> <201402251419.31151.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201402251419.31151.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some SoCs need parts of their sram for special purposes. So while being part
of the peripheral, it should not be part of the genpool controlling the sram.

Therefore add the option to define reserved regions as subnodes of the
sram-node similar to defining reserved global memory regions.

Originally
Suggested-by: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Using subnodes for reserved regions
Suggested-by: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Tested-by: Ulrich Prinz <ulrich.prinz-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
Hi Arnd,

I've changed the range definition as suggested. I've also changed my
rockchip dt-files accordingly, but will wait with respinning the whole
series until the direction with this binding is a bit safer.

I've also amended the "compatible"-property for the subnodes. It now
mimics the text from the generic reserved memory nodes [0],
which got no complaints from the DT maintainers.

Heiko


[0] https://lkml.org/lkml/2014/2/4/172

 Documentation/devicetree/bindings/misc/sram.txt | 35 +++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/sram.txt b/Documentation/devicetree/bindings/misc/sram.txt
index 4d0a00e..36cbe5a 100644
--- a/Documentation/devicetree/bindings/misc/sram.txt
+++ b/Documentation/devicetree/bindings/misc/sram.txt
@@ -8,9 +8,44 @@ Required properties:
 
 - reg : SRAM iomem address range
 
+Reserving sram areas:
+---------------------
+
+Each child of the sram node specifies a region of reserved memory. Each
+child node should use a 'reg' property to specify a specific range of
+reserved memory.
+
+Following the generic-names recommended practice, node names should
+reflect the purpose of the node. Unit address (@<address>) should be
+appended to the name.
+
+Required properties in the sram node:
+
+- #address-cells, #size-cells : should use the same values as the root node
+- ranges : standard definition, should translate from local addresses
+           within the sram to bus addresses
+
+Required properties in the area nodes:
+
+- reg : iomem address range, relative to the SRAM range
+
+Optional properties in the area nodes:
+
+- compatible : standard definition, should contain a vendor specific string
+               in the form <vendor>,[<device>-]<usage>
+
 Example:
 
 sram: sram@5c000000 {
 	compatible = "mmio-sram";
 	reg = <0x5c000000 0x40000>; /* 256 KiB SRAM at address 0x5c000000 */
+
+	#adress-cells = <1>;
+	#size-cells = <1>;
+	ranges = <0 0x5c000000 0x40000>;
+
+	smp-sram@100 {
+		compatible = "socvendor,smp-sram";
+		reg = <0x100 0x50>;
+	};
 };
-- 
1.8.5.3


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
