Return-Path: <SRS0=/AVO=NC=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr10066.outbound.protection.outlook.com ([40.107.1.66]:36974
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726784AbeJVOAC (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 22 Oct 2018 10:00:02 -0400
From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v2 1/4] usb: chipidea: add flag for imx hsic implementation
Date: Mon, 22 Oct 2018 05:42:56 +0000
Message-ID: <20181022054031.14027-2-peter.chen@nxp.com>
References: <20181022054031.14027-1-peter.chen@nxp.com>
In-Reply-To: <20181022054031.14027-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, Peter Chen <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

NXP (Freecale) imx HSIC design has some special requirements, add
some flags at host code to handle them.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/host.c  | 24 ++++++++++++++++++++++++
 include/linux/usb/chipidea.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index d858a82c4f44..d74a13d7c21c 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -28,6 +28,20 @@ struct ehci_ci_priv {
 	struct regulator *reg_vbus;
 };
=20
+/* This function is used to override WKCN, WKDN, and WKOC */
+static void ci_ehci_override_wakeup_flag(struct ehci_hcd *ehci,
+		u32 __iomem *reg, u32 flags, bool set)
+{
+	u32 val =3D ehci_readl(ehci, reg);
+
+	if (set)
+		val |=3D flags;
+	else
+		val &=3D ~flags;
+
+	ehci_writel(ehci, val, reg);
+}
+
 static int ehci_ci_portpower(struct usb_hcd *hcd, int portnum, bool enable=
)
 {
 	struct ehci_hcd *ehci =3D hcd_to_ehci(hcd);
@@ -170,6 +184,11 @@ static int host_start(struct ci_hdrc *ci)
 			otg->host =3D &hcd->self;
 			hcd->self.otg_port =3D 1;
 		}
+
+		if (ci->platdata->notify_event &&
+			(ci->platdata->flags & CI_HDRC_IMX_IS_HSIC))
+			ci->platdata->notify_event
+				(ci, CI_HDRC_IMX_HSIC_ACTIVE_EVENT);
 	}
=20
 	return ret;
@@ -218,6 +237,8 @@ void ci_hdrc_host_destroy(struct ci_hdrc *ci)
 static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
 {
 	struct ehci_hcd *ehci =3D hcd_to_ehci(hcd);
+	struct device *dev =3D hcd->self.controller;
+	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
 	int port;
 	u32 tmp;
=20
@@ -249,6 +270,9 @@ static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
 			 * It needs a short delay between set RS bit and PHCD.
 			 */
 			usleep_range(150, 200);
+			if (ci->platdata->flags & CI_HDRC_IMX_IS_HSIC)
+				ci_ehci_override_wakeup_flag(ehci, reg,
+					PORT_WKDISC_E | PORT_WKCONN_E, false);
 			break;
 		}
 	}
diff --git a/include/linux/usb/chipidea.h b/include/linux/usb/chipidea.h
index 63758c399e4e..911e05af671e 100644
--- a/include/linux/usb/chipidea.h
+++ b/include/linux/usb/chipidea.h
@@ -60,9 +60,12 @@ struct ci_hdrc_platform_data {
 #define CI_HDRC_OVERRIDE_RX_BURST	BIT(11)
 #define CI_HDRC_OVERRIDE_PHY_CONTROL	BIT(12) /* Glue layer manages phy */
 #define CI_HDRC_REQUIRES_ALIGNED_DMA	BIT(13)
+#define CI_HDRC_IMX_IS_HSIC		BIT(14)
 	enum usb_dr_mode	dr_mode;
 #define CI_HDRC_CONTROLLER_RESET_EVENT		0
 #define CI_HDRC_CONTROLLER_STOPPED_EVENT	1
+#define CI_HDRC_IMX_HSIC_ACTIVE_EVENT		2
+#define CI_HDRC_IMX_HSIC_SUSPEND_EVENT		3
 	int	(*notify_event) (struct ci_hdrc *ci, unsigned event);
 	struct regulator	*reg_vbus;
 	struct usb_otg_caps	ci_otg_caps;
--=20
2.14.1
