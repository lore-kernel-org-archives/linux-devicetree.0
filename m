Return-Path: <SRS0=lCsO=65=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A28C433E0
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A79AB206B6
	for <linux-devicetree@archiver.kernel.org>; Fri, 15 May 2020 08:05:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kgcVx03U"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727854AbgEOIFh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 15 May 2020 04:05:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:33168 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727107AbgEOIFh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 15 May 2020 04:05:37 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04F85a7E013212;
        Fri, 15 May 2020 03:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589529936;
        bh=V6kE9S02Onp1ogX9WwOLvadfz/1qUW8r6XVlVCR8Wec=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kgcVx03UFCE7/YuhN+Xw6H9UXPsZL7jEvW6bGYSvTLiQXFG6cPkrDfEk/szD4bQZy
         RJ3XpAJGo6QArSu1RIQBv1vpJaHN7l4mcteGO7F81uiHfGyQqRJsdBW+8R/d4IzcVd
         0NPJljnN/IkQzLkfKT0JSvCtnIN5b3Vb83p4OVqo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04F85a0f122400
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 15 May 2020 03:05:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 03:05:36 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 03:05:35 -0500
Received: from lta0400828a.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04F85RTg069544;
        Fri, 15 May 2020 03:05:34 -0500
From:   Roger Quadros <rogerq@ti.com>
To:     <kishon@ti.com>
CC:     <robh+dt@kernel.org>, <b-liu@ti.com>, <devicetree@vger.kernel.org>,
        <vigneshr@ti.com>, <nsekhar@ti.com>, Roger Quadros <rogerq@ti.com>
Subject: [PATCH 3/4] dt-binding: phy: ti,omap-usb2: Add quirk to disable charger detection
Date:   Fri, 15 May 2020 11:05:17 +0300
Message-ID: <20200515080518.26870-4-rogerq@ti.com>
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

Add "ti,dis-chg-det-quirk" property to disable the USB2_PHY Charger Detect
logic.

Signed-off-by: Roger Quadros <rogerq@ti.com>
---
 Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
index ecfb28f714ea..ec3e85a17bfa 100644
--- a/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,omap-usb2.yaml
@@ -54,6 +54,11 @@ properties:
       (deprecated) phandle of the control module used by PHY driver
       to power on the PHY. Use syscon-phy-power instead.
 
+  ti,dis-chg-det-quirk:
+    description:
+      if present, driver will disable charger detection logic.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

