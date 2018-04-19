From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 07/15] media: staging/imx: add 10 bit bayer support
Date: Thu, 19 Apr 2018 11:18:04 +0100
Message-ID: <20180419101812.30688-8-rui.silva@linaro.org>
References: <20180419101812.30688-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180419101812.30688-1-rui.silva@linaro.org>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: mchehab@kernel.org, sakari.ailus@linux.intel.com, Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ryan Harkin <ryan.harkin@linaro.org>, Rui Miguel Silva <rui.silva@linaro.org>, Fabio Estevam <fabio.estevam@nxp.com>, Shawn Guo <shawnguo@kernel.org>, linux-media@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Some sensors can only output 10 bit bayer formats, like the OV2680. Add support
for that in imx-media.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/staging/media/imx/imx-media-utils.c | 24 +++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index fab98fc0d6a0..99527daba29a 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -118,6 +118,30 @@ static const struct imx_media_pixfmt rgb_formats[] = {
 		.cs     = IPUV3_COLORSPACE_RGB,
 		.bpp    = 8,
 		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.codes  = {MEDIA_BUS_FMT_SBGGR10_1X10},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.codes  = {MEDIA_BUS_FMT_SGBRG10_1X10},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.codes  = {MEDIA_BUS_FMT_SGRBG10_1X10},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
+	}, {
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.codes  = {MEDIA_BUS_FMT_SRGGB10_1X10},
+		.cs     = IPUV3_COLORSPACE_RGB,
+		.bpp    = 16,
+		.bayer  = true,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR16,
 		.codes  = {
-- 
2.17.0
