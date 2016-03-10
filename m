From: Alan <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: [PATCH v2 2/2] goldfish: Enable ACPI-based enumeration for goldfish
 framebuffer
Date: Thu, 10 Mar 2016 15:39:40 +0000
Message-ID: <20160310153911.8996.29184.stgit@localhost.localdomain>
References: <20160310153845.8996.17736.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160310153845.8996.17736.stgit-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tomi.valkeinen-l0cyMroinI0@public.gmane.org, plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Yu Ning <yu.ning-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>

Enable ACPI bindings for the Goldfish framebuffer device.

Signed-off-by: Yu Ning <yu.ning-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Jin Qian <jinqian-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Signed-off-by: Alan <alan-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
---
 drivers/video/fbdev/goldfishfb.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/video/fbdev/goldfishfb.c b/drivers/video/fbdev/goldfishfb.c
index f0e651b..58b33e4 100644
--- a/drivers/video/fbdev/goldfishfb.c
+++ b/drivers/video/fbdev/goldfishfb.c
@@ -26,6 +26,7 @@
 #include <linux/interrupt.h>
 #include <linux/ioport.h>
 #include <linux/platform_device.h>
+#include <linux/acpi.h>
 
 enum {
 	FB_GET_WIDTH        = 0x00,
@@ -310,6 +311,12 @@ static const struct of_device_id goldfish_fb_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, goldfish_fb_of_match);
 
+static const struct acpi_device_id goldfish_fb_acpi_match[] = {
+	{ "GFSH0004", 0 },
+	{ },
+};
+MODULE_DEVICE_TABLE(acpi, goldfish_fb_acpi_match);
+
 static struct platform_driver goldfish_fb_driver = {
 	.probe		= goldfish_fb_probe,
 	.remove		= goldfish_fb_remove,
@@ -317,6 +324,7 @@ static struct platform_driver goldfish_fb_driver = {
 		.name = "goldfish_fb",
 		.owner = THIS_MODULE,
 		.of_match_table = goldfish_fb_of_match,
+		.acpi_match_table = ACPI_PTR(goldfish_fb_acpi_match),
 	}
 };
 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
