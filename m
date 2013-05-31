From: Hebbar Gururaja <gururaja.hebbar-l0cyMroinI0@public.gmane.org>
Subject: [PATCH 01/11] pinctrl: single: adopt pinctrl sleep mode management
Date: Fri, 31 May 2013 15:43:01 +0530
Message-ID: <1369995191-20855-2-git-send-email-gururaja.hebbar@ti.com>
References: <1369995191-20855-1-git-send-email-gururaja.hebbar@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
In-Reply-To: <1369995191-20855-1-git-send-email-gururaja.hebbar-l0cyMroinI0@public.gmane.org>
List-Unsubscribe: <http://linux.davincidsp.com/mailman/options/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=unsubscribe>
List-Archive: <http://linux.davincidsp.com/pipermail/davinci-linux-open-source>
List-Post: <mailto:davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
List-Help: <mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=help>
List-Subscribe: <http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source>,
	<mailto:davinci-linux-open-source-request-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org?subject=subscribe>
Sender: <davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org>
Errors-To: davinci-linux-open-source-bounces-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org
To: khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org
Cc: davinci-linux-open-source-VycZQUHpC/PFrsHnngEfi1aTQe2KTcn/@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Make pinctrl-single able to handle suspend/resume events and change
hogged pins states accordingly.

Signed-off-by: Hebbar Gururaja <gururaja.hebbar-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
:100644 100644 b9fa046... bfd4f6a... M	drivers/pinctrl/pinctrl-single.c
 drivers/pinctrl/pinctrl-single.c |   27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-single.c b/drivers/pinctrl/pinctrl-single.c
index b9fa046..bfd4f6a 100644
--- a/drivers/pinctrl/pinctrl-single.c
+++ b/drivers/pinctrl/pinctrl-single.c
@@ -1346,6 +1346,29 @@ static int pcs_add_gpio_func(struct device_node *node, struct pcs_device *pcs)
 	return ret;
 }
 
+static int pinctrl_single_suspend(struct platform_device *pdev,
+					pm_message_t state)
+{
+	struct pcs_device *pcs;
+
+	pcs = platform_get_drvdata(pdev);
+	if (!pcs)
+		return -EINVAL;
+
+	return pinctrl_force_sleep(pcs->pctl);
+}
+
+static int pinctrl_single_resume(struct platform_device *pdev)
+{
+	struct pcs_device *pcs;
+
+	pcs = platform_get_drvdata(pdev);
+	if (!pcs)
+		return -EINVAL;
+
+	return pinctrl_force_default(pcs->pctl);
+}
+
 static int pcs_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1494,6 +1517,10 @@ static struct platform_driver pcs_driver = {
 		.name		= DRIVER_NAME,
 		.of_match_table	= pcs_of_match,
 	},
+#ifdef CONFIG_PM
+	.suspend = pinctrl_single_suspend,
+	.resume = pinctrl_single_resume,
+#endif
 };
 
 module_platform_driver(pcs_driver);
-- 
1.7.9.5
