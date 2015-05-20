From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH v2 6/6] usb: chipidea: add work-around for Marvell HSIC PHY startup
Date: Tue, 19 May 2015 21:10:05 -0500
Message-ID: <1432087805-16671-7-git-send-email-robh@kernel.org>
References: <1432087805-16671-1-git-send-email-robh@kernel.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1432087805-16671-1-git-send-email-robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Marvell 28nm HSIC PHY requires the port to be forced to HS mode after
the port power is applied. This is done using the test mode in the PORTSC
register.

As HSIC is always HS, this work-around should be safe to do with all HSIC
PHYs. If not, a flag can also be added.

Signed-off-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Peter Chen <Peter.Chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 drivers/usb/chipidea/host.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 21fe1a3..6cf87b8 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -37,12 +37,14 @@ static int (*orig_bus_suspend)(struct usb_hcd *hcd);
 
 struct ehci_ci_priv {
 	struct regulator *reg_vbus;
+	struct ci_hdrc *ci;
 };
 
 static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
 {
 	struct ehci_hcd *ehci = hcd_to_ehci(hcd);
 	struct ehci_ci_priv *priv = (struct ehci_ci_priv *)ehci->priv;
+	struct ci_hdrc *ci = priv->ci;
 	struct device *dev = hcd->self.controller;
 	int ret = 0;
 	int port = HCS_N_PORTS(ehci->hcs_params);
@@ -64,6 +66,15 @@ static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable)
 			return ret;
 		}
 	}
+
+	if (enable && (ci->platdata->phy_mode == USBPHY_INTERFACE_MODE_HSIC)) {
+		/*
+		 * Marvell 28nm HSIC PHY requires forcing the port to HS mode.
+		 * As HSIC is always HS, this should be safe for others.
+		 */
+		hw_port_test_set(ci, 5);
+		hw_port_test_set(ci, 0);
+	}
 	return 0;
 };
 
@@ -112,6 +123,7 @@ static int host_start(struct ci_hdrc *ci)
 
 	priv = (struct ehci_ci_priv *)ehci->priv;
 	priv->reg_vbus = NULL;
+	priv->ci = ci;
 
 	if (ci->platdata->reg_vbus && !ci_otg_is_fsm_mode(ci)) {
 		if (ci->platdata->flags & CI_HDRC_TURN_VBUS_EARLY_ON) {
-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
