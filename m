Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4EA3C4167B
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ABEB9221E2
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Bqwkhdfm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbgHFHtX (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:49:23 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:56230 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728808AbgHFHtI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:49:08 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767mwR0016666;
        Thu, 6 Aug 2020 02:48:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700138;
        bh=JNwKPc/wzdas1tmAYs56MvAHvTmGNvJDkOqrb/YorAc=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=BqwkhdfmvXCINjwLqvx0P/JeYpL/u/asCcm9a3pgCyX8fmdN7ZNB8J8sNtmsydu3t
         HgUBX9z89wFqes6FbesjVyQQ5/hdyH01Q6T7ZDq0O+OU52M2KIvW/8c4hbDU8QJGBD
         faxqpz+zi7jJSgLM+xQNkscnfdlsjIO0Ik3YD0pY=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767mwwj059919
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:48:58 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:48:57 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:48:58 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSYt051454;
        Thu, 6 Aug 2020 02:48:54 -0500
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
Subject: [PATCH v6 06/13] irqchip/ti-sci-intr: Add support for INTR being a parent to INTR
Date:   Thu, 6 Aug 2020 13:18:19 +0530
Message-ID: <20200806074826.24607-7-lokeshvutla@ti.com>
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

Driver assumes that Interrupt parent to Interrupt router is always GIC.
This is not true always and an Interrupt Router can be a parent to
Interrupt Router. Update the driver to detect the parent and request the
parent irqs accordingly.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/irqchip/irq-ti-sci-intr.c | 152 ++++++++++++++++++------------
 1 file changed, 93 insertions(+), 59 deletions(-)

diff --git a/drivers/irqchip/irq-ti-sci-intr.c b/drivers/irqchip/irq-ti-sci-intr.c
index 5ea148faf2ab..cbc1758228d9 100644
--- a/drivers/irqchip/irq-ti-sci-intr.c
+++ b/drivers/irqchip/irq-ti-sci-intr.c
@@ -17,29 +17,20 @@
 #include <linux/of_irq.h>
 #include <linux/soc/ti/ti_sci_protocol.h>
 
-#define TI_SCI_DEV_ID_MASK	0xffff
-#define TI_SCI_DEV_ID_SHIFT	16
-#define TI_SCI_IRQ_ID_MASK	0xffff
-#define TI_SCI_IRQ_ID_SHIFT	0
-#define HWIRQ_TO_DEVID(hwirq)	(((hwirq) >> (TI_SCI_DEV_ID_SHIFT)) & \
-				 (TI_SCI_DEV_ID_MASK))
-#define HWIRQ_TO_IRQID(hwirq)	((hwirq) & (TI_SCI_IRQ_ID_MASK))
-#define TO_HWIRQ(dev, index)	((((dev) & TI_SCI_DEV_ID_MASK) << \
-				 TI_SCI_DEV_ID_SHIFT) | \
-				((index) & TI_SCI_IRQ_ID_MASK))
-
 /**
  * struct ti_sci_intr_irq_domain - Structure representing a TISCI based
  *				   Interrupt Router IRQ domain.
  * @sci:	Pointer to TISCI handle
- * @dst_irq:	TISCI resource pointer representing GIC irq controller.
- * @dst_id:	TISCI device ID of the GIC irq controller.
+ * @out_irqs:	TISCI resource pointer representing INTR irqs.
+ * @dev:	Struct device pointer.
+ * @ti_sci_id:	TI-SCI device identifier
  * @type:	Specifies the trigger type supported by this Interrupt Router
  */
 struct ti_sci_intr_irq_domain {
 	const struct ti_sci_handle *sci;
-	struct ti_sci_resource *dst_irq;
-	u32 dst_id;
+	struct ti_sci_resource *out_irqs;
+	struct device *dev;
+	u32 ti_sci_id;
 	u32 type;
 };
 
@@ -70,15 +61,44 @@ static int ti_sci_intr_irq_domain_translate(struct irq_domain *domain,
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
 
-	if (fwspec->param_count != 2)
+	if (fwspec->param_count != 1)
 		return -EINVAL;
 
-	*hwirq = TO_HWIRQ(fwspec->param[0], fwspec->param[1]);
+	*hwirq = fwspec->param[0];
 	*type = intr->type;
 
 	return 0;
 }
 
