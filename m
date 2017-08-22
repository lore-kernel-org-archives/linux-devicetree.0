From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: sunxi: fix the core number of V3s
 in sunxi README
Date: Tue, 22 Aug 2017 13:23:21 +0800
Message-ID: <20170822052322.15338-2-icenowy@aosc.io>
References: <20170822052322.15338-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRB2X753GAKGQET7DFA2Y-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170822052322.15338-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Allwinner V3s SoC is not quad-core, but single-core.

Fix this in the README file.

Fixes: b074fede01c0 ("arm: sunxi: add support for V3s SoC")
Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
---
 Documentation/arm/sunxi/README | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/arm/sunxi/README b/Documentation/arm/sunxi/README
index d7b1f016bd62..de791e18ccef 100644
--- a/Documentation/arm/sunxi/README
+++ b/Documentation/arm/sunxi/README
@@ -33,6 +33,11 @@ SunXi family
 
       - Next Thing Co GR8 (sun5i)
 
+    * Single ARM Cortex-A7 based SoCs
+      - Allwinner V3s (sun8i)
+        + Datasheet
+          http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf
+
     * Dual ARM Cortex-A7 based SoCs
       - Allwinner A20 (sun7i)
         + User Manual
@@ -71,10 +76,6 @@ SunXi family
         + Datasheet
           http://dl.linux-sunxi.org/H3/Allwinner_H3_Datasheet_V1.0.pdf
 
-      - Allwinner V3s (sun8i)
-        + Datasheet
-          http://linux-sunxi.org/File:Allwinner_V3s_Datasheet_V1.0.pdf
-
     * Quad ARM Cortex-A15, Quad ARM Cortex-A7 based SoCs
       - Allwinner A80
         + Datasheet
-- 
2.13.5
