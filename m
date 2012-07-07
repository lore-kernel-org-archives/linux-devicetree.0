From: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH v9 REBASE 7/9] usb: chipidea: permit driver bindings pass phy pointer
Date: Sat, 7 Jul 2012 22:56:46 +0800
Message-ID: <1341673008-29808-8-git-send-email-richard.zhao@freescale.com>
References: <1341673008-29808-1-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1341673008-29808-1-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linuxzsc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, mkl-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Sometimes, the driver bindings may know what phy they use.
For example, when using device tree, the usb controller may have a
phandler pointing to usb phy.

Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Acked-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Tested-by: Subodh Nijsure <snijsure-4jo+YWezP1RWk0Htik3J/w@public.gmane.org>
---
 drivers/usb/chipidea/ci.h    |    2 ++
 drivers/usb/chipidea/core.c  |    4 ++++
 drivers/usb/chipidea/host.c  |    1 +
 drivers/usb/chipidea/udc.c   |   11 +++++++----
 include/linux/usb/chipidea.h |    3 +++
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h
index 9655e35..d738603 100644
--- a/drivers/usb/chipidea/ci.h
+++ b/drivers/usb/chipidea/ci.h
@@ -160,6 +160,8 @@ struct ci13xxx {
 
 	struct ci13xxx_platform_data	*platdata;
 	int				vbus_active;
+	/* FIXME: some day, we'll not use global phy */
+	bool				global_phy;
 	struct usb_phy			*transceiver;
 	struct usb_hcd			*hcd;
 };
diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 39603d7..1083585 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -419,6 +419,10 @@ static int __devinit ci_hdrc_probe(struct platform_device *pdev)
 
 	ci->dev = dev;
 	ci->platdata = dev->platform_data;
+	if (ci->platdata->phy)
+		ci->transceiver = ci->platdata->phy;
+	else
+		ci->global_phy = true;
 
 	ret = hw_device_init(ci, base);
 	if (ret < 0) {
diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 4a4fdb8..ebff9f4 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -117,6 +117,7 @@ static int host_start(struct ci13xxx *ci)
 	hcd->has_tt = 1;
 
 	hcd->power_budget = ci->platdata->power_budget;
+	hcd->phy = ci->transceiver;
 
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = ci->hw_bank.cap;
diff --git a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c
index ba8284e..c7a032a 100644
--- a/drivers/usb/chipidea/udc.c
+++ b/drivers/usb/chipidea/udc.c
@@ -1685,7 +1685,8 @@ static int udc_start(struct ci13xxx *ci)
 
 	ci->gadget.ep0 = &ci->ep0in->ep;
 
-	ci->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
+	if (ci->global_phy)
+		ci->transceiver = usb_get_phy(USB_PHY_TYPE_USB2);
 
 	if (ci->platdata->flags & CI13XXX_REQUIRE_TRANSCEIVER) {
 		if (ci->transceiver == NULL) {
@@ -1729,7 +1730,8 @@ static int udc_start(struct ci13xxx *ci)
 remove_trans:
 	if (!IS_ERR_OR_NULL(ci->transceiver)) {
 		otg_set_peripheral(ci->transceiver->otg, &ci->gadget);
-		usb_put_phy(ci->transceiver);
+		if (ci->global_phy)
+			usb_put_phy(ci->transceiver);
 	}
 
 	dev_err(dev, "error = %i\n", retval);
@@ -1738,7 +1740,7 @@ remove_dbg:
 unreg_device:
 	device_unregister(&ci->gadget.dev);
 put_transceiver:
-	if (!IS_ERR_OR_NULL(ci->transceiver))
+	if (!IS_ERR_OR_NULL(ci->transceiver) && ci->global_phy)
 		usb_put_phy(ci->transceiver);
 free_pools:
 	dma_pool_destroy(ci->td_pool);
@@ -1772,7 +1774,8 @@ static void udc_stop(struct ci13xxx *ci)
 
 	if (!IS_ERR_OR_NULL(ci->transceiver)) {
 		otg_set_peripheral(ci->transceiver->otg, NULL);
-		usb_put_phy(ci->transceiver);
+		if (ci->global_phy)
+			usb_put_phy(ci->transceiver);
 	}
 	dbg_remove_files(&ci->gadget.dev);
 	device_unregister(&ci->gadget.dev);
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index be078f0..544825d 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -5,12 +5,15 @@
 #ifndef __LINUX_USB_CHIPIDEA_H
 #define __LINUX_USB_CHIPIDEA_H
 
+#include <linux/usb/otg.h>
+
 struct ci13xxx;
 struct ci13xxx_platform_data {
 	const char	*name;
 	/* offset of the capability registers */
 	uintptr_t	 capoffset;
 	unsigned	 power_budget;
+	struct usb_phy	*phy;
 	unsigned long	 flags;
 #define CI13XXX_REGS_SHARED		BIT(0)
 #define CI13XXX_REQUIRE_TRANSCEIVER	BIT(1)
-- 
1.7.9.5


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
