From: Louis Kuo <louis.kuo@mediatek.com>
Subject: [RFC PATCH V4 2/4] media: platform: Add Mediatek sensor interface
 driver KConfig
Date: Sun, 15 Sep 2019 14:50:02 +0800
Message-ID: <20190915065004.20257-3-louis.kuo@mediatek.com>
References: <20190915065004.20257-1-louis.kuo@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190915065004.20257-1-louis.kuo@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, keiichiw@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, srv_heupstream@mediatek.com, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, louis.kuo@mediatek.com, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds KConfig for sensor interface driver. Sensor interface
driver
is a MIPI-CSI2 host driver, namely, a HW camera interface controller.
It support a widely adopted, simple, high-speed protocol primarily
intended
for point-to-point image and video transmission between cameras and host
devices.

Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
---
 drivers/media/platform/mtk-isp/Kconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig

diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
new file mode 100644
index 000000000000..bc7fd01808b3
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Kconfig
@@ -0,0 +1,17 @@
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
+	    Choose y if you want to use Mediatek SoCs to create image
+	    capture application such as video recording and still image
+	    capture.
+
-- 
2.18.0
