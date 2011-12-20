From: Dong Aisheng <b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [RFC PATCH v3 5/5] mmc: sdhci-esdhc-imx: using pinmux subsystem
Date: Wed, 21 Dec 2011 01:40:40 +0800
Message-ID: <1324402840-32451-6-git-send-email-b29396@freescale.com>
References: <1324402840-32451-1-git-send-email-b29396@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324402840-32451-1-git-send-email-b29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Signed-off-by: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Signed-off-by: Dong Aisheng <dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Chris Ball <cjb-2X9k7bc8m7Mdnm+yROfE0A@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Wolfram Sang <w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 drivers/mmc/host/sdhci-esdhc-imx.c |   20 ++++++++++++++++++++
 1 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index 4b976f0..4504136 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -24,6 +24,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/of_gpio.h>
+#include <linux/pinctrl/pinmux.h>
 #include <mach/esdhc.h>
 #include "sdhci-pltfm.h"
 #include "sdhci-esdhc.h"
@@ -68,6 +69,7 @@ struct pltfm_imx_data {
 	int flags;
 	u32 scratchpad;
 	enum imx_esdhc_type devtype;
+	struct pinmux *pmx;
 	struct esdhc_platform_data boarddata;
 };
 
@@ -439,6 +441,7 @@ static int __devinit sdhci_esdhc_imx_probe(struct platform_device *pdev)
 	struct clk *clk;
 	int err;
 	struct pltfm_imx_data *imx_data;
+	struct pinmux *pmx;
 
 	host = sdhci_pltfm_init(pdev, &sdhci_esdhc_imx_pdata);
 	if (IS_ERR(host))
@@ -466,6 +469,16 @@ static int __devinit sdhci_esdhc_imx_probe(struct platform_device *pdev)
 	clk_enable(clk);
 	pltfm_host->clk = clk;
 
+	pmx = pinmux_get(&pdev->dev, NULL);
+	if (IS_ERR(pmx)) {
+		err = PTR_ERR(pmx);
+		goto err_pmx_get;
+	}
+	err = pinmux_enable(pmx);
+	if (err)
+		goto err_pmx_enable;
+	imx_data->pmx = pmx;
+
 	if (!is_imx25_esdhc(imx_data))
 		host->quirks |= SDHCI_QUIRK_BROKEN_TIMEOUT_VAL;
 
@@ -558,6 +571,10 @@ no_card_detect_irq:
 		gpio_free(boarddata->wp_gpio);
 no_card_detect_pin:
 no_board_data:
+	pinmux_disable(imx_data->pmx);
+err_pmx_enable:
+	pinmux_put(imx_data->pmx);
+err_pmx_get:
 	clk_disable(pltfm_host->clk);
 	clk_put(pltfm_host->clk);
 err_clk_get:
@@ -585,6 +602,9 @@ static int __devexit sdhci_esdhc_imx_remove(struct platform_device *pdev)
 		gpio_free(boarddata->cd_gpio);
 	}
 
+	pinmux_disable(imx_data->pmx);
+	pinmux_put(imx_data->pmx);
+
 	clk_disable(pltfm_host->clk);
 	clk_put(pltfm_host->clk);
 	kfree(imx_data);
-- 
1.7.0.4
