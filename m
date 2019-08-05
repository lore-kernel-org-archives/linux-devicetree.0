Return-Path: <SRS0=3ErU=WB=vger.kernel.org=devicetree-owner@kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:52765 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727830AbfHEKD0 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 5 Aug 2019 06:03:26 -0400
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 6/8] clk: mvebu: ap806: add AP-DCLK (hclk) to system controller driver
Date: Mon,  5 Aug 2019 12:03:08 +0200
Message-Id: <20190805100310.29048-7-miquel.raynal@bootlin.com>
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Stefan Chulski <stefanc@marvell.com>, Yan Markman <ymarkman@marvell.com>, Omri Itach <omrii@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

From: Omri Itach <omrii@marvell.com>

Add dynamic AP-DCLK clock (hclk) to system controller driver. AP-DCLK
is half the rate of DDR clock, so its derrived from Sample At Reset
configuration. The clock frequency is required for AP806 AXI monitor
profiling feature.

Signed-off-by: Omri Itach <omrii@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 48 ++++++++++++++++++++-
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index 2cf874f01394..bc43adff02e0 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -21,7 +21,7 @@
 #define AP806_SAR_REG			0x400
 #define AP806_SAR_CLKFREQ_MODE_MASK	0x1f
 
-#define AP806_CLK_NUM			5
+#define AP806_CLK_NUM			6
 
 static struct clk *ap806_clks[AP806_CLK_NUM];
 
@@ -33,7 +33,7 @@ static struct clk_onecell_data ap806_clk_data = {
 static int ap806_syscon_common_probe(struct platform_device *pdev,
 				     struct device_node *syscon_node)
 {
-	unsigned int freq_mode, cpuclk_freq;
+	unsigned int freq_mode, cpuclk_freq, dclk_freq;
 	const char *name, *fixedclk_name;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
@@ -93,8 +93,42 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	/* Get DCLK frequency (DCLK = DDR_CLK / 2) */
+	switch (freq_mode) {
+	case 0x0:
+	case 0x6:
+		/* DDR_CLK = 1200Mhz */
+		dclk_freq = 600;
+		break;
+	case 0x1:
+	case 0x7:
+	case 0xD:
+		/* DDR_CLK = 1050Mhz */
+		dclk_freq = 525;
+		break;
+	case 0x13:
+	case 0x17:
+		/* DDR_CLK = 650Mhz */
+		dclk_freq = 325;
+		break;
+	case 0x4:
+	case 0x14:
+	case 0x19:
+	case 0x1A:
+	case 0x1B:
+	case 0x1C:
+	case 0x1D:
+		/* DDR_CLK = 800Mhz */
+		dclk_freq = 400;
+		break;
+	default:
+		dclk_freq = 0;
+		dev_err(dev, "invalid Sample at Reset value\n");
+	}
+
 	/* Convert to hertz */
 	cpuclk_freq *= 1000 * 1000;
+	dclk_freq *= 1000 * 1000;
 
 	/* CPU clocks depend on the Sample At Reset configuration */
 	name = ap_cp_unique_name(dev, syscon_node, "pll-cluster-0");
@@ -141,6 +175,14 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 		goto fail4;
 	}
 
+	/* AP-DCLK(HCLK) Clock is DDR clock divided by 2 */
+	name = ap_cp_unique_name(dev, syscon_node, "ap-dclk");
+	ap806_clks[5] = clk_register_fixed_rate(dev, name, NULL, 0, dclk_freq);
+	if (IS_ERR(ap806_clks[5])) {
+		ret = PTR_ERR(ap806_clks[5]);
+		goto fail5;
+	}
+
 	ret = of_clk_add_provider(np, of_clk_src_onecell_get, &ap806_clk_data);
 	if (ret)
 		goto fail_clk_add;
@@ -148,6 +190,8 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	return 0;
 
 fail_clk_add:
+	clk_unregister_fixed_factor(ap806_clks[5]);
+fail5:
 	clk_unregister_fixed_factor(ap806_clks[4]);
 fail4:
 	clk_unregister_fixed_factor(ap806_clks[3]);
-- 
2.20.1
