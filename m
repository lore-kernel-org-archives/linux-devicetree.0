From: Jernej Skrabec <jernej.skrabec@siol.net>
Subject: [PATCH v2 09/18] drm/sun4i: mixer: Order includes alphabetically
Date: Tue, 10 Jul 2018 22:35:02 +0200
Message-ID: <20180710203511.18454-10-jernej.skrabec@siol.net>
References: <20180710203511.18454-1-jernej.skrabec@siol.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180710203511.18454-1-jernej.skrabec@siol.net>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@bootlin.com, wens@csie.org, robh+dt@kernel.org
Cc: airlied@linux.ie, mark.rutland@arm.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
List-Id: devicetree@vger.kernel.org

Includes are not alphabetically ordered.

Reorder them.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index ee8febb25903..aa81b9838ae8 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -21,8 +21,8 @@
 
 #include <linux/component.h>
 #include <linux/dma-mapping.h>
-#include <linux/reset.h>
 #include <linux/of_device.h>
+#include <linux/reset.h>
 
 #include "sun4i_drv.h"
 #include "sun8i_mixer.h"
-- 
2.18.0
