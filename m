Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA69C433DF
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C72B206B6
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Cn3ttORp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727902AbgEOIFe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 04:05:34 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:41994 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgEOIFe (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 04:05:34 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F85WI4016826;
        Fri, 15 May 2020 03:05:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589529932;
        bh=QREGSWut0iRDofW4Y9qg2+oO6wD3Lw3XUJD5ZmJuNrQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Cn3ttORp6+UXOJGIkjV10smqqls7HKnVR9hTZpXmtQ6eBUP4o6NL2Ni1s3mk74FpY
         F6kTuNs8fhXZGzcMHRfB38PEeg8KUY9c7A29c5XQxmBTpiThzeUH1S2cion92f+3VA
         rxIZvp+IKsoq99yePHAkkZfiQfwWKBuMiVoeGEKY=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F85W2R093480;
        Fri, 15 May 2020 03:05:32 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 03:05:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 03:05:31 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F85RTe069544;
        Fri, 15 May 2020 03:05:30 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <kishon@ti.com>
CC:     <robh+dt@kernel.org>, <b-liu@ti.com>, <devicetree@vger.kernel.org>,
        <vigneshr@ti.com>, <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 1/4] phy: omap-usb2: Clean up exported header
Date:   Fri, 15 May 2020 11:05:15 +0300
Message-ID: <20200515080518.26870-2-rogerq@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515080518.26870-1-rogerq@ti.com>
References: <20200515080518.26870-1-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Move private definitions from header to phy-omap-usb2.c file.
Get rid of unused data structures usb_dpll_params and omap_usb_phy_type.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/phy/ti/phy-omap-usb2.c | 60 +++++++++++++++++++++++++++--
 include/linux/phy/omap_usb.h   | 69 +---------------------------------
 2 files changed, 58 insertions(+), 71 deletions(-)

diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
index 3d74629d7423..cb2dd3230fa7 100644
--- a/drivers/phy/ti/phy-omap-usb2.c
+++ b/drivers/phy/ti/phy-omap-usb2.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * omap-usb2.c - USB PHY, talking to musb controller in OMAP.
+ * omap-usb2.c - USB PHY, talking to USB controller on TI SoCs.
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2012-2020 Texas Instruments Incorporated - http://www.ti.com
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
  */
 
@@ -23,13 +23,65 @@
 #include <linux/regmap.h>
 #include <linux/of_platform.h>
 
-#define USB2PHY_DISCON_BYP_LATCH (1 << 31)
-#define USB2PHY_ANA_CONFIG1 0x4c
+#define USB2PHY_ANA_CONFIG1		0x4c
+#define USB2PHY_DISCON_BYP_LATCH	BIT(31)
 
+/* SoC Specific USB2_OTG register definitions */
 #define AM654_USB2_OTG_PD		BIT(8)
 #define AM654_USB2_VBUS_DET_EN		BIT(5)
 #define AM654_USB2_VBUSVALID_DET_EN	BIT(4)
 
