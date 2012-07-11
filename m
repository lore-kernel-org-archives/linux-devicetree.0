From: Leela Krishna Amudala <l.krishna@samsung.com>
Subject: [PATCH V2 2/2] drm/exynos: Modifying exynos drm fimd to support
	exynos5
Date: Wed, 11 Jul 2012 14:14:47 +0530
Message-ID: <1341996287-14666-3-git-send-email-l.krishna@samsung.com>
References: <1341996287-14666-1-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-reply-to: <1341996287-14666-1-git-send-email-l.krishna@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: dri-devel@lists.freedesktop.org, devicetree-discuss@lists.ozlabs.org
Cc: Prathyush K <prathyush.k@samsung.com>, joshi@samsung.com, inki.dae@samsung.com, laurent.pinchart@ideasonboard.com, olofj@google.com
List-Id: devicetree@vger.kernel.org

From: Prathyush K <prathyush.k@samsung.com>

The name of the exynos drm fimd device is renamed to exynos-drm-fimd
and two ids are created from exynos4-fb and exynos5-fb.

Signed-off-by: Prathyush K <prathyush.k@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c |   13 ++++++++++++-
 1 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 6f06260..0a28a55 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1089,6 +1089,16 @@ static const struct of_device_id drm_fimd_dt_match[] = {
 MODULE_DEVICE_TABLE(of, drm_fimd_dt_match);
 #endif
 
+static struct platform_device_id exynos_drm_driver_ids[] = {
+	{
+		.name		= "exynos4-fb",
+	}, {
+		.name		= "exynos5-fb",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(platform, exynos_drm_driver_ids);
+
 static const struct dev_pm_ops fimd_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(fimd_suspend, fimd_resume)
 	SET_RUNTIME_PM_OPS(fimd_runtime_suspend, fimd_runtime_resume, NULL)
@@ -1097,8 +1107,9 @@ static const struct dev_pm_ops fimd_pm_ops = {
 struct platform_driver fimd_driver = {
 	.probe		= fimd_probe,
 	.remove		= __devexit_p(fimd_remove),
+	.id_table       = exynos_drm_driver_ids,
 	.driver		= {
-		.name	= "exynos4-fb",
+		.name	= "exynos-drm-fimd",
 		.owner	= THIS_MODULE,
 		.pm	= &fimd_pm_ops,
 		.of_match_table = of_match_ptr(drm_fimd_dt_match),
-- 
1.7.0.4
