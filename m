Return-Path: <SRS0=x5QR=37=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C22BC352A4
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C5892080C
	for <linux-devicetree@archiver.kernel.org>; Tue, 11 Feb 2020 00:52:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SjRakv+7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727753AbgBKAwb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 10 Feb 2020 19:52:31 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:46648 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbgBKAwU (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 10 Feb 2020 19:52:20 -0500
Received: by mail-pl1-f195.google.com with SMTP id y8so3506647pll.13
        for <devicetree@vger.kernel.org>; Mon, 10 Feb 2020 16:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GYcfh7fMvYAlIR4aXXQzSt3C06chntR52at8wJa3tek=;
        b=SjRakv+7HKKrp8NEOCX6VIPeMG11xHX8mJW3D+GViIV7v/rUbknzfoWGD0potFL2Ya
         TrH3x9E6SmsvIRYJXb+wZzcUZG74z3A4hCT1zGy6vaWGkoo29WuZG/Juz1fNPwu3dZ9i
         zJVy0AN1d12ARHC111yN0xNgL1xmfRiN/v6oLaG1sYZw9+rYZVpLxti/3vV7gUCpyk6n
         sjzITxfb819yxQs05nd58woWMNZmuSyJJguUK+OjN1cRYKgRCi9yZJmDvp7nY/m9XBuw
         5cOnSiqNgDHn1viFutg6GcTlXZeQH0PxU1/DoDSkcmnMkKmMDcjYWiOLw5bpZmlNo3UA
         OI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GYcfh7fMvYAlIR4aXXQzSt3C06chntR52at8wJa3tek=;
        b=JpY4VA0uKk9WKT+A4pLfsxbZ7jc3xb+MxwMdPbgqKghIo3f31FBBosqyo4b+SJWdLn
         pkL0pbKeonP6PV7RdJRrWz9jsgEmDA5zpY299sN34DmJ0IB1vWTb3e6UGjrJwcG6+XVG
         zLYAeo2+SCszDflWp/pUhZyflCt8XQAoOMk+xww7Tq9CYy0ha176N0re79oQKjQh+9Sf
         OMsuFy2KmufFR9AHSnJuD2ccP0vUE4mnfhixkC48g+QrG20igscRrJw9SuxXMM4zAebZ
         d0BeuwvTxeq86bALrQFr9UT39WHfa98cJdkj/V9rttruhfkQO35F82XBsRByj/4IZzDO
         7oeg==
X-Gm-Message-State: APjAAAUdMpWggt7Aj2p9ouB/5VkRP3TeceGagJjm95eO5ZL7GAsm7oYR
        Ah5y9muGUJnz08aIJPUTI0f4bA==
X-Google-Smtp-Source: APXvYqy3iW4pbURn69ZVNZ5cxr/DdFPKQ0xbucqlfM3QXmYD5SG1FCE8u5y7dSubB0s6uoRDoGzQFg==
X-Received: by 2002:a17:902:760e:: with SMTP id k14mr590560pll.119.1581382339888;
        Mon, 10 Feb 2020 16:52:19 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q21sm1538480pff.105.2020.02.10.16.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:52:19 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Subject: [PATCH v3 8/8] remoteproc: qcom: Introduce panic handler for PAS and ADSP
Date:   Mon, 10 Feb 2020 16:50:59 -0800
Message-Id: <20200211005059.1377279-9-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
References: <20200211005059.1377279-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Make the PAS and ADSP/CDSP remoteproc drivers implement the panic
handler that will invoke a stop to prepare the remoteprocs for post
mortem debugging.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- Update return type and pass the return value through

 drivers/remoteproc/qcom_q6v5_adsp.c | 8 ++++++++
 drivers/remoteproc/qcom_q6v5_pas.c  | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index 19f784adf91c..822881534d37 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -291,12 +291,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
 	return adsp->mem_region + offset;
 }
 
+static unsigned int adsp_panic(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+
+	return qcom_q6v5_panic(&adsp->q6v5);
+}
+
 static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
+	.panic = adsp_panic,
 };
 
 static int adsp_init_clock(struct qcom_adsp *adsp, const char **clk_ids)
diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index d20ce3c62256..ac38624fb14d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -242,12 +242,20 @@ static void *adsp_da_to_va(struct rproc *rproc, u64 da, int len)
 	return adsp->mem_region + offset;
 }
 
+static unsigned int adsp_panic(struct rproc *rproc)
+{
+	struct qcom_adsp *adsp = (struct qcom_adsp *)rproc->priv;
+
+	return qcom_q6v5_panic(&adsp->q6v5);
+}
+
 static const struct rproc_ops adsp_ops = {
 	.start = adsp_start,
 	.stop = adsp_stop,
 	.da_to_va = adsp_da_to_va,
 	.parse_fw = qcom_register_dump_segments,
 	.load = adsp_load,
+	.panic = adsp_panic,
 };
 
 static int adsp_init_clock(struct qcom_adsp *adsp)
-- 
2.24.0

