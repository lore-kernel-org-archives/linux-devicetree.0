From: Anson.Huang@nxp.com
Subject: [PATCH 1/6] thermal: qoriq: Use devm_platform_ioremap_resource()
 instead of of_iomap()
Date: Fri,  5 Jul 2019 12:56:07 +0800
Message-ID: <20190705045612.27665-1-Anson.Huang@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: rui.zhang@intel.com, edubezval@gmail.com, daniel.lezcano@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, l.stach@pengutronix.de, abel.vesa@nxp.com, andrew.smirnov@gmail.com, angus@akkea.ca, ccaione@baylibre.com, agx@sigxcpu.org, leonard.crestez@nxp.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

Use devm_platform_ioremap_resource() instead of of_iomap() to
save the iounmap() call in error handle path;

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
 drivers/thermal/qoriq_thermal.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/qoriq_thermal.c b/drivers/thermal/qoriq_thermal.c
index 7b36493..c7c7de2 100644
--- a/drivers/thermal/qoriq_thermal.c
+++ b/drivers/thermal/qoriq_thermal.c
@@ -202,32 +202,27 @@ static int qoriq_tmu_probe(struct platform_device *pdev)
 
 	data->little_endian = of_property_read_bool(np, "little-endian");
 
-	data->regs = of_iomap(np, 0);
-	if (!data->regs) {
+	data->regs = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(data->regs)) {
 		dev_err(&pdev->dev, "Failed to get memory region\n");
-		ret = -ENODEV;
-		goto err_iomap;
+		return PTR_ERR(data->regs);
 	}
 
 	qoriq_tmu_init_device(data);	/* TMU initialization */
 
 	ret = qoriq_tmu_calibration(pdev);	/* TMU calibration */
 	if (ret < 0)
-		goto err_tmu;
+		goto err;
 
 	ret = qoriq_tmu_register_tmu_zone(pdev);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register sensors\n");
-		ret = -ENODEV;
-		goto err_iomap;
+		goto err;
 	}
 
 	return 0;
 
-err_tmu:
-	iounmap(data->regs);
-
-err_iomap:
+err:
 	platform_set_drvdata(pdev, NULL);
 
 	return ret;
@@ -240,7 +235,6 @@ static int qoriq_tmu_remove(struct platform_device *pdev)
 	/* Disable monitoring */
 	tmu_write(data, TMR_DISABLE, &data->regs->tmr);
 
-	iounmap(data->regs);
 	platform_set_drvdata(pdev, NULL);
 
 	return 0;
-- 
2.7.4
