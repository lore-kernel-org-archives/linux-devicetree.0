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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5835BC3F2C6
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F84620873
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhReD04x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727745AbgCJPUS (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 11:20:18 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40933 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727361AbgCJPUS (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 11:20:18 -0400
Received: by mail-wm1-f65.google.com with SMTP id e26so1797973wme.5;
        Tue, 10 Mar 2020 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kOW4sWg6Q7VGPDYbJbyB7HbqHDmbBp1ycDkxRC8YVxA=;
        b=bhReD04xb47VJuOb863x1yRYJpYpSJLzDmqHmONtE6BqjWWb1xza3YQXQzUVanb+1v
         VOLgMp4HmmsQUxcv7PS4j3j0OmfQ7BA20kY4jXEDTtSOI5rDkDFFz7hlgBCGAp4na+gg
         vmph4Iq71vvISazrB8QEYdHb9f2wMNpCH/LgL6YAvu8UIvoRIlGZZML/sZT3MWSYawd3
         /febHCnezEAF0RxtgPNBgkHEqvR8p84IecwAgC9RTNDtsrgbXqnC8LUX5e9eiRYqmlyg
         m/6c5LDGrO97bzB8SFtZk7jdMgGTwLmmbrvkWygBqRRR+haujBWSRajhaZqfcKDY6NkJ
         tYcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kOW4sWg6Q7VGPDYbJbyB7HbqHDmbBp1ycDkxRC8YVxA=;
        b=iaB11yXExUee4046emdiIzUZj56CJqfVK/2HrkISGASa9j11iC9FDXpiR/2cENYrkA
         GtbDEVHTT2Pp55lKuepC1p9lNYtGK75es4eeQzwsB895jc0ISiRSvqSWzT2H/1nFXz+8
         HWnj6MufsKvl8efm4A8+L5rQpMgK8ZRXMlBBVQB8szDOAHvt9x5TpuEux36eZ8NYv89x
         z92Cl3u23F/u048sD9SgyFIlAaL+nbT2Gek7bwdeeHVndVJnv4ih4/tKvZ9SrhG04Qfd
         fUl/0lVnx6WEXXJJxrFscPp/e9oTrH+IIx4lqYc7d5lj5nZqBkijX6UgIf3eNq5+PIAj
         B0kw==
X-Gm-Message-State: ANhLgQ3yICfLxm5srwI3ij55xAqhhktmqdcmT4ifi6GkLjUcm47musqS
        iDeAVpBCkbOh+qnnJFRZy+U=
X-Google-Smtp-Source: ADFU+vu468Cq8+15bTySdCPrW5DR0zf2iX5vUsNk41jQPts1j/zhomX5PEvvoDppHlQBS0o81G+9wQ==
X-Received: by 2002:a1c:964f:: with SMTP id y76mr2589173wmd.62.1583853613555;
        Tue, 10 Mar 2020 08:20:13 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id o9sm69181610wrw.20.2020.03.10.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:20:11 -0700 (PDT)
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
Subject: [PATCH v5 1/8] clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
Date:   Tue, 10 Mar 2020 16:19:56 +0100
Message-Id: <20200310152003.2945170-2-thierry.reding@gmail.com>
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

Introduce the low jitter path of PLLP and PLLMB which can be used as EMC
clock source.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c         | 11 +++++++++++
 include/dt-bindings/clock/tegra210-car.h |  4 ++--
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 45d54ead30bc..f99647b4a71f 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -3161,6 +3161,17 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
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

