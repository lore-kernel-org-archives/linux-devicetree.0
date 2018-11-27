Return-Path: <SRS0=g9Sy=OG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:26834
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728512AbeK0U2Q (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 27 Nov 2018 15:28:16 -0500
From: PETER CHEN <peter.chen@nxp.com>
Subject: [PATCH v3 1/4] usb: chipidea: add flag for imx hsic implementation
Date: Tue, 27 Nov 2018 09:30:53 +0000
Message-ID: <20181127092824.22756-2-peter.chen@nxp.com>
References: <20181127092824.22756-1-peter.chen@nxp.com>
In-Reply-To: <20181127092824.22756-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, PETER CHEN <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

NXP (Freecale) imx HSIC design has some special requirements, add
some flags at host code to handle them.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/host.c  | 17 +++++++++++++++++
 include/linux/usb/chipidea.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index d858a82c4f44..028a3574266a 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -170,6 +170,11 @@ static int host_start(struct ci_hdrc *ci)
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
@@ -218,6 +223,8 @@ void ci_hdrc_host_destroy(struct ci_hdrc *ci)
 static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
 {
 	struct ehci_hcd *ehci =3D hcd_to_ehci(hcd);
+	struct device *dev =3D hcd->self.controller;
+	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
 	int port;
 	u32 tmp;
=20
@@ -249,6 +256,16 @@ static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
 			 * It needs a short delay between set RS bit and PHCD.
 			 */
 			usleep_range(150, 200);
+			/*
+			 * Need to clear WKCN and WKOC for imx HSIC,
+			 * otherwise, there will be wakeup event.
+			 */
+			if (ci->platdata->flags & CI_HDRC_IMX_IS_HSIC) {
+				tmp =3D ehci_readl(ehci, reg);
+				tmp &=3D ~(PORT_WKDISC_E | PORT_WKCONN_E);
+				ehci_writel(ehci, tmp, reg);
+			}
+
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
