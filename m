Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC11C433F1
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:38:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6941920714
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:38:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="oQOhdnht"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgGYQiD (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 12:38:03 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:41682 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYQiC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 12:38:02 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PGbv9d088688;
        Sat, 25 Jul 2020 11:37:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595695077;
        bh=gjnGcczhsR6D66k3Zb6TBPSYtQ+3WexiORvyEXw2dkI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oQOhdnht6uBKlzO66ZLz6TyEj038aOzYadosf1Dvv1lm41yTLqlo4INyfQf+Yv2w9
         2D8Csvry5wskndO5iz9Y1KS7wOzeLzfAs8J2Swjwt2ZszlJhDsf9IDq/WSvRwPVS1a
         qFcj+jVwCh4QQOQb+xLi8r0HIfLRd29TRHec/YX8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGbvxd119512;
        Sat, 25 Jul 2020 11:37:57 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 11:37:56 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 11:37:56 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGbCo3124636;
        Sat, 25 Jul 2020 11:37:53 -0500
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
Subject: [PATCH v4 09/10] irqchip/ti-sci-inta: Do not store TISCI device id in platform device id field
Date:   Sat, 25 Jul 2020 22:06:59 +0530
Message-ID: <20200725163700.20583-10-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200725163700.20583-1-lokeshvutla@ti.com>
References: <20200725163700.20583-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Even though DT doesn't make active use of id field in platform_device, we cannot
hijack it to store TISCI device id. So create a field in struct ti_sci_inta
for storing TISCI id and drop usage of id field in platform_device.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/irqchip/irq-ti-sci-inta.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index 7e3ebf6ed2cd..f2d2f29991b9 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -83,6 +83,7 @@ struct ti_sci_inta_vint_desc {
  * @vint_mutex:		Mutex to protect vint_list
  * @base:		Base address of the memory mapped IO registers
  * @pdev:		Pointer to platform device.
+ * @ti_sci_id:		TI-SCI device identifier
  */
 struct ti_sci_inta_irq_domain {
 	const struct ti_sci_handle *sci;
@@ -93,6 +94,7 @@ struct ti_sci_inta_irq_domain {
 	struct mutex vint_mutex;
 	void __iomem *base;
 	struct platform_device *pdev;
+	u32 ti_sci_id;
 };
 
 #define to_vint_desc(e, i) container_of(e, struct ti_sci_inta_vint_desc, \
@@ -156,7 +158,7 @@ static struct ti_sci_inta_vint_desc *ti_sci_inta_alloc_parent_irq(struct irq_dom
 
 	parent_fwspec.fwnode = of_node_to_fwnode(of_irq_find_parent(dev_of_node(&inta->pdev->dev)));
 	parent_fwspec.param_count = 2;
-	parent_fwspec.param[0] = inta->pdev->id;
+	parent_fwspec.param[0] = inta->ti_sci_id;
 	parent_fwspec.param[1] = vint_desc->vint_id;
 
 	parent_virq = irq_create_fwspec_mapping(&parent_fwspec);
@@ -202,7 +204,7 @@ static struct ti_sci_inta_event_desc *ti_sci_inta_alloc_event(struct ti_sci_inta
 
 	err = inta->sci->ops.rm_irq_ops.set_event_map(inta->sci,
 						      dev_id, dev_index,
-						      inta->pdev->id,
+						      inta->ti_sci_id,
 						      vint_desc->vint_id,
 						      event_desc->global_event,
 						      free_bit);
@@ -299,7 +301,7 @@ static void ti_sci_inta_free_irq(struct ti_sci_inta_event_desc *event_desc,
 	inta->sci->ops.rm_irq_ops.free_event_map(inta->sci,
 						 HWIRQ_TO_DEVID(hwirq),
 						 HWIRQ_TO_IRQID(hwirq),
-						 inta->pdev->id,
+						 inta->ti_sci_id,
 						 vint_desc->vint_id,
 						 event_desc->global_event,
 						 event_desc->vint_bit);
@@ -549,21 +551,21 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &pdev->id);
+	ret = of_property_read_u32(dev->of_node, "ti,sci-dev-id", &inta->ti_sci_id);
 	if (ret) {
 		dev_err(dev, "missing 'ti,sci-dev-id' property\n");
 		return -EINVAL;
 	}
 
-	inta->vint = devm_ti_sci_get_of_resource(inta->sci, dev, pdev->id,
+	inta->vint = devm_ti_sci_get_of_resource(inta->sci, dev, inta->ti_sci_id,
 						 "ti,sci-rm-range-vint");
 	if (IS_ERR(inta->vint)) {
 		dev_err(dev, "VINT resource allocation failed\n");
 		return PTR_ERR(inta->vint);
 	}
 
-	inta->global_event = devm_ti_sci_get_of_resource(inta->sci, dev, pdev->id,
-						"ti,sci-rm-range-global-event");
+	inta->global_event = devm_ti_sci_get_of_resource(inta->sci, dev, inta->ti_sci_id,
+							 "ti,sci-rm-range-global-event");
 	if (IS_ERR(inta->global_event)) {
 		dev_err(dev, "Global event resource allocation failed\n");
 		return PTR_ERR(inta->global_event);
-- 
2.27.0

