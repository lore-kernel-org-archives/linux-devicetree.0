From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH 11/14] media: sh-mobile-ceu-camera: runtime PM suspending
 doesn't have to be synchronous
Date: Thu, 27 Sep 2012 16:07:30 +0200
Message-ID: <1348754853-28619-12-git-send-email-g.liakhovetski@gmx.de>
References: <1348754853-28619-1-git-send-email-g.liakhovetski@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348754853-28619-1-git-send-email-g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Sylwester Nawrocki <sylvester.nawrocki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In both error and clean up cases there is no need to wait for runtime PM
to finish suspending the device.

Signed-off-by: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
---
 .../platform/soc_camera/sh_mobile_ceu_camera.c     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c b/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
index 0a24253..41e4664 100644
--- a/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
+++ b/drivers/media/platform/soc_camera/sh_mobile_ceu_camera.c
@@ -572,7 +572,7 @@ static int sh_mobile_ceu_add_device(struct soc_camera_device *icd)
 
 	ret = v4l2_subdev_call(csi2_sd, core, s_power, 1);
 	if (ret < 0 && ret != -ENOIOCTLCMD && ret != -ENODEV) {
-		pm_runtime_put_sync(ici->v4l2_dev.dev);
+		pm_runtime_put(ici->v4l2_dev.dev);
 		return ret;
 	}
 
@@ -612,7 +612,7 @@ static void sh_mobile_ceu_remove_device(struct soc_camera_device *icd)
 	}
 	spin_unlock_irq(&pcdev->lock);
 
-	pm_runtime_put_sync(ici->v4l2_dev.dev);
+	pm_runtime_put(ici->v4l2_dev.dev);
 
 	dev_info(icd->parent,
 		 "SuperH Mobile CEU driver detached from camera %d\n",
-- 
1.7.2.5
