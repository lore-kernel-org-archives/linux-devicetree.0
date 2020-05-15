Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26A6C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D70E206B6
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="fFgFqbgc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727796AbgEOIFk (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 04:05:40 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33172 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgEOIFk (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 04:05:40 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F85chO013217;
        Fri, 15 May 2020 03:05:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589529938;
        bh=MnK+vhU2JOfOI2c4AgNYggwCOAcQ/+eiqQj7qMjgCuo=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fFgFqbgcRxReAvCSlJ0LATRRSvejDdQuEl4AocII0A8yuf+SUSbAlGpOas4SfiBKE
         Hdji5N18YXef/n95x7BpbwiKNsk0fhgnBDbbSYJbLO+M3RTSfn8+8D578kBqtzbvY6
         4f4LSrbNTJolawsBXuP1xYufOi2NfUbsbRfontdE=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04F85cVU103143
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 03:05:38 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 03:05:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 03:05:37 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F85RTh069544;
        Fri, 15 May 2020 03:05:36 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <kishon@ti.com>
CC:     <robh+dt@kernel.org>, <b-liu@ti.com>, <devicetree@vger.kernel.org>,
        <vigneshr@ti.com>, <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 4/4] phy: omap-usb2-phy: disable PHY charger detect
Date:   Fri, 15 May 2020 11:05:18 +0300
Message-ID: <20200515080518.26870-5-rogerq@ti.com>
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

AM654x PG1.0 has a silicon bug that D+ is pulled high after POR, which
could cause enumeration failure with some USB hubs.  Disabling the
USB2_PHY Charger Detect function will put D+ into the normal state.

Using property "ti,dis-chg-det-quirk" in the DT usb2-phy node to
enable this workaround for AM654x PG1.0.

This addresses Silicon Errata:
i2075 - "USB2PHY: USB2PHY Charger Detect is Enabled by Default Without VBUS
Presence"

Signed-off-by: Bin Liu <b-liu@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 drivers/phy/ti/phy-omap-usb2.c | 35 +++++++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/ti/phy-omap-usb2.c b/drivers/phy/ti/phy-omap-usb2.c
index cb2dd3230fa7..8ab8b94511d4 100644
--- a/drivers/phy/ti/phy-omap-usb2.c
+++ b/drivers/phy/ti/phy-omap-usb2.c
@@ -26,6 +26,10 @@
 #define USB2PHY_ANA_CONFIG1		0x4c
 #define USB2PHY_DISCON_BYP_LATCH	BIT(31)
 
+#define USB2PHY_CHRG_DET			0x14
+#define USB2PHY_CHRG_DET_USE_CHG_DET_REG	BIT(29)
+#define USB2PHY_CHRG_DET_DIS_CHG_DET		BIT(28)
+
 /* SoC Specific USB2_OTG register definitions */
 #define AM654_USB2_OTG_PD		BIT(8)
 #define AM654_USB2_VBUS_DET_EN		BIT(5)
@@ -43,6 +47,7 @@
 #define OMAP_USB2_HAS_START_SRP			BIT(0)
 #define OMAP_USB2_HAS_SET_VBUS			BIT(1)
 #define OMAP_USB2_CALIBRATE_FALSE_DISCONNECT	BIT(2)
+#define OMAP_USB2_DISABLE_CHRG_DET		BIT(3)
 
 struct omap_usb {
 	struct usb_phy		phy;
@@ -236,6 +241,13 @@ static int omap_usb_init(struct phy *x)
 		omap_usb_writel(phy->phy_base, USB2PHY_ANA_CONFIG1, val);
 	}
 
+	if (phy->flags & OMAP_USB2_DISABLE_CHRG_DET) {
+		val = omap_usb_readl(phy->phy_base, USB2PHY_CHRG_DET);
+		val |= USB2PHY_CHRG_DET_USE_CHG_DET_REG |
+		       USB2PHY_CHRG_DET_DIS_CHG_DET;
+		omap_usb_writel(phy->phy_base, USB2PHY_CHRG_DET, val);
+	}
+
 	return 0;
 }
 
@@ -366,14 +378,12 @@ static int omap_usb2_probe(struct platform_device *pdev)
 	phy->mask		= phy_data->mask;
 	phy->power_on		= phy_data->power_on;
 	phy->power_off		= phy_data->power_off;
+	phy->flags		= phy_data->flags;
 
-	if (phy_data->flags & OMAP_USB2_CALIBRATE_FALSE_DISCONNECT) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		phy->phy_base = devm_ioremap_resource(&pdev->dev, res);
-		if (IS_ERR(phy->phy_base))
-			return PTR_ERR(phy->phy_base);
-		phy->flags |= OMAP_USB2_CALIBRATE_FALSE_DISCONNECT;
-	}
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	phy->phy_base = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(phy->phy_base))
+		return PTR_ERR(phy->phy_base);
 
 	phy->syscon_phy_power = syscon_regmap_lookup_by_phandle(node,
 							"syscon-phy-power");
@@ -405,6 +415,17 @@ static int omap_usb2_probe(struct platform_device *pdev)
 		}
 	}
 
+	/*
+	 * Errata i2075: USB2PHY: USB2PHY Charger Detect is Enabled by
+	 * Default Without VBUS Presence.
+	 *
+	 * AM654x SR1.0 has a silicon bug due to which D+ is pulled high after
+	 * POR, which could cause enumeration failure with some USB hubs.
+	 * Disabling the USB2_PHY Charger Detect function will put D+
+	 * into the normal state.
+	 */
+	if (of_property_read_bool(node, "ti,dis-chg-det-quirk"))
+		phy->flags |= OMAP_USB2_DISABLE_CHRG_DET;
 
 	phy->wkupclk = devm_clk_get(phy->dev, "wkupclk");
 	if (IS_ERR(phy->wkupclk)) {
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

