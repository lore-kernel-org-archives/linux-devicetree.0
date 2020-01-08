Return-Path: <SRS0=aplZ=25=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2362FC33C9E
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 05:53:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8BC92073D
	for <linux-devicetree@archiver.kernel.org>; Wed,  8 Jan 2020 05:53:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rmY/HpS/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725774AbgAHFxh (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Wed, 8 Jan 2020 00:53:37 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:36189 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgAHFxh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 8 Jan 2020 00:53:37 -0500
Received: by mail-pg1-f195.google.com with SMTP id k3so1018209pgc.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jan 2020 21:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoB041Qi6gAAsKDfeXTiJLvWYKMaZ3RNSLAQlXIIIG0=;
        b=rmY/HpS/mbpy6xWHZc+XG8LDePEJw8nEDOE0yYUwMpcMbWnwWD4ibVlbu0EtJt9XGY
         WTpuQENnkbkloGePmvTrH2uDl2i4ocs//5xYYKO8sKEFe0NOUpPL4H9cv36+Fa8Wv+o8
         73u1xiZnqzTqz5nGn/h2l3h++gMTHvf/Qtf1wA3lblGcMZ9vIHGoEvJhTiocXpKJ45Ma
         qGZTgblO1msz7vOzp8YrREaSyZ+2UCokkTEp7+vGdJIBFAnzrJfwO1K1VOYPbogtinNp
         8LCL2gseqtHo1MnNLTdgnZ1qS+wMFzm8MCoHr2YBTHVLTj0+yQg+Qs3d5+d/U5ZDryb0
         ptVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YoB041Qi6gAAsKDfeXTiJLvWYKMaZ3RNSLAQlXIIIG0=;
        b=C+IQFGDOhYK2wfap+p4vGt3xsD2eywXMNPgCSK56eReVDG8autSP/hbVMwA7721t9y
         wm6RFGViCR96J9rsfR5j73kzPe+PpaKC5ahhWZ1iGRhdUPb/MwfynqRecQ5+Zi1NHuRV
         BRp22lns37fISQIFZU6bNPXCf2/Yi7rmGfIs2ZFz0k69gnbNvnDqUWAqVqtCTbSpKnh0
         kTOedp+yoe788v88uhfUrITCZgDhFHAzDcE2A2Vg6TJL8KF8R4Wfp7zb40yLzYj4F8NS
         FU3hdHvCpFr4JGFDL0FgdcsRtUETYYNxXFTeysbGAbUsml4vyeM414dkeI64RzgGoOdG
         vjhA==
X-Gm-Message-State: APjAAAVflBB8jJXVbhH08pC3x1Qk7un3lyyqsUNw1hRuRGtEegrdNPdf
        4xqZkXui9kqX4IaZQsa4FsY++w==
X-Google-Smtp-Source: APXvYqzw6INjJz8mKK7BZ2+aIxdsMGb+ExuIJpa29ybtjU6VtPqSIZdlwTCJ4IiEtL1Rb8g/wUwGUA==
X-Received: by 2002:a65:5786:: with SMTP id b6mr3555590pgr.316.1578462816142;
        Tue, 07 Jan 2020 21:53:36 -0800 (PST)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b8sm1643971pff.114.2020.01.07.21.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 21:53:35 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: wcnss: Allow specifying firmware-name
Date:   Tue,  7 Jan 2020 21:52:52 -0800
Message-Id: <20200108055252.639791-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Introduce a firmware-name property, in order to be able to support
device/platform specific firmware for the wireless connectivity
subsystem; in line with other Qualcomm remoteproc drivers.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 .../devicetree/bindings/remoteproc/qcom,wcnss-pil.txt     | 6 ++++++
 drivers/remoteproc/qcom_wcnss.c                           | 8 +++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
index d420f84ddfb0..00844a5d2ccf 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.txt
@@ -34,6 +34,12 @@ on the Qualcomm WCNSS core.
 	Definition: should be "wdog", "fatal", optionally followed by "ready",
 		    "handover", "stop-ack"
 
+- firmware-name:
+	Usage: optional
+	Value type: <string>
+	Definition: must list the relative firmware image path for the
+		    WCNSS core.
+
 - vddmx-supply:
 - vddcx-supply:
 - vddpx-supply:
diff --git a/drivers/remoteproc/qcom_wcnss.c b/drivers/remoteproc/qcom_wcnss.c
index dc135754bb9c..a0468b3cc76f 100644
--- a/drivers/remoteproc/qcom_wcnss.c
+++ b/drivers/remoteproc/qcom_wcnss.c
@@ -457,6 +457,7 @@ static int wcnss_alloc_memory_region(struct qcom_wcnss *wcnss)
 
 static int wcnss_probe(struct platform_device *pdev)
 {
+	const char *fw_name = WCNSS_FIRMWARE_NAME;
 	const struct wcnss_data *data;
 	struct qcom_wcnss *wcnss;
 	struct resource *res;
@@ -474,8 +475,13 @@ static int wcnss_probe(struct platform_device *pdev)
 		return -ENXIO;
 	}
 
+	ret = of_property_read_string(pdev->dev.of_node, "firmware-name",
+				      &fw_name);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
 	rproc = rproc_alloc(&pdev->dev, pdev->name, &wcnss_ops,
-			    WCNSS_FIRMWARE_NAME, sizeof(*wcnss));
+			    fw_name, sizeof(*wcnss));
 	if (!rproc) {
 		dev_err(&pdev->dev, "unable to allocate remoteproc\n");
 		return -ENOMEM;
-- 
2.24.0

