From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 06/14] media: staging/imx: add imx7 capture subsystem
Date: Mon,  7 May 2018 17:21:44 +0100
Message-ID: <20180507162152.2545-7-rui.silva@linaro.org>
References: <20180507162152.2545-1-rui.silva@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180507162152.2545-1-rui.silva@linaro.org>
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

Add imx7 capture subsystem to imx-media core to allow the use some of the
existing modules for i.MX5/6 with i.MX7 SoC.

Since i.MX7 does not have an IPU, add driver data with unset ipu_present flag
that change some runtime behaviors.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/staging/media/imx/imx-media-dev.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index b019dcefccd6..55fe0321edc0 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -561,8 +561,13 @@ static const struct imx_media_driver_data imx6_drvdata = {
 	.ipu_present = true,
 };
 
+static const struct imx_media_driver_data imx7_drvdata = {
+	.ipu_present = false,
+};
+
 static const struct of_device_id imx_media_dt_ids[] = {
 	{ .compatible = "fsl,imx-capture-subsystem", .data = &imx6_drvdata },
+	{ .compatible = "fsl,imx7-capture-subsystem", .data = &imx7_drvdata },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_media_dt_ids);
-- 
2.17.0
