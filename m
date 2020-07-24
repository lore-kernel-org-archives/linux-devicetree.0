Return-Path: <SRS0=+aE9=BD=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BDCC433EC
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 14:19:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D70F20771
	for <linux-devicetree@archiver.kernel.org>; Fri, 24 Jul 2020 14:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kEOJusWL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbgGXOT0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 24 Jul 2020 10:19:26 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:52876 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726728AbgGXOTZ (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 24 Jul 2020 10:19:25 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06OEJI34085855;
        Fri, 24 Jul 2020 09:19:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595600358;
        bh=d4BSxSaAm9p1ZuFa72PTpOv0IV/Q3gEDfvYJRGY/7EY=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kEOJusWLpwXZ8n2gSZgKHkIdo1jlQoG58NxGuxyTMYuUuhoBYoKBkl77i247H2LNL
         BB4KomhGVG3CLrY0UlrVJMlNribm0rjw4B40zJ8IQAJEje92w2dOEV4zOZy7q6dzZo
         ZtivJhBIK1/+iAV4/YTxxNTaf24LUCt+ivvkoSXA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06OEJHPM023114
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Jul 2020 09:19:18 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 24
 Jul 2020 09:19:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 24 Jul 2020 09:19:17 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06OEIiXv016316;
        Fri, 24 Jul 2020 09:19:14 -0500
From:   Lokesh Vutla <lokeshvutla@ti.com>
To:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>
CC:     Thomas Gleixner <tglx@linutronix.de>, Nishanth Menon <nm@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v3 7/9] dt-bindings: irqchip: ti,sci-inta: Update docs to support different parent.
Date:   Fri, 24 Jul 2020 19:48:35 +0530
Message-ID: <20200724141837.4542-8-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200724141837.4542-1-lokeshvutla@ti.com>
References: <20200724141837.4542-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Drop the firmware related interrupt ranges and use the hardware specified
interrupt numbers within Interrupt Aggregator. This ensures interrupt
aggregator DT node need not assume any interrupt parent type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../interrupt-controller/ti,sci-inta.txt       | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
index 7841cb099e13..b14abec580a2 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-inta.txt
@@ -43,13 +43,14 @@ TISCI Interrupt Aggregator Node:
 - msi-controller:	Identifies the node as an MSI controller.
 - interrupt-parent:	phandle of irq parent.
 - ti,sci:		Phandle to TI-SCI compatible System controller node.
-- ti,sci-dev-id:	TISCI device ID of the Interrupt Aggregator.
-- ti,sci-rm-range-vint:	Array of TISCI subtype ids representing vints(inta
-			outputs) range within this INTA, assigned to the
-			requesting host context.
-- ti,sci-rm-range-global-event:	Array of TISCI subtype ids representing the
-			global events range reaching this IA and are assigned
-			to the requesting host context.
+- ti,sci-dev-id:	TISCI device id of interrupt controller.
+- ti,interrupt-ranges:	Set of triplets containing ranges that convert
+			the INTA output interrupt numbers to parent's
+			interrupt number. Each triplet has following entries:
+			- First entry specifies the base for vint
+			- Second entry specifies the base for parent irqs
+			- Third entry specifies the limit
+
 
 Example:
 --------
@@ -61,6 +62,5 @@ main_udmass_inta: interrupt-controller@33d00000 {
 	interrupt-parent = <&main_navss_intr>;
 	ti,sci = <&dmsc>;
 	ti,sci-dev-id = <179>;
-	ti,sci-rm-range-vint = <0x0>;
-	ti,sci-rm-range-global-event = <0x1>;
+	interrupt-ranges = <0 0 256>;
 };
-- 
2.27.0

