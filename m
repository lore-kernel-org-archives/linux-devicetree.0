Return-Path: <SRS0=deyM=Y4=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADA4ACA9ED4
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 16:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8F6C22089C
	for <linux-devicetree@archiver.kernel.org>; Mon,  4 Nov 2019 16:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbfKDQiq (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 4 Nov 2019 11:38:46 -0500
Received: from foss.arm.com ([217.140.110.172]:46772 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727861AbfKDQiq (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Mon, 4 Nov 2019 11:38:46 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FB9E328;
        Mon,  4 Nov 2019 08:38:45 -0800 (PST)
Received: from e119886-lin.cambridge.arm.com (unknown [10.37.6.20])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 978AE3F71A;
        Mon,  4 Nov 2019 08:38:44 -0800 (PST)
From:   Andrew Murray <andrew.murray@arm.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     devicetree@vger.kernel.org
Subject: [PATCH v1 1/7] PCI: dt: Add legacy PCI IRQ defines
Date:   Mon,  4 Nov 2019 16:38:15 +0000
Message-Id: <20191104163834.8932-2-andrew.murray@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191104163834.8932-1-andrew.murray@arm.com>
References: <20191104163834.8932-1-andrew.murray@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

PCI devices can trigger interrupts via 4 physical/virtual lines known
as INTA, INTB, INTC or INTD. Due to interrupt swizzling it is often
required to describe the interrupt mapping in the device tree. Let's
add a define for each type to improve device tree clarity.

Signed-off-by: Andrew Murray <andrew.murray@arm.com>
---
 include/dt-bindings/interrupt-controller/irq.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/dt-bindings/interrupt-controller/irq.h b/include/dt-bindings/interrupt-controller/irq.h
index 9e3d183e1381..f9063fd661cd 100644
--- a/include/dt-bindings/interrupt-controller/irq.h
+++ b/include/dt-bindings/interrupt-controller/irq.h
@@ -17,4 +17,12 @@
 #define IRQ_TYPE_LEVEL_HIGH	4
 #define IRQ_TYPE_LEVEL_LOW	8
 
+/* Legacy PCI IRQ lines */
+#define IRQ_INTA		1
+#define IRQ_INTB		2
+#define IRQ_INTC		3
+#define IRQ_INTD		4
+
+#define IRQ_INT_ALL		7
+
 #endif
-- 
2.21.0

