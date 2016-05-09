From: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Subject: [PATCH 1/2] doc/devicetree: Add Aspeed VIC bindings
Date: Mon,  9 May 2016 22:03:58 +0930
Message-ID: <1462797239-14765-2-git-send-email-joel@jms.id.au>
References: <1462797239-14765-1-git-send-email-joel@jms.id.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462797239-14765-1-git-send-email-joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org, benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>
---
 .../interrupt-controller/aspeed,ast2400-vic.txt    | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt

diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
new file mode 100644
index 000000000000..10ed0c20ee6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2400-vic.txt
@@ -0,0 +1,24 @@
+Aspeed Vectored Interrupt Controller
+
+These bindings are for the Aspeed AST2400 interrupt controller register layout.
+The SoC has an legacy register layout, but this driver does not support that
+mode of operation.
+
+Required properties:
+
+- compatible : should be "aspeed,ast2400-vic".
+
+- interrupt-controller : Identifies the node as an interrupt controller
+- #interrupt-cells : Specifies the number of cells needed to encode an
+  interrupt source. The value shall be 1.
+- valid-sources : bitmask of valid irq sources
+
+Example:
+
+ vic: interrupt-controller {
+      compatible = "aspeed,ast2400-new-vic";
+      interrupt-controller;
+      #interrupt-cells = <1>;
+      valid-sources = < 0xffffffff 0x0007ffff>;
+      reg = <0x1e6c0080 0x80>;
+ };
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
