From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 1/4] dt-bindings: add binding for Allwinner A64
 SRAM controller and SRAM C
Date: Wed,  9 Aug 2017 16:56:24 +0800
Message-ID: <20170809085627.32687-2-icenowy@aosc.io>
References: <20170809085627.32687-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB6E4VPGAKGQENEUCSNA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170809085627.32687-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The display engine on Allwinner A64 wants to claim the SRAM C section.

Add a SRAM controller compatible for A64, and a SRAM section compatible
for its SRAM C.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 Documentation/devicetree/bindings/sram/sunxi-sram.txt | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
index 8d5665468fe7..f34b3a553d7c 100644
--- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
+++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
@@ -9,7 +9,9 @@ Controller Node
 ---------------
 
 Required properties:
-- compatible : "allwinner,sun4i-a10-sram-controller"
+- compatible : should be:
+    - "allwinner,sun4i-a10-sram-controller"
+    - "allwinner,sun50i-a64-sram-controller"
 - reg : sram controller register offset + length
 
 SRAM nodes
@@ -22,10 +24,13 @@ Each SRAM will have SRAM sections that are going to be handled by the
 SRAM controller as subnodes. These sections are represented following
 once again the representation described in the mmio-sram binding.
 
-The valid sections compatible are:
+The valid sections compatible for A10 are:
     - allwinner,sun4i-a10-sram-a3-a4
     - allwinner,sun4i-a10-sram-d
 
+The valid sections compatible for A64 are:
+    - allwinner,sun50i-a64-sram-c
+
 Devices using SRAM sections
 ---------------------------
 
-- 
2.13.0
