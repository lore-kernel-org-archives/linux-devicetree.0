Return-Path: <SRS0=7Os6=BE=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F3EC433DF
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:37:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96A03206E3
	for <linux-devicetree@archiver.kernel.org>; Sat, 25 Jul 2020 16:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="w1PgBQAF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727770AbgGYQh2 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sat, 25 Jul 2020 12:37:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:46178 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgGYQh2 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sat, 25 Jul 2020 12:37:28 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06PGbNTk086705;
        Sat, 25 Jul 2020 11:37:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595695043;
        bh=zcHa+290Nwek06QwUPYI6LSqqjEAXrYj6aDFGgIMayg=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=w1PgBQAFMBYaeeA9788IgXCAJdLBytsUeqz3mmT+XF4fjl8FFW3Tkl52e6ObLbgro
         rpQb+0dfYPOpHZ+iFmu1l5TE/yfJ/tDY01asqI3I5bL2L0xJRWg5zZT05JysXsO6VX
         rx3ZNHGIaBziGxT/DoAs9pGzGu9oVWXJrV/DQZls=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06PGbM5F031795
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 25 Jul 2020 11:37:22 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sat, 25
 Jul 2020 11:37:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sat, 25 Jul 2020 11:37:22 -0500
Received: from lokesh-ssd.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06PGbCnt124636;
        Sat, 25 Jul 2020 11:37:18 -0500
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
Subject: [PATCH v4 01/10] firmware: ti_sci: Drop the device id to resource type translation
Date:   Sat, 25 Jul 2020 22:06:51 +0530
Message-ID: <20200725163700.20583-2-lokeshvutla@ti.com>
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

With ABI 3.0, sysfw deprecated special resource types used for AM65x
SoC. Instead started using device id as resource type similar to the
convention used in J721E SOC.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 drivers/firmware/ti_sci.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 4126be9e3216..930a65ed78ad 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -3355,16 +3355,6 @@ static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
 	.rm_type_map = NULL,
 };
 
-static struct ti_sci_rm_type_map ti_sci_am654_rm_type_map[] = {
-	{.dev_id = 56, .type = 0x00b}, /* GIC_IRQ */
-	{.dev_id = 179, .type = 0x000}, /* MAIN_NAV_UDMASS_IA0 */
-	{.dev_id = 187, .type = 0x009}, /* MAIN_NAV_RA */
-	{.dev_id = 188, .type = 0x006}, /* MAIN_NAV_UDMAP */
-	{.dev_id = 194, .type = 0x007}, /* MCU_NAV_UDMAP */
-	{.dev_id = 195, .type = 0x00a}, /* MCU_NAV_RA */
-	{.dev_id = 0, .type = 0x000}, /* end of table */
-};
-
 /* Description for AM654 */
 static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
 	.default_host_id = 12,
@@ -3373,7 +3363,7 @@ static const struct ti_sci_desc ti_sci_pmmc_am654_desc = {
 	/* Limited by MBOX_TX_QUEUE_LEN. K2G can handle upto 128 messages! */
 	.max_msgs = 20,
 	.max_msg_size = 60,
-	.rm_type_map = ti_sci_am654_rm_type_map,
+	.rm_type_map = NULL,
 };
 
 static const struct of_device_id ti_sci_of_match[] = {
-- 
2.27.0

