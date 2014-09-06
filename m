From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH 7/7] dmaengine: sun6i: Remove obsolete clk
 muxing code
Date: Sat,  6 Sep 2014 18:47:28 +0800
Message-ID: <1410000448-9999-8-git-send-email-wens@csie.org>
References: <1410000448-9999-1-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-sunxi+bncBCMILY6JWQBBBR6MVOQAKGQE7AOULBA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1410000448-9999-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Emilio Lopez <emilio-0Z03zUJReD5OxF6Tv1QG9Q@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The sun6i DMA controller requires the AHB1 bus clock to be
clocked from PLL6. This was originally done by the dmaengine
driver during probe time. The AHB1 clock driver has since been
unified, so the original code does not work.

Remove the clk muxing code, and replace it with DT clk default
properties.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 drivers/dma/sun6i-dma.c | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 1f92a56..3aa10b3 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -862,7 +862,6 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 {
 	struct sun6i_dma_dev *sdc;
 	struct resource *res;
-	struct clk *mux, *pll6;
 	int ret, i;
 
 	sdc = devm_kzalloc(&pdev->dev, sizeof(*sdc), GFP_KERNEL);
@@ -886,28 +885,6 @@ static int sun6i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(sdc->clk);
 	}
 
-	mux = clk_get(NULL, "ahb1_mux");
-	if (IS_ERR(mux)) {
-		dev_err(&pdev->dev, "Couldn't get AHB1 Mux\n");
-		return PTR_ERR(mux);
-	}
-
-	pll6 = clk_get(NULL, "pll6");
-	if (IS_ERR(pll6)) {
-		dev_err(&pdev->dev, "Couldn't get PLL6\n");
-		clk_put(mux);
-		return PTR_ERR(pll6);
-	}
-
-	ret = clk_set_parent(mux, pll6);
-	clk_put(pll6);
-	clk_put(mux);
-
-	if (ret) {
-		dev_err(&pdev->dev, "Couldn't reparent AHB1 on PLL6\n");
-		return ret;
-	}
-
 	sdc->rstc = devm_reset_control_get(&pdev->dev, NULL);
 	if (IS_ERR(sdc->rstc)) {
 		dev_err(&pdev->dev, "No reset controller specified\n");
-- 
2.1.0
