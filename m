From: Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH 06/15] media: staging/imx: add imx7 capture subsystem
Date: Thu, 19 Apr 2018 11:18:03 +0100
Message-ID: <20180419101812.30688-7-rui.silva@linaro.org>
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

Add imx7 capture subsystem to imx-media core to allow the use some of the
existing modules for i.MX5/6 with i.MX7 SoC.

Since i.MX7 does not have an IPU set the no_ipu_present flag to differentiate
some runtime behaviors.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 drivers/staging/media/imx/imx-media-dev.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
index a8afe0ec4134..967d172f1447 100644
--- a/drivers/staging/media/imx/imx-media-dev.c
+++ b/drivers/staging/media/imx/imx-media-dev.c
@@ -484,6 +484,9 @@ static int imx_media_probe(struct platform_device *pdev)
 		goto notifier_cleanup;
 	}
 
+	if (of_device_is_compatible(node, "fsl,imx7-capture-subsystem"))
+		imxmd->no_ipu_present = true;
+
 	if (!imxmd->no_ipu_present) {
 		ret = imx_media_add_internal_subdevs(imxmd);
 		if (ret) {
@@ -541,6 +544,7 @@ static int imx_media_remove(struct platform_device *pdev)
 
 static const struct of_device_id imx_media_dt_ids[] = {
 	{ .compatible = "fsl,imx-capture-subsystem" },
+	{ .compatible = "fsl,imx7-capture-subsystem" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, imx_media_dt_ids);
-- 
2.17.0
