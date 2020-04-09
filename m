Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B20C38A2A
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:53:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 37E842082D
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:53:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZc7Av/t"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726670AbgDIRxS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:53:18 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50728 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgDIRxS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:53:18 -0400
Received: by mail-wm1-f68.google.com with SMTP id x25so673336wmc.0;
        Thu, 09 Apr 2020 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kd2k1S51AJoxXmx0CELtwbdw2XFSi2rd3QAA3OfIUBE=;
        b=CZc7Av/tDJHLKb+y3ZYorBL2C0GVxIn1jVZAODB13uuE2DVT3+L/Blmn9FPUp/rx2s
         uCVIOh/jKKkm54vHf5q/5GZ5o9nXjkR8WlBGMEIR35UyL/6A5+Dam5JV864tVgSbkZpm
         afcLSkwbBLZECsrj8QklCQGQPgYMb1O20ZQyQNT+H8z2FGfaR5m8nXLeqeoGjr7TxV+r
         z0zRJwXDDP4q35I400nXE8Ewgg6N1F9jQ512zB4OW2tldbgYTrc/zt3GKeO/eEjVxPzR
         PMoiW0DphxH/q8c9UVCSIpJamzL/oXASQeG/+IcLwbnBRhgDxhEAyMXP1rH6d1R+isvM
         oCsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kd2k1S51AJoxXmx0CELtwbdw2XFSi2rd3QAA3OfIUBE=;
        b=mZG+w3r4FlRhBw3B7ob0DFTxa/PidSMRBxlDrd2qvsu84QyTJpAifBuTa49pXqBmol
         qSuKTfpWKi5OkT98rSpLMqXgFhOAN2vvE0ziEBIc7lnHRiHFyivNo89vTzCDtQQlad7h
         ViRHdp5PElbTTvo01tdCF861sH7EttdV0gk//fh5kRrq7gUafuDI3slwCwJ9716yfkB6
         U4Ake6UsQSFDx/dFjDHHXrtMA58P7QMvsh4b0r32Vy2zTLoL+p6mXqjvah5vHE013Ssa
         x9n8Cva4f91tZE9Oo4ABX88SDCSLwMNb/mVM8lYwnsNVHau/dVUGRyP4LuV5sBHllDCQ
         gS+Q==
X-Gm-Message-State: AGi0PubTMlfv/oE0x1/ZVvuMdMP3c4rjSCLOkZDt3L8yGI31h/feF91x
        zIcUIH0DMzTPEaFtK+1D7Ew=
X-Google-Smtp-Source: APiQypI9UtNZG2r3E9m02wmzNZ2WOjfhJifbGFR+gxfruOnf+Bfm1wLq7C79VH+JrzevKZ4ojZvrCA==
X-Received: by 2002:a05:600c:2341:: with SMTP id 1mr941714wmq.153.1586454795997;
        Thu, 09 Apr 2020 10:53:15 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id w11sm4460804wmi.32.2020.04.09.10.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:53:14 -0700 (PDT)
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
Subject: [PATCH v6 14/14] clk: tegra: Remove the old emc_mux clock for Tegra210
Date:   Thu,  9 Apr 2020 19:52:38 +0200
Message-Id: <20200409175238.3586487-15-thierry.reding@gmail.com>
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

Remove the old emc_mux clock and don't use the common EMC clock
definition. This will be replaced by a new clock defined in the
EMC driver.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 50 ++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 798920ec50e9..f2bb188fbc6a 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -319,12 +319,6 @@ static unsigned long tegra210_input_freq[] = {
 	[8] = 12000000,
 };
 
-static const char *mux_pllmcp_clkm[] = {
-	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
-	"pll_p",
-};
-#define mux_pllmcp_clkm_idx NULL
-
 #define PLL_ENABLE			(1 << 30)
 
 #define PLLCX_MISC1_IDDQ		(1 << 27)
@@ -2336,7 +2330,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
 	[tegra_clk_i2c2] = { .dt_id = TEGRA210_CLK_I2C2, .present = true },
 	[tegra_clk_uartc_8] = { .dt_id = TEGRA210_CLK_UARTC, .present = true },
 	[tegra_clk_mipi_cal] = { .dt_id = TEGRA210_CLK_MIPI_CAL, .present = true },
-	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = true },
 	[tegra_clk_usb2] = { .dt_id = TEGRA210_CLK_USB2, .present = true },
 	[tegra_clk_bsev] = { .dt_id = TEGRA210_CLK_BSEV, .present = true },
 	[tegra_clk_uartd_8] = { .dt_id = TEGRA210_CLK_UARTD, .present = true },
@@ -2979,6 +2972,27 @@ static const char * const sor1_parents[] = {
 
 static u32 sor1_parents_idx[] = { 0, 2, 5, 6 };
 
+static const struct clk_div_table mc_div_table_tegra210[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 4 },
+	{ .val = 2, .div = 1 },
+	{ .val = 3, .div = 2 },
+	{ .val = 0, .div = 0 },
+};
+
+static void tegra210_clk_register_mc(const char *name,
+				     const char *parent_name)
+{
+	struct clk *clk;
+
+	clk = clk_register_divider_table(NULL, name, parent_name,
+					 CLK_IS_CRITICAL,
+					 clk_base + CLK_SOURCE_EMC,
+					 15, 2, CLK_DIVIDER_READ_ONLY,
+					 mc_div_table_tegra210, &emc_lock);
+	clks[TEGRA210_CLK_MC] = clk;
+}
+
 static const char * const sor1_out_parents[] = {
 	/*
 	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
@@ -3021,7 +3035,8 @@ static const char * const la_parents[] = {
 static struct tegra_clk_periph tegra210_la =
 	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL, NULL);
 
-static __init void tegra210_periph_clk_init(void __iomem *clk_base,
+static __init void tegra210_periph_clk_init(struct device_node *np,
+					    void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
 	struct clk *clk;
@@ -3067,16 +3082,6 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 			CLK_SOURCE_LA, 0);
 	clks[TEGRA210_CLK_LA] = clk;
 
-	/* emc mux */
-	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
-
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
-	clks[TEGRA210_CLK_MC] = clk;
-
 	/* cml0 */
 	clk = clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_AUX,
 				0, 0, &pll_e_lock);
@@ -3119,6 +3124,13 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 	}
 
 	tegra_periph_clk_init(clk_base, pmc_base, tegra210_clks, &pll_p_params);
+
+	/* emc */
+	clk = tegra210_clk_register_emc(np, clk_base);
+	clks[TEGRA210_CLK_EMC] = clk;
+
+	/* mc */
+	tegra210_clk_register_mc("mc", "emc");
 }
 
 static void __init tegra210_pll_init(void __iomem *clk_base,
@@ -3717,7 +3729,7 @@ static void __init tegra210_clock_init(struct device_node *np)
 
 	tegra_fixed_clk_init(tegra210_clks);
 	tegra210_pll_init(clk_base, pmc_base);
-	tegra210_periph_clk_init(clk_base, pmc_base);
+	tegra210_periph_clk_init(np, clk_base, pmc_base);
 	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
 			     tegra210_audio_plls,
 			     ARRAY_SIZE(tegra210_audio_plls), 24576000);
-- 
2.24.1

