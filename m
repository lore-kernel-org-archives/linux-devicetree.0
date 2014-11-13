From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 1/4] dt-bindings: simplefb: Specify node
 location and handoff related properties
Date: Thu, 13 Nov 2014 09:50:07 +0100
Message-ID: <1415868610-13297-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBTXBSGRQKGQEIX36ODQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Luc Verhaegen <libv-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, David Herrmann <dh.herrmann-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Since simplefb nodes do not relate directly to hw typically they have been
placed in the root of the devicetree. As the represent runtime information
having them as sub-nodes of /chosen is more logical, specify this.

Also specify when to set the chosen stdout-path property to a simplefb node.

For reliable handover to a hardware specific driver, that driver needs to
know which simplefb to unregister when taking over, specify how the hw driver
can find the matching simplefb node.

Last add some advice on how to fill and use simplefb nodes from a firmware
pov.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Acked-by: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
--
Changes in v2:
-Add stdout-path to the example code
---
 .../bindings/video/simple-framebuffer.txt          | 38 +++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
index 8f35718..8b7ecf6 100644
--- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
+++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
@@ -4,6 +4,26 @@ A simple frame-buffer describes a frame-buffer setup by firmware or
 the bootloader, with the assumption that the display hardware has already
 been set up to scan out from the memory pointed to by the reg property.
 
+Since simplefb nodes represent runtime information they must be sub-nodes of
+the chosen node (*). The primary display node must be named framebuffer0,
+additional nodes must be called framebuffer1, etc.
+
+If a simplefb node represents the preferred console for user interaction,
+then the chosen node's stdout-path property must point to it.
+
+If the devicetree contains nodes for the display hardware used by a simplefb,
+then one of the hw nodes must have a property called "framebuffer" pointing to
+the framebuffer# node in chosen, so that the operating system knows which
+simplefb to disable when handing over control to a driver for the real
+hardware. The bindings for the hw nodes must specify which node contains the
+framebuffer property.
+
+It is advised that devicetree files contain pre-filled, disabled framebuffer#
+nodes, so that the firmware only needs to update the mode information and
+enable them. This way if e.g. later on support for more display clocks get
+added, the simplefb nodes will already contain this info and the firmware
+does not need to be updated.
+
 Required properties:
 - compatible: "simple-framebuffer"
 - reg: Should contain the location and size of the framebuffer memory.
@@ -22,11 +42,27 @@ Optional properties:
 
 Example:
 
-	framebuffer {
+chosen {
+	framebuffer0 {
 		compatible = "simple-framebuffer";
 		reg = <0x1d385000 (1600 * 1200 * 2)>;
 		width = <1600>;
 		height = <1200>;
 		stride = <(1600 * 2)>;
 		format = "r5g6b5";
+		clocks = <&ahb_gates 36>, <&ahb_gates 43>, <&ahb_gates 44>;
 	};
+	stdout-path = &framebuffer0;
+};
+
+soc@01c00000 {
+	lcdc0: lcdc@1c0c000 {
+		compatible = "allwinner,sun4i-a10-lcdc";
+		framebuffer = <&framebuffer0>;
+	};
+};
+
+
+*) Older devicetree files may have a compatible = "simple-framebuffer" node
+in a different place, operating systems must first enumerate any framebuffer#
+nodes found under chosen and then check for other compatible nodes.
-- 
2.1.0
