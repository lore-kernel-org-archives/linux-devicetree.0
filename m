From: Russell King <rmk+kernel@armlinux.org.uk>
Subject: [PATCH 1/3] drm/armada: fix compare_of() for LCD controllers
Date: Tue, 10 Jul 2018 11:24:14 +0100
Message-ID: <E1fcpoc-0003Yt-07@rmk-PC.armlinux.org.uk>
References: <20180710102344.GH17271@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180710102344.GH17271@n2100.armlinux.org.uk>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Cc: David Airlie <airlied@linux.ie>
List-Id: devicetree@vger.kernel.org

The DT node passed for LCD controllers is the "port" node within the
parent device.  Detect this and compare the parent node.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
---
 drivers/gpu/drm/armada/armada_drv.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index d1705d298a39..217f0590fd61 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -205,7 +205,10 @@ static void armada_drm_unbind(struct device *dev)
 
 static int compare_of(struct device *dev, void *data)
 {
-	return dev->of_node == data;
+	struct device_node *np = data;
+	if (of_node_cmp(np->name, "port") == 0)
+		np = np->parent;
+	return dev->of_node == np;
 }
 
 static int compare_dev_name(struct device *dev, void *data)
-- 
2.7.4
