From: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 1/2] Drivers: w1: mxc_w1, Add support for DT
Date: Sat, 23 Feb 2013 18:35:57 +0100
Message-ID: <1361640958-1876-1-git-send-email-mpa@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: zbr-i6C2adt8DTjR7s880joybQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add devicetree support for mxc_w1 driver.

Signed-off-by: Markus Pargmann <mpa-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt | 13 +++++++++++++
 drivers/w1/masters/mxc_w1.c                         |  7 +++++++
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt

diff --git a/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt b/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
new file mode 100644
index 0000000..686ced4
--- /dev/null
+++ b/Documentation/devicetree/bindings/w1/fsl,mxc-w1.txt
@@ -0,0 +1,13 @@
+Freescale driver for Dalla's 1-wire bus master on imx chips
+
+This driver supports imx21,27,31,35.
+
+Required properties:
+- compatible : "fsl,<chip>-w1"
+- reg : Should be the memory range.
+
+Example:
+		w1: w1@10009000 {
+			compatible = "fsl,imx27-w1";
+			reg = <0x10009000 0x1000>;
+		};
diff --git a/drivers/w1/masters/mxc_w1.c b/drivers/w1/masters/mxc_w1.c
index 708a25f..827ff7f 100644
--- a/drivers/w1/masters/mxc_w1.c
+++ b/drivers/w1/masters/mxc_w1.c
@@ -186,9 +186,16 @@ static int mxc_w1_remove(struct platform_device *pdev)
 	return 0;
 }
 
+struct of_device_id mxc_w1_of_ids[] = {
+	{ .compatible = "fsl,imx21-w1", },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mxc_w1_of_ids);
+
 static struct platform_driver mxc_w1_driver = {
 	.driver = {
 		   .name = "mxc_w1",
+		   .of_match_table = mxc_w1_of_ids,
 	},
 	.probe = mxc_w1_probe,
 	.remove = mxc_w1_remove,
-- 
1.8.1.2
