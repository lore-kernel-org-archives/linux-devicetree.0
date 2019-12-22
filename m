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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB0EC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 922E120665
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNPLaEpg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbfLVOKt (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:49 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35091 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbfLVOKs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:48 -0500
Received: by mail-wr1-f66.google.com with SMTP id g17so13943045wro.2;
        Sun, 22 Dec 2019 06:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4FvfcScGOqGCyba7I+4/EUJ/GDOw2ve0f7wiG+UB+Yk=;
        b=aNPLaEpgXfe75PXfHkh/q2rblg7LM/KyqESWRqdYRdmuOLmibo6GmhKl+N+OoX5chn
         FaN+qnTy/PFcd7Nx8kgqN2T5wCGx7ppknWZiyNaT2uMPNVp+tofRAaERrvOre/lVID3h
         VcDHh1pFqVuy8dVACycHeD9f5j5WFsIE7fqJzuSB+4m18d/2gHuAeCtIHYj+9H8FY8ap
         6ns05TefErVRgvQl/HUuXcg+BHcnPb4kblTVwM2cmbIBtTeGbawO0GXnyKNsnxemNtoi
         cSggQXQHgbV8YsQ8YmrdugrpGbxnOknFh3KMr7B8GwpbvugR+z9g3/B1dc7w3hQTq28O
         LkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4FvfcScGOqGCyba7I+4/EUJ/GDOw2ve0f7wiG+UB+Yk=;
        b=BWH7txtvOWFmkoKGndjvCLi8KENR7oy6WDaf5f/KptfUCNccg/L1VDl+DP3MD4yACH
         2Ooxmbg6iXjlmSn5UBhlcfNlZQ06vYOdxK+gSdWmhuQro68TQgE/KeJB8OKFloUr3wqj
         odYNOKi5YOobRMqeawIBwWH/6HdHC++H82eiPtVx5FDTYRsBen9SnZpW3KNJSJLg+VIY
         /kc97TKCo40IUyg0eux1rV3A8r2QH9CcD9FdIhGjre+3K4OTLrgb78XZjyKEF6jfBjsV
         q0CGH0TdaZubIGAIxZImFL092zyBADhwYAmwFHucG3A3952nVSpz95+8GHNCK6U/hbEi
         MXcA==
X-Gm-Message-State: APjAAAWbW4wHIroUn5H6vJr6+9zkH6fp1ThNLSge58IJSOYS62IvYe6/
        MmS+4i8JljNRUfI/l7CzvAU=
X-Google-Smtp-Source: APXvYqwsyfdpXYdEEVQFXEvp0IDzKMoJPOqO6It1AhrUeq0ndIPicJ1AmEY9lzhoj3jt/FLdu3bitg==
X-Received: by 2002:a5d:690e:: with SMTP id t14mr25345611wru.65.1577023847368;
        Sun, 22 Dec 2019 06:10:47 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id l17sm16860427wro.77.2019.12.22.06.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:46 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/13] memory: tegra: Extract memory client SID programming
Date:   Sun, 22 Dec 2019 15:10:28 +0100
Message-Id: <20191222141035.1649937-7-thierry.reding@gmail.com>
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

Move programming of the memory client to SID mapping into a separate
function so that it can be reused from multiple call sites.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186.c | 49 ++++++++++++++++++---------------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index ad5c353dba6e..57895116c8e5 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -32,6 +32,32 @@ struct tegra186_mc {
 	const struct tegra186_mc_soc *soc;
 };
 
+static void tegra186_mc_program_sid(struct tegra186_mc *mc)
+{
+	unsigned int i;
+
+	for (i = 0; i < mc->soc->num_clients; i++) {
+		const struct tegra186_mc_client *client = &mc->soc->clients[i];
+		u32 override, security;
+
+		override = readl(mc->regs + client->regs.override);
+		security = readl(mc->regs + client->regs.security);
+
+		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
+			client->name, override, security);
+
+		dev_dbg(mc->dev, "setting SID %u for %s\n", client->sid,
+			client->name);
+		writel(client->sid, mc->regs + client->regs.override);
+
+		override = readl(mc->regs + client->regs.override);
+		security = readl(mc->regs + client->regs.security);
+
+		dev_dbg(mc->dev, "client %s: override: %x security: %x\n",
+			client->name, override, security);
+	}
+}
+
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	{
 		.name = "ptcr",
@@ -549,7 +575,6 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 {
 	struct tegra186_mc *mc;
 	struct resource *res;
-	unsigned int i;
 	int err;
 
 	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
@@ -565,28 +590,8 @@ static int tegra186_mc_probe(struct platform_device *pdev)
 
 	mc->dev = &pdev->dev;
 
-	for (i = 0; i < mc->soc->num_clients; i++) {
-		const struct tegra186_mc_client *client = &mc->soc->clients[i];
-		u32 override, security;
-
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
-
-		dev_dbg(&pdev->dev, "client %s: override: %x security: %x\n",
-			client->name, override, security);
-
-		dev_dbg(&pdev->dev, "setting SID %u for %s\n", client->sid,
-			client->name);
-		writel(client->sid, mc->regs + client->regs.override);
-
-		override = readl(mc->regs + client->regs.override);
-		security = readl(mc->regs + client->regs.security);
-
-		dev_dbg(&pdev->dev, "client %s: override: %x security: %x\n",
-			client->name, override, security);
-	}
-
 	platform_set_drvdata(pdev, mc);
+	tegra186_mc_program_sid(mc);
 
 	return err;
 }
-- 
2.24.1

