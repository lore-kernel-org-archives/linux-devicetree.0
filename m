Return-Path: <SRS0=Hucj=TO=renesas.com=prvs=40371367b7=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH v3 03/15] phy: renesas: rcar-gen3-usb2: detect usb_x1 clock
Date: Tue, 14 May 2019 09:55:53 -0500
Message-ID: <20190514145605.19112-4-chris.brandt@renesas.com>
In-Reply-To: <20190514145605.19112-1-chris.brandt@renesas.com>
References: <20190514145605.19112-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Simon Horman <horms@verge.net.au>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Chris
List-ID: <devicetree@vger.kernel.org>

The RZ/A2 has an optional dedicated 48MHz clock input for the PLL.
If a clock node named 'usb_x1' exists and set to non-zero, then we can
assume we want it use it.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
v3:
 * avoid magic number
 * use devm_clk_get and clk_get_rate
v2:
 * use 'usb_x1' clock node instead of 'renesas,uses_usb_x1' property
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index 1322185a00a2..06e0fc804226 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -12,6 +12,7 @@
 #include <linux/extcon-provider.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -34,6 +35,7 @@
 #define USB2_VBCTRL		0x60c
 #define USB2_LINECTRL1		0x610
 #define USB2_ADPCTRL		0x630
+#define USB2_PHYCLK_CTRL	0x644
 
 /* INT_ENABLE */
 #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
@@ -75,6 +77,9 @@
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
+/* PHYCLK_CTRL */
+#define PHYCLK_CTRL_UCLKSEL		BIT(0)
+
 #define NUM_OF_PHYS			4
 enum rcar_gen3_phy_index {
 	PHY_INDEX_BOTH_HC,
@@ -110,6 +115,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool uses_usb_x1;
 };
 
 /*
@@ -391,6 +397,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	void __iomem *usb2_base = channel->base;
 	u32 val;
 
+	if (channel->uses_usb_x1)
+		writel(PHYCLK_CTRL_UCLKSEL, usb2_base + USB2_PHYCLK_CTRL);
+
 	/* Initialize USB2 part */
 	val = readl(usb2_base + USB2_INT_ENABLE);
 	val |= USB2_INT_ENABLE_UCOM_INTEN | rphy->int_enable_bits;
@@ -583,6 +592,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
+	struct clk *usb_x1_clk;
 	struct resource *res;
 	const struct phy_ops *phy_usb2_ops;
 	int irq, ret = 0, i;
@@ -630,6 +640,10 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
+	usb_x1_clk = devm_clk_get(dev, "usb_x1");
+	if (!IS_ERR(usb_x1_clk) && clk_get_rate(usb_x1_clk))
+		channel->uses_usb_x1 = true;
+
 	/*
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
-- 
2.16.1
