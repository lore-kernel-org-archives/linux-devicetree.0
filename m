From: Jason Liu <jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH V3 5/5] net/fec: add device tree matching support
Date: Wed,  9 Mar 2011 13:19:33 +0800
Message-ID: <1299647973-21845-6-git-send-email-jason.hui@linaro.org>
References: <1299647973-21845-1-git-send-email-jason.hui@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
In-Reply-To: <1299647973-21845-1-git-send-email-jason.hui-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.linaro.org/mailman/options/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/linaro-dev>
List-Post: <mailto:linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>
List-Help: <mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=help>
List-Subscribe: <http://lists.linaro.org/mailman/listinfo/linaro-dev>,
	<mailto:linaro-dev-request-cunTk1MwBs8s++Sfvej+rw@public.gmane.org?subject=subscribe>
Sender: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
Errors-To: linaro-dev-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jason Liu <r64343-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/net/fec.c |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/drivers/net/fec.c b/drivers/net/fec.c
index 02cdd71..fcb9768 100644
--- a/drivers/net/fec.c
+++ b/drivers/net/fec.c
@@ -45,6 +45,9 @@
 #include <linux/phy.h>
 #include <linux/fec.h>
 
+#include <linux/of.h>
+#include <linux/of_address.h>
+
 #include <asm/cacheflush.h>
 
 #ifndef CONFIG_ARM
@@ -1523,6 +1526,13 @@ static const struct dev_pm_ops fec_pm_ops = {
 };
 #endif
 
+#ifdef CONFIG_OF
+static struct of_device_id fec_matches[] = {
+	{ .compatible = "fsl,imx-fec" },
+	{},
+};
+#endif
+
 static struct platform_driver fec_driver = {
 	.driver	= {
 		.name	= DRIVER_NAME,
@@ -1530,6 +1540,9 @@ static struct platform_driver fec_driver = {
 #ifdef CONFIG_PM
 		.pm	= &fec_pm_ops,
 #endif
+#ifdef CONFIG_OF
+		.of_match_table = fec_matches,
+#endif
 	},
 	.id_table = fec_devtype,
 	.probe	= fec_probe,
-- 
1.7.1
