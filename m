Return-Path: <SRS0=kUjg=BQ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9906AC433F2
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8955E204FD
	for <linux-devicetree@archiver.kernel.org>; Thu,  6 Aug 2020 11:05:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="nM/WdvE2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728788AbgHFHt0 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 6 Aug 2020 03:49:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44578 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbgHFHtS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 6 Aug 2020 03:49:18 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0767mjJK122818;
        Thu, 6 Aug 2020 02:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1596700125;
        bh=c66utQEU1G+ACzM1W6QUNuPxHwWHV37VcKoLkPa44jQ=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=nM/WdvE2J+5cCrAlEQ/f65RJKyKK333Jz9ShgrrgmacUkm9H6T35v/VhpvA09NKyt
         KcaU1LJtsQWgTdJgm3VEiHdYtrXdma41aQq2RjtxvmhhBXo13KTZy7oG2e0bFgwotc
         8AWlXGB1vsXhUw7L4wWboVcjRnVn5jp2g+tQc9EU=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0767mjZ7059791
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Aug 2020 02:48:45 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 02:48:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 02:48:45 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0767mSYq051454;
        Thu, 6 Aug 2020 02:48:41 -0500
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
Subject: [PATCH v6 03/13] firmware: ti_sci: Add support for getting resource with subtype
Date:   Thu, 6 Aug 2020 13:18:16 +0530
Message-ID: <20200806074826.24607-4-lokeshvutla@ti.com>
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

With SYSFW ABI 3.0 changes, interrupts coming out of an interrupt
controller is identified by a type and it is consistent across SoCs.
Similarly global events for Interrupt aggregator. So add an API to get
resource range using a resource type.

Acked-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/firmware/ti_sci.c              | 89 +++++++++++++++++++-------
 include/linux/soc/ti/ti_sci_protocol.h | 13 ++++
 2 files changed, 80 insertions(+), 22 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 03bd01ba5fe7..722af9ee53d6 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3208,61 +3208,50 @@ u32 ti_sci_get_num_resources(struct ti_sci_resource *res)
 EXPORT_SYMBOL_GPL(ti_sci_get_num_resources);
 
 /**
- * devm_ti_sci_get_of_resource() - Get a TISCI resource assigned to a device
+ * devm_ti_sci_get_resource_sets() - Get a TISCI resources assigned to a device
  * @handle:	TISCI handle
  * @dev:	Device pointer to which the resource is assigned
  * @dev_id:	TISCI device id to which the resource is assigned
- * @of_prop:	property name by which the resource are represented
+ * @sub_types:	Array of sub_types assigned corresponding to device
+ * @sets:	Number of sub_types
  *
  * Return: Pointer to ti_sci_resource if all went well else appropriate
  *	   error pointer.
  */
-struct ti_sci_resource *
-devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
-			    struct device *dev, u32 dev_id, char *of_prop)
+static struct ti_sci_resource *
+devm_ti_sci_get_resource_sets(const struct ti_sci_handle *handle,
+			      struct device *dev, u32 dev_id, u32 *sub_types,
+			      u32 sets)
 {
 	struct ti_sci_resource *res;
 	bool valid_set = false;
-	u32 resource_subtype;
 	int i, ret;
 
 	res = devm_kzalloc(dev, sizeof(*res), GFP_KERNEL);
 	if (!res)
 		return ERR_PTR(-ENOMEM);
 
-	ret = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
-					      sizeof(u32));
-	if (ret < 0) {
-		dev_err(dev, "%s resource type ids not available\n", of_prop);
-		return ERR_PTR(ret);
-	}
-	res->sets = ret;
-
+	res->sets = sets;
 	res->desc = devm_kcalloc(dev, res->sets, sizeof(*res->desc),
 				 GFP_KERNEL);
 	if (!res->desc)
 		return ERR_PTR(-ENOMEM);
 
 	for (i = 0; i < res->sets; i++) {
-		ret = of_property_read_u32_index(dev_of_node(dev), of_prop, i,
-						 &resource_subtype);
-		if (ret)
-			return ERR_PTR(-EINVAL);
-
 		ret = handle->ops.rm_core_ops.get_range(handle, dev_id,
-							resource_subtype,
+							sub_types[i],
 							&res->desc[i].start,
 							&res->desc[i].num);
 		if (ret) {
 			dev_dbg(dev, "dev = %d subtype %d not allocated for this host\n",
-				dev_id, resource_subtype);
+				dev_id, sub_types[i]);
 			res->desc[i].start = 0;
 			res->desc[i].num = 0;
 			continue;
 		}
 
 		dev_dbg(dev, "dev = %d, subtype = %d, start = %d, num = %d\n",
-			dev_id, resource_subtype, res->desc[i].start,
+			dev_id, sub_types[i], res->desc[i].start,
 			res->desc[i].num);
 
 		valid_set = true;
