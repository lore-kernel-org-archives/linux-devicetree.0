From: Jungo Lin <jungo.lin@mediatek.com>
Subject: [RFC,v3 3/9] media: platform: Add Mediatek ISP Pass 1 driver Kconfig
Date: Tue, 11 Jun 2019 11:53:38 +0800
Message-ID: <20190611035344.29814-4-jungo.lin@mediatek.com>
References: <jungo.lin@mediatek.com>
 <20190611035344.29814-1-jungo.lin@mediatek.com>
Reply-To: jungo.lin@mediatek.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190611035344.29814-1-jungo.lin@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: tfiga@chromium.org, hverkuil@xs4all.nl, laurent.pinchart@ideasonboard.com, matthias.bgg@gmail.com, mchehab@kernel.org
Cc: devicetree@vger.kernel.org, sean.cheng@mediatek.com, rynn.wu@mediatek.com, srv_heupstream@mediatek.com, robh@kernel.org, ryan.yu@mediatek.com, frankie.chiu@mediatek.com, jungo.lin@mediatek.com, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, ddavenport@chromium.org, frederic.chen@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds Kconfig for Pass 1 (P1) unit driver of Mediatek's
camera ISP system. ISP P1 unit is embedded in Mediatek SoCs. It
provides RAW processing which includes optical black correction,
defect pixel correction, W/IR imbalance correction and lens
shading correction.

Signed-off-by: Jungo Lin <jungo.lin@mediatek.com>
---
 drivers/media/platform/Kconfig         |  2 ++
 drivers/media/platform/mtk-isp/Kconfig | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 drivers/media/platform/mtk-isp/Kconfig

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 011c1c2fcf19..8e2b65d757e5 100644
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
index 000000000000..983b79c261fa
--- /dev/null
+++ b/drivers/media/platform/mtk-isp/Kconfig
@@ -0,0 +1,17 @@
+config VIDEO_MEDIATEK_ISP_PASS1
+	bool "Mediatek Pass 1 image processing function"
+	depends on VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
+	select V4L2_FWNODE
+	select VIDEOBUF2_DMA_CONTIG
+	default n
+	help
+		Pass 1 driver controls 3A (auto-focus, exposure,
+		and white balance) with tuning feature and outputs
+		the captured image buffers in Mediatek's camera system.
+
+		Choose y if you want to use Mediatek SoCs to create image
+		captured application such as video recording and still image
+		capturing.
+
+
-- 
2.18.0
