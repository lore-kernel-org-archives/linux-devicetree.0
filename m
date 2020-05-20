Return-Path: <SRS0=Re5X=7C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53FEC433E0
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1956207D3
	for <linux-devicetree@archiver.kernel.org>; Wed, 20 May 2020 12:45:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="J6wXtRgP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbgETMpg (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 20 May 2020 08:45:36 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:47590 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726820AbgETMpg (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 20 May 2020 08:45:36 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KCj8aa067923;
        Wed, 20 May 2020 07:45:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589978708;
        bh=GPUmnbro7mSaU0UtG6tfjXGOcAmldK4tyVyWEm7/5to=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=J6wXtRgPPN+hi9U0ZPzTjUUEA9SQhwbBakcz5rZQIHH4S7Mi8BBSa+kXfY67vZ2+8
         TYTOEE4OjHz2fbitNtrLqRlt30H5wostlkPxj+0ypndpDRyAQwogfGTEdwDnbLWYzo
         zJWfva1bsTYOWcubPVJ/AVhXMvOzgTrmOoARQJYA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KCj8jQ103972
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 20 May 2020 07:45:08 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 07:45:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 07:45:08 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KCiuvM026764;
        Wed, 20 May 2020 07:45:04 -0500
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
Subject: [PATCH 02/12] firmware: ti_sci: Drop unused structure ti_sci_rm_type_map
Date:   Wed, 20 May 2020 18:14:44 +0530
Message-ID: <20200520124454.10532-3-lokeshvutla@ti.com>
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

struct ti_sci_rm_type_map is no longer used. Drop its definition and its
declarations.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/firmware/ti_sci.c | 56 +--------------------------------------
 1 file changed, 1 insertion(+), 55 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 930a65ed78ad..a81ddec9e669 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -64,22 +64,6 @@ struct ti_sci_xfers_info {
 	spinlock_t xfer_lock;
 };
 
-/**
- * struct ti_sci_rm_type_map - Structure representing TISCI Resource
- *				management representation of dev_ids.
- * @dev_id:	TISCI device ID
- * @type:	Corresponding id as identified by TISCI RM.
- *
- * Note: This is used only as a work around for using RM range apis
- *	for AM654 SoC. For future SoCs dev_id will be used as type
- *	for RM range APIs. In order to maintain ABI backward compatibility
- *	type is not being changed for AM654 SoC.
- */
-struct ti_sci_rm_type_map {
-	u32 dev_id;
-	u16 type;
-};
-
 /**
  * struct ti_sci_desc - Description of SoC integration
  * @default_host_id:	Host identifier representing the compute entity
@@ -87,14 +71,12 @@ struct ti_sci_rm_type_map {
  * @max_msgs: Maximum number of messages that can be pending
  *		  simultaneously in the system
  * @max_msg_size: Maximum size of data per message that can be handled.
- * @rm_type_map: RM resource type mapping structure.
  */
 struct ti_sci_desc {
 	u8 default_host_id;
 	int max_rx_timeout_ms;
 	int max_msgs;
 	int max_msg_size;
-	struct ti_sci_rm_type_map *rm_type_map;
 };
 
 /**
@@ -1710,33 +1692,6 @@ static int ti_sci_cmd_core_reboot(const struct ti_sci_handle *handle)
 	return ret;
 }
 
-static int ti_sci_get_resource_type(struct ti_sci_info *info, u16 dev_id,
-				    u16 *type)
-{
-	struct ti_sci_rm_type_map *rm_type_map = info->desc->rm_type_map;
-	bool found = false;
-	int i;
-
-	/* If map is not provided then assume dev_id is used as type */
-	if (!rm_type_map) {
-		*type = dev_id;
-		return 0;
-	}
-
-	for (i = 0; rm_type_map[i].dev_id; i++) {
-		if (rm_type_map[i].dev_id == dev_id) {
-			*type = rm_type_map[i].type;
-			found = true;
-			break;
-		}
-	}
-
-	if (!found)
-		return -EINVAL;
-
-	return 0;
-}
-
 /**
  * ti_sci_get_resource_range - Helper to get a range of resources assigned
  *			       to a host. Resource is uniquely identified by
@@ -1760,7 +1715,6 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 	struct ti_sci_xfer *xfer;
 	struct ti_sci_info *info;
 	struct device *dev;
-	u16 type;
 	int ret = 0;
 
 	if (IS_ERR(handle))
@@ -1780,15 +1734,9 @@ static int ti_sci_get_resource_range(const struct ti_sci_handle *handle,
 		return ret;
 	}
 
-	ret = ti_sci_get_resource_type(info, dev_id, &type);
-	if (ret) {
-		dev_err(dev, "rm type lookup failed for %u\n", dev_id);
-		goto fail;
-	}
-
 	req = (struct ti_sci_msg_req_get_resource_range *)xfer->xfer_buf;
 	req->secondary_host = s_host;
-	req->type = type & MSG_RM_RESOURCE_TYPE_MASK;
+	req->type = dev_id & MSG_RM_RESOURCE_TYPE_MASK;
 	req->subtype = subtype & MSG_RM_RESOURCE_SUBTYPE_MASK;
 
 	ret = ti_sci_do_xfer(info, xfer);
@@ -3352,7 +3300,6 @@ static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
 	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 64,
-	.rm_type_map = NULL,
 };
 
 /* Description for AM654 */
@@ -3363,7 +3310,6 @@ static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
 	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 60,
-	.rm_type_map = NULL,
 };
 
 static const struct of_device_id ti_sci_of_match[] = {
-- 
2.17.1

