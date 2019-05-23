From: <dongchun.zhu@mediatek.com>
Subject: [PATCH 2/3] media: i2c: ov02a10: Add CONFIG_VIDEO_OV02A10
Date: Thu, 23 May 2019 18:22:03 +0800
Message-ID: <20190523102204.24112-3-dongchun.zhu@mediatek.com>
References: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190523102204.24112-1-dongchun.zhu@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: mchehab@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, matthias.bgg@gmail.com, bingbu.cao@intel.com
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com, menghui.lin@mediatek.com, shengnan.wang@mediatek.com, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, dongchun.zhu@mediatek.com, louis.kuo@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Dongchun Zhu <dongchun.zhu@mediatek.com>

Add CONFIG_VIDEO_OV02A10 to the Kconfig entry.

Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
---
 drivers/media/i2c/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 7793358..480aa42 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -615,6 +615,18 @@ config VIDEO_IMX355
 	  To compile this driver as a module, choose M here: the
 	  module will be called imx355.
 
+config VIDEO_OV02A10
+	tristate "OmniVision OV02A10 sensor support"
+	depends on I2C && VIDEO_V4L2 && VIDEO_V4L2_SUBDEV_API
+	depends on MEDIA_CAMERA_SUPPORT
+	select V4L2_FWNODE
+	help
+	  This is a Video4Linux2 sensor driver for the OmniVision
+	  OV02A10 camera.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called ov02a10.
+
 config VIDEO_OV2640
 	tristate "OmniVision OV2640 sensor support"
 	depends on VIDEO_V4L2 && I2C
-- 
2.9.2
