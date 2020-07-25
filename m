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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A82C433F4
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:38:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11D91206E3
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:38:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="R+SNu9yT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726926AbgGYQiI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 12:38:08 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:47170 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYQiI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 12:38:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PGc18w062000;
        Sat, 25 Jul 2020 11:38:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595695081;
        bh=HeX0VbKPlWpFeEwDIWsY63pWmoJAwLroryi9ehWI7Gs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=R+SNu9yTAsxLb0ZMTeJ3A0NrJPEYsFLOkwgoic5d+VKO6m5GQeOE4LSfZOwar6rOa
         SnzKDJYl3aRBXXe9MuHUJzaeY7db2KnbFmvwVDX85FQHj9WCLP0PrjzY6rduanupVN
         gYBGeYprBGrsJGOSx3Z2kRJpGExCuu9mIinQVJDI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06PGc15b106279
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 25 Jul 2020 11:38:01 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 11:38:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 11:38:00 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGbCo4124636;
        Sat, 25 Jul 2020 11:37:57 -0500
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
Subject: [PATCH v4 10/10] irqchip/ti-sci-inta: Add support for INTA directly connecting to GIC
Date:   Sat, 25 Jul 2020 22:07:00 +0530
Message-ID: <20200725163700.20583-11-lokeshvutla@ti.com>
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

Driver assumes that Interrupt parent to Interrupt Aggregator is always
Interrupt router. This is not true always and GIC can be a parent to
Interrupt Aggregator. Update the driver to detect the parent and request
the parent irqs accordingly.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/irqchip/irq-ti-sci-inta.c | 87 ++++++++++++++++++++++++++-----
 1 file changed, 74 insertions(+), 13 deletions(-)

diff --git a/drivers/irqchip/irq-ti-sci-inta.c b/drivers/irqchip/irq-ti-sci-inta.c
index f2d2f29991b9..da1298ee365f 100644
--- a/drivers/irqchip/irq-ti-sci-inta.c
+++ b/drivers/irqchip/irq-ti-sci-inta.c
@@ -8,6 +8,7 @@
 
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
 #include <linux/interrupt.h>
@@ -130,6 +131,37 @@ static void ti_sci_inta_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(irq_desc_get_chip(desc), desc);
 }
 
