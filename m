Return-Path: <SRS0=+eCa=5Z=vger.kernel.org=devicetree-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EA44C2BBFD
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7ABB220769
	for <linux-devicetree@archiver.kernel.org>; Thu,  9 Apr 2020 17:52:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HU25nZds"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgDIRw6 (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Thu, 9 Apr 2020 13:52:58 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36891 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726678AbgDIRw6 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 9 Apr 2020 13:52:58 -0400
Received: by mail-wr1-f66.google.com with SMTP id w10so12921066wrm.4;
        Thu, 09 Apr 2020 10:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w2XWmn2IMve7ztaoE+kNvmQfiIn4SeEph/EH4R+cFe0=;
        b=HU25nZds50xgXaMVYaaR8zQTsdjpOuy2nsbfcKv+XF7AL/K54wXlVVU42XbtvcV/IJ
         50ThtHplKGBzrt16sjOE5ReMK1xcqhpnRyUqU+55bgI0ofak3v3xNJMd45ZbYO0pkcvA
         GZ1ZgcOU5mm7gTAL5foqAXAq3BLOi5+UOyBzmlbdwaGx3ns+tRgjj7I8Odtb73JdVMMi
         jKuzZOgj/OyQVa4YQDRbYwtX+e3SfcpkEVFL6DLd8rOYHGHRAVfxgmbQ/1tYt8ponfUE
         xfwsRH6g2g0tq6HO5YNEzdmtDXjCQZOV7DZNkNyE/EAYd63JMrZzEZrWCQ9ghgkgC9MR
         TWtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w2XWmn2IMve7ztaoE+kNvmQfiIn4SeEph/EH4R+cFe0=;
        b=tDpZWrz9CrmI3nD9BJF+6QT9F2F4Nt9GyeZPWN7LfWQXr7Hyd1TG9igK0pLCRFpIwN
         WOLK8ceaf1jmNS4n3bNVMIWWOG9m+QUmD5ufHwOblSKOV9LGpQu/Qlr/MZE3QY8vJ25E
         QhfjLba/FieUEdaQco3QbU0FqCa/2U30niNBb9J2ndBSX7oiVTqUmKyEGAxftqA4aAbY
         GlNGoNzDLKc9dF9f5mb4dTNwMHLXWL6UhJhVmSSFAvwstG8rpAeE6zbICIxl7sMLsJ0z
         lw4RruM5BKekY6Oimje0252yVQTy+ocv1DuuERXl+85h4BPzKLyj2tTEdt77plz2WdG8
         jz3Q==
X-Gm-Message-State: AGi0PuaKwOxQiRjT8KwaMzCbWLeHWWX6bK4NsWunbX52hk/R/HlMXr99
        ZtZxwaG/A7cAeFcGIsOt/O8=
X-Google-Smtp-Source: APiQypKwfR4vjCF7ir++sU76P7m313N0fGNZ69wsA4xwew9Wuf+CnX9oMnlZlVWfxvmNtnYvI+ZHmQ==
X-Received: by 2002:adf:8b5c:: with SMTP id v28mr320365wra.98.1586454776272;
        Thu, 09 Apr 2020 10:52:56 -0700 (PDT)
Received: from localhost (pD9E51D62.dip0.t-ipconnect.de. [217.229.29.98])
        by smtp.gmail.com with ESMTPSA id q143sm2600501wme.31.2020.04.09.10.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2020 10:52:55 -0700 (PDT)
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
Subject: [PATCH v6 06/14] clk: tegra: Export functions for EMC clock scaling
Date:   Thu,  9 Apr 2020 19:52:30 +0200
Message-Id: <20200409175238.3586487-7-thierry.reding@gmail.com>
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

Export functions to allow accessing the CAR register required by EMC
clock scaling. These functions will be used to access the CAR register
as part of the scaling sequence.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v5:
- remove tegra210_clk_emc_get_setting() which is no longer needed

 drivers/clk/tegra/clk-tegra210.c | 26 ++++++++++++++++++++++++++
 include/linux/clk/tegra.h        |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 57d97e87d870..798920ec50e9 100644
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

