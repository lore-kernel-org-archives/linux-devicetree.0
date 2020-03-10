Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB271C18E5C
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A712F20727
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mg2P+mWI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726637AbgCJPUc (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 11:20:32 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34030 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgCJPUc (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 11:20:32 -0400
Received: by mail-wr1-f68.google.com with SMTP id z15so16424549wrl.1;
        Tue, 10 Mar 2020 08:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ii2BrewVS3q4fYdTKcoF5y7GinLZa/uKgQ7LuFVDOiE=;
        b=mg2P+mWIwefea2Gb4MbVfGYZyYQ/wESleXFBAU4JH6aLt3sl8z0AHjHfh+G3NtU31g
         KomkkTDwg8i1XsIUw0klCGuKm+WEyRL+zw7v5GoA6yg7LiDR4xcTCd/f2T9wJ+DnwD39
         6mHkCwo1Rut9S89gI+b3bwe4jUB5NI+f52D6HXft8JDw3Y8W68NYnLYf+m46yDFHIGX8
         K4PXT7vjnudt0xVlGOfXB7jONl7ObhhavdF3Q+unKhWVDnWCqk4A7lKM1pgkLg6z2viA
         cUKnlyeiVmBN+0ixLZmksTGwJcGJ+NwLHSbt58y2qgzYFn6nZ/UdID6fOeyfL5j8M5L4
         Ys1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ii2BrewVS3q4fYdTKcoF5y7GinLZa/uKgQ7LuFVDOiE=;
        b=g2Dkpci+WwxfQ1igumejYEC/NmgSzopSjoFVLuVeJxPE5Ux1PH5japDgvcDqOd1YtB
         mJp0tDB7Ah/PZ4rjSo7hmuHSe4//Z9vdaHL18uoai/pd2ujR3o4gx6fH+jzEOiEh9jPX
         7+vIAVhhaRfvmL5Wr11nhvY5KhaELe3QD+VP60ZG9iHbfGrKrmsNyxgt2r/BdmWi02Sx
         M6vDr+OgkgmfzpOo+kJIgbW+t2veg5uT6latOG2+3sCFUQbif9i2dU5Vjf8LiwIUuhga
         wd4wjR+LyJOxZGIMVTURUelIfVz8dmml39CTlOEwyyymRTr68FEJmZNfkOBdy6SKpDFT
         yvFw==
X-Gm-Message-State: ANhLgQ0d87z2niezE0gKh2cNyLMzYTwSVG2BtsYN31WVltmrWAXkXRd/
        6qfLHuxUu89CD8jCRlikFwA=
X-Google-Smtp-Source: ADFU+vtqTs4uQrDAjryzWDvDnNDQaQ9//VXaPAg8U0G9Hcxghhfz7KMqFy3Tr5AdeGHNKXA3DcuEfw==
X-Received: by 2002:a5d:6aca:: with SMTP id u10mr26376254wrw.99.1583853628261;
        Tue, 10 Mar 2020 08:20:28 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id t18sm4676558wml.17.2020.03.10.08.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:20:27 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 8/8] clk: tegra: Remove the old emc_mux clock for Tegra210
Date:   Tue, 10 Mar 2020 16:20:03 +0100
Message-Id: <20200310152003.2945170-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200310152003.2945170-1-thierry.reding@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
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
 drivers/clk/tegra/clk-tegra210.c | 46 ++++++++++++++++++++------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 0a5be781da60..53a570b1fc29 100644
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
@@ -2987,6 +2980,27 @@ static const char * const sor1_parents[] = {
 
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
@@ -3029,7 +3043,8 @@ static const char * const la_parents[] = {
 static struct tegra_clk_periph tegra210_la =
 	TEGRA_CLK_PERIPH(29, 7, 9, 0, 8, 1, TEGRA_DIVIDER_ROUND_UP, 76, 0, NULL, 0);
 
-static __init void tegra210_periph_clk_init(void __iomem *clk_base,
+static __init void tegra210_periph_clk_init(struct device_node *np,
+					    void __iomem *clk_base,
 					    void __iomem *pmc_base)
 {
 	struct clk *clk;
@@ -3075,15 +3090,12 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
 			CLK_SOURCE_LA, 0);
 	clks[TEGRA210_CLK_LA] = clk;
 
-	/* emc mux */
-	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
-			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
-			       clk_base + CLK_SOURCE_EMC,
-			       29, 3, 0, &emc_lock);
+	/* emc */
+	clk = tegra210_clk_register_emc(np, clk_base);
+	clks[TEGRA210_CLK_EMC] = clk;
 
-	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
-				    &emc_lock);
-	clks[TEGRA210_CLK_MC] = clk;
+	/* mc */
+	tegra210_clk_register_mc("mc", "emc");
 
 	/* cml0 */
 	clk = clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_AUX,
@@ -3728,7 +3740,7 @@ static void __init tegra210_clock_init(struct device_node *np)
 
 	tegra_fixed_clk_init(tegra210_clks);
 	tegra210_pll_init(clk_base, pmc_base);
-	tegra210_periph_clk_init(clk_base, pmc_base);
+	tegra210_periph_clk_init(np, clk_base, pmc_base);
 	tegra_audio_clk_init(clk_base, pmc_base, tegra210_clks,
 			     tegra210_audio_plls,
 			     ARRAY_SIZE(tegra210_audio_plls), 24576000);
-- 
2.24.1

