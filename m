From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 2/7] dmaengine: sun6i: Add a quirk for additional mbus clock
Date: Mon, 27 May 2019 22:14:54 +0200
Message-ID: <20190527201459.20130-3-peron.clem@gmail.com>
References: <20190527201459.20130-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190527201459.20130-1-peron.clem@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Dan Williams <dan.j.williams@intel.com>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

From: Jernej Skrabec <jernej.skrabec@siol.net>

H6 DMA controller needs additional mbus clock to be enabled.

Add a quirk for it and handle it accordingly.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0cd13f17fc11..7d9606997251 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -129,6 +129,7 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
+	bool has_mbus_clk;
 };
 
 /*
@@ -182,6 +183,7 @@ struct sun6i_dma_dev {
 	struct dma_device	slave;
 	void __iomem		*base;
 	struct clk		*clk;
+	struct clk		*clk_mbus;
 	int			irq;
 	spinlock_t		lock;
 	struct reset_control	*rstc;
@@ -1208,6 +1210,14 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(sdc->clk);
 	}
 
+	if (sdc->cfg->has_mbus_clk) {
+		sdc->clk_mbus = devm_clk_get(&pdev->dev, "mbus");
+		if (IS_ERR(sdc->clk_mbus)) {
+			dev_err(&pdev->dev, "No mbus clock specified\n");
+			return PTR_ERR(sdc->clk_mbus);
+		}
+	}
+
 	sdc->rstc = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(sdc->rstc)) {
 		dev_err(&pdev->dev, "No reset controller specified\n");
@@ -1312,11 +1322,19 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		goto err_reset_assert;
 	}
 
+	if (sdc->cfg->has_mbus_clk) {
+		ret = clk_prepare_enable(sdc->clk_mbus);
+		if (ret) {
+			dev_err(&pdev->dev, "Couldn't enable mbus clock\n");
+			goto err_clk_disable;
+		}
+	}
+
 	ret = devm_request_irq(&pdev->dev, sdc->irq, sun6i_dma_interrupt, 0,
 			       dev_name(&pdev->dev), sdc);
 	if (ret) {
 		dev_err(&pdev->dev, "Cannot request IRQ\n");
-		goto err_clk_disable;
+		goto err_mbus_clk_disable;
 	}
 
 	ret = dma_async_device_register(&sdc->slave);
@@ -1341,6 +1359,8 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&sdc->slave);
 err_irq_disable:
 	sun6i_kill_tasklet(sdc);
+err_mbus_clk_disable:
+	clk_disable_unprepare(sdc->clk_mbus);
 err_clk_disable:
 	clk_disable_unprepare(sdc->clk);
 err_reset_assert:
@@ -1359,6 +1379,7 @@ static int sun6i_dma_remove(struct platform_device *pdev)
 
 	sun6i_kill_tasklet(sdc);
 
+	clk_disable_unprepare(sdc->clk_mbus);
 	clk_disable_unprepare(sdc->clk);
 	reset_control_assert(sdc->rstc);
 
-- 
2.20.1