+#define OMAP_DEV_PHY_PD		BIT(0)
+#define OMAP_USB2_PHY_PD	BIT(28)
+
+#define AM437X_USB2_PHY_PD		BIT(0)
+#define AM437X_USB2_OTG_PD		BIT(1)
+#define AM437X_USB2_OTGVDET_EN		BIT(19)
+#define AM437X_USB2_OTGSESSEND_EN	BIT(20)
+
+/* Driver Flags */
+#define OMAP_USB2_HAS_START_SRP			BIT(0)
+#define OMAP_USB2_HAS_SET_VBUS			BIT(1)
+#define OMAP_USB2_CALIBRATE_FALSE_DISCONNECT	BIT(2)
+
+struct omap_usb {
+	struct usb_phy		phy;
+	struct phy_companion	*comparator;
+	void __iomem		*pll_ctrl_base;
+	void __iomem		*phy_base;
+	struct device		*dev;
+	struct device		*control_dev;
+	struct clk		*wkupclk;
+	struct clk		*optclk;
+	u8			flags;
+	struct regmap		*syscon_phy_power; /* ctrl. reg. acces */
+	unsigned int		power_reg; /* power reg. index within syscon */
+	u32			mask;
+	u32			power_on;
+	u32			power_off;
+};
+
+#define	phy_to_omapusb(x)	container_of((x), struct omap_usb, phy)
+
+struct usb_phy_data {
+	const char *label;
+	u8 flags;
+	u32 mask;
+	u32 power_on;
+	u32 power_off;
+};
+
+static inline u32 omap_usb_readl(void __iomem *addr, unsigned int offset)
+{
+	return __raw_readl(addr + offset);
+}
+
+static inline void omap_usb_writel(void __iomem *addr, unsigned int offset,
+				   u32 data)
+{
+	__raw_writel(data, addr + offset);
+}
+
 /**
  * omap_usb2_set_comparator - links the comparator present in the sytem with
  *	this phy
diff --git a/include/linux/phy/omap_usb.h b/include/linux/phy/omap_usb.h
index 5973a6313529..e23b52df93ec 100644
--- a/include/linux/phy/omap_usb.h
+++ b/include/linux/phy/omap_usb.h
@@ -2,68 +2,14 @@
 /*
  * omap_usb.h -- omap usb2 phy header file
  *
- * Copyright (C) 2012 Texas Instruments Incorporated - http://www.ti.com
+ * Copyright (C) 2012-2020 Texas Instruments Incorporated - http://www.ti.com
  * Author: Kishon Vijay Abraham I <kishon@ti.com>
  */
 
 #ifndef __DRIVERS_OMAP_USB2_H
 #define __DRIVERS_OMAP_USB2_H
 
-#include <linux/io.h>
-#include <linux/usb/otg.h>
-
-struct usb_dpll_params {
-	u16	m;
-	u8	n;
-	u8	freq:3;
-	u8	sd;
-	u32	mf;
-};
-
-enum omap_usb_phy_type {
-	TYPE_USB2,    /* USB2_PHY, power down in CONTROL_DEV_CONF */
-	TYPE_DRA7USB2, /* USB2 PHY, power and power_aux e.g. DRA7 */
-	TYPE_AM437USB2, /* USB2 PHY, power e.g. AM437x */
-};
-
-struct omap_usb {
-	struct usb_phy		phy;
-	struct phy_companion	*comparator;
-	void __iomem		*pll_ctrl_base;
-	void __iomem		*phy_base;
-	struct device		*dev;
-	struct device		*control_dev;
-	struct clk		*wkupclk;
-	struct clk		*optclk;
-	u8			flags;
-	enum omap_usb_phy_type	type;
-	struct regmap		*syscon_phy_power; /* ctrl. reg. acces */
-	unsigned int		power_reg; /* power reg. index within syscon */
-	u32			mask;
-	u32			power_on;
-	u32			power_off;
-};
-
-struct usb_phy_data {
-	const char *label;
-	u8 flags;
-	u32 mask;
-	u32 power_on;
-	u32 power_off;
-};
-
-/* Driver Flags */
-#define OMAP_USB2_HAS_START_SRP (1 << 0)
-#define OMAP_USB2_HAS_SET_VBUS (1 << 1)
-#define OMAP_USB2_CALIBRATE_FALSE_DISCONNECT (1 << 2)
-
-#define OMAP_DEV_PHY_PD		BIT(0)
-#define OMAP_USB2_PHY_PD	BIT(28)
-
-#define AM437X_USB2_PHY_PD		BIT(0)
-#define AM437X_USB2_OTG_PD		BIT(1)
-#define AM437X_USB2_OTGVDET_EN		BIT(19)
-#define AM437X_USB2_OTGSESSEND_EN	BIT(20)
+#include <linux/usb/phy_companion.h>
 
 #define	phy_to_omapusb(x)	container_of((x), struct omap_usb, phy)
 
@@ -76,15 +22,4 @@ static inline int omap_usb2_set_comparator(struct phy_companion *comparator)
 }
 #endif
 
-static inline u32 omap_usb_readl(void __iomem *addr, unsigned offset)
-{
-	return __raw_readl(addr + offset);
-}
-
-static inline void omap_usb_writel(void __iomem *addr, unsigned offset,
-	u32 data)
-{
-	__raw_writel(data, addr + offset);
-}
-
 #endif /* __DRIVERS_OMAP_USB_H */
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

