Return-Path: <SRS0=sOYF=2R=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7CEC2D0C6
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 05:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D30BD20828
	for <linux-devicetree@archiver.kernel.org>; Fri, 27 Dec 2019 05:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nLUHfY3E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfL0FdC (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Fri, 27 Dec 2019 00:33:02 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:34464 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727102AbfL0FdA (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 27 Dec 2019 00:33:00 -0500
Received: by mail-pf1-f194.google.com with SMTP id i6so7377589pfc.1
        for <devicetree@vger.kernel.org>; Thu, 26 Dec 2019 21:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CeCsCjetYaq9WLaLyz0l/vASvwsTn/rJXzj0Xq2S4N0=;
        b=nLUHfY3E5pMaN/KibvmuXbNaq42aQuxH65u3ZO17PcOn2YXEXNxWwRZ1Uwshnr2S+A
         lVYJhmM9SL4UeG2a1yWFvttGr1Wo/xmIAbIq9BLzf6o6geguJVWtrYcCgOC4gSvhQpHi
         lf6+PG0dZwBXVEwwPMZAuVTtW9W4YxRzxMV/4x5w1NklBDocWivYi6fgJHI4brndU4xN
         MMPqLAFb5AwBy+Jk9GUrwJ9qzXxszrZlwXCmLp7l/OP8g0O36xOlipenlvdtD6k2JdK8
         w2z42alR2lXpGiTRg4hUQl3IAkxVa0wtJWqfuNGJsWeCJElbo7fX2MvECQw3E+b2U2nW
         O47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CeCsCjetYaq9WLaLyz0l/vASvwsTn/rJXzj0Xq2S4N0=;
        b=sYXSgfzxidnHWTyPr0VWx8yc14QY+BRVCalEt3eVoCIfkmfFqjtKDXV2gk6jTA4+DO
         XdavCjnpnzQ2V6uiqGU4h0WhR+h3c1w2mqq/pPlJaLBJE8JgyTNGND2cxZYxt6G8kuS6
         WiWFVu1iOzURY2L1pqzqL/8j423wmN7So5yLi7NLRAwNRghDyEDhpjY3MfdD6JSVI3ct
         kq28+af/sO5yPSnrfE25NSUBBABGW6IcpN5lw9rrsWWacUfAq5T69ZtpIkIN+MMSSdWG
         3yn+BM7E87iplUIViS3Z32XlVP/u2WKLpvbXJ0wxX5HJpI6z/8QexOUfAiz2C7pKa0i3
         RA3g==
X-Gm-Message-State: APjAAAX08QdCym9oWKSJgEEmnPHzpa1HhOIXtZar1Oo7QtufO8H8JsJX
        p7hluFIM5lCS/almshkwiC9JBg==
X-Google-Smtp-Source: APXvYqxzJpBIHGrECrk/Sj1WJfPavf8d17nw7NaVwsIPGGgf0uM1/ScPyfybxlPjCI6MxIUQVcd6NQ==
X-Received: by 2002:a63:1210:: with SMTP id h16mr51989473pgl.171.1577424779986;
        Thu, 26 Dec 2019 21:32:59 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id c22sm16789196pfo.50.2019.12.26.21.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2019 21:32:59 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v2 7/8] remoteproc: qcom: q6v5: Add common panic handler
Date:   Thu, 26 Dec 2019 21:32:14 -0800
Message-Id: <20191227053215.423811-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191227053215.423811-1-bjorn.andersson@linaro.org>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a common panic handler that invokes a stop request and sleep enough
to let the remoteproc flush it's caches etc in order to aid post mortem
debugging.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- None

 drivers/remoteproc/qcom_q6v5.c | 19 +++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h |  1 +
 2 files changed, 20 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index cb0f4a0be032..17167c980e02 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2014 Sony Mobile Communications AB
  * Copyright (c) 2012-2013, The Linux Foundation. All rights reserved.
  */
+#include <linux/delay.h>
 #include <linux/kernel.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
@@ -15,6 +16,8 @@
 #include <linux/remoteproc.h>
 #include "qcom_q6v5.h"
 
+#define Q6V5_PANIC_DELAY_MS	200
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -162,6 +165,22 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
 
+/**
+ * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Set the stop bit and sleep in order to allow the remote processor to flush
+ * its caches etc for post mortem debugging.
+ */
+void qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
+{
+	qcom_smem_state_update_bits(q6v5->state,
+				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
+
+	mdelay(Q6V5_PANIC_DELAY_MS);
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 7ac92c1e0f49..c37e6fd063e4 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
+void qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
 
 #endif
-- 
2.24.0

