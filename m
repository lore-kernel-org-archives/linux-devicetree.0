Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB31C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 16:37:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BCCBB20737
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 16:37:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727780AbgC0QhL (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 12:37:11 -0400
Received: from foss.arm.com ([217.140.110.172]:48562 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbgC0QhL (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 12:37:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE34F1FB;
        Fri, 27 Mar 2020 09:37:10 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C1BCD3F71F;
        Fri, 27 Mar 2020 09:37:09 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, f.fainelli@gmail.com,
        linux-imx@nxp.com
Subject: [PATCH 3/4] firmware: arm_scmi: Check shmem property for channel availablity
Date:   Fri, 27 Mar 2020 16:36:53 +0000
Message-Id: <20200327163654.13389-4-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200327163654.13389-1-sudeep.holla@arm.com>
References: <20200327163654.13389-1-sudeep.holla@arm.com>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Instead of declaring the channel availabilty unconditionally, let us
check for the presence of "shmem" property and return the channel
availablity accordingly.

Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/firmware/arm_scmi/smc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/firmware/arm_scmi/smc.c b/drivers/firmware/arm_scmi/smc.c
index dd4b54c29679..5929c668dc1d 100644
--- a/drivers/firmware/arm_scmi/smc.c
+++ b/drivers/firmware/arm_scmi/smc.c
@@ -33,6 +33,11 @@ struct scmi_smc {
 
 static bool smc_chan_available(struct device *dev, int idx)
 {
+	struct device_node *np = of_parse_phandle(dev->of_node, "shmem", 0);
+	if (!np)
+		return false;
+
+	of_node_put(np);
 	return true;
 }
 
-- 
2.17.1

