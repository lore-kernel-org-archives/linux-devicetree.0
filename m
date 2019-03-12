From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH 06/14] dt-bindings: clock: sunxi-ccu: remove
 bogus + before R40 compatible
Date: Tue, 12 Mar 2019 23:22:48 +0800
Message-ID: <20190312152256.35574-7-icenowy@aosc.io>
References: <20190312152256.35574-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB2E6T7SAKGQEBWX75DI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190312152256.35574-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jagan Teki <jagan-dyjBcgdgk7Pe9wHmmfpqLFaTQe2KTcn/@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When adding the R40 compatible string to the binding document, a + is
left behind the string, which seems to be a fault when dealing with
patches.

Remove the bogus + sign.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 Documentation/devicetree/bindings/clock/sunxi-ccu.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
index e3bd88ae456b..8e39c6e26c26 100644
--- a/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
+++ b/Documentation/devicetree/bindings/clock/sunxi-ccu.txt
@@ -14,7 +14,7 @@ Required properties :
 		- "allwinner,sun8i-a83t-r-ccu"
 		- "allwinner,sun8i-h3-ccu"
 		- "allwinner,sun8i-h3-r-ccu"
-+		- "allwinner,sun8i-r40-ccu"
+		- "allwinner,sun8i-r40-ccu"
 		- "allwinner,sun8i-v3s-ccu"
 		- "allwinner,sun9i-a80-ccu"
 		- "allwinner,sun50i-a64-ccu"
-- 
2.18.1
