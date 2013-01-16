From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH 5/7] staging: drm/imx: Use SRC to reset IPU
Date: Wed, 16 Jan 2013 17:13:05 +0100
Message-ID: <1358352787-15441-6-git-send-email-p.zabel@pengutronix.de>
References: <1358352787-15441-1-git-send-email-p.zabel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1358352787-15441-1-git-send-email-p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Request the System Reset Controller to reset the IPU if
specified via device tree phandle.

Signed-off-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
---
 .../devicetree/bindings/staging/imx-drm/fsl-imx-drm.txt    |    3 +++
 drivers/staging/imx-drm/ipu-v3/ipu-common.c                |   12 +++++++++---
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.txt b/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.txt
index 07654f0..f769857 100644
--- a/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.txt
+++ b/Documentation/devicetree/bindings/staging/imx-drm/fsl-imx-drm.txt
@@ -8,6 +8,8 @@ Required properties:
 - interrupts: Should contain sync interrupt and error interrupt,
   in this order.
 - #crtc-cells: 1, See below
+- resets: phandle pointing to the system reset controller and
+          reset line index, see reset/fsl,imx-src.txt for details
 
 example:
 
@@ -16,6 +18,7 @@ ipu: ipu@18000000 {
 	compatible = "fsl,imx53-ipu";
 	reg = <0x18000000 0x080000000>;
 	interrupts = <11 10>;
+	resets = <&src 2>;
 };
 
 Parallel display support
diff --git a/drivers/staging/imx-drm/ipu-v3/ipu-common.c b/drivers/staging/imx-drm/ipu-v3/ipu-common.c
index f7059cd..6a6211d 100644
--- a/drivers/staging/imx-drm/ipu-v3/ipu-common.c
+++ b/drivers/staging/imx-drm/ipu-v3/ipu-common.c
@@ -16,6 +16,7 @@
 #include <linux/export.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/reset.h>
 #include <linux/platform_device.h>
 #include <linux/err.h>
 #include <linux/spinlock.h>
@@ -660,7 +661,7 @@ int ipu_idmac_disable_channel(struct ipuv3_channel *channel)
 }
 EXPORT_SYMBOL_GPL(ipu_idmac_disable_channel);
 
-static int ipu_reset(struct ipu_soc *ipu)
+static int ipu_memory_reset(struct ipu_soc *ipu)
 {
 	unsigned long timeout;
 
@@ -1104,7 +1105,12 @@ static int ipu_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_failed_irq;
 
-	ret = ipu_reset(ipu);
+	ret = device_reset(&pdev->dev);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to reset: %d\n", ret);
+		goto out_failed_reset;
+	}
+	ret = ipu_memory_reset(ipu);
 	if (ret)
 		goto out_failed_reset;
 
@@ -1130,8 +1136,8 @@ static int ipu_probe(struct platform_device *pdev)
 failed_add_clients:
 	ipu_submodules_exit(ipu);
 failed_submodules_init:
-	ipu_irq_exit(ipu);
 out_failed_reset:
+	ipu_irq_exit(ipu);
 out_failed_irq:
 	clk_disable_unprepare(ipu->clk);
 failed_clk_get:
-- 
1.7.10.4
