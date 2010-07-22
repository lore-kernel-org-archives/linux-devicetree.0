From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/device: Protect against binding of_platform_drivers to
	non-OF devices
Date: Thu, 22 Jul 2010 16:24:07 -0600
Message-ID: <20100722222407.21517.46568.stgit@angua>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

There is an unlikely chance of this situation is occurring, but it is
easy to protect against.  If a matching entry cannot be found in the
of_match_table, then don't bind the driver.

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
---
 drivers/of/platform.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index 712dfd8..f3f1ec8 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -30,8 +30,13 @@ static int platform_driver_probe_shim(struct platform_device *pdev)
 
 	pdrv = container_of(pdev->dev.driver, struct platform_driver, driver);
 	ofpdrv = container_of(pdrv, struct of_platform_driver, platform_driver);
+
+	/* There is an unlikely chance that an of_platform driver might match
+	 * on a non-OF platform device.  If so, then of_match_device() will
+	 * come up empty.  Return -EINVAL in this case so other drivers get
+	 * the chance to bind. */
 	match = of_match_device(pdev->dev.driver->of_match_table, &pdev->dev);
-	return ofpdrv->probe(pdev, match);
+	return match ? ofpdrv->probe(pdev, match) : -EINVAL;
 }
 
 static void platform_driver_shutdown_shim(struct platform_device *pdev)
