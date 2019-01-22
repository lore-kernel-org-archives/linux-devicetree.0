Return-Path: <SRS0=pK1f=P6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-eopbgr60052.outbound.protection.outlook.com ([40.107.6.52]:33024
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726284AbfAVKi3 (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 22 Jan 2019 05:38:29 -0500
From: Jun Li <jun.li@nxp.com>
Subject: [PATCH 2/2] dwc3: add power down clock scale setting when init core
Date: Tue, 22 Jan 2019 10:37:19 +0000
Message-ID: <1548152179-19472-2-git-send-email-jun.li@nxp.com>
References: <1548152179-19472-1-git-send-email-jun.li@nxp.com>
In-Reply-To: <1548152179-19472-1-git-send-email-jun.li@nxp.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: devicetree-owner@vger.kernel.org
To: "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "balbi@kernel.org" <balbi@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>
List-ID: <devicetree@vger.kernel.org>

Set the right power down clock scale if the property
"snps,power-down-scale" is specified.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 drivers/usb/dwc3/core.c | 15 +++++++++++++++
 drivers/usb/dwc3/core.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 88c80fc..c41c0b2 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -878,6 +878,19 @@ static void dwc3_set_incr_burst_type(struct dwc3 *dwc)
 	dwc3_writel(dwc->regs, DWC3_GSBUSCFG0, cfg);
 }
=20
+static void dwc3_set_power_down_clk_scale(struct dwc3 *dwc)
+{
+	u32 reg, scale;
+
+	if (!device_property_read_u32(dwc->dev, "snps,power-down-scale",
+				      &scale)) {
+		reg =3D dwc3_readl(dwc->regs, DWC3_GCTL);
+		reg &=3D ~(DWC3_GCTL_PWRDNSCALE_MASK);
+		reg |=3D DWC3_GCTL_PWRDNSCALE(scale);
+		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
+	}
+}
+
 /**
  * dwc3_core_init - Low-level initialization of DWC3 Core
  * @dwc: Pointer to our controller context structure
@@ -908,6 +921,8 @@ static int dwc3_core_init(struct dwc3 *dwc)
 			dwc->maximum_speed =3D USB_SPEED_HIGH;
 	}
=20
+	dwc3_set_power_down_clk_scale(dwc);
+
 	ret =3D dwc3_phy_setup(dwc);
 	if (ret)
 		goto err0;
diff --git a/drivers/usb/dwc3/core.h b/drivers/usb/dwc3/core.h
index 5bfb625..8cdaab3 100644
--- a/drivers/usb/dwc3/core.h
+++ b/drivers/usb/dwc3/core.h
@@ -216,6 +216,7 @@
=20
 /* Global Configuration Register */
 #define DWC3_GCTL_PWRDNSCALE(n)	((n) << 19)
+#define DWC3_GCTL_PWRDNSCALE_MASK	DWC3_GCTL_PWRDNSCALE(0x1fff)
 #define DWC3_GCTL_U2RSTECN	BIT(16)
 #define DWC3_GCTL_RAMCLKSEL(x)	(((x) & DWC3_GCTL_CLK_MASK) << 6)
 #define DWC3_GCTL_CLK_BUS	(0)
--=20
2.7.4
