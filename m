From: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V5 4/4] net/fec: add device tree matching support
Date: Wed, 16 Mar 2011 23:51:41 +0800
Message-ID: <1300290701-9433-5-git-send-email-jason.hui@linaro.org>
References: <1300290701-9433-1-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1300290701-9433-1-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 .../devicetree/bindings/net/fsl-imx-fec.txt        |   17 +++++++++++++++++
 drivers/net/fec.c                                  |   17 +++++++++++++++++
 2 files changed, 34 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/fsl-imx-fec.txt b/Documentation/devicetree/bindings/net/fsl-imx-fec.txt
new file mode 100644
index 0000000..cff97cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/fsl-imx-fec.txt
@@ -0,0 +1,17 @@
+* FEC (Fast Ethernet Controller)
+
+Required properties:
+- compatible : "fsl,imx51-fec".
+- reg : Offset and length of the register set for the device.
+- interrupts : should contain uart interrupt.
+- fec_clk-clock : the fec clock input information.
+
+Example:
+
+fec@ec000 {
+	compatible = "fsl,imx51-fec";
+	reg = <0xec000 0x1000>;
+	interrupts = <0x57>;
+	fec_clk-clock = <&fec_clk>, "fec";
+} ;
+
diff --git a/drivers/net/fec.c b/drivers/net/fec.c
index 2a71373..b6b7446 100644
--- a/drivers/net/fec.c
+++ b/drivers/net/fec.c
@@ -44,6 +44,8 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/fec.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
 
 #include <asm/cacheflush.h>
 
@@ -77,6 +79,13 @@ static struct platform_device_id fec_devtype[] = {
 	}
 };
 
+#ifdef CONFIG_OF
+static const struct of_device_id fec_dt_ids[] = {
+	{ .compatible = "fsl,imx51-fec", .data = &fec_devtype[0], },
+	{},
+};
+#endif
+
 static unsigned char macaddr[ETH_ALEN];
 module_param_array(macaddr, byte, NULL, 0);
 MODULE_PARM_DESC(macaddr, "FEC Ethernet MAC address");
@@ -1366,6 +1375,11 @@ fec_probe(struct platform_device *pdev)
 	struct net_device *ndev;
 	int i, irq, ret = 0;
 	struct resource *r;
+	const struct of_device_id *of_id;
+
+	of_id = of_match_device(fec_dt_ids, &pdev->dev);
+	if (of_id)
+		pdev->id_entry = (struct platform_device_id *)of_id->data;
 
 	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!r)
@@ -1530,6 +1544,9 @@ static struct platform_driver fec_driver = {
 #ifdef CONFIG_PM
 		.pm	= &fec_pm_ops,
 #endif
+#ifdef CONFIG_OF
+		.of_match_table = fec_dt_ids,
+#endif
 	},
 	.id_table = fec_devtype,
 	.probe	= fec_probe,
-- 
1.7.1
