Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB4CC35276
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7A3C221E2
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="h9U/r8Hb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728428AbgHFHt1 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:49:27 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:34622 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728795AbgHFHtH (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:49:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767mnB0006003;
        Thu, 6 Aug 2020 02:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700129;
        bh=XnlZ6qHRVkyju0+M8x1YPSI8NMAYN5RVwC6CFVBol58=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=h9U/r8HbLLVZH1d0OZ1riPqSt0OVso5rj56tf7vKOKnizixQqn1fw2+BE8OMNiTmR
         xKk2LbNVg+SbCe6h3vG/Su62vtumcAhK1j9RsfXMvbODr9FfnZaI6RnDbIRu5gpv4I
         9S+Wq/7Hjg7RsWz3twhB4Kjoc/oBYffowmf4fdhE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767mnhI017862
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:48:49 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:48:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:48:49 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSYr051454;
        Thu, 6 Aug 2020 02:48:45 -0500
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
        Suman Anna <s-anna@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 04/13] dt-bindings: irqchip: ti,sci-intr: Update bindings to drop the usage of gic as parent
Date:   Thu, 6 Aug 2020 13:18:17 +0530
Message-ID: <20200806074826.24607-5-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806074826.24607-1-lokeshvutla@ti.com>
References: <20200806074826.24607-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Drop the firmware related dt-bindings and use the hardware specified
interrupt numbers within Interrupt Router. This ensures interrupt router
DT node need not assume any interrupt parent type.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../interrupt-controller/ti,sci-intr.txt      | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
index 178fca08278f..c7046f3da201 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
@@ -44,15 +44,17 @@ Required Properties:
 			4: If intr supports level triggered interrupts.
 - interrupt-controller:	Identifies the node as an interrupt controller
 - #interrupt-cells:	Specifies the number of cells needed to encode an
-			interrupt source. The value should be 2.
-			First cell should contain the TISCI device ID of source
-			Second cell should contain the interrupt source offset
-			within the device.
+			interrupt source. The value should be 1.
+			First cell should contain interrupt router input number
+			as specified by hardware.
 - ti,sci:		Phandle to TI-SCI compatible System controller node.
-- ti,sci-dst-id:	TISCI device ID of the destination IRQ controller.
-- ti,sci-rm-range-girq:	Array of TISCI subtype ids representing the host irqs
-			assigned to this interrupt router. Each subtype id
-			corresponds to a range of host irqs.
+- ti,sci-dev-id:	TISCI device id of interrupt controller.
+- ti,interrupt-ranges:	Set of triplets containing ranges that convert
+			the INTR output interrupt numbers to parent's
+			interrupt number. Each triplet has following entries:
+			- First entry specifies the base for intr output irq
+			- Second entry specifies the base for parent irqs
+			- Third entry specifies the limit
 
 For more details on TISCI IRQ resource management refer:
 https://downloads.ti.com/tisci/esd/latest/2_tisci_msgs/rm/rm_irq.html
@@ -62,21 +64,20 @@ Example:
 The following example demonstrates both interrupt router node and the consumer
 node(main gpio) on the AM654 SoC:
 
-main_intr: interrupt-controller0 {
+main_gpio_intr: interrupt-controller0 {
 	compatible = "ti,sci-intr";
 	ti,intr-trigger-type = <1>;
 	interrupt-controller;
 	interrupt-parent = <&gic500>;
-	#interrupt-cells = <2>;
+	#interrupt-cells = <1>;
 	ti,sci = <&dmsc>;
-	ti,sci-dst-id = <56>;
-	ti,sci-rm-range-girq = <0x1>;
+	ti,sci-dev-id = <131>;
+	ti,interrupt-ranges = <0 360 32>;
 };
 
 main_gpio0: gpio@600000 {
 	...
-	interrupt-parent = <&main_intr>;
-	interrupts = <57 256>, <57 257>, <57 258>,
-		     <57 259>, <57 260>, <57 261>;
+	interrupt-parent = <&main_gpio_intr>;
+	interrupts = <192>, <193>, <194>, <195>, <196>, <197>;
 	...
 };
-- 
2.27.0

