From: Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [RFC PATCH V1 2/4] media: platform: Add Mediatek sensor interface
 driver KConfig
Date: Thu, 14 Mar 2019 22:18:34 +0800
Message-ID: <1552573116-21421-3-git-send-email-louis.kuo@mediatek.com>
References: <1552573116-21421-1-git-send-email-louis.kuo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1552573116-21421-1-git-send-email-louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: hans.verkuil-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org, laurent.pinchart+renesas-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, tfiga-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, keiichiw-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sean.Cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Rynn.Wu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, holmes.chiou-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, Jerry-ch.Chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, jungo.lin-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, sj.huang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, yuzhao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, zwisler-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, christie.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, frederic.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds KConfig for sensor interface driver. Sensor interface driver
is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
It support a widely adopted, simple, high-speed protocol primarily intended
for point-to-point image and video transmission between cameras and host
devices.

Signed-off-by: Louis Kuo <louis.kuo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/media/platform/mtk-isp/Kconfig | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig

diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
new file mode 100644
index 0000000..c665fa1
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Kconfig
@@ -0,0 +1,16 @@
+config MTK_SENINF
+	bool "Mediatek mipi csi2 driver"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CAMERA_SUPPORT
+	select V4L2_FWNODE
+
+	default n
+	help
+	    This driver provides a mipi-csi2 host driver used as a
+	    interface to connect camera with Mediatek's
+	    MT8183 SOCs. It is able to handle multiple cameras
+	    at the same time.
+
+		Choose y if you want to use Mediatek SoCs to create image
+		capture application such as video recording and still image
+		capture.
-- 
1.9.1
