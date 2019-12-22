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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD03C2D0D3
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D4E7C2070A
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 14:10:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pqkswmr4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726549AbfLVOKy (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 09:10:54 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43316 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726449AbfLVOKy (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 09:10:54 -0500
Received: by mail-wr1-f66.google.com with SMTP id d16so13911461wre.10;
        Sun, 22 Dec 2019 06:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aNNkzdmoZGfEvwyeSAAoGpupKiOvMsZG3DgnjeluIjA=;
        b=pqkswmr4T9zR4ih6X3amPK5UcPQzY1rWkOC5jnAbU9sVpVWynAHpbQ1ewIfagmeqtW
         Rkvth87jP3v48uXh0B1Upbytpykih/0pw4aRSF9LMET8zIc0sLSQ6BLdMOejF4qHPQoE
         2n6a+LDLDEEkxCNv93qlxuv+kvn70e9RkMaRQlQCZmzjrzZslKCIazIustcGAaxxaBJE
         fliRE9Y2cN3e9AAFyZq8EcrHbY9X8so4gCRS21okAC8PCg6dmifWg15nHHrRAfvsilGN
         gH8ER+JB522Mp2nHOeZQPMYdFG/7YdzsWoroCAtAkkAnka7BnAntOwX0JxgcUHaDfG8m
         tkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aNNkzdmoZGfEvwyeSAAoGpupKiOvMsZG3DgnjeluIjA=;
        b=TqfP/iZnzuJwGnmVTx9nrbKe7Bqk7KVbyikDXyb4egdwOT3QsmzTs7FjQRbaX+Z7KK
         p3SjJ4GxOQXBAdyz2yEE73g5nQsM4YtmA9sQr4cX2rrr9mdmBluUjvrLQls5n8wiKAiv
         WqAjsh9r9Wn5tQq19Gvj30o5IZvHdrlZIsodNsymmeZKSphm85wEBreyye6UNqjCN2v7
         NEk9fcLnloRS3S5B8B9Gn+0htUZLwWijcFNkuWQnCsroxscnUf/Padmrbq3f4ySMke5D
         eAbQr6n/Tu+ip2vNg3+rwym/gnE97TcrYtrNrzWLwuSvpa3GCObtTMeFbPqIRe8hq7b6
         dZcw==
X-Gm-Message-State: APjAAAWCjdTAdYFUPx2vlqxfSyI1TCUB+OFameBA2nW7u2GqiWvznacE
        so1LEsImwNPTD1vnUqEGEmk=
X-Google-Smtp-Source: APXvYqxEiakSXD9oiQQ5Wrwmum38SiaGapo+YQu1G840m6nf9h0khaL2V8wnzpS5mqPdFDdSmemqTw==
X-Received: by 2002:a5d:5403:: with SMTP id g3mr25727058wrv.302.1577023852472;
        Sun, 22 Dec 2019 06:10:52 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id q11sm17308214wrp.24.2019.12.22.06.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 06:10:51 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 09/13] memory: tegra: Only include support for enabled SoCs
Date:   Sun, 22 Dec 2019 15:10:31 +0100
Message-Id: <20191222141035.1649937-10-thierry.reding@gmail.com>
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

The memory client tables can be fairly large and they can easily be
omitted if support for the corresponding SoC is not enabled.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra186-emc.c | 2 ++
 drivers/memory/tegra/tegra186.c     | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/memory/tegra/tegra186-emc.c b/drivers/memory/tegra/tegra186-emc.c
index a3f275a7b4d6..812a4e152dcb 100644
--- a/drivers/memory/tegra/tegra186-emc.c
+++ b/drivers/memory/tegra/tegra186-emc.c
@@ -267,7 +267,9 @@ static int tegra186_emc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_emc_of_match[] = {
+#if defined(CONFIG_ARCH_TEGRA186_SOC)
 	{ .compatible = "nvidia,tegra186-emc" },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra186_emc_of_match);
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index a727f0925276..9c9a2f54b6fc 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -9,7 +9,9 @@
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
 
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 #include <dt-bindings/memory/tegra186-mc.h>
+#endif
 
 struct tegra186_mc_client {
 	const char *name;
@@ -58,6 +60,7 @@ static void tegra186_mc_program_sid(struct tegra186_mc *mc)
 	}
 }
 
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 static const struct tegra186_mc_client tegra186_mc_clients[] = {
 	{
 		.name = "ptcr",
@@ -570,6 +573,7 @@ static const struct tegra186_mc_soc tegra186_mc_soc = {
 	.num_clients = ARRAY_SIZE(tegra186_mc_clients),
 	.clients = tegra186_mc_clients,
 };
+#endif
 
 static int tegra186_mc_probe(struct platform_device *pdev)
 {
@@ -615,7 +619,9 @@ static int tegra186_mc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id tegra186_mc_of_match[] = {
+#if defined(CONFIG_ARCH_TEGRA_186_SOC)
 	{ .compatible = "nvidia,tegra186-mc", .data = &tegra186_mc_soc },
+#endif
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, tegra186_mc_of_match);
-- 
2.24.1

