From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 08/11] dt-bindings: add binding for A64 DE2 CCU SRAM
Date: Fri, 22 Dec 2017 20:22:40 +0800
Message-ID: <20171222122243.25735-9-icenowy@aosc.io>
References: <20171222122243.25735-1-icenowy@aosc.io>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171222122243.25735-1-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

A64's Display Engine 2.0 needs a section of SRAM (SRAM C) to be claimed,
otherwise the whole DE2 memory zone cannot be accessed (kept to all 0).

Add binding for this, in order to make the DE2 CCU able to claim the
SRAM and enable access to the DE2 clock and reset registers.

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
Changes in v3:
- Add Rob's ACK.

 Documentation/devicetree/bindings/clock/sun8i-de2.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/sun8i-de2.txt b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
index f2fa87c4765c..a7d558a2b9b2 100644
--- a/Documentation/devicetree/bindings/clock/sun8i-de2.txt
+++ b/Documentation/devicetree/bindings/clock/sun8i-de2.txt
@@ -6,6 +6,7 @@ Required properties :
 		- "allwinner,sun8i-a83t-de2-clk"
 		- "allwinner,sun8i-h3-de2-clk"
 		- "allwinner,sun8i-v3s-de2-clk"
+		- "allwinner,sun50i-a64-de2-clk"
 		- "allwinner,sun50i-h5-de2-clk"
 
 - reg: Must contain the registers base address and length
@@ -18,6 +19,10 @@ Required properties :
 - #clock-cells : must contain 1
 - #reset-cells : must contain 1
 
+Additional required properties for "allwinner,sun50i-a64-de2-clk" :
+- allwinner,sram: See Documentation/devicetree/bindings/sram/sunxi-sram.txt,
+		  should be the SRAM C section on A64 SoC.
+
 Example:
 de2_clocks: clock@1000000 {
 	compatible = "allwinner,sun8i-h3-de2-clk";
-- 
2.14.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
