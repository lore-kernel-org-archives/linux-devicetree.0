From: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: [PATCH v6 4/4] ARM: imx6ul: add "fsl,imx6ul-snvs-lpgpr" node
Date: Tue, 20 Jun 2017 06:40:59 +0200
Message-ID: <20170620044059.16113-5-o.rempel@pengutronix.de>
References: <20170620044059.16113-1-o.rempel@pengutronix.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170620044059.16113-1-o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Guy Shapiro <guy.shapiro-2HKgp+mgmS5l57MIdRCFDg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

snvs_lpgpr confirmed to work with imx6ul as well.

Signed-off-by: Oleksij Rempel <o.rempel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Tested-by: Guy Shapiro <guy.shapiro-2HKgp+mgmS5l57MIdRCFDg@public.gmane.org>
---
 Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt | 3 ++-
 arch/arm/boot/dts/imx6ul.dtsi                          | 4 ++++
 drivers/nvmem/snvs_lpgpr.c                             | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
index 21910fb3159f..d2a811f92d7f 100644
--- a/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
+++ b/Documentation/devicetree/bindings/nvmem/snvs-lpgpr.txt
@@ -5,8 +5,9 @@ This DT node should be represented as a sub-node of a "syscon",
 "simple-mfd" node.
 
 Required properties:
-- compatible: should be:
+- compatible: should be one of fallowing variants:
 	"fsl,imx6q-snvs-lpgpr" for Freescale i.MX6Q/D/DL/S
+	"fsl,imx6ul-snvs-lpgpr" for Freescale i.MX6UL
 
 Example:
 snvs: snvs@020cc000 {
diff --git a/arch/arm/boot/dts/imx6ul.dtsi b/arch/arm/boot/dts/imx6ul.dtsi
index b9d7d2d09402..df870abc28f5 100644
--- a/arch/arm/boot/dts/imx6ul.dtsi
+++ b/arch/arm/boot/dts/imx6ul.dtsi
@@ -624,6 +624,10 @@
 					linux,keycode = <KEY_POWER>;
 					wakeup-source;
 				};
+
+				snvs_lpgpr: snvs-lpgpr {
+					compatible = "fsl,imx6ul-snvs-lpgpr";
+				};
 			};
 
 			epit1: epit@020d0000 {
diff --git a/drivers/nvmem/snvs_lpgpr.c b/drivers/nvmem/snvs_lpgpr.c
index eb3369363e44..2b20a12918d8 100644
--- a/drivers/nvmem/snvs_lpgpr.c
+++ b/drivers/nvmem/snvs_lpgpr.c
@@ -136,6 +136,7 @@ static int snvs_lpgpr_remove(struct platform_device *pdev)
 
 static const struct of_device_id snvs_lpgpr_dt_ids[] = {
 	{ .compatible = "fsl,imx6q-snvs-lpgpr", .data = &snvs_lpgpr_cfg_imx6q },
+	{ .compatible = "fsl,imx6ul-snvs-lpgpr", .data = &snvs_lpgpr_cfg_imx6q },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, snvs_lpgpr_dt_ids);
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
