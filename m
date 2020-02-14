Return-Path: <SRS0=lsCC=4C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7747C3B196
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 09:22:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BD9B7222C4
	for <linux-devicetree@archiver.kernel.org>; Fri, 14 Feb 2020 09:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nLRCzp+6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727965AbgBNJWl (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 14 Feb 2020 04:22:41 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:54628 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728422AbgBNJWl (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 14 Feb 2020 04:22:41 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01E9MSd8113443;
        Fri, 14 Feb 2020 03:22:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1581672148;
        bh=V4Een5bn49I3Vtd9T/lM+OWuxq0pVWOOl4j/tunVZT4=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nLRCzp+685YfDmiyy0gcW9n1sTd9Sw0g2k/cYqf13TmsncfTjAR2gMRUG4PuE7+ok
         ZIsgcpPVLpMYbNd6yk/LRp8xw8YvCZfc3+aEisNYtckqeyc1RWGxcvs8sXyj8kXPKZ
         M+0Az6a8Bo/lPGx8fiHZHcRJAmWy5wlttwk47Dt4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01E9MSUr090258
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 14 Feb 2020 03:22:28 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 14
 Feb 2020 03:22:28 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 14 Feb 2020 03:22:28 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01E9MJj7086345;
        Fri, 14 Feb 2020 03:22:24 -0600
From:   Jyri Sarha <jsarha@ti.com>
To:     <dri-devel@lists.freedesktop.org>, <ssantosh@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>
CC:     <tomi.valkeinen@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <peter.ujfalusi@ti.com>, <bparrot@ti.com>, <praneeth@ti.com>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH resend 1/2] ARM: dts: keystone-k2g: Add DSS node
Date:   Fri, 14 Feb 2020 11:22:14 +0200
Message-ID: <f029d3ae32e569b5e66f28bcb6824464a71bb0b6.1581671951.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581671951.git.jsarha@ti.com>
References: <cover.1581671951.git.jsarha@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add DT node for DSS. K2G has DSS version 6. Keystone family DSS are
somewhat different compered to the old OMAP family DSSes and the
binding looks different too.

Signed-off-by: Jyri Sarha <jsarha@ti.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Jyri Sarha <jsarha@ti.com>
---
 arch/arm/boot/dts/keystone-k2g.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index 1c833105d6c5..08ba31780baa 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -324,6 +324,28 @@
 			clock-names = "gpio";
 		};
 
+		dss: dss@02540000 {
+			compatible = "ti,k2g-dss";
+			reg =	<0x02540000 0x400>,
+				<0x02550000 0x1000>,
+				<0x02557000 0x1000>,
+				<0x0255a800 0x100>,
+				<0x0255ac00 0x100>;
+			reg-names = "cfg", "common", "vid1", "ovr1", "vp1";
+			clocks =	<&k2g_clks 0x2 0>,
+					<&k2g_clks 0x2 1>;
+			clock-names = "fck", "vp1";
+			interrupts = <GIC_SPI 247 IRQ_TYPE_EDGE_RISING>;
+
+			power-domains = <&k2g_pds 0x2>;
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			max-memory-bandwidth = <230000000>;
+		};
+
 		edma0: edma@2700000 {
 			compatible = "ti,k2g-edma3-tpcc", "ti,edma3-tpcc";
 			reg =	<0x02700000 0x8000>;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki. Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

