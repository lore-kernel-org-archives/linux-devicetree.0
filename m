Return-Path: <SRS0=g9Sy=OG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60054.outbound.protection.outlook.com ([40.107.6.54]:26834
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728512AbeK0U2V (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 27 Nov 2018 15:28:21 -0500
From: PETER CHEN <peter.chen@nxp.com>
Subject: [PATCH v3 3/4] usb: chipidea: host: override ehci->hub_control
Date: Tue, 27 Nov 2018 09:30:59 +0000
Message-ID: <20181127092824.22756-4-peter.chen@nxp.com>
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

The chipidea controller has some special requirements during
suspend/resume, override common ehci->hub_control to implement
it.

Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/host.c | 76 +++++++++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 028a3574266a..aa4756dab487 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -220,6 +220,81 @@ void ci_hdrc_host_destroy(struct ci_hdrc *ci)
 		host_stop(ci);
 }
=20
+/* The below code is based on tegra ehci driver */
+static int ci_ehci_hub_control(
+	struct usb_hcd	*hcd,
+	u16		typeReq,
+	u16		wValue,
+	u16		wIndex,
+	char		*buf,
+	u16		wLength
+)
+{
+	struct ehci_hcd	*ehci =3D hcd_to_ehci(hcd);
+	u32 __iomem	*status_reg;
+	u32		temp;
+	unsigned long	flags;
+	int		retval =3D 0;
+	struct device *dev =3D hcd->self.controller;
+	struct ci_hdrc *ci =3D dev_get_drvdata(dev);
+
+	status_reg =3D &ehci->regs->port_status[(wIndex & 0xff) - 1];
+
+	spin_lock_irqsave(&ehci->lock, flags);
+
+	if (typeReq =3D=3D SetPortFeature && wValue =3D=3D USB_PORT_FEAT_SUSPEND)=
 {
+		temp =3D ehci_readl(ehci, status_reg);
+		if ((temp & PORT_PE) =3D=3D 0 || (temp & PORT_RESET) !=3D 0) {
+			retval =3D -EPIPE;
+			goto done;
+		}
+
+		temp &=3D ~(PORT_RWC_BITS | PORT_WKCONN_E);
+		temp |=3D PORT_WKDISC_E | PORT_WKOC_E;
+		ehci_writel(ehci, temp | PORT_SUSPEND, status_reg);
+
+		/*
+		 * If a transaction is in progress, there may be a delay in
+		 * suspending the port. Poll until the port is suspended.
+		 */
+		if (ehci_handshake(ehci, status_reg, PORT_SUSPEND,
+						PORT_SUSPEND, 5000))
+			ehci_err(ehci, "timeout waiting for SUSPEND\n");
+
+		if (ci->platdata->flags & CI_HDRC_IMX_IS_HSIC) {
+			if (ci->platdata->notify_event)
+				ci->platdata->notify_event
+					(ci, CI_HDRC_IMX_HSIC_SUSPEND_EVENT);
+
+			temp =3D ehci_readl(ehci, status_reg);
+			temp &=3D ~(PORT_WKDISC_E | PORT_WKCONN_E);
+			ehci_writel(ehci, temp, status_reg);
+		}
+
+		set_bit((wIndex & 0xff) - 1, &ehci->suspended_ports);
+		goto done;
+	}
+
+	/*
+	 * After resume has finished, it needs do some post resume
+	 * operation for some SoCs.
+	 */
+	else if (typeReq =3D=3D ClearPortFeature &&
+					wValue =3D=3D USB_PORT_FEAT_C_SUSPEND) {
+
+		/* Make sure the resume has finished, it should be finished */
+		if (ehci_handshake(ehci, status_reg, PORT_RESUME, 0, 25000))
+			ehci_err(ehci, "timeout waiting for resume\n");
+	}
+
+	spin_unlock_irqrestore(&ehci->lock, flags);
+
+	/* Handle the hub control events here */
+	return ehci_hub_control(hcd, typeReq, wValue, wIndex, buf, wLength);
+done:
+	spin_unlock_irqrestore(&ehci->lock, flags);
+	return retval;
+}
 static int ci_ehci_bus_suspend(struct usb_hcd *hcd)
 {
 	struct ehci_hcd *ehci =3D hcd_to_ehci(hcd);
@@ -298,4 +373,5 @@ void ci_hdrc_host_driver_init(void)
 	ehci_init_driver(&ci_ehci_hc_driver, &ehci_ci_overrides);
 	orig_bus_suspend =3D ci_ehci_hc_driver.bus_suspend;
 	ci_ehci_hc_driver.bus_suspend =3D ci_ehci_bus_suspend;
+	ci_ehci_hc_driver.hub_control =3D ci_ehci_hub_control;
 }
--=20
2.14.1
