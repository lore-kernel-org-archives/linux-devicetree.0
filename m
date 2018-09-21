Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/5] Revert "usb: renesas_usbhs: add extcon notifier to set mode for non-otg channel"
Date: Fri, 21 Sep 2018 21:26:28 +0900
Message-Id: <1537532792-20376-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1537532792-20376-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

This reverts commit 8ada211d0383b72878582bd312b984a9eae62b30.

R-Car D3 can use OTG mode in fact. So, the commit doesn't need anymore.
In other words, like other R-Car Gen3 SoCs, R-Car D3 can change the mode
by using the phy-rcar-gen3-usb2 driver.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c |  9 ---------
 drivers/usb/renesas_usbhs/common.h |  1 -
 drivers/usb/renesas_usbhs/rcar3.c  | 11 -----------
 3 files changed, 21 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index d6c39ba..522cc09 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -677,15 +677,6 @@ static int usbhs_probe(struct platform_device *pdev)
 		break;
 	case USBHS_TYPE_RCAR_GEN3_WITH_PLL:
 		priv->pfunc = usbhs_rcar3_with_pll_ops;
-		if (!IS_ERR_OR_NULL(priv->edev)) {
-			priv->nb.notifier_call = priv->pfunc.notifier;
-			ret = devm_extcon_register_notifier(&pdev->dev,
-							    priv->edev,
-							    EXTCON_USB_HOST,
-							    &priv->nb);
-			if (ret < 0)
-				dev_err(&pdev->dev, "no notifier registered\n");
-		}
 		break;
 	case USBHS_TYPE_RZA1:
 		priv->pfunc = usbhs_rza1_ops;
diff --git a/drivers/usb/renesas_usbhs/common.h b/drivers/usb/renesas_usbhs/common.h
index 555b3e7..3777af8 100644
--- a/drivers/usb/renesas_usbhs/common.h
+++ b/drivers/usb/renesas_usbhs/common.h
@@ -257,7 +257,6 @@ struct usbhs_priv {
 	struct platform_device *pdev;
 
 	struct extcon_dev *edev;
-	struct notifier_block nb;
 
 	spinlock_t		lock;
 
diff --git a/drivers/usb/renesas_usbhs/rcar3.c b/drivers/usb/renesas_usbhs/rcar3.c
index d0ea4ff..b9a8453 100644
--- a/drivers/usb/renesas_usbhs/rcar3.c
+++ b/drivers/usb/renesas_usbhs/rcar3.c
@@ -112,16 +112,6 @@ static int usbhs_rcar3_get_id(struct platform_device *pdev)
 	return USBHS_GADGET;
 }
 
-static int usbhs_rcar3_notifier(struct notifier_block *nb, unsigned long event,
-				void *data)
-{
-	struct usbhs_priv *priv = container_of(nb, struct usbhs_priv, nb);
-
-	usbhs_rcar3_set_usbsel(priv, !!event);
-
-	return NOTIFY_DONE;
-}
-
 const struct renesas_usbhs_platform_callback usbhs_rcar3_ops = {
 	.power_ctrl = usbhs_rcar3_power_ctrl,
 	.get_id = usbhs_rcar3_get_id,
@@ -130,5 +120,4 @@ static int usbhs_rcar3_notifier(struct notifier_block *nb, unsigned long event,
 const struct renesas_usbhs_platform_callback usbhs_rcar3_with_pll_ops = {
 	.power_ctrl = usbhs_rcar3_power_and_pll_ctrl,
 	.get_id = usbhs_rcar3_get_id,
-	.notifier = usbhs_rcar3_notifier,
 };
-- 
1.9.1
