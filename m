From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] dt-bindings: simplefb: Document naming scheme
 for pre-populated simplefb nodes
Date: Fri, 14 Nov 2014 10:02:31 +0100
Message-ID: <1415955751-6316-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBM4KS6RQKGQEF4FZNCA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
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

Since we advice to use pre-populated simeplfb nodes in dt files, where the
firmware then only needs to fill in the mode info + address and enable it,
we should also specify how these pre-populated nodes should be named so
that the firmware can find and enable the right one.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
 Documentation/devicetree/bindings/video/simple-framebuffer.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/video/simple-framebuffer.txt b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
index c548f33..01dc948 100644
--- a/Documentation/devicetree/bindings/video/simple-framebuffer.txt
+++ b/Documentation/devicetree/bindings/video/simple-framebuffer.txt
@@ -29,6 +29,13 @@ enable them. This way if e.g. later on support for more display clocks get
 added, the simplefb nodes will already contain this info and the firmware
 does not need to be updated.
 
+If pre-filled framebuffer nodes are used, they should be named
+"framebuffer#-<output>", e.g. "framebuffer0-hdmi". The output should be
+included in the name since different outputs typically require different
+clocks and the clocks are part of the pre-populated nodes. The firmware must
+rename the nodes to the standard "framebuffer@<address>" using the runtime
+chosen address when enabling the nodes.
+
 Required properties:
 - compatible: "simple-framebuffer"
 - reg: Should contain the location and size of the framebuffer memory.
-- 
2.1.0