+/**
+ * ti_sci_intr_xlate_irq() - Translate hwirq to parent's hwirq.
+ * @intr:	IRQ domain corresponding to Interrupt Router
+ * @irq:	Hardware irq corresponding to the above irq domain
+ *
+ * Return parent irq number if translation is available else -ENOENT.
+ */
+static int ti_sci_intr_xlate_irq(struct ti_sci_intr_irq_domain *intr, u32 irq)
+{
+	struct device_node *np = dev_of_node(intr->dev);
+	u32 base, pbase, size, len;
+	const __be32 *range;
+
+	range = of_get_property(np, "ti,interrupt-ranges", &len);
+	if (!range)
+		return irq;
+
+	for (len /= sizeof(*range); len >= 3; len -= 3) {
+		base = be32_to_cpu(*range++);
+		pbase = be32_to_cpu(*range++);
+		size = be32_to_cpu(*range++);
+
+		if (base <= irq && irq < base + size)
+			return irq - base + pbase;
+	}
+
+	return -ENOENT;
+}
+
 /**
  * ti_sci_intr_irq_domain_free() - Free the specified IRQs from the domain.
  * @domain:	Domain to which the irqs belong
@@ -89,66 +109,76 @@ static void ti_sci_intr_irq_domain_free(struct irq_domain *domain,
 					unsigned int virq, unsigned int nr_irqs)
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
-	struct irq_data *data, *parent_data;
-	u16 dev_id, irq_index;
+	struct irq_data *data;
+	int out_irq;
 
-	parent_data = irq_domain_get_irq_data(domain->parent, virq);
 	data = irq_domain_get_irq_data(domain, virq);
-	irq_index = HWIRQ_TO_IRQID(data->hwirq);
-	dev_id = HWIRQ_TO_DEVID(data->hwirq);
+	out_irq = (uintptr_t)data->chip_data;
 
-	intr->sci->ops.rm_irq_ops.free_irq(intr->sci, dev_id, irq_index,
-					   intr->dst_id, parent_data->hwirq);
-	ti_sci_release_resource(intr->dst_irq, parent_data->hwirq);
+	intr->sci->ops.rm_irq_ops.free_irq(intr->sci,
+					   intr->ti_sci_id, data->hwirq,
+					   intr->ti_sci_id, out_irq);
+	ti_sci_release_resource(intr->out_irqs, out_irq);
 	irq_domain_free_irqs_parent(domain, virq, 1);
 	irq_domain_reset_irq_data(data);
 }
 
 /**
- * ti_sci_intr_alloc_gic_irq() - Allocate GIC specific IRQ
+ * ti_sci_intr_alloc_parent_irq() - Allocate parent IRQ
  * @domain:	Pointer to the interrupt router IRQ domain
  * @virq:	Corresponding Linux virtual IRQ number
  * @hwirq:	Corresponding hwirq for the IRQ within this IRQ domain
  *
- * Returns 0 if all went well else appropriate error pointer.
+ * Returns parent irq if all went well else appropriate error pointer.
  */
-static int ti_sci_intr_alloc_gic_irq(struct irq_domain *domain,
-				     unsigned int virq, u32 hwirq)
+static int ti_sci_intr_alloc_parent_irq(struct irq_domain *domain,
+					unsigned int virq, u32 hwirq)
 {
 	struct ti_sci_intr_irq_domain *intr = domain->host_data;
+	struct device_node *parent_node;
 	struct irq_fwspec fwspec;
-	u16 dev_id, irq_index;
-	u16 dst_irq;
-	int err;
-
-	dev_id = HWIRQ_TO_DEVID(hwirq);
-	irq_index = HWIRQ_TO_IRQID(hwirq);
+	u16 out_irq, p_hwirq;
+	int err = 0;
 
-	dst_irq = ti_sci_get_free_resource(intr->dst_irq);
-	if (dst_irq == TI_SCI_RESOURCE_NULL)
+	out_irq = ti_sci_get_free_resource(intr->out_irqs);
+	if (out_irq == TI_SCI_RESOURCE_NULL)
 		return -EINVAL;
 
-	fwspec.fwnode = domain->parent->fwnode;
-	fwspec.param_count = 3;
-	fwspec.param[0] = 0;	/* SPI */
-	fwspec.param[1] = dst_irq - 32; /* SPI offset */
-	fwspec.param[2] = intr->type;
+	p_hwirq = ti_sci_intr_xlate_irq(intr, out_irq);
+	if (p_hwirq < 0)
+		goto err_irqs;
+
+	parent_node = of_irq_find_parent(dev_of_node(intr->dev));
+	fwspec.fwnode = of_node_to_fwnode(parent_node);
+
+	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
+		/* Parent is GIC */
+		fwspec.param_count = 3;
+		fwspec.param[0] = 0;	/* SPI */
+		fwspec.param[1] = p_hwirq - 32; /* SPI offset */
+		fwspec.param[2] = intr->type;
+	} else {
+		/* Parent is Interrupt Router */
+		fwspec.param_count = 1;
+		fwspec.param[0] = p_hwirq;
+	}
 
 	err = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
 	if (err)
 		goto err_irqs;
 
