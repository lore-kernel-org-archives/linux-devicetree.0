Return-Path: <SRS0=7Z3r=NS=renesas.com=chris.brandt@kernel.org>
From: Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH 2/3] phy: renesas: rcar-gen3-usb2: Add support for R7S9210
Date: Wed,  7 Nov 2018 12:35:57 -0500
Message-Id: <20181107173558.54481-3-chris.brandt@renesas.com>
In-Reply-To: <20181107173558.54481-1-chris.brandt@renesas.com>
References: <20181107173558.54481-1-chris.brandt@renesas.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: linux-renesas-soc@vger.kernel.org, Simon Horman <horms+renesas@verge.net.au>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Chris Brandt <chris.brandt@renesas.com>
List-ID: <devicetree@vger.kernel.org>

The RZ/A2 has the same USB2 host controller as R-Car Gen3 with only some
minor differences.

Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/phy/renesas/Kconfig              |  2 +-
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 12 ++++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/renesas/Kconfig b/drivers/phy/renesas/Kconfig
index e340a925bbb1..beebeba31e84 100644
--- a/drivers/phy/renesas/Kconfig
+++ b/drivers/phy/renesas/Kconfig
@@ -19,7 +19,7 @@ config PHY_RCAR_GEN3_PCIE
 config PHY_RCAR_GEN3_USB2
 	tristate "Renesas R-Car generation 3 USB 2.0 PHY driver"
 	depends on ARCH_RENESAS
-	depends on EXTCON
+	depends on EXTCON || ARCH_R7S9210
 	depends on USB_SUPPORT
 	select GENERIC_PHY
 	select USB_COMMON
diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index d0f412c25981..96ac75ba40ea 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -34,6 +34,7 @@
 #define USB2_VBCTRL		0x60c
 #define USB2_LINECTRL1		0x610
 #define USB2_ADPCTRL		0x630
+#define USB2_PHYCLK_CTRL	0x644
 
 /* INT_ENABLE */
 #define USB2_INT_ENABLE_UCOM_INTEN	BIT(3)
@@ -88,6 +89,7 @@ struct rcar_gen3_chan {
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool uses_usb_x1;
 };
 
 /*
@@ -326,6 +328,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	struct rcar_gen3_chan *channel = phy_get_drvdata(p);
 	void __iomem *usb2_base = channel->base;
 
+	if (channel->uses_usb_x1)
+		writel(0x00000001, usb2_base + USB2_PHYCLK_CTRL);
+
 	/* Initialize USB2 part */
 	writel(USB2_INT_ENABLE_INIT, usb2_base + USB2_INT_ENABLE);
 	writel(USB2_SPD_RSM_TIMSET_INIT, usb2_base + USB2_SPD_RSM_TIMSET);
@@ -334,6 +339,9 @@ static int rcar_gen3_phy_usb2_init(struct phy *p)
 	/* Initialize otg part */
 	if (channel->is_otg_channel)
 		rcar_gen3_init_otg(channel);
+	else
+		/* No otg, so default to host mode */
+		writel(0x00000000, usb2_base + USB2_COMMCTRL);
 
 	return 0;
 }
@@ -406,6 +414,7 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 }
 
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
+	{ .compatible = "renesas,usb2-phy-r7s9210" },
 	{ .compatible = "renesas,usb2-phy-r8a7795" },
 	{ .compatible = "renesas,usb2-phy-r8a7796" },
 	{ .compatible = "renesas,usb2-phy-r8a77965" },
@@ -471,6 +480,9 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (of_property_read_bool(dev->of_node, "renesas,uses_usb_x1"))
+		channel->uses_usb_x1 = true;
+
 	/*
 	 * devm_phy_create() will call pm_runtime_enable(&phy->dev);
 	 * And then, phy-core will manage runtime pm for this device.
-- 
2.16.1
