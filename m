Return-Path: <SRS0=jSFQ=5M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A97C3C43331
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 16:37:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 852C9206E6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Mar 2020 16:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727769AbgC0QhI (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Mar 2020 12:37:08 -0400
Received: from foss.arm.com ([217.140.110.172]:48530 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727726AbgC0QhH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 27 Mar 2020 12:37:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 566091FB;
        Fri, 27 Mar 2020 09:37:07 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67FE13F71F;
        Fri, 27 Mar 2020 09:37:06 -0700 (PDT)
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Peng Fan <peng.fan@nxp.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>, f.fainelli@gmail.com,
        linux-imx@nxp.com
Subject: [PATCH 0/4] firmware: arm_scmi: Extend SMC/HVC to support multiple channels
Date:   Fri, 27 Mar 2020 16:36:50 +0000
Message-Id: <20200327163654.13389-1-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Hi,

While merging SMC/HVC transport to SCMI, I did a quick hack to extend
it to support multiple channels. I may be missing something obvious, if
not the changes required look simple. Some of them could be merged into
original patch, but since I am unable to test, I preferred to keep them
separate, easy to revert if things break.

Regards,
Sudeep
--

Sudeep Holla (4):
  firmware: arm_scmi: Make mutex channel specific
  firmware: arm_scmi: Drop empty stub for smc_mark_txdone
  firmware: arm_scmi: Check shmem property for channel availablity
  firmware: arm_scmi: Drop checking for shmem property in parent node

 drivers/firmware/arm_scmi/smc.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

--
2.17.1

