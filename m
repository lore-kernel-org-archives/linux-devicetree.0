From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>
Subject: [PATCH] pinctrl: pinctrl-single: Convert to devm_ioremap_resource()
Date: Tue, 27 Aug 2013 12:35:34 +0530
Message-ID: <1377587134-8967-1-git-send-email-manishv.b@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces+gld-davinci-linux-open-source=gmane.org-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "Vishwanathrao Badarkhe, Manish" <manishv.b-l0cyMroinI0@public.gmane.org>

Convert devm_request_mem_region() and devm_ioremap() to
devm_ioremap_resource() which provides more consistent
error handling to manage resource.

Signed-off-by: Vishwanathrao Badarkhe, Manish <manishv.b-l0cyMroinI0@public.gmane.org>
---
:100644 100644 7323cca... b0fef18... M	drivers/pinctrl/pinctrl-single.c
 drivers/pinctrl/pinctrl-single.c |   21 +++------------------
 1 file changed, 3 insertions(+), 18 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index 7323cca..b0fef18 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1556,24 +1556,9 @@ static int pcs_probe(struct platform_device *pdev)
 						  "pinctrl-single,bit-per-mux");
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(pcs->dev, "could not get resource\n");
-		return -ENODEV;
-	}
-
-	pcs->res = devm_request_mem_region(pcs->dev, res->start,
-			resource_size(res), DRIVER_NAME);
-	if (!pcs->res) {
-		dev_err(pcs->dev, "could not get mem_region\n");
-		return -EBUSY;
-	}
-
-	pcs->size = resource_size(pcs->res);
-	pcs->base = devm_ioremap(pcs->dev, pcs->res->start, pcs->size);
-	if (!pcs->base) {
-		dev_err(pcs->dev, "could not ioremap\n");
-		return -ENODEV;
-	}
+	pcs->base = devm_ioremap_resource(pcs->dev, res);
+	if (IS_ERR(pcs->base))
+		return PTR_ERR(pcs->base);
 
 	INIT_RADIX_TREE(&pcs->pgtree, GFP_KERNEL);
 	INIT_RADIX_TREE(&pcs->ftree, GFP_KERNEL);
-- 
1.7.9.5
