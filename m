From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [PATCH] of/rtc: rtc-mpc5121.c: Fix build failures
Date: Wed, 02 Jun 2010 14:08:39 -0600
Message-ID: <20100602200826.10331.23002.stgit@angua>
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
Cc: Paul Gortmaker <p_gortmaker-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>, Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fixes build errors caused by the:
- OF device_node pointer being moved into struct device
- removal of the match_table field from struct of_platform_driver

Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
CC: Paul Gortmaker <p_gortmaker-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
CC: Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
CC: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>
CC: Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
CC: Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>
CC: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
CC: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
---

I've applied this patch to my merge-devicetree branch

 drivers/rtc/rtc-mpc5121.c |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
index f0dbf9c..db5d8c4 100644
--- a/drivers/rtc/rtc-mpc5121.c
+++ b/drivers/rtc/rtc-mpc5121.c
@@ -279,7 +279,7 @@ static int __devinit mpc5121_rtc_probe(struct of_device *op,
 	if (!rtc)
 		return -ENOMEM;
 
-	rtc->regs = of_iomap(op->node, 0);
+	rtc->regs = of_iomap(op->dev.of_node, 0);
 	if (!rtc->regs) {
 		dev_err(&op->dev, "%s: couldn't map io space\n", __func__);
 		err = -ENOSYS;
@@ -290,7 +290,7 @@ static int __devinit mpc5121_rtc_probe(struct of_device *op,
 
 	dev_set_drvdata(&op->dev, rtc);
 
-	rtc->irq = irq_of_parse_and_map(op->node, 1);
+	rtc->irq = irq_of_parse_and_map(op->dev.of_node, 1);
 	err = request_irq(rtc->irq, mpc5121_rtc_handler, IRQF_DISABLED,
 						"mpc5121-rtc", &op->dev);
 	if (err) {
@@ -299,7 +299,7 @@ static int __devinit mpc5121_rtc_probe(struct of_device *op,
 		goto out_dispose;
 	}
 
-	rtc->irq_periodic = irq_of_parse_and_map(op->node, 0);
+	rtc->irq_periodic = irq_of_parse_and_map(op->dev.of_node, 0);
 	err = request_irq(rtc->irq_periodic, mpc5121_rtc_handler_upd,
 				IRQF_DISABLED, "mpc5121-rtc_upd", &op->dev);
 	if (err) {
@@ -365,9 +365,11 @@ static struct of_device_id mpc5121_rtc_match[] __devinitdata = {
 };
 
 static struct of_platform_driver mpc5121_rtc_driver = {
-	.owner = THIS_MODULE,
-	.name = "mpc5121-rtc",
-	.match_table = mpc5121_rtc_match,
+	.driver = {
+		.name = "mpc5121-rtc",
+		.owner = THIS_MODULE,
+		.of_match_table = mpc5121_rtc_match,
+	},
 	.probe = mpc5121_rtc_probe,
 	.remove = __devexit_p(mpc5121_rtc_remove),
 };
