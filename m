From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 17/22] drm/msm: Use of_device_match()
Date: Mon,  6 Jun 2016 10:31:59 +0200
Message-ID: <20160606083204.19760-18-thierry.reding@gmail.com>
References: <20160606083204.19760-1-thierry.reding@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160606083204.19760-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the common implementation rather than the driver-private variant.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 1f7de47d817e..554d0b4f1e9b 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -15,6 +15,8 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#include <linux/of_device.h>
+
 #include "msm_drv.h"
 #include "msm_debugfs.h"
 #include "msm_fence.h"
@@ -796,15 +798,6 @@ static const struct dev_pm_ops msm_pm_ops = {
  * Componentized driver support:
  */
 
-/*
- * NOTE: duplication of the same code as exynos or imx (or probably any other).
- * so probably some room for some helpers
- */
-static int compare_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static void release_of(struct device *dev, void *data)
 {
 	of_node_put(data);
@@ -824,7 +817,7 @@ static int add_components(struct device *dev, struct component_match **matchptr,
 			break;
 
 		component_match_add_release(dev, matchptr, release_of,
-					    compare_of, node);
+					    of_device_match, node);
 	}
 
 	return 0;
-- 
2.8.3
