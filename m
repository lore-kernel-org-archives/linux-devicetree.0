From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [RFC 11/12] backlight: Probe backlight devices on demand
Date: Fri, 24 Apr 2015 16:47:27 +0200
Message-ID: <1429886848-5843-12-git-send-email-tomeu.vizoso@collabora.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Alexander Holler <holler@ahsoftware.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

When looking up a backlight device through its DT node, ensure that the
corresponding device has been registered.
---
 drivers/video/backlight/backlight.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index bddc8b1..fe7833b 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/backlight.h>
 #include <linux/notifier.h>
+#include <linux/of_platform.h>
 #include <linux/ctype.h>
 #include <linux/err.h>
 #include <linux/fb.h>
@@ -559,6 +560,8 @@ struct backlight_device *of_find_backlight_by_node(struct device_node *node)
 {
 	struct device *dev;
 
+	of_platform_device_ensure(node);
+
 	dev = class_find_device(backlight_class, NULL, node, of_parent_match);
 
 	return dev ? to_backlight_device(dev) : NULL;
-- 
2.3.6
