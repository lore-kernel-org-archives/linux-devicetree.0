From: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
Subject: [PATCH 1/3] ARM: sunxi: add support for H2+ SoC
Date: Sat, 12 Nov 2016 00:46:52 +0800
Message-ID: <20161111164654.15273-1-icenowy@aosc.xyz>
Reply-To: icenowy-ymACFijhrKM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCZLPFN5Q4OBBGXMS7AQKGQEGZNFA5Q-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Jonathan Corbet <corbet-T1hC0tSOHrs@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner H2+ is a quad-core Cortex-A7 SoC.

It is very like H3, that they share the same SoC ID (0x1680), and H3
memory maps as well as drivers works well on the SoC.

Signed-off-by: Icenowy Zheng <icenowy-ymACFijhrKM@public.gmane.org>
---
 Documentation/arm/sunxi/README                  | 4 ++++
 Documentation/devicetree/bindings/arm/sunxi.txt | 1 +
 arch/arm/mach-sunxi/sunxi.c                     | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/README
index cd02433..1fe4d99c 100644
--- a/Documentation/arm/sunxi/README
+++ b/Documentation/arm/sunxi/README
@@ -63,6 +63,10 @@ SunXi family
         + User Manual
           http://dl.linux-sunxi.org/A33/A33%20user%20manual%20release%201.1.pdf
 
+      - Allwinner H2+ (sun8i)
+        + No document available now, but is known to be working properly with
+          H3 drivers and memory map.
+
       - Allwinner H3 (sun8i)
         + Datasheet
           http://dl.linux-sunxi.org/H3/Allwinner_H3_Datasheet_V1.0.pdf
diff --git a/Documentation/devicetree/bindings/arm/sunxi.txt b/Documentation/devicetree/bindings/arm/sunxi.txt
index 3975d0a..0c0f277 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.txt
+++ b/Documentation/devicetree/bindings/arm/sunxi.txt
@@ -13,5 +13,6 @@ using one of the following compatible strings:
   allwinner,sun8i-a33
   allwinner,sun8i-a83t
   allwinner,sun8i-h3
+  allwinner,sun8i-h2plus
   allwinner,sun9i-a80
   nextthing,gr8
diff --git a/arch/arm/mach-sunxi/sunxi.c b/arch/arm/mach-sunxi/sunxi.c
index 2e2bde2..3647ad7 100644
--- a/arch/arm/mach-sunxi/sunxi.c
+++ b/arch/arm/mach-sunxi/sunxi.c
@@ -63,6 +63,7 @@ static const char * const sun8i_board_dt_compat[] = {
 	"allwinner,sun8i-a23",
 	"allwinner,sun8i-a33",
 	"allwinner,sun8i-a83t",
+	"allwinner,sun8i-h2plus",
 	"allwinner,sun8i-h3",
 	NULL,
 };
-- 
2.10.1
