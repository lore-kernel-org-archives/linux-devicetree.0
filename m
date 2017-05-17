From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v8 6/9] drm/sun4i: tcon: add support for V3s TCON
Date: Wed, 17 May 2017 22:47:22 +0800
Message-ID: <20170517144725.3463-7-icenowy@aosc.io>
References: <20170517144725.3463-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBPOG6HEAKGQE7ZGJMFY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20170517144725.3463-1-icenowy-h8G6r0blFSE@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Allwinner V3s SoC features a TCON without channel 1.

Add support for it.

Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Reviewed-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
Changes in v7:
- Added Chen-Yu's Reviewed-by.

 drivers/gpu/drm/sun4i/sun4i_drv.c  | 3 ++-
 drivers/gpu/drm/sun4i/sun4i_tcon.c | 5 +++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 4a979d17ddaa..1dd1948025d2 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -178,7 +178,8 @@ static bool sun4i_drv_node_is_tcon(struct device_node *node)
 	return of_device_is_compatible(node, "allwinner,sun5i-a13-tcon") ||
 		of_device_is_compatible(node, "allwinner,sun6i-a31-tcon") ||
 		of_device_is_compatible(node, "allwinner,sun6i-a31s-tcon") ||
-		of_device_is_compatible(node, "allwinner,sun8i-a33-tcon");
+		of_device_is_compatible(node, "allwinner,sun8i-a33-tcon") ||
+		of_device_is_compatible(node, "allwinner,sun8i-v3s-tcon");
 }
 
 static int compare_of(struct device *dev, void *data)
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/sun4i_tcon.c
index 990c973c0334..f44a37a5993d 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
@@ -601,11 +601,16 @@ static const struct sun4i_tcon_quirks sun8i_a33_quirks = {
 	/* nothing is supported */
 };
 
+static const struct sun4i_tcon_quirks sun8i_v3s_quirks = {
+	/* nothing is supported */
+};
+
 static const struct of_device_id sun4i_tcon_of_table[] = {
 	{ .compatible = "allwinner,sun5i-a13-tcon", .data = &sun5i_a13_quirks },
 	{ .compatible = "allwinner,sun6i-a31-tcon", .data = &sun6i_a31_quirks },
 	{ .compatible = "allwinner,sun6i-a31s-tcon", .data = &sun6i_a31s_quirks },
 	{ .compatible = "allwinner,sun8i-a33-tcon", .data = &sun8i_a33_quirks },
+	{ .compatible = "allwinner,sun8i-v3s-tcon", .data = &sun8i_v3s_quirks },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sun4i_tcon_of_table);
-- 
2.12.2
