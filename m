From: Michael Grzeschik <mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 5/7] USB chipidea i.MX: use devm_usb_get_phy_by_phandle to get
 phy
Date: Fri, 31 May 2013 20:38:47 +0200
Message-ID: <1370025529-7414-6-git-send-email-mgr@pengutronix.de>
References: <1370025529-7414-1-git-send-email-mgr@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1370025529-7414-1-git-send-email-mgr-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

Signed-off-by: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/usb/chipidea/ci13xxx_imx.c | 41 ++++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/chipidea/ci13xxx_imx.c b/drivers/usb/chipidea/ci13xxx_imx.c
index 4d64541..48c446b 100644
--- a/drivers/usb/chipidea/ci13xxx_imx.c
+++ b/drivers/usb/chipidea/ci13xxx_imx.c
@@ -29,7 +29,6 @@
 	((struct usb_phy *)platform_get_drvdata(pdev))
 
 struct ci13xxx_imx_data {
-	struct device_node *phy_np;
 	struct usb_phy *phy;
 	struct platform_device *ci_pdev;
 	struct clk *clk;
@@ -98,12 +97,12 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
 				  CI13XXX_PULLUP_ON_VBUS |
 				  CI13XXX_DISABLE_STREAMING,
 	};
-	struct platform_device *plat_ci, *phy_pdev;
-	struct device_node *phy_np;
+	struct platform_device *plat_ci;
 	struct resource *res;
 	struct regulator *reg_vbus;
 	struct pinctrl *pinctrl;
 	int ret;
+	struct usb_phy *phy;
 
 	if (of_find_property(pdev->dev.of_node, "fsl,usbmisc", NULL)
 		&& !usbmisc_ops)
@@ -140,19 +139,21 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	phy_np = of_parse_phandle(pdev->dev.of_node, "fsl,usbphy", 0);
-	if (phy_np) {
-		data->phy_np = phy_np;
-		phy_pdev = of_find_device_by_node(phy_np);
-		if (phy_pdev) {
-			struct usb_phy *phy;
-			phy = pdev_to_phy(phy_pdev);
-			if (phy &&
-			    try_module_get(phy_pdev->dev.driver->owner)) {
-				usb_phy_init(phy);
-				data->phy = phy;
-			}
+	phy = devm_usb_get_phy_by_phandle(&pdev->dev, "fsl,usbphy", 0);
+
+	if (PTR_ERR(phy) == -EPROBE_DEFER) {
+		ret = -EPROBE_DEFER;
+		goto err_clk;
+	}
+
+	if (!IS_ERR(phy)) {
+		ret = usb_phy_init(phy);
+		if (ret) {
+			dev_err(&pdev->dev, "unable to init phy: %d\n", ret);
+			goto err_clk;
 		}
+
+		data->phy = phy;
 	}
 
 	/* we only support host now, so enable vbus here */
@@ -163,7 +164,7 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev,
 				"Failed to enable vbus regulator, err=%d\n",
 				ret);
-			goto put_np;
+			goto err_clk;
 		}
 		data->reg_vbus = reg_vbus;
 	} else {
@@ -202,7 +203,7 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
 		if (ret) {
 			dev_err(&pdev->dev,
 				"usbmisc post failed, ret=%d\n", ret);
-			goto put_np;
+			goto err;
 		}
 	}
 
@@ -217,9 +218,7 @@ static int ci13xxx_imx_probe(struct platform_device *pdev)
 err:
 	if (reg_vbus)
 		regulator_disable(reg_vbus);
-put_np:
-	if (phy_np)
-		of_node_put(phy_np);
+err_clk:
 	clk_disable_unprepare(data->clk);
 	return ret;
 }
@@ -239,8 +238,6 @@ static int ci13xxx_imx_remove(struct platform_device *pdev)
 		module_put(data->phy->dev->driver->owner);
 	}
 
-	of_node_put(data->phy_np);
-
 	clk_disable_unprepare(data->clk);
 
 	platform_set_drvdata(pdev, NULL);
-- 
1.8.2.rc2
