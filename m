Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F79DC433E2
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2C5E206F1
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hrmJDtRf"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726570AbgETMpc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 08:45:32 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47536 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726826AbgETMpc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 08:45:32 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KCjG1s067949;
        Wed, 20 May 2020 07:45:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589978716;
        bh=oK3hM/zFeC+mIJrz3R+My3WJaaX6WdrHZO4CX5W//aU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=hrmJDtRfyC4LGMler90+rfAyk7CMjZ3GFN0+XvPNj9ub7GUFFKjeiRcF2mtX4i8mM
         M+5+Hm4mEyLaDj1aQ6Ru81yR2FQSFrONdJvo8DrbF7QrxXRZ6g3S8ueoaQmDW71gz6
         Yt+7B1G515+axOBKj4GjfltZvAgWA2FoWN1xf1jc=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KCjGHc001304
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 07:45:16 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 07:45:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 07:45:15 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KCiuvO026764;
        Wed, 20 May 2020 07:45:12 -0500
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
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH 04/12] dt-bindings: irqchip: ti,sci-intr: Update bindings to drop the usage of gic as parent
Date:   Wed, 20 May 2020 18:14:46 +0530
Message-ID: <20200520124454.10532-5-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520124454.10532-1-lokeshvutla@ti.com>
References: <20200520124454.10532-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Drop the firmware related dt-bindings and use the hardware specified
interrupt numbers within Interrupt Router. This ensures interrupt router
DT node need not assume any interrupt parent type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 .../interrupt-controller/ti,sci-intr.txt      | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt b/Documentation/devicetree/bindings/interrupt-controller/ti,sci-intr.txt
index 1a8718f8855d..8b56b2de1c73 100644
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
 http://downloads.ti.com/tisci/esd/latest/2_tisci_msgs/rm/rm_irq.html
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
2.17.1

