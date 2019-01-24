From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v11 04/13] media: staging/imx7: add imx7 CSI subdev driver
Date: Thu, 24 Jan 2019 16:09:19 +0000
Message-ID: <20190124160928.31884-5-rui.silva@linaro.org>
References: <20190124160928.31884-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20190124160928.31884-1-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Rui Miguel Silva <rui.silva@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This add the media entity subdevice and control driver for the i.MX7
CMOS Sensor Interface.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/staging/media/imx/Kconfig  | 9 ++++++++-
 drivers/staging/media/imx/Makefile | 2 ++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
index bfc17de56b17..36b276ea2ecc 100644
--- a/drivers/staging/media/imx/Kconfig
+++ b/drivers/staging/media/imx/Kconfig
@@ -11,7 +11,7 @@ config VIDEO_IMX_MEDIA
 	  driver for the i.MX5/6 SOC.
 
 if VIDEO_IMX_MEDIA
-menu "i.MX5/6 Media Sub devices"
+menu "i.MX5/6/7 Media Sub devices"
 
 config VIDEO_IMX_CSI
 	tristate "i.MX5/6 Camera Sensor Interface driver"
@@ -20,5 +20,12 @@ config VIDEO_IMX_CSI
 	---help---
 	  A video4linux camera sensor interface driver for i.MX5/6.
 
+config VIDEO_IMX7_CSI
+	tristate "i.MX7 Camera Sensor Interface driver"
+	depends on VIDEO_IMX_MEDIA && VIDEO_DEV && I2C
+	default y
+	help
+	  Enable support for video4linux camera sensor interface driver for
+	  i.MX7.
 endmenu
 endif
diff --git a/drivers/staging/media/imx/Makefile b/drivers/staging/media/imx/Makefile
index a30b3033f9a3..074f016d3519 100644
--- a/drivers/staging/media/imx/Makefile
+++ b/drivers/staging/media/imx/Makefile
@@ -12,3 +12,5 @@ obj-$(CONFIG_VIDEO_IMX_MEDIA) += imx-media-ic.o
 
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx-media-csi.o
 obj-$(CONFIG_VIDEO_IMX_CSI) += imx6-mipi-csi2.o
+
+obj-$(CONFIG_VIDEO_IMX7_CSI) += imx7-media-csi.o
-- 
2.20.1
