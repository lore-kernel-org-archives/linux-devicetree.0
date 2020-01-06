Return-Path: <SRS0=ND8X=23=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EC5C33CA1
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 15:50:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 40437207FF
	for <linux-devicetree@archiver.kernel.org>; Mon,  6 Jan 2020 15:50:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SbKDbi4H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbgAFPuY (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Mon, 6 Jan 2020 10:50:24 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44896 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726927AbgAFPuY (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 6 Jan 2020 10:50:24 -0500
Received: by mail-lj1-f195.google.com with SMTP id u71so51377204lje.11
        for <devicetree@vger.kernel.org>; Mon, 06 Jan 2020 07:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BGNJV+T/A2yMDmvoIRAZ3Ql5cKw3jiqTHheiep1uASM=;
        b=SbKDbi4H0AXMk/VMgh+kHK4NZuJBIxX334QO7e/+w9pYxtARgYqif5gu74r8M+ISLK
         ryQN7+WuCIkeXAD9NstbEiT8jy0Xb/FeMzBVWM1Lgxs8Wyi5XJXnHVallVbGWhnYHFDw
         bqiySDlFIXeP1Zdr1KQqZditUVDtJC7W1jWlX1/toY+b/e6PPlBMRVS85DaFgcz1rrV5
         FYCeGBYbR8JLkZSfPD/X0Uqau5EQTncANGu16dkdsAyYGzTkVpHOxlQhRxsk4E1jXp/W
         dpTrfwRUskQ92Hft25+i4Gneimxj4Yl31AiaY1L4ammBTkJEXUebfOWuhqHET9kHuuej
         l56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BGNJV+T/A2yMDmvoIRAZ3Ql5cKw3jiqTHheiep1uASM=;
        b=hLgSG56dvVF/4xOUXbnvBdl+zJYfAnZ6DaCtLY06TEj+egtL6snTqB2GWPNi0wn8oj
         hjrn4Y0hjAkTZWGwDjrXKgIbp5DHmjkUFeCUKnIi9mu09sqPogzLhoI0IwXz+Ijl8daa
         8tk/jfsSXSbqwkL8q/jDEkYba6ca5/gtiztG59MvSIiAhRQiDIMS3f7BdZtPsBi+NFwZ
         36/uKV7PhzR8Mfl+saDUSXIep75I5hdUaGWpU8PNwKX/Ddy8U02Bi/X551wCLIYzR/g5
         xSSMIlObcieOntKv6ESZ61Lze3dQZXygYYodYJ8z21EM3ibkzbABa7trvkSmwwu/QHIu
         feIQ==
X-Gm-Message-State: APjAAAXr+aDbXT5DjYwFHk1TPwWGWYIxm/Y/JmDqMaxPdGoiFrbWpZx+
        HoR//kOwIybeaaOtu6ZNW3Zueg==
X-Google-Smtp-Source: APXvYqx8EiFqr9oVEr2tK/TUXU6n3zuupSQlIhSG6KWVH+yTLTXk/9UU9jgciAoDRQg+erUcyhFJzg==
X-Received: by 2002:a2e:58c:: with SMTP id 134mr62497740ljf.12.1578325822739;
        Mon, 06 Jan 2020 07:50:22 -0800 (PST)
Received: from localhost.localdomain ([37.157.136.193])
        by smtp.gmail.com with ESMTPSA id x84sm29388259lfa.97.2020.01.06.07.50.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:50:22 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 10/12] venus: core: add sdm845-v2 DT compatible and resource struct
Date:   Mon,  6 Jan 2020 17:49:27 +0200
Message-Id: <20200106154929.4331-11-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
References: <20200106154929.4331-1-stanimir.varbanov@linaro.org>
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

In order to use dynamic video codec assignment add a new sdm845-v2
DT compatible and new venus_resource structure to cover the binding
where all pmdomains and clocks are under the venus_core control.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.c | 27 ++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index a20ab00a8068..c7525d951e92 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -495,10 +495,37 @@ static const struct venus_resources sdm845_res = {
 	.fwname = "qcom/venus-5.2/venus.mdt",
 };
 
+static const struct venus_resources sdm845_res_v2 = {
+	.freq_tbl = sdm845_freq_table,
+	.freq_tbl_size = ARRAY_SIZE(sdm845_freq_table),
+	.bw_tbl_enc = sdm845_bw_table_enc,
+	.bw_tbl_enc_size = ARRAY_SIZE(sdm845_bw_table_enc),
+	.bw_tbl_dec = sdm845_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sdm845_bw_table_dec),
+	.codec_freq_data = sdm845_codec_freq_data,
+	.codec_freq_data_size = ARRAY_SIZE(sdm845_codec_freq_data),
+	.clks = {"core", "iface", "bus" },
+	.clks_num = 3,
+	.vcodec0_clks = { "vcodec0_core", "vcodec0_bus" },
+	.vcodec1_clks = { "vcodec1_core", "vcodec1_bus" },
+	.vcodec_clks_num = 2,
+	.vcodec_pmdomains = { "venus", "vcodec0", "vcodec1" },
+	.vcodec_pmdomains_num = 3,
+	.vcodec_num = 2,
+	.max_load = 3110400,	/* 4096x2160@90 */
+	.hfi_version = HFI_VERSION_4XX,
+	.vmem_id = VIDC_RESOURCE_NONE,
+	.vmem_size = 0,
+	.vmem_addr = 0,
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/venus-5.2/venus.mdt",
+};
+
 static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8916-venus", .data = &msm8916_res, },
 	{ .compatible = "qcom,msm8996-venus", .data = &msm8996_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
+	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
-- 
2.17.1

