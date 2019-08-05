Return-Path: <SRS0=xLqw=WB=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 8/8] clk: mvebu: ap80x: add AP807 clock support
Date: Mon,  5 Aug 2019 12:03:10 +0200
Message-Id: <20190805100310.29048-9-miquel.raynal@bootlin.com>
In-Reply-To: <20190805100310.29048-1-miquel.raynal@bootlin.com>
References: <20190805100310.29048-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Grzegorz Jaszczyk <jaz@semihalf.com>, Marcin Wojtas <mw@semihalf.com>, Stefan Chulski <stefanc@marvell.com>, Yan Markman <ymarkman@marvell.com>, Ben Peled <bpeled@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

From: Ben Peled <bpeled@marvell.com>

Add driver support for AP807 clock.

Signed-off-by: Ben Peled <bpeled@marvell.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/clk/mvebu/ap806-system-controller.c | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
index c64e2cc4a3ba..948bd1e71aea 100644
--- a/drivers/clk/mvebu/ap806-system-controller.c
+++ b/drivers/clk/mvebu/ap806-system-controller.c
@@ -102,6 +102,30 @@ static int ap806_get_sar_clocks(unsigned int freq_mode,
 	return 0;
 }
 
+static int ap807_get_sar_clocks(unsigned int freq_mode,
+				unsigned int *cpuclk_freq,
+				unsigned int *dclk_freq)
+{
+	switch (freq_mode) {
+	case 0x0:
+		*cpuclk_freq = 2000;
+		*dclk_freq = 1200;
+		break;
+	case 0x6:
+		*cpuclk_freq = 2200;
+		*dclk_freq = 1200;
+		break;
+	case 0xD:
+		*cpuclk_freq = 1600;
+		*dclk_freq = 1200;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ap806_syscon_common_probe(struct platform_device *pdev,
 				     struct device_node *syscon_node)
 {
@@ -130,6 +154,9 @@ static int ap806_syscon_common_probe(struct platform_device *pdev,
 	if (of_device_is_compatible(pdev->dev.of_node,
 				    "marvell,ap806-clock")) {
 		ret = ap806_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
+	} else if (of_device_is_compatible(pdev->dev.of_node,
+					   "marvell,ap807-clock")) {
+		ret = ap807_get_sar_clocks(freq_mode, &cpuclk_freq, &dclk_freq);
 	} else {
 		dev_err(dev, "compatible not supported\n");
 		return -EINVAL;
@@ -252,6 +279,7 @@ builtin_platform_driver(ap806_syscon_legacy_driver);
 
 static const struct of_device_id ap806_clock_of_match[] = {
 	{ .compatible = "marvell,ap806-clock", },
+	{ .compatible = "marvell,ap807-clock", },
 	{ }
 };
 
-- 
2.20.1