-	err = intr->sci->ops.rm_irq_ops.set_irq(intr->sci, dev_id, irq_index,
-						intr->dst_id, dst_irq);
+	err = intr->sci->ops.rm_irq_ops.set_irq(intr->sci,
+						intr->ti_sci_id, hwirq,
+						intr->ti_sci_id, out_irq);
 	if (err)
 		goto err_msg;
 
-	return 0;
+	return p_hwirq;
 
 err_msg:
 	irq_domain_free_irqs_parent(domain, virq, 1);
 err_irqs:
-	ti_sci_release_resource(intr->dst_irq, dst_irq);
+	ti_sci_release_resource(intr->out_irqs, out_irq);
 	return err;
 }
 
@@ -168,18 +198,19 @@ static int ti_sci_intr_irq_domain_alloc(struct irq_domain *domain,
 	struct irq_fwspec *fwspec = data;
 	unsigned long hwirq;
 	unsigned int flags;
-	int err;
+	int err, p_hwirq;
 
 	err = ti_sci_intr_irq_domain_translate(domain, fwspec, &hwirq, &flags);
 	if (err)
 		return err;
 
-	err = ti_sci_intr_alloc_gic_irq(domain, virq, hwirq);
-	if (err)
-		return err;
+	p_hwirq = ti_sci_intr_alloc_parent_irq(domain, virq, hwirq);
+	if (p_hwirq < 0)
+		return p_hwirq;
 
 	irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
-				      &ti_sci_intr_irq_chip, NULL);
+				      &ti_sci_intr_irq_chip,
+				      (void *)(uintptr_t)p_hwirq);
 
 	return 0;
 }
@@ -214,6 +245,7 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 	if (!intr)
 		return -ENOMEM;
 
+	intr->dev = dev;
 	ret = of_property_read_u32(dev_of_node(dev), "ti,intr-trigger-type",
 				   &intr->type);
 	if (ret) {
@@ -230,19 +262,19 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dst-id",
-				   &intr->dst_id);
+	ret = of_property_read_u32(dev_of_node(dev), "ti,sci-dev-id",
+				   &intr->ti_sci_id);
 	if (ret) {
-		dev_err(dev, "missing 'ti,sci-dst-id' property\n");
+		dev_err(dev, "missing 'ti,sci-dev-id' property\n");
 		return -EINVAL;
 	}
 
-	intr->dst_irq = devm_ti_sci_get_of_resource(intr->sci, dev,
-						    intr->dst_id,
-						    "ti,sci-rm-range-girq");
-	if (IS_ERR(intr->dst_irq)) {
+	intr->out_irqs = devm_ti_sci_get_resource(intr->sci, dev,
+						  intr->ti_sci_id,
+						  TI_SCI_RESASG_SUBTYPE_IR_OUTPUT);
+	if (IS_ERR(intr->out_irqs)) {
 		dev_err(dev, "Destination irq resource allocation failed\n");
-		return PTR_ERR(intr->dst_irq);
+		return PTR_ERR(intr->out_irqs);
 	}
 
 	domain = irq_domain_add_hierarchy(parent_domain, 0, 0, dev_of_node(dev),
@@ -252,6 +284,8 @@ static int ti_sci_intr_irq_domain_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	}
 
+	dev_info(dev, "Interrupt Router %d domain created\n", intr->ti_sci_id);
+
 	return 0;
 }
 
-- 
2.27.0

