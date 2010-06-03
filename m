From: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
Subject: [PATCH] of/crypto: crypto4xx_core.c: fix build breakage
Date: Thu,  3 Jun 2010 02:53:18 +0200
Message-ID: <1275526398-758-1-git-send-email-agust@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Herbert Xu <herbert-lOAM2aK0SrRLBo1qDEOMRrpzq4S04n8Q@public.gmane.org>, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixes build error caused by the OF device_node
pointer being moved into struct device

Signed-off-by: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
---
 drivers/crypto/amcc/crypto4xx_core.c |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/amcc/crypto4xx_core.c b/drivers/crypto/amcc/crypto4xx_core.c
index 9d65b37..983530b 100644
--- a/drivers/crypto/amcc/crypto4xx_core.c
+++ b/drivers/crypto/amcc/crypto4xx_core.c
@@ -1158,7 +1158,7 @@ static int __init crypto4xx_probe(struct of_device *ofdev,
 	struct device *dev = &ofdev->dev;
 	struct crypto4xx_core_device *core_dev;
 
-	rc = of_address_to_resource(ofdev->node, 0, &res);
+	rc = of_address_to_resource(ofdev->dev.of_node, 0, &res);
 	if (rc)
 		return -ENODEV;
 
@@ -1215,13 +1215,13 @@ static int __init crypto4xx_probe(struct of_device *ofdev,
 		     (unsigned long) dev);
 
 	/* Register for Crypto isr, Crypto Engine IRQ */
-	core_dev->irq = irq_of_parse_and_map(ofdev->node, 0);
+	core_dev->irq = irq_of_parse_and_map(ofdev->dev.of_node, 0);
 	rc = request_irq(core_dev->irq, crypto4xx_ce_interrupt_handler, 0,
 			 core_dev->dev->name, dev);
 	if (rc)
 		goto err_request_irq;
 
-	core_dev->dev->ce_base = of_iomap(ofdev->node, 0);
+	core_dev->dev->ce_base = of_iomap(ofdev->dev.of_node, 0);
 	if (!core_dev->dev->ce_base) {
 		dev_err(dev, "failed to of_iomap\n");
 		goto err_iomap;
-- 
1.7.0.4
