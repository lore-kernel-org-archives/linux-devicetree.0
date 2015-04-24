From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [RFC 07/12] drm: Probe panels on demand
Date: Fri, 24 Apr 2015 16:47:23 +0200
Message-ID: <1429886848-5843-8-git-send-email-tomeu.vizoso@collabora.com>
References: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1429886848-5843-1-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>, Alexander Holler <holler@ahsoftware.de>, Olof Johansson <olof@lixom.net>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: devicetree@vger.kernel.org

When looking up a panel through its DT node, ensure that the
corresponding device has been registered.
---
 drivers/gpu/drm/drm_panel.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 2ef988e..041211e 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -23,6 +23,7 @@
 
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of_platform.h>
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_panel.h>
@@ -80,6 +81,8 @@ struct drm_panel *of_drm_find_panel(struct device_node *np)
 {
 	struct drm_panel *panel;
 
+	of_platform_device_ensure(np);
+
 	mutex_lock(&panel_lock);
 
 	list_for_each_entry(panel, &panel_list, list) {
-- 
2.3.6
