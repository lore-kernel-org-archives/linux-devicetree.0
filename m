Return-Path: <SRS0=TQXC=2M=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2AA2C2D0D3
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B43C62070A
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzLNJJ0Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726291AbfLVOKv (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:51 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:52784 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfLVOKv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:51 -0500
Received: by mail-wm1-f65.google.com with SMTP id p9so13385947wmc.2;
        Sun, 22 Dec 2019 06:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ikfJiDpjg9QYCtJ3tEmCYkHOmVUTASh0OD5MpVkjVLU=;
        b=gzLNJJ0Q+KkYDQw5mVCzdY39juEHI8921wIgvSOjZnq1UQYZGK9ioW6xbd1w/pZyOc
         0FTklasvkROuH4jJvbWbnzv/l8jlw/ytE9LaNk0ms+B0WE4SVnpersTg5bb6c6prdwu/
         7qhUoU6YDXcQ9GaiNxFL2uVuy5/6zbiwjfXR+AyIcmWKaqxG87IIPFDfhMZt7Sp65zzr
         Ac3OLh/kvNmUAMfD13U1nVS3q0GT+in7M7LFeQjeY0F6wkGiRokwV2TGK21hDkLIgLUh
         xM02vCWaEXRAUPHS17wOr4APBbYGsdv+rHwPImkyemBUhN+aarFT2XQlCST7n0FP3ceE
         WGXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ikfJiDpjg9QYCtJ3tEmCYkHOmVUTASh0OD5MpVkjVLU=;
        b=jXIiuUw+hiNenOsP+hEIebElzirdiuooQjo4Z9iM+arF2Q7LmIuqlwsLBh3Ii0/IWX
         GybJYsWsd8KkiTdaA2AMjZXxWVD+YXKDYo16FAfxW+2LtF6t3dkAfaAGKlCER5NjRIFU
         UOf25ku+tb8tHCcUGjaJY12/ryg3MrRJNFln9MPfOHCEOk2MqOAM4XIQQ7YIWVtlU0pR
         a3ygz+/gRCCcFVDP6L/unCGrlAjcHPMzxcmO47K6Ybr4K9XYnO11ciyfb/W1ai/N3mVX
         gQvB+85Wk9jN36AbH9A4s8z3f5JyslaiVP5+0urkVISfN7VTpzk5QvcMvGEjlnoHTAUh
         KuIA==
X-Gm-Message-State: APjAAAWCQwJgTbNe1hjL3k1xfd2TPWF4Yoz2ZMsMbd0YgNskYz6D29rE
        zOjBeaSc9+5NhDcqVq5AVR0=
X-Google-Smtp-Source: APXvYqxH/UjRNAHzS217dwm1H2UKxNF5l3vyB9FvGUpFv1KPJJBP0SrEThecMZsb/8psOPk7oPR+eg==
X-Received: by 2002:a1c:9d8b:: with SMTP id g133mr25936600wme.27.1577023849320;
        Sun, 22 Dec 2019 06:10:49 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id t190sm16546496wmt.44.2019.12.22.06.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/13] memory: tegra: Add system sleep support
Date:   Sun, 22 Dec 2019 15:10:29 +0100
Message-Id: <20191222141035.1649937-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add system suspend/resume support for the memory controller found on
Tegra186 and later. This is required so that the SID registers can be
reprogrammed after their content was lost during system sleep.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 57895116c8e5..77a313f1bf0e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -602,10 +602,29 @@ static const struct of_device_id tegra186_mc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
 
+static int tegra186_mc_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int tegra186_mc_resume(struct device *dev)
+{
+	struct tegra186_mc *mc = dev_get_drvdata(dev);
+
+	tegra186_mc_program_sid(mc);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra186_mc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(tegra186_mc_suspend, tegra186_mc_resume)
+};
+
 static struct platform_driver tegra186_mc_driver = {
 	.driver = {
 		.name = "tegra186-mc",
 		.of_match_table = tegra186_mc_of_match,
+		.pm = &tegra186_mc_pm_ops,
 		.suppress_bind_attrs = true,
 	},
 	.prevent_deferred_probe = true,
-- 
2.24.1

