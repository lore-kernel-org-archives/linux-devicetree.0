From: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH v1 21/24] [media] fsl-viu: OF clock lookup,
 prepare before enable
Date: Tue, 16 Jul 2013 10:45:37 +0200
Message-ID: <1373964341-25228-1-git-send-email-gsi@denx.de>
References: <1373914074-20889-1-git-send-email-gsi@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1373914074-20889-1-git-send-email-gsi-ynQEQJNshbs@public.gmane.org>
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
To: linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Detlev Zundel <dzu-ynQEQJNshbs@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Kleine-Budde <mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Wolfgang Grandegger <wg-5Yr1BZd7O62+XT7JhA+gdA@public.gmane.org>, Mauro Carvalho Chehab <m.chehab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

device tree based clock lookup, must prepare clocks before enabling
them, unprepare after disable, error check in the clock setup

Signed-off-by: Gerhard Sittig <gsi-ynQEQJNshbs@public.gmane.org>
---
 drivers/media/platform/fsl-viu.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
index 221ec42..b95aa43 100644
--- a/drivers/media/platform/fsl-viu.c
+++ b/drivers/media/platform/fsl-viu.c
@@ -1582,8 +1582,11 @@ static int viu_of_probe(struct platform_device *op)
 		dev_err(&op->dev, "failed to find the clock module!\n");
 		ret = -ENODEV;
 		goto err_clk;
-	} else {
-		clk_enable(viu_dev->clk);
+	}
+	ret = clk_prepare_enable(viu_dev->clk);
+	if (ret) {
+		dev_err(&op->dev, "failed to enable the clock!\n");
+		goto err_clk_put;
 	}
 
 	/* reset VIU module */
@@ -1602,7 +1605,8 @@ static int viu_of_probe(struct platform_device *op)
 	return ret;
 
 err_irq:
-	clk_disable(viu_dev->clk);
+	clk_disable_unprepare(viu_dev->clk);
+err_clk_put:
 	clk_put(viu_dev->clk);
 err_clk:
 	video_unregister_device(viu_dev->vdev);
@@ -1626,7 +1630,7 @@ static int viu_of_remove(struct platform_device *op)
 	free_irq(dev->irq, (void *)dev);
 	irq_dispose_mapping(dev->irq);
 
-	clk_disable(dev->clk);
+	clk_disable_unprepare(dev->clk);
 	clk_put(dev->clk);
 
 	video_unregister_device(dev->vdev);
-- 
1.7.10.4
