From: <frederic.chen@mediatek.com>
Subject: [RFC PATCH V3 3/5] media: platform: Add Mediatek DIP driver KConfig
Date: Tue, 10 Sep 2019 03:22:42 +0800
Message-ID: <20190909192244.9367-4-frederic.chen@mediatek.com>
References: <20190909192244.9367-1-frederic.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190909192244.9367-1-frederic.chen@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: hans.verkuil@cisco.com, laurent.pinchart+renesas@ideasonboard.com, tfiga@chromium.org, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: shik@chromium.org, devicetree@vger.kernel.org, Sean.Cheng@mediatek.com, Rynn.Wu@mediatek.com, Allan.Yang@mediatek.com, srv_heupstream@mediatek.com, holmes.chiou@mediatek.com, suleiman@chromium.org, Jerry-ch.Chen@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, yuzhao@chromium.org, linux-mediatek@lists.infradead.org, zwisler@chromium.org, christie.yu@mediatek.com, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frederic Chen <frederic.chen@mediatek.com>

This patch adds KConfig for Mediatek Digital Image Processing
driver(DIP). DIP is embedded in Mediatek SoCs. It provides
image format conversion, resizing, and rotation function.

Signed-off-by: Frederic Chen <frederic.chen@mediatek.com>
---
 drivers/media/platform/Kconfig         |  2 ++
 drivers/media/platform/mtk-isp/Kconfig | 19 +++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 0c725d4dcf80..b8501e1b134f 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -32,6 +32,8 @@ source "drivers/media/platform/davinci/Kconfig"
 
 source "drivers/media/platform/omap/Kconfig"
 
+source "drivers/media/platform/mtk-isp/Kconfig"
+
 config VIDEO_ASPEED
 	tristate "Aspeed AST2400 and AST2500 Video Engine driver"
 	depends on VIDEO_V4L2
diff --git a/drivers/media/platform/mtk-isp/Kconfig b/drivers/media/platform/mtk-isp/Kconfig
new file mode 100644
index 000000000000..a4267db70c24
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Kconfig
@@ -0,0 +1,19 @@
+config VIDEO_MEDIATEK_ISP_DIP
+	bool "Mediatek Digital Image Processing function"
+	select VIDEO_V4L2_SUBDEV_API
+	select VIDEOBUF2_DMA_CONTIG
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_V4L2
+	select VIDEOBUF2_MEMOPS
+	select MEDIA_CONTROLLER
+
+	default n
+	help
+	    Support the basic Digital Image Processing (DIP) driver.
+
+	    DIP driver provides image format conversion, resizing,
+	    and rotation function through the low power hardware.
+	    DIP also supports multiple output feature. It can
+	    generate two or more output image with different effect
+	    based on a single input image at the same time.
+
-- 
2.18.0
