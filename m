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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C21E8C2D0D4
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99DE42070A
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwAlx0mO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726189AbfLVOKs (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:48 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35581 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbfLVOKr (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:47 -0500
Received: by mail-wm1-f66.google.com with SMTP id p17so13708576wmb.0;
        Sun, 22 Dec 2019 06:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1/mOro4NgYwnpZevvzpvIEMzpkoj/ksBreNeBpDTYAo=;
        b=jwAlx0mOsatYHy659lNHs1JqYLJfwOW7+lDE/v1+aWLfc/ysrbCmdr3v9o/hLAjxKP
         2hUvC3lm6hWE2fyKnK61Rq36WqdvgiLx3i7w0wVik41w/8yfHrRf6/xOV7UETxhgVffA
         7L2oKnsmbRGH71Tn0A61uLqXa7JDv5deudZZViRbpaWD7zBxraKtzafK91lMTiOTbMBk
         hgeT4eB/PY/AoFD7YodB+vafhDj8oi/TnyiqAcXakHJjxs1UATYmWNUIDbOu4YgDQKAi
         +OF+mCJOnzxM5lSzlouewcTgKnXMMy7U3jus6qZjZwFUQ4vRyiCNShJad+uuu5Toiu7i
         850Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1/mOro4NgYwnpZevvzpvIEMzpkoj/ksBreNeBpDTYAo=;
        b=HYBWlUhuipVJTEZvKIB+F7fieFkMEecq1kl2OBGw+yrH75bzg1yik5c6gt1328Iqo0
         di+BVIXiIgtqjBAq59NIQ2ZzFmWzm5F7B6ETcdOFXjyvXiOUXrliKBfmVZxq3pkUy2KY
         2j0YTjCyHqqnmwC9jJ21s14m63KNwiqQzx23W5p3PgRoCtDyW4aG7L196qyqzrjvluuR
         uEDzIE1+GJiLyRVwveKpTg50GWF3cDDEXrjuLbUaAvJsLRIYmdvSvsAkBNTBNr96sGws
         +x4xOQz9GK7yAvb4bOCAehlMwr0jG4MeURKCiGAssC9WVR580PUHMmy9idArPbBkA7xo
         xZ1Q==
X-Gm-Message-State: APjAAAUQq5dGGi/mkeOfHlpDM/ndkCHDHWOgczahlybh2dA7CjcU9bqt
        DHuERbN+X3UO5vB1kEAbf1U=
X-Google-Smtp-Source: APXvYqziLMOLPfZ2htSrLwZmXGW0Pd0oOIxjqj2jMcn+NCV3zxFx4bNvvnbirf3o0UrmwIrgXs4a2Q==
X-Received: by 2002:a1c:a745:: with SMTP id q66mr25711997wme.167.1577023845756;
        Sun, 22 Dec 2019 06:10:45 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id p18sm17057478wmb.8.2019.12.22.06.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:45 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/13] memory: tegra: Add per-SoC data for Tegra186
Date:   Sun, 22 Dec 2019 15:10:27 +0100
Message-Id: <20191222141035.1649937-6-thierry.reding@gmail.com>
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

Instead of hard-coding the memory client table, use per-SoC data in
preparation for adding support for other SoCs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index f72e89877295..ad5c353dba6e 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -6,15 +6,11 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/mod_devicetable.h>
+#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include <dt-bindings/memory/tegra186-mc.h>
 
-struct tegra_mc {
-	struct device *dev;
-	void __iomem *regs;
-};
-
 struct tegra186_mc_client {
 	const char *name;
 	unsigned int sid;
@@ -24,10 +20,16 @@ struct tegra186_mc_client {
 	} regs;
 };
 
+struct tegra186_mc_soc {
+	const struct tegra186_mc_client *clients;
+	unsigned int num_clients;
+};
+
 struct tegra186_mc {
-	struct memory_controller base;
 	struct device *dev;
 	void __iomem *regs;
+
+	const struct tegra186_mc_soc *soc;
 };
 
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
@@ -538,17 +540,24 @@ static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	},
 };
 
+static const struct tegra186_mc_soc tegra186_mc_soc = {
+	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
+	.clients = tegra186_mc_clients,
+};
+
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
 	struct tegra186_mc *mc;
 	struct resource *res;
 	unsigned int i;
-	int err = 0;
+	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
 	if (!mc)
 		return -ENOMEM;
 
+	mc->soc = of_device_get_match_data(&pdev->dev);
+
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	mc->regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(mc->regs))
@@ -556,8 +565,8 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 	mc->dev = &pdev->dev;
 
-	for (i = 0; i < ARRAY_SIZE(tegra186_mc_clients); i++) {
-		const struct tegra186_mc_client *client = &tegra186_mc_clients[i];
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra186_mc_client *client = &mc->soc->clients[i];
 		u32 override, security;
 
 		override = readl(mc->regs + client->regs.override);
@@ -583,7 +592,7 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_mc_of_match[] = {
-	{ .compatible = "nvidia,tegra186-mc", },
+	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
-- 
2.24.1

