From: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v2 2/4] simplefb: Add support for enumerating
 simplefb dt nodes in /chosen
Date: Thu, 13 Nov 2014 09:50:08 +0100
Message-ID: <1415868610-13297-2-git-send-email-hdegoede@redhat.com>
References: <1415868610-13297-1-git-send-email-hdegoede@redhat.com>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDRZXY4CYYORBT7BSGRQKGQEQQ2S4FQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1415868610-13297-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

Update simplefb to support the new preferred location for simplefb dt nodes
under /chosen.

Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
--
Changes in v2:
-Make name array larger in case we ever encounter more then 10000 framebuffers
---
 drivers/video/fbdev/simplefb.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index cd96edd..2705af8 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -27,6 +27,7 @@
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/clk-provider.h>
+#include <linux/of_platform.h>
 
 static struct fb_fix_screeninfo simplefb_fix = {
 	.id		= "simple",
@@ -385,7 +386,37 @@ static struct platform_driver simplefb_driver = {
 	.probe = simplefb_probe,
 	.remove = simplefb_remove,
 };
-module_platform_driver(simplefb_driver);
+
+static int __init simplefb_init(void)
+{
+	int i, ret;
+	char name[32];
+	struct device_node *np;
+
+	ret = platform_driver_register(&simplefb_driver);
+	if (ret)
+		return ret;
+
+	for (i = 0; ; i++) {
+		snprintf(name, sizeof(name), "framebuffer%d", i);
+		np = of_find_node_by_name(of_chosen, name);
+		if (!np)
+			break;
+
+		/* of_platform_device_create will check status for us */
+		of_platform_device_create(np, NULL, NULL);
+	}
+
+	return 0;
+}
+
+static void __exit simplefb_exit(void)
+{
+	platform_driver_unregister(&simplefb_driver);
+}
+
+module_init(simplefb_init);
+module_exit(simplefb_exit);
 
 MODULE_AUTHOR("Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>");
 MODULE_DESCRIPTION("Simple framebuffer driver");
-- 
2.1.0
