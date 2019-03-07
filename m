From: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Subject: [PATCH 2/6] dmaengine: sun6i: Add a quirk for
 additional mbus clock
Date: Thu,  7 Mar 2019 17:58:25 +0100
Message-ID: <20190307165829.9086-3-jernej.skrabec@siol.net>
References: <20190307165829.9086-1-jernej.skrabec@siol.net>
Reply-To: jernej.skrabec-gGgVlfcn5nU@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBDQNBWPU7YERBRE3QXSAKGQEW3PRLWA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20190307165829.9086-1-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, jernej.skrabec-gGgVlfcn5nU@public.gmane.org
List-Id: devicetree@vger.kernel.org

H6 DMA controller needs additional mbus clock to be enabled.

Add a quirk for it and handle it accordingly.

Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 0cd13f17fc11..761555080325 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -129,6 +129,7 @@ struct sun6i_dma_config {
 	u32 dst_burst_lengths;
 	u32 src_addr_widths;
 	u32 dst_addr_widths;
+	bool mbus_clk;
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
 
+	if (sdc->cfg->mbus_clk) {
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
 
+	if (sdc->cfg->mbus_clk) {
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
2.21.0
