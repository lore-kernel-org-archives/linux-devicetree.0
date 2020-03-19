Return-Path: <SRS0=Rh3i=5E=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69A14C4332E
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 12:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F95820663
	for <linux-devicetree@archiver.kernel.org>; Thu, 19 Mar 2020 12:14:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="njOQ4F8k"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbgCSMOd (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 19 Mar 2020 08:14:33 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44926 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727031AbgCSMOb (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 19 Mar 2020 08:14:31 -0400
Received: by mail-wr1-f68.google.com with SMTP id o12so2126272wrh.11
        for <devicetree@vger.kernel.org>; Thu, 19 Mar 2020 05:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X2Xv4uORm87l+84uMG+Z6O9csFS6Z05eg8XvBedWYqw=;
        b=njOQ4F8kt/r3GjPvAzUyBYTgWq111kBIjNvQFumoP24lpirM/JRS32i7mCVLBAITCi
         cgiYylpSdPnpyFSwyawXbeFzc1KdwmAbCRNhWrvybOpBDtnQQiQK2bq/okxVMSP7NaCX
         7bBvGtZ5YwrbK4yH7oOvieqdjMtx4erDTKjJyt/OzwZi131VLgkiU9Pa44pS1i3WJvFs
         vPGmnFXcmqDLGxd3OVVOQlNZWufB0Dks+OxA4p4z4tW/3yroj4QIdTPRJlx5QrWeFkAY
         g7cOh1gkk4K/rH1mndJ7M9wVr52N9ZqFiXrMm93At1zZlereR94Z0BjZFxeMRZqNgmU8
         f0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X2Xv4uORm87l+84uMG+Z6O9csFS6Z05eg8XvBedWYqw=;
        b=QCpY96m2yEg0w6YeHVfl1pni1zaKOOZtvpHpU8yETrK/gK4oPakytRghJJKbpUfjYu
         g4S3u4O+6llfmF+Q1wYfpGlDXd1Z90tO/azkyVyg90ED8cvWsYuwG4CdwEhJTl1+uPwx
         feWh1VpklS41EsyzSVCOAu797Eoq2u/xtbBz1AmW98Yoi9+mAqKvjCKrNIluztscWh1p
         NvsTNCvtuNk6/lhIaaQey4YL/OJUQqZLelE8UxA+vpEA8me9tl1+2dp2ta54BarvgAOh
         iMwXfFf3Tu0ne8ZNEWmit96XEpLhT+Y6sSGlyCpoEbtJMyAK5V0VMUbs8l4CHU0/qpm4
         xTTA==
X-Gm-Message-State: ANhLgQ1dVv+OXZtinc6oPYMsyh1X6cSEOXnxUPiLfXB3vNPUhs60BzIw
        lgHTbci1m3+GWYS2vC/5rxhpwQ==
X-Google-Smtp-Source: ADFU+vtRmac6JqvgKSJgSidNRtitLeNCe4QcW4CA86WQGWpD3QSiU9DNPQqam6jsn2srAoi7DF6rEg==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr3813859wro.193.1584620066954;
        Thu, 19 Mar 2020 05:14:26 -0700 (PDT)
Received: from srini-hackbox.lan (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
        by smtp.gmail.com with ESMTPSA id a73sm2770455wme.47.2020.03.19.05.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2020 05:14:25 -0700 (PDT)
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2] soc: qcom: socinfo: add missing soc_id sysfs entry
Date:   Thu, 19 Mar 2020 12:14:18 +0000
Message-Id: <20200319121418.5180-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

Looks like SoC ID is not exported to sysfs for some reason.
This patch adds it!

This is mostly used by userspace libraries like Snapdragon
Neural Processing Engine (SNPE) SDK for checking supported SoC info.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
Changes since v1:
	- expanded SNPE short form for more clarity

 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ebb49aee179b..08a4b8ae1764 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -430,6 +430,8 @@ static int qcom_socinfo_probe(struct platform_device *pdev)
 	qs->attr.family = "Snapdragon";
 	qs->attr.machine = socinfo_machine(&pdev->dev,
 					   le32_to_cpu(info->id));
+	qs->attr.soc_id = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u",
+					 le32_to_cpu(info->id));
 	qs->attr.revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%u.%u",
 					   SOCINFO_MAJOR(le32_to_cpu(info->ver)),
 					   SOCINFO_MINOR(le32_to_cpu(info->ver)));
-- 
2.21.0