@@ -3280,6 +3269,62 @@ devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
 	return ERR_PTR(-EINVAL);
 }
 
+/**
+ * devm_ti_sci_get_of_resource() - Get a TISCI resource assigned to a device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @of_prop:	property name by which the resource are represented
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+struct ti_sci_resource *
+devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
+			    struct device *dev, u32 dev_id, char *of_prop)
+{
+	struct ti_sci_resource *res;
+	u32 *sub_types;
+	int sets;
+
+	sets = of_property_count_elems_of_size(dev_of_node(dev), of_prop,
+					       sizeof(u32));
+	if (sets < 0) {
+		dev_err(dev, "%s resource type ids not available\n", of_prop);
+		return ERR_PTR(sets);
+	}
+
+	sub_types = kcalloc(sets, sizeof(*sub_types), GFP_KERNEL);
+	if (!sub_types)
+		return ERR_PTR(-ENOMEM);
+
+	of_property_read_u32_array(dev_of_node(dev), of_prop, sub_types, sets);
+	res = devm_ti_sci_get_resource_sets(handle, dev, dev_id, sub_types,
+					    sets);
+
+	kfree(sub_types);
+	return res;
+}
+EXPORT_SYMBOL_GPL(devm_ti_sci_get_of_resource);
+
+/**
+ * devm_ti_sci_get_resource() - Get a resource range assigned to the device
+ * @handle:	TISCI handle
+ * @dev:	Device pointer to which the resource is assigned
+ * @dev_id:	TISCI device id to which the resource is assigned
+ * @suub_type:	TISCI resource subytpe representing the resource.
+ *
+ * Return: Pointer to ti_sci_resource if all went well else appropriate
+ *	   error pointer.
+ */
+struct ti_sci_resource *
+devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
+			 u32 dev_id, u32 sub_type)
+{
+	return devm_ti_sci_get_resource_sets(handle, dev, dev_id, &sub_type, 1);
+}
+EXPORT_SYMBOL_GPL(devm_ti_sci_get_resource);
+
 static int tisci_reboot_handler(struct notifier_block *nb, unsigned long mode,
 				void *cmd)
 {
diff --git a/include/linux/soc/ti/ti_sci_protocol.h b/include/linux/soc/ti/ti_sci_protocol.h
index 49c5d29cd33c..cf27b080e148 100644
--- a/include/linux/soc/ti/ti_sci_protocol.h
+++ b/include/linux/soc/ti/ti_sci_protocol.h
@@ -220,6 +220,9 @@ struct ti_sci_rm_core_ops {
 				    u16 *range_start, u16 *range_num);
 };
 
+#define TI_SCI_RESASG_SUBTYPE_IR_OUTPUT		0
+#define TI_SCI_RESASG_SUBTYPE_IA_VINT		0xa
+#define TI_SCI_RESASG_SUBTYPE_GLOBAL_EVENT_SEVT	0xd
 /**
  * struct ti_sci_rm_irq_ops: IRQ management operations
  * @set_irq:		Set an IRQ route between the requested source
@@ -556,6 +559,9 @@ u32 ti_sci_get_num_resources(struct ti_sci_resource *res);
 struct ti_sci_resource *
 devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
 			    struct device *dev, u32 dev_id, char *of_prop);
+struct ti_sci_resource *
+devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
+			 u32 dev_id, u32 sub_type);
 
 #else	/* CONFIG_TI_SCI_PROTOCOL */
 
@@ -609,6 +615,13 @@ devm_ti_sci_get_of_resource(const struct ti_sci_handle *handle,
 {
 	return ERR_PTR(-EINVAL);
 }
+
+static inline struct ti_sci_resource *
+devm_ti_sci_get_resource(const struct ti_sci_handle *handle, struct device *dev,
+			 u32 dev_id, u32 sub_type);
+{
+	return ERR_PTR(-EINVAL);
+}
 #endif	/* CONFIG_TI_SCI_PROTOCOL */
 
 #endif	/* __TISCI_PROTOCOL_H */
-- 
2.27.0

