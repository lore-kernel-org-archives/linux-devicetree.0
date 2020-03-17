Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39CDDC4CECE
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 09:41:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A07A20714
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 09:41:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726719AbgCQJlm (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 05:41:42 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50553 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbgCQJlY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 05:41:24 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jE8ix-0004Q6-2M; Tue, 17 Mar 2020 10:41:23 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jE8iw-00049K-E4; Tue, 17 Mar 2020 10:41:22 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 1/6] soc: xilinx: vcu: drop useless success message
Date:   Tue, 17 Mar 2020 10:41:10 +0100
Message-Id: <20200317094115.15896-2-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200317094115.15896-1-m.tretter@pengutronix.de>
References: <20200317094115.15896-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: devicetree@vger.kernel.org
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

The message that the driver was successfully probed only adds useless
noise. Drop the message.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/soc/xilinx/xlnx_vcu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
index a3aa40996f13..dcd8e7824b06 100644
--- a/drivers/soc/xilinx/xlnx_vcu.c
+++ b/drivers/soc/xilinx/xlnx_vcu.c
@@ -571,8 +571,6 @@ static int xvcu_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, xvcu);
 
-	dev_info(&pdev->dev, "%s: Probed successfully\n", __func__);
-
 	return 0;
 
 error_pll_ref:
-- 
2.20.1

