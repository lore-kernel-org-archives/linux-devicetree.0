Return-Path: <SRS0=9w3Z=YZ=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFDDCA9ECF
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0303020656
	for <linux-devicetree@archiver.kernel.org>; Fri,  1 Nov 2019 11:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObaO68Gw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728571AbfKAL3q (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 1 Nov 2019 07:29:46 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:44573 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728293AbfKAL3q (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Nov 2019 07:29:46 -0400
Received: by mail-pg1-f193.google.com with SMTP id e10so6289481pgd.11
        for <devicetree@vger.kernel.org>; Fri, 01 Nov 2019 04:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8wEKLy/QbmIjTepBa+G0u56b2IMWWIVu+NxyDN5fxcI=;
        b=ObaO68GwYx/JIeZLc8UXrIbi4TERM6qSHLrZCLweBh6KlOozKXYgHCfXJyDYDTI0NB
         yf+B2S8MuFhcAlHxAmLNgsRoh6u+FwZwqeO9meHAJTJxQqyLkELLkK9gybKelOZgdI2B
         sNsPCIE7HYZguWCJAH5FA1+/Imq254FgIAd16I+4lp5waL/aQDlYz7edJRQeTNB3TURj
         HulQShN//6UflrZMHykGRKpvrXxOLY7+JSTYMdKoVA5lXwNoUG96LiWDApO2Vdu6QKmI
         0n0RvNnGUvyOQtUgaAiD/C47GhiLZWZPKBqBzH0vVCiC4j9oef8k4F+1sHHqOr8Q3Rva
         2qjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=8wEKLy/QbmIjTepBa+G0u56b2IMWWIVu+NxyDN5fxcI=;
        b=HJwguElExzMY896zMOpQEH4R7YHjk6ZYunWgf0KUpqPPYn5AzTSrdqzVRBpG3W/nIs
         uQQJH1e7NxjCxuFByA+vg48KH6YkkQMlDturm3SW1mFy3jBRjhVWKCIvpfjYtC4EvO8j
         M90mnIYgy/c4+10CJusDGVfuGzlbwSKwC90CiXjBga8Sr4LArdBTxRjXheOBO72xkXdB
         CDDU0oU06PnQUSRlRmLbt0oitQPPAyJp1Bb5NuYfiD9ZKgoxQkJgxV1zWRUxcWxY6Hvq
         EcWoSdjL4DzLmg2U7c0A79WRnQxznQc/8av5boKHMB4kOZEBUbwJwnYw+28xq2dYHBWX
         OygQ==
X-Gm-Message-State: APjAAAUFv3BYUaSlfNcfgjfbVCaLNQADW5U8Xc9sLPDHwouDRFDWa0wL
        6walpCDQG34gKDtBl2GKAUI=
X-Google-Smtp-Source: APXvYqyvhS3Wws16gOvM1xFxkNNJYkqWEvO4Bbi80yrpJ+HfvspUT2zid2VwN/75hHGE4n7zVdzrZQ==
X-Received: by 2002:a65:63cf:: with SMTP id n15mr13218245pgv.314.1572607785116;
        Fri, 01 Nov 2019 04:29:45 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id w12sm1369427pfn.105.2019.11.01.04.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2019 04:29:44 -0700 (PDT)
From:   Joel Stanley <joel@jms.id.au>
To:     Rob Herring <robh+dt@kernel.org>, Andrew Jeffery <andrew@aj.id.au>,
        Jeremy Kerr <jk@ozlabs.org>,
        Alistar Popple <alistair@popple.id.au>,
        Eddie James <eajames@linux.ibm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        devicetree@vger.kernel.org, linux-fsi@lists.ozlabs.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] fsi: aspeed: Add trace points
Date:   Fri,  1 Nov 2019 21:59:05 +1030
Message-Id: <20191101112905.7282-5-joel@jms.id.au>
X-Mailer: git-send-email 2.24.0.rc1
In-Reply-To: <20191101112905.7282-1-joel@jms.id.au>
References: <20191101112905.7282-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

These trace points help with debugging the FSI master. They show the low
level reads, writes and error states of the master.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 drivers/fsi/fsi-master-aspeed.c          | 22 +++++++
 include/trace/events/fsi_master_aspeed.h | 77 ++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 include/trace/events/fsi_master_aspeed.h

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index 5bb7a778075e..be1f2449b77a 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -67,6 +67,9 @@ static const u32 fsi_base = 0xa0000000;
 #define XFER_HALFWORD	(BIT(0))
 #define XFER_BYTE	(0)
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/fsi_master_aspeed.h>
+
 #define FSI_LINK_ENABLE_SETUP_TIME	10	/* in mS */
 
 #define DEFAULT_DIVISOR			14
@@ -92,6 +95,8 @@ static int __opb_write(struct fsi_master_aspeed *aspeed, u32 addr,
 
 	status = readl(base + OPB0_STATUS);
 
+	trace_fsi_master_aspeed_opb_write(addr, val, transfer_size, status, reg);
+
 	/* Return error when poll timed out */
 	if (ret)
 		return ret;
@@ -139,6 +144,10 @@ static int __opb_read(struct fsi_master_aspeed *aspeed, uint32_t addr,
 
 	result = readl(base + OPB0_FSI_DATA_R);
 
+	trace_fsi_master_aspeed_opb_read(addr, transfer_size, result,
+			readl(base + OPB0_STATUS),
+			reg);
+
 	/* Return error when poll timed out */
 	if (ret)
 		return ret;
@@ -186,6 +195,19 @@ static int check_errors(struct fsi_master_aspeed *aspeed, int err)
 {
 	int ret;
 
+	if (trace_fsi_master_aspeed_opb_error_enabled()) {
+		__be32 mresp0, mstap0, mesrb0;
+
+		opb_readl(aspeed, ctrl_base + FSI_MRESP0, &mresp0);
+		opb_readl(aspeed, ctrl_base + FSI_MSTAP0, &mstap0);
+		opb_readl(aspeed, ctrl_base + FSI_MESRB0, &mesrb0);
+
+		trace_fsi_master_aspeed_opb_error(
+				be32_to_cpu(mresp0),
+				be32_to_cpu(mstap0),
+				be32_to_cpu(mesrb0));
+	};
+
 	if (err == -EIO) {
 		/* Check MAEB (0x70) ? */
 
diff --git a/include/trace/events/fsi_master_aspeed.h b/include/trace/events/fsi_master_aspeed.h
new file mode 100644
index 000000000000..a355ceacc33f
--- /dev/null
+++ b/include/trace/events/fsi_master_aspeed.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM fsi_master_aspeed
+
+#if !defined(_TRACE_FSI_MASTER_ASPEED_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_FSI_MASTER_ASPEED_H
+
+#include <linux/tracepoint.h>
+
+TRACE_EVENT(fsi_master_aspeed_opb_read,
+	TP_PROTO(uint32_t addr, size_t size, uint32_t result, uint32_t status, uint32_t irq_status),
+	TP_ARGS(addr, size, result, status, irq_status),
+	TP_STRUCT__entry(
+		__field(uint32_t,  addr)
+		__field(size_t,    size)
+		__field(uint32_t,  result)
+		__field(uint32_t,  status)
+		__field(uint32_t,  irq_status)
+		),
+	TP_fast_assign(
+		__entry->addr = addr;
+		__entry->size = size;
+		__entry->result = result;
+		__entry->status = status;
+		__entry->irq_status = irq_status;
+		),
+	TP_printk("addr %08x size %zu: result %08x sts: %08x irq_sts: %08x",
+		__entry->addr, __entry->size, __entry->result,
+		__entry->status, __entry->irq_status
+	   )
+);
+
+TRACE_EVENT(fsi_master_aspeed_opb_write,
+	TP_PROTO(uint32_t addr, uint32_t val, size_t size, uint32_t status, uint32_t irq_status),
+	TP_ARGS(addr, val, size, status, irq_status),
+	TP_STRUCT__entry(
+		__field(uint32_t,    addr)
+		__field(uint32_t,    val)
+		__field(size_t,    size)
+		__field(uint32_t,  status)
+		__field(uint32_t,  irq_status)
+		),
+	TP_fast_assign(
+		__entry->addr = addr;
+		__entry->val = val;
+		__entry->size = size;
+		__entry->status = status;
+		__entry->irq_status = irq_status;
+		),
+	TP_printk("addr %08x val %08x size %zu status: %08x irq_sts: %08x",
+		__entry->addr, __entry->val, __entry->size,
+		__entry->status, __entry->irq_status
+		)
+	);
+
+TRACE_EVENT(fsi_master_aspeed_opb_error,
+	TP_PROTO(uint32_t mresp0, uint32_t mstap0, uint32_t mesrb0),
+	TP_ARGS(mresp0, mstap0, mesrb0),
+	TP_STRUCT__entry(
+		__field(uint32_t,  mresp0)
+		__field(uint32_t,  mstap0)
+		__field(uint32_t,  mesrb0)
+		),
+	TP_fast_assign(
+		__entry->mresp0 = mresp0;
+		__entry->mstap0 = mstap0;
+		__entry->mesrb0 = mesrb0;
+		),
+	TP_printk("mresp0 %08x mstap0 %08x mesrb0 %08x",
+		__entry->mresp0, __entry->mstap0, __entry->mesrb0
+		)
+	);
+
+#endif
+
+#include <trace/define_trace.h>
-- 
2.24.0.rc1

