From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: [PATCH v2 2/6] hwrng: atmel: use clk_prepapre_enable/_disable_unprepare
Date: Wed,  1 Oct 2014 09:13:59 +0200
Message-ID: <1412147639-4796-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1412093987-30241-3-git-send-email-boris.brezillon@free-electrons.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1412093987-30241-3-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Andrew Victor <linux@maxim.org.za>, Peter Korsgaard <jacmet@sunsite.dk>, Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Use clk_prepare_enable/_disable_unprepare instead of clk_enable/disable
to work properly with the CCF.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
Acked-by: Peter Korsgaard <peter@korsgaard.com>
---
Changes since v1:
- fix typo in commit message

 drivers/char/hw_random/atmel-rng.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
index 851bc7e..644ec48 100644
--- a/drivers/char/hw_random/atmel-rng.c
+++ b/drivers/char/hw_random/atmel-rng.c
@@ -67,7 +67,7 @@ static int atmel_trng_probe(struct platform_device *pdev)
 	if (IS_ERR(trng->clk))
 		return PTR_ERR(trng->clk);
 
-	ret = clk_enable(trng->clk);
+	ret = clk_prepare_enable(trng->clk);
 	if (ret)
 		return ret;
 
@@ -95,7 +95,7 @@ static int atmel_trng_remove(struct platform_device *pdev)
 	hwrng_unregister(&trng->rng);
 
 	writel(TRNG_KEY, trng->base + TRNG_CR);
-	clk_disable(trng->clk);
+	clk_disable_unprepare(trng->clk);
 
 	return 0;
 }
@@ -105,7 +105,7 @@ static int atmel_trng_suspend(struct device *dev)
 {
 	struct atmel_trng *trng = dev_get_drvdata(dev);
 
-	clk_disable(trng->clk);
+	clk_disable_unprepare(trng->clk);
 
 	return 0;
 }
@@ -114,7 +114,7 @@ static int atmel_trng_resume(struct device *dev)
 {
 	struct atmel_trng *trng = dev_get_drvdata(dev);
 
-	return clk_enable(trng->clk);
+	return clk_prepare_enable(trng->clk);
 }
 
 static const struct dev_pm_ops atmel_trng_pm_ops = {
-- 
1.9.1
