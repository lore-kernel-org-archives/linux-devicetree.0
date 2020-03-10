Return-Path: <SRS0=JrLZ=43=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029DAC18E5A
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D0EB321655
	for <linux-devicetree@archiver.kernel.org>; Tue, 10 Mar 2020 15:20:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvFIf0s8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgCJPUR (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Tue, 10 Mar 2020 11:20:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:36869 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726283AbgCJPUR (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 10 Mar 2020 11:20:17 -0400
Received: by mail-wr1-f68.google.com with SMTP id 6so16405523wre.4;
        Tue, 10 Mar 2020 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ac+20iayhp4+0FnX9pq9ZNATMk94e/yNZak2klt7liY=;
        b=fvFIf0s8tJ7nMhiwYoqjiydXgG4bC0KQkNRaca18ueKV6HcTx8FQWG2bUr/AoWqzOb
         liAZ/jX+9/3EwpFXNhNvOiw0lQ8fHtRLpaI2t1+rBynwu1tCErOb4rnRzxaLgJ8/9cXL
         ns9BNz5uEQiiGMYH0/zII8o1wX1zEeSwBb3NGhvdNXUeGYQFGy028PSKBUJh6YZnQNPx
         x4oJ/8u/I3nI0mNunh3KMhcRxN+7TNkSQyQH58tnLxozeNU7FwGLNbLOD4y0hjoIUWfe
         3Xnn+J4RSYho0qTrwtHmNUThhEzEHS9EwL4/De4YlhadvPVuqMHb++c+WsU3TNqnA/hF
         BA5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ac+20iayhp4+0FnX9pq9ZNATMk94e/yNZak2klt7liY=;
        b=bQV4ouMOtr3DEnpNsiuHvtqZ7X8pVpP50a5xb+V0gxw2q+zVBiCCJpCFA4GRvpacHF
         oYimiS8FStmyJdFnpQndiQNHWR5uuzCfakmQ04IA84b8rSLrRQcNLMcbzy9dJFr+KPEM
         kz6eAPDnIgVUjA1Wdy5U2n3HoBxTJUf1A0eERYUemuyJD4WkWs1qGyy+V9c555CrU6nl
         yD5cX9zF9oO8psGE2W5A6G8E84lsFxylf1KlaB+Z7q6hBacqUxlol4NxEFlZeXmmigpo
         JNPxlu1U/GEk/7KSXnCphmbrDm475RaITQsKv21sHS7KHPdqg2r2P6agrzPnDGc9uXv8
         OHWA==
X-Gm-Message-State: ANhLgQ2ljYuODQ2vc2GfPJhYjWVMOXgnV88m3nnPai11cmFTaxjCaNoF
        xUvX3xLV17Ay6pHusAyNsLg=
X-Google-Smtp-Source: ADFU+vv+5coWzF5H1z7jNZwrIOJw0ccmtqYOGmc9003dtqOsXVm8IKrBMBmxJaHP+yjocAhoIv6Hug==
X-Received: by 2002:adf:8501:: with SMTP id 1mr29813544wrh.56.1583853615306;
        Tue, 10 Mar 2020 08:20:15 -0700 (PDT)
Received: from localhost (pD9E516A9.dip0.t-ipconnect.de. [217.229.22.169])
        by smtp.gmail.com with ESMTPSA id e22sm4369921wme.45.2020.03.10.08.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 08:20:14 -0700 (PDT)
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
Subject: [PATCH v5 2/8] clk: tegra: Export functions for EMC clock scaling
Date:   Tue, 10 Mar 2020 16:19:57 +0100
Message-Id: <20200310152003.2945170-3-thierry.reding@gmail.com>
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

Export functions to allow accessing the CAR register required by EMC
clock scaling. These functions will be used to access the CAR register
as part of the scaling sequence.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- remove tegra210_clk_emc_update_setting() which is no longer needed

 drivers/clk/tegra/clk-tegra210.c | 26 ++++++++++++++++++++++++++
 include/linux/clk/tegra.h        |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index f99647b4a71f..0a5be781da60 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -37,6 +37,7 @@
 #define CLK_SOURCE_LA 0x1f8
 #define CLK_SOURCE_SDMMC2 0x154
 #define CLK_SOURCE_SDMMC4 0x164
+#define CLK_SOURCE_EMC_DLL 0x664
 
 #define PLLC_BASE 0x80
 #define PLLC_OUT 0x84
@@ -227,6 +228,10 @@
 #define RST_DFLL_DVCO 0x2f4
 #define DVFS_DFLL_RESET_SHIFT 0
 
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET	0x284
+#define CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR	0x288
+#define CLK_OUT_ENB_X_CLK_ENB_EMC_DLL		BIT(14)
+
 #define CLK_RST_CONTROLLER_RST_DEV_Y_SET 0x2a8
 #define CLK_RST_CONTROLLER_RST_DEV_Y_CLR 0x2ac
 #define CPU_SOFTRST_CTRL 0x380
@@ -555,6 +560,27 @@ void tegra210_set_sata_pll_seq_sw(bool state)
 }
 EXPORT_SYMBOL_GPL(tegra210_set_sata_pll_seq_sw);
 
+void tegra210_clk_emc_dll_enable(bool flag)
+{
+	u32 offset = flag ? CLK_RST_CONTROLLER_CLK_OUT_ENB_X_SET :
+		     CLK_RST_CONTROLLER_CLK_OUT_ENB_X_CLR;
+
+	writel_relaxed(CLK_OUT_ENB_X_CLK_ENB_EMC_DLL, clk_base + offset);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_enable);
+
+void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value)
+{
+	writel_relaxed(emc_dll_src_value, clk_base + CLK_SOURCE_EMC_DLL);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_dll_update_setting);
+
+void tegra210_clk_emc_update_setting(u32 emc_src_value)
+{
+	writel_relaxed(emc_src_value, clk_base + CLK_SOURCE_EMC);
+}
+EXPORT_SYMBOL_GPL(tegra210_clk_emc_update_setting);
+
 static void tegra210_generic_mbist_war(struct tegra210_domain_mbist_war *mbist)
 {
 	u32 val;
diff --git a/include/linux/clk/tegra.h b/include/linux/clk/tegra.h
index 2b1b35240074..5b0bdb413460 100644
--- a/include/linux/clk/tegra.h
+++ b/include/linux/clk/tegra.h
@@ -131,6 +131,9 @@ extern void tegra210_set_sata_pll_seq_sw(bool state);
 extern void tegra210_put_utmipll_in_iddq(void);
 extern void tegra210_put_utmipll_out_iddq(void);
 extern int tegra210_clk_handle_mbist_war(unsigned int id);
+extern void tegra210_clk_emc_dll_enable(bool flag);
+extern void tegra210_clk_emc_dll_update_setting(u32 emc_dll_src_value);
+extern void tegra210_clk_emc_update_setting(u32 emc_src_value);
 
 struct clk;
 
-- 
2.24.1

