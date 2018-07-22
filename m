From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 2/5] dt-bindings: sunxi-sram: add binding for
 Allwinner H6 SRAM C
Date: Sun, 22 Jul 2018 13:39:52 +0800
Message-ID: <20180722053955.25266-3-icenowy@aosc.io>
References: <20180722053955.25266-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB75R2DNAKGQEH6ADGNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180722053955.25266-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Corentin Labbe <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Allwinner H6 SoC's DE3 needs the SRAM C section being claimed in the
system controller to work, like A64 DE2.

As H6 and A64 system controller are quite similar, code is reused now,
and the A64 fallback compatible string is added after the H6 compatible
string.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 Documentation/devicetree/bindings/sram/sunxi-sram.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sunxi-sram.txt b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
index c51ade86578c..6527a1a535a3 100644
--- a/Documentation/devicetree/bindings/sram/sunxi-sram.txt
+++ b/Documentation/devicetree/bindings/sram/sunxi-sram.txt
@@ -18,6 +18,7 @@ Required properties:
     - "allwinner,sun8i-h3-system-control"
     - "allwinner,sun50i-a64-sram-controller" (deprecated)
     - "allwinner,sun50i-a64-system-control"
+    - "allwinner,sun50i-h6-system-contorl", "allwinner,sun50i-a64-system-control"
 - reg : sram controller register offset + length
 
 SRAM nodes
@@ -54,6 +55,9 @@ The valid sections compatible for H3 are:
 The valid sections compatible for A64 are:
     - allwinner,sun50i-a64-sram-c
 
+The valid sections compatible for H6 are:
+    - allwinner,sun50i-h6-sram-c, allwinner,sun50i-a64-sram-c
+
 Devices using SRAM sections
 ---------------------------
 
-- 
2.18.0
