Return-Path: <SRS0=IqaF=OU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr00074.outbound.protection.outlook.com ([40.107.0.74]:49632
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729474AbeLKCJE (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 10 Dec 2018 21:09:04 -0500
From: Peter Chen <peter.chen@nxp.com>
Subject: [PATCH v5 3/4] usb: chipidea: host: override ehci->hub_control
Date: Tue, 11 Dec 2018 02:09:00 +0000
Message-ID: <20181211020624.9433-4-peter.chen@nxp.com>
References: <20181211020624.9433-1-peter.chen@nxp.com>
In-Reply-To: <20181211020624.9433-1-peter.chen@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Cc: dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>, "festevam@gmail.com" <festevam@gmail.com>, Peter Chen <peter.chen@nxp.com>
List-ID: <devicetree@vger.kernel.org>

The chipidea controller has some special requirements during
suspend/resume, override common ehci->hub_control to implement
it.

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
Signed-off-by: Peter Chen <peter.chen@nxp.com>
---
 drivers/usb/chipidea/host.c | 75 +++++++++++++++++++++++++++++++++++++++++=
++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 028a3574266a..b45ceb91c735 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -220,6 +220,80 @@ void ci_hdrc_host_destroy(struct ci_hdrc *ci)
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
+			PORT_SUSPEND, 5000))
+			ehci_err(ehci, "timeout waiting for SUSPEND\n");
+
+		if (ci->platdata->flags & CI_HDRC_IMX_IS_HSIC) {
+			if (ci->platdata->notify_event)
+				ci->platdata->notify_event(ci,
+					CI_HDRC_IMX_HSIC_SUSPEND_EVENT);
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
+		wValue =3D=3D USB_PORT_FEAT_C_SUSPEND) {
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
@@ -298,4 +372,5 @@ void ci_hdrc_host_driver_init(void)
 	ehci_init_driver(&ci_ehci_hc_driver, &ehci_ci_overrides);
 	orig_bus_suspend =3D ci_ehci_hc_driver.bus_suspend;
 	ci_ehci_hc_driver.bus_suspend =3D ci_ehci_bus_suspend;
+	ci_ehci_hc_driver.hub_control =3D ci_ehci_hub_control;
 }
--=20
2.14.1
