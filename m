Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F329CC2BA19
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD868206F5
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e8V799L6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbgDIRwz (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:52:55 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54643 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726621AbgDIRwz (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:52:55 -0400
Received: by mail-wm1-f67.google.com with SMTP id h2so641998wmb.4;
        Thu, 09 Apr 2020 10:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8OX49v7ht2ccb3HbzZfG1Xl37EYQK4Qbq6nNBMHiCwo=;
        b=e8V799L6ZzqJcbqBdl+kuC57iM+6qJqlmTB2djmq/zWGC/r0DfpzlY51t4cV+unldq
         DDAhrnTKy2Z40H/1/c7vdBXFYyCmw8QFJ2Mk1o7mGYj+QX3HnRASeXW+xFrfQpH0ESd5
         gc+UNHB3aPG1iK9zVkvjZkwlcYuKZRDYPzYGKJeh59Hk4j01ByAoce0s4o5AwQxhRfA/
         VNjmhiK6p89iQzYmDl4vQkxw8N2F1bZkUY2ANJRWFShE0S9Obzji6M6cSLM1oRgWJmsO
         DJrundS5YqiIrb0A5jodn4Cz67QDvNlcnlbHY6FuxXwaMOg+F23Iku7alQAREkApmVNc
         4/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8OX49v7ht2ccb3HbzZfG1Xl37EYQK4Qbq6nNBMHiCwo=;
        b=VrX0xzZuXIm3b8zA1XxVe/X8AYF8tNezHtUw0ypEWMIjLTYhdjdsGMjGygmfiYQa3D
         B5iLDdrO3/KCi8t+EgBQm+VG0qphlAYBrSJ/2BZefieJ9x3Ked2O6aDtYKd386ayshqD
         4fkpbZEs7VzGACOYin/OAIkLyemAo9Vop6RWonT9pbgnOyPMJM3Wx6BiEa4Fk7Lh/EzN
         cmSs+6tRKnci04VNfXMp7UefIEUPLI8yD1rJpZtoN8o9iCCn+2wmTzRlgiLthMAae9ky
         jVq+jsnXi2AI/8SuBRzt/JBLqF5GdFyaY1M/Cpskhhu+Uuw37QZpb2cVdlzEIjmORYBw
         13wQ==
X-Gm-Message-State: AGi0PubHMLKBYWEHy4P3p5OUfastFDoO+9/xaVOZH9IQrCYvV3MyWat4
        c6bB/5D5im1Nkg9yAE4vpSYOazTQ
X-Google-Smtp-Source: APiQypIXXShkNT1oobBv5zVyasU9wTZqyKLapzFP9j4TcanTO1e3NYqGGYhDpU38o4MLhPxwhgBSvA==
X-Received: by 2002:a1c:5f56:: with SMTP id t83mr940331wmb.61.1586454774160;
        Thu, 09 Apr 2020 10:52:54 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id a10sm41351533wrm.87.2020.04.09.10.52.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:53 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 05/14] clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
Date:   Thu,  9 Apr 2020 19:52:29 +0200
Message-Id: <20200409175238.3586487-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200409175238.3586487-1-thierry.reding@gmail.com>
References: <20200409175238.3586487-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Joseph Lo <josephl@nvidia.com>

Introduce the low jitter path of PLLP and PLLMB which can be used as EMC
clock source.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 11 +++++++++++
 include/dt-bindings/clock/tegra210-car.h |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index defe3b7ebfa4..57d97e87d870 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3153,6 +3153,17 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
 	clk_register_clkdev(clk, "pll_m_ud", NULL);
 	clks[TEGRA210_CLK_PLL_M_UD] = clk;
 
+	/* PLLMB_UD */
+	clk = clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
+					CLK_SET_RATE_PARENT, 1, 1);
+	clk_register_clkdev(clk, "pll_mb_ud", NULL);
+	clks[TEGRA210_CLK_PLL_MB_UD] = clk;
+
+	/* PLLP_UD */
+	clk = clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
+					0, 1, 1);
+	clks[TEGRA210_CLK_PLL_P_UD] = clk;
+
 	/* PLLU_VCO */
 	if (!tegra210_init_pllu()) {
 		clk = clk_register_fixed_rate(NULL, "pll_u_vco", "pll_ref", 0,
diff --git a/include/dt-bindings/clock/tegra210-car.h b/include/dt-bindings/clock/tegra210-car.h
index 7a8f10b9a66d..5c93b01156d4 100644
--- a/include/dt-bindings/clock/tegra210-car.h
+++ b/include/dt-bindings/clock/tegra210-car.h
@@ -351,8 +351,8 @@
 #define TEGRA210_CLK_PLL_P_OUT_XUSB 317
 #define TEGRA210_CLK_XUSB_SSP_SRC 318
 #define TEGRA210_CLK_PLL_RE_OUT1 319
-/* 320 */
-/* 321 */
+#define TEGRA210_CLK_PLL_MB_UD 320
+#define TEGRA210_CLK_PLL_P_UD 321
 #define TEGRA210_CLK_ISP 322
 #define TEGRA210_CLK_PLL_A_OUT_ADSP 323
 #define TEGRA210_CLK_PLL_A_OUT0_OUT_ADSP 324
-- 
2.24.1