+/**
+ * ti_sci_inta_xlate_irq() - Translate hwirq to parent's hwirq.
+ * @inta:	IRQ domain corresponding to Interrupt Aggregator
+ * @irq:	Hardware irq corresponding to the above irq domain
+ *
+ * Return parent irq number if translation is available else -ENOENT.
+ */
+static int ti_sci_inta_xlate_irq(struct ti_sci_inta_irq_domain *inta,
+				 u16 vint_id)
+{
+	struct device_node *np = dev_of_node(&inta->pdev->dev);
+	u32 base, parent_base, size;
+	const __be32 *range;
+	int len;
+
+	range = of_get_property(np, "ti,interrupt-ranges", &len);
+	if (!range)
+		return vint_id;
+
+	for (len /= sizeof(*range); len >= 3; len -= 3) {
+		base = be32_to_cpu(*range++);
+		parent_base = be32_to_cpu(*range++);
+		size = be32_to_cpu(*range++);
+
+		if (base <= vint_id && vint_id < base + size)
+			return vint_id - base + parent_base;
+	}
+
+	return -ENOENT;
+}
+
 /**
  * ti_sci_inta_alloc_parent_irq() - Allocate parent irq to Interrupt aggregator
  * @domain:	IRQ domain corresponding to Interrupt Aggregator
@@ -141,30 +173,52 @@ static struct ti_sci_inta_vint_desc *ti_sci_inta_alloc_parent_irq(struct irq_dom
 	struct ti_sci_inta_irq_domain *inta = domain->host_data;
 	struct ti_sci_inta_vint_desc *vint_desc;
 	struct irq_fwspec parent_fwspec;
+	struct device_node *parent_node;
 	unsigned int parent_virq;
-	u16 vint_id;
+	u16 vint_id, p_hwirq;
+	int ret;
 
 	vint_id = ti_sci_get_free_resource(inta->vint);
 	if (vint_id == TI_SCI_RESOURCE_NULL)
 		return ERR_PTR(-EINVAL);
 
+	p_hwirq = ti_sci_inta_xlate_irq(inta, vint_id);
+	if (p_hwirq < 0) {
+		ret = p_hwirq;
+		goto free_vint;
+	}
+
 	vint_desc = kzalloc(sizeof(*vint_desc), GFP_KERNEL);
-	if (!vint_desc)
-		return ERR_PTR(-ENOMEM);
+	if (!vint_desc) {
+		ret = -ENOMEM;
+		goto free_vint;
+	}
 
 	vint_desc->domain = domain;
 	vint_desc->vint_id = vint_id;
 	INIT_LIST_HEAD(&vint_desc->list);
 
-	parent_fwspec.fwnode = of_node_to_fwnode(of_irq_find_parent(dev_of_node(&inta->pdev->dev)));
-	parent_fwspec.param_count = 2;
-	parent_fwspec.param[0] = inta->ti_sci_id;
-	parent_fwspec.param[1] = vint_desc->vint_id;
+	parent_node = of_irq_find_parent(dev_of_node(&inta->pdev->dev));
+	parent_fwspec.fwnode = of_node_to_fwnode(parent_node);
+
+	if (of_device_is_compatible(parent_node, "arm,gic-v3")) {
+		/* Parent is GIC */
+		parent_fwspec.param_count = 3;
+		parent_fwspec.param[0] = 0;
+		parent_fwspec.param[1] = p_hwirq - 32;
+		parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
+	} else {
+		/* Parent is Interrupt Router */
+		parent_fwspec.param_count = 1;
+		parent_fwspec.param[0] = p_hwirq;
+	}
 
 	parent_virq = irq_create_fwspec_mapping(&parent_fwspec);
 	if (parent_virq == 0) {
-		kfree(vint_desc);
-		return ERR_PTR(-EINVAL);
+		dev_err(&inta->pdev->dev, "Parent IRQ allocation failed\n");
+		ret = -EINVAL;
+		goto free_vint_desc;
+
 	}
 	vint_desc->parent_virq = parent_virq;
 
@@ -173,6 +227,11 @@ static struct ti_sci_inta_vint_desc *ti_sci_inta_alloc_parent_irq(struct irq_dom
 					 ti_sci_inta_irq_handler, vint_desc);
 
 	return vint_desc;
+free_vint_desc:
+	kfree(vint_desc);
+free_vint:
+	ti_sci_release_resource(inta->vint, vint_id);
+	return ERR_PTR(ret);
 }
 
 /**
@@ -557,15 +616,15 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
-	inta->vint = devm_ti_sci_get_of_resource(inta->sci, dev, inta->ti_sci_id,
-						 "ti,sci-rm-range-vint");
+	inta->vint = devm_ti_sci_get_resource(inta->sci, dev, inta->ti_sci_id,
+					      TI_SCI_RESASG_SUBTYPE_IA_VINT);
 	if (IS_ERR(inta->vint)) {
 		dev_err(dev, "VINT resource allocation failed\n");
 		return PTR_ERR(inta->vint);
 	}
 
-	inta->global_event = devm_ti_sci_get_of_resource(inta->sci, dev, inta->ti_sci_id,
-							 "ti,sci-rm-range-global-event");
+	inta->global_event = devm_ti_sci_get_resource(inta->sci, dev, inta->ti_sci_id,
+						      TI_SCI_RESASG_SUBTYPE_GLOBAL_EVENT_SEVT);
 	if (IS_ERR(inta->global_event)) {
 		dev_err(dev, "Global event resource allocation failed\n");
 		return PTR_ERR(inta->global_event);
@@ -596,6 +655,8 @@ static int ti_sci_inta_irq_domain_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&inta->vint_list);
 	mutex_init(&inta->vint_mutex);
 
+	dev_info(dev, "Interrupt Aggregator domain %d created\n", pdev->id);
+
 	return 0;
 }
 
-- 
2.27.0

