Return-Path: <SRS0=DG9v=56=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B011C2BBC7
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 10:58:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B66F2072D
	for <linux-devicetree@archiver.kernel.org>; Tue, 14 Apr 2020 10:58:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438359AbgDNK57 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 14 Apr 2020 06:57:59 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57203 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729506AbgDNKcK (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 14 Apr 2020 06:32:10 -0400
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28] helo=dude02.lab.pengutronix.de)
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jOIrN-0007BW-EF; Tue, 14 Apr 2020 12:32:05 +0200
Received: from mtr by dude02.lab.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1jOIrM-000186-TB; Tue, 14 Apr 2020 12:32:04 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc:     Rohit Visavalia <rohit.visavalia@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dhaval Shah <dshah@xilinx.com>, kernel@pengutronix.de,
        Michael Tretter <m.tretter@pengutronix.de>
Subject: [PATCH v2 2/6] ARM: dts: define indexes for output clocks
Date:   Tue, 14 Apr 2020 12:31:58 +0200
Message-Id: <20200414103202.4288-3-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200414103202.4288-1-m.tretter@pengutronix.de>
References: <20200414103202.4288-1-m.tretter@pengutronix.de>
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

The VCU System-Level Control provides 4 clocks. Defined indexes for
these clocks.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
Changelog:

v1 -> v2:
- none
---
 include/dt-bindings/clock/xlnx-vcu.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 include/dt-bindings/clock/xlnx-vcu.h

diff --git a/include/dt-bindings/clock/xlnx-vcu.h b/include/dt-bindings/clock/xlnx-vcu.h
new file mode 100644
index 000000000000..f2a5ea9c4155
--- /dev/null
+++ b/include/dt-bindings/clock/xlnx-vcu.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Pengutronix, Michael Tretter <kernel@pengutronix.de>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_XLNX_VCU_H
+#define _DT_BINDINGS_CLOCK_XLNX_VCU_H
+
+#define CLK_XVCU_ENC_CORE		0
+#define CLK_XVCU_ENC_MCU		1
+#define CLK_XVCU_DEC_CORE		2
+#define CLK_XVCU_DEC_MCU		3
+#define CLK_XVCU_MAX			4
+
+#endif /* _DT_BINDINGS_CLOCK_XLNX_VCU_H */
-- 
2.20.1

