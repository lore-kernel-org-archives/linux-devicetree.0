Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A12C352A4
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 213E92080C
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsdDKXZg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgBKAwe (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 19:52:34 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:45139 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727729AbgBKAwT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 19:52:19 -0500
Received: by mail-pg1-f196.google.com with SMTP id b9so4772967pgk.12
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 16:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VL9nzl13JbFlFI5aOpKHBIlRNrHP5XdfNTObBCxAwmM=;
        b=JsdDKXZg83El14Y+KO7R4dJ8Ux+zLngwyOQ9E8Xr/vgF278O/o+YOUlMivVMSxSyz6
         KdjF1kVdkSV/s78/LaHLL8i9pcK98CVtiaftdmgQD0OW2nB1DjSfT7Q4+ehI+VgxPazv
         wTEUd/05phFW0T0/V2uhM8oVi+rKJkYl2UIcv1RAgHxZbjaVssmGEPiuouiQBK8Ri3xB
         Vu8nQLRF7GAMalbw3I4lenhvjXMvRw7IEYTy+tBGZwzjwejo9JtIMpQdpyCP/5ybLmRT
         MwPovBVu4PJBO6EtHFf9S5YG2yrJ+ZKqtA7lBxRBg9B6P0YHEutD2AImaJLqtiY9GBs4
         2NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VL9nzl13JbFlFI5aOpKHBIlRNrHP5XdfNTObBCxAwmM=;
        b=knaPQrCvNX2ItGKpl5aZYzxbtt+7/+7mqOjB8QsGBK8lYcPm8vzYMvlf9N8xjPVQQY
         FANTiTPE+XMPV+BjwsDYLQE5KgfhqeZ0VE7omTiE1jyx8QESRuG6YW9MxbnCrIz7J5sD
         BH2Jiryn3EQMpNcfOPbC/Hoe4ch01ccWwTs7+0xecy6Tq72oMI4caUjlops/ogFjmOSu
         XEhZzyYwtripSDYVoBmntTCezWsK6p8Ts23QjiSIy3XJP6ufbvfFA0Ffv85vOIwg8+TR
         nm/9F9NW4iPOZR7K00IaYdpI2PyCklU3An+gubc7sEpHI0vF94Hm2aicyUGJ1VU+6Xom
         yzqA==
X-Gm-Message-State: APjAAAUMEup+FweVZWpqN2NxqkHwihMdKrmK6VkslM/Q+5HMTlcP3cL8
        2SjM5+hsopCAjrkwAdr5/oRDaQ==
X-Google-Smtp-Source: APXvYqxcdRYNV1rhar6shgYZDBGKPcIBa/X2p9rsfFfoCjyYkYM1zFHNbn0J6xNiVUAwIbwl77k/vQ==
X-Received: by 2002:a63:615:: with SMTP id 21mr4301621pgg.440.1581382338561;
        Mon, 10 Feb 2020 16:52:18 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:18 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 7/8] remoteproc: qcom: q6v5: Add common panic handler
Date:   Mon, 10 Feb 2020 16:50:58 -0800
Message-Id: <20200211005059.1377279-8-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Add a common panic handler that invokes a stop request and sleep enough
to let the remoteproc flush it's caches etc in order to aid post mortem
debugging. For now a hard coded 200ms is returned to the remoteproc
core, this value is taken from the downstream kernel.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Update return type and return the delay

 drivers/remoteproc/qcom_q6v5.c | 20 ++++++++++++++++++++
 drivers/remoteproc/qcom_q6v5.h |  1 +
 2 files changed, 21 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5.c b/drivers/remoteproc/qcom_q6v5.c
index cb0f4a0be032..6bf660ad889c 100644
--- a/drivers/remoteproc/qcom_q6v5.c
+++ b/drivers/remoteproc/qcom_q6v5.c
@@ -15,6 +15,8 @@
 #include <linux/remoteproc.h>
 #include "qcom_q6v5.h"
 
+#define Q6V5_PANIC_DELAY_MS	200
+
 /**
  * qcom_q6v5_prepare() - reinitialize the qcom_q6v5 context before start
  * @q6v5:	reference to qcom_q6v5 context to be reinitialized
@@ -162,6 +164,24 @@ int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5)
 }
 EXPORT_SYMBOL_GPL(qcom_q6v5_request_stop);
 
+/**
+ * qcom_q6v5_panic() - panic handler to invoke a stop on the remote
+ * @q6v5:	reference to qcom_q6v5 context
+ *
+ * Set the stop bit and sleep in order to allow the remote processor to flush
+ * its caches etc for post mortem debugging.
+ *
+ * Return: 200ms
+ */
+unsigned int qcom_q6v5_panic(struct qcom_q6v5 *q6v5)
+{
+	qcom_smem_state_update_bits(q6v5->state,
+				    BIT(q6v5->stop_bit), BIT(q6v5->stop_bit));
+
+	return Q6V5_PANIC_DELAY_MS;
+}
+EXPORT_SYMBOL_GPL(qcom_q6v5_panic);
+
 /**
  * qcom_q6v5_init() - initializer of the q6v5 common struct
  * @q6v5:	handle to be initialized
diff --git a/drivers/remoteproc/qcom_q6v5.h b/drivers/remoteproc/qcom_q6v5.h
index 7ac92c1e0f49..3bef8243b33b 100644
--- a/drivers/remoteproc/qcom_q6v5.h
+++ b/drivers/remoteproc/qcom_q6v5.h
@@ -42,5 +42,6 @@ int qcom_q6v5_prepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_unprepare(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_request_stop(struct qcom_q6v5 *q6v5);
 int qcom_q6v5_wait_for_start(struct qcom_q6v5 *q6v5, int timeout);
+unsigned int qcom_q6v5_panic(struct qcom_q6v5 *q6v5);
 
 #endif
-- 
2.24.0

