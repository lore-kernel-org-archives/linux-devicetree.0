From: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Subject: [PATCH 13/14] ARM: kirkwood: sata_mv: add device tree binding
Date: Wed,  7 Mar 2012 03:44:54 +0000
Message-ID: <9858608e73993c22b64e9f10cff6e597d20f73b1.1331090356.git.jason@lakedaemon.net>
References: <cover.1331090356.git.jason@lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
In-Reply-To: <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
References: <cover.1330625877.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
 <cover.1331090356.git.jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: arnd-r2nGTMty4D4@public.gmane.org
Cc: nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, andrew-g2DYL2Zd6BY@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, michael-QKn5cuLxLXY@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>

Based on devicetree work by Michael Walle.  Changed compatible property
to "mrvl,orion-sata", simplified retrieving nr_ports from fdt.

Signed-off-by: Michael Walle <michael-QKn5cuLxLXY@public.gmane.org>
Signed-off-by: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
---
 drivers/ata/sata_mv.c |   18 ++++++++++++++++--
 1 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index 38950ea..ebd0d24 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -65,6 +65,7 @@
 #include <linux/mbus.h>
 #include <linux/bitops.h>
 #include <linux/gfp.h>
+#include <linux/of.h>
 #include <scsi/scsi_host.h>
 #include <scsi/scsi_cmnd.h>
 #include <scsi/scsi_device.h>
@@ -4045,8 +4046,12 @@ static int mv_platform_probe(struct platform_device *pdev)
 		return -EINVAL;
 
 	/* allocate host */
-	mv_platform_data = pdev->dev.platform_data;
-	n_ports = mv_platform_data->n_ports;
+	if (pdev->dev.of_node)
+		of_property_read_u32(pdev->dev.of_node, "nr-ports", &n_ports);
+	else {
+		mv_platform_data = pdev->dev.platform_data;
+		n_ports = mv_platform_data->n_ports;
+	}
 
 	host = ata_host_alloc_pinfo(&pdev->dev, ppi, n_ports);
 	hpriv = devm_kzalloc(&pdev->dev, sizeof(*hpriv), GFP_KERNEL);
@@ -4172,6 +4177,14 @@ static int mv_platform_resume(struct platform_device *pdev)
 #define mv_platform_resume NULL
 #endif
 
+#ifdef CONFIG_OF
+static struct of_device_id mv_sata_dt_ids[] __devinitdata = {
+	{ .compatible = "mrvl,orion-sata", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mvsdio_dt_ids);
+#endif
+
 static struct platform_driver mv_platform_driver = {
 	.probe			= mv_platform_probe,
 	.remove			= __devexit_p(mv_platform_remove),
@@ -4180,6 +4193,7 @@ static struct platform_driver mv_platform_driver = {
 	.driver			= {
 				   .name = DRV_NAME,
 				   .owner = THIS_MODULE,
+				   .of_match_table = of_match_ptr(mv_sata_dt_ids),
 				  },
 };
 
-- 
1.7.3.4
