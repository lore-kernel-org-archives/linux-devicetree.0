From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v4 4/8] phy: phy-mt65xx-usb3: move clock from phy node into port nodes
Date: Sat, 11 Mar 2017 14:22:49 +0800
Message-ID: <1489213373-2544-4-git-send-email-chunfeng.yun@mediatek.com>
References: <1489213373-2544-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1489213373-2544-1-git-send-email-chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

each port has its own reference clock, the HighSpeed port is 48M,
and the SuperSpeed port is usually 26M, put them into port node for
flexibility, this can close clock if the port is not used.

Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
 drivers/phy/phy-mt65xx-usb3.c |   29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/phy-mt65xx-usb3.c b/drivers/phy/phy-mt65xx-usb3.c
index 7fff482..7ffac6c 100644
--- a/drivers/phy/phy-mt65xx-usb3.c
+++ b/drivers/phy/phy-mt65xx-usb3.c
@@ -153,6 +153,7 @@ struct mt65xx_phy_pdata {
 struct mt65xx_phy_instance {
 	struct phy *phy;
 	void __iomem *port_base;
+	struct clk *ref_clk;	/* reference clock of anolog phy */
 	u32 index;
 	u8 type;
 };
@@ -160,7 +161,8 @@ struct mt65xx_phy_instance {
 struct mt65xx_u3phy {
 	struct device *dev;
 	void __iomem *sif_base;	/* only shared sif */
-	struct clk *u3phya_ref;	/* reference clock of usb3 anolog phy */
+	/* deprecated, use @ref_clk instead in phy instance */
+	struct clk *u3phya_ref; /* reference clock of usb3 anolog phy */
 	const struct mt65xx_phy_pdata *pdata;
 	struct mt65xx_phy_instance **phys;
 	int nphys;
@@ -455,6 +457,12 @@ static int mt65xx_phy_init(struct phy *phy)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(instance->ref_clk);
+	if (ret) {
+		dev_err(u3phy->dev, "failed to enable ref_clk\n");
+		return ret;
+	}
+
 	if (instance->type == PHY_TYPE_USB2)
 		phy_instance_init(u3phy, instance);
 	else
@@ -494,6 +502,7 @@ static int mt65xx_phy_exit(struct phy *phy)
 	if (instance->type == PHY_TYPE_USB2)
 		phy_instance_exit(u3phy, instance);
 
+	clk_disable_unprepare(instance->ref_clk);
 	clk_disable_unprepare(u3phy->u3phya_ref);
 	return 0;
 }
@@ -594,10 +603,13 @@ static int mt65xx_u3phy_probe(struct platform_device *pdev)
 		return PTR_ERR(u3phy->sif_base);
 	}
 
+	/* it's deprecated, make it optional for backward compatibility */
 	u3phy->u3phya_ref = devm_clk_get(dev, "u3phya_ref");
 	if (IS_ERR(u3phy->u3phya_ref)) {
-		dev_err(dev, "error to get u3phya_ref\n");
-		return PTR_ERR(u3phy->u3phya_ref);
+		if (PTR_ERR(u3phy->u3phya_ref) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
+
+		u3phy->u3phya_ref = NULL;
 	}
 
 	port = 0;
@@ -638,6 +650,17 @@ static int mt65xx_u3phy_probe(struct platform_device *pdev)
 		instance->index = port;
 		phy_set_drvdata(phy, instance);
 		port++;
+
+		/* if deprecated clock is provided, ignore instance's one */
+		if (u3phy->u3phya_ref)
+			continue;
+
+		instance->ref_clk = devm_clk_get(&phy->dev, "ref");
+		if (IS_ERR(instance->ref_clk)) {
+			dev_err(dev, "failed to get ref_clk(id-%d)\n", port);
+			retval = PTR_ERR(instance->ref_clk);
+			goto put_child;
+		}
 	}
 
 	provider = devm_of_phy_provider_register(dev, mt65xx_phy_xlate);
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
