Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CAADC2D0ED
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 16:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 730F6206E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 16:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727766AbgC0QhJ (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 12:37:09 -0400
Received: from foss.arm.com ([217.140.110.172]:48540 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbgC0QhI (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 12:37:08 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D42131B;
        Fri, 27 Mar 2020 09:37:08 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 894EE3F71F;
        Fri, 27 Mar 2020 09:37:07 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, f.fainelli@gmail.com,
        linux-imx@nxp.com
Subject: [PATCH 1/4] firmware: arm_scmi: Make mutex channel specific
Date:   Fri, 27 Mar 2020 16:36:51 +0000
Message-Id: <20200327163654.13389-2-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327163654.13389-1-sudeep.holla@arm.com>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In order to support multiple SMC/HVC transport channels with associated
shared memory, it is better to maintain the mutex per channel instead of
existing global one.

Move the smc_mutex into the scmi_smc structure and also rename it to
shmem_lock which is more appropriate for it's use.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/smc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/smc.c b/drivers/firmware/arm_scmi/smc.c
index 336168e40f49..6dc8a88cc91b 100644
--- a/drivers/firmware/arm_scmi/smc.c
+++ b/drivers/firmware/arm_scmi/smc.c
@@ -27,11 +27,10 @@
 struct scmi_smc {
 	struct scmi_chan_info *cinfo;
 	struct scmi_shared_mem __iomem *shmem;
+	struct mutex shmem_lock;
 	u32 func_id;
 };
 
-static DEFINE_MUTEX(smc_mutex);
-
 static bool smc_chan_available(struct device *dev, int idx)
 {
 	return true;
@@ -78,6 +77,7 @@ static int smc_chan_setup(struct scmi_chan_info *cinfo, struct device *dev,
 
 	scmi_info->func_id = func_id;
 	scmi_info->cinfo = cinfo;
+	mutex_init(&scmi_info->shmem_lock);
 	cinfo->transport_info = scmi_info;
 
 	return 0;
@@ -102,14 +102,14 @@ static int smc_send_message(struct scmi_chan_info *cinfo,
 	struct scmi_smc *scmi_info = cinfo->transport_info;
 	struct arm_smccc_res res;
 
-	mutex_lock(&smc_mutex);
+	mutex_lock(&scmi_info->shmem_lock);
 
 	shmem_tx_prepare(scmi_info->shmem, xfer);
 
 	arm_smccc_1_1_invoke(scmi_info->func_id, 0, 0, 0, 0, 0, 0, 0, &res);
 	scmi_rx_callback(scmi_info->cinfo, shmem_read_header(scmi_info->shmem));
 
-	mutex_unlock(&smc_mutex);
+	mutex_unlock(&scmi_info->shmem_lock);
 
 	return res.a0;
 }
-- 
2.17.1

