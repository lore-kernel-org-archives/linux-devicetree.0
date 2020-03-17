Return-Path: <SRS0=fjOU=5C=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB00BC18E5B
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 09:41:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9287B20714
	for <linux-devicetree@archiver.kernel.org>; Tue, 17 Mar 2020 09:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgCQJll (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 17 Mar 2020 05:41:41 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:40979 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727286AbgCQJlY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 17 Mar 2020 05:41:24 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jE8ix-0004QB-2O; Tue, 17 Mar 2020 10:41:23 +0100
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jE8iw-00049Z-GV; Tue, 17 Mar 2020 10:41:22 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH 6/6] soc: xilinx: vcu: add missing register NUM_CORE
Date:   Tue, 17 Mar 2020 10:41:15 +0100
Message-Id: <20200317094115.15896-7-m.tretter@pengutronix.de>
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

The H.264/H.265 Video Codec Unit v1.2 documentation describes this
register as follows:

	Number of encoders core used for the provided configuration

This is required for configuring the VCU encoder buffer.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/linux/mfd/syscon/xlnx-vcu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/syscon/xlnx-vcu.h b/include/linux/mfd/syscon/xlnx-vcu.h
index d3edec4b7b1d..ff7bc3656f6e 100644
--- a/include/linux/mfd/syscon/xlnx-vcu.h
+++ b/include/linux/mfd/syscon/xlnx-vcu.h
@@ -32,6 +32,7 @@
 #define VCU_BUFFER_B_FRAME		0x5c
 #define VCU_WPP_EN			0x60
 #define VCU_PLL_CLK_DEC			0x64
+#define VCU_NUM_CORE			0x6c
 #define VCU_GASKET_INIT			0x74
 #define VCU_GASKET_VALUE		0x03
 
-- 
2.20.1

