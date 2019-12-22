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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B69CAC2D0C0
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 82B4520665
	for <linux-devicetree@archiver.kernel.org>; Sun, 22 Dec 2019 11:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bC/x9fTv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbfLVLjb (ORCPT
        <rfc822;linux-devicetree@archiver.kernel.org>);
        Sun, 22 Dec 2019 06:39:31 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52552 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbfLVLja (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 22 Dec 2019 06:39:30 -0500
Received: by mail-wm1-f66.google.com with SMTP id p9so13202363wmc.2;
        Sun, 22 Dec 2019 03:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=If4aECzhlb5r/MkSpd3LbWbgsDSixISfCtTwJdZ8SqI=;
        b=bC/x9fTvkiSKBFmb9Lgku+w8cl0kOwcjLHhW7/9R01c9SZvOStLurY9rDeF81tzFnv
         8vNng1YnZ/WpfMju5nNESH0XSjb74PRdNIQsYFkzE6LazuTNsYSjy8CMlFkGFrqE5A7a
         q+RhwsbrYvXr5/wa4PmmQbvFHM1qfJzslClpzfT6eMFtZ+2oPu3wMBqidPdR6rUDmxDI
         vXX8mNQBJ318vO17tyV7EjXd4ikOKr0Y2yjlDuAfi6Lwk0ZRA9RZbq3MTZgt2XqgXzBk
         JGYzbCRj8RGFT5aT7SIF++iGKvptmnbvR+1MQqBcDlIu224WAWQzYjR9nPjKEafFXZNf
         lsyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=If4aECzhlb5r/MkSpd3LbWbgsDSixISfCtTwJdZ8SqI=;
        b=KuylmtMAkH4OO5DZHXcr+j4MfT56vjguUVKrAuOhnIkRaYGrpQAvt5fhFV2o2tj+OL
         qsLYdg+A0BBlG2NxCgwlPPkBz+axFE/JRpsUZiSSYgPn6VnBF6NSwvBulXqqDrkIQKbl
         zPI4A9PLR8A4pYy7iiQevOTe8qs6HJ3pEp/Ly4bsDt4eveQlqvWj/E8UyEsTC7aN5gVI
         vT1InV7Lpb4WSwu+i8Rhaat/350sc93k5bcxmQFL0jNVNRX1SZNwOOacidlMTrx4HTTp
         +Zx+/tSPcHJOzJ5fnnCLgIYFLRxSV32b7TSz6H3MnfkfgW/YhsAE/kJ3VX4g9M/Gzt9N
         DApg==
X-Gm-Message-State: APjAAAUorUV4ub8Ln70ki8Tv9qRGylEmUbNb7O1KmQ1vUupPsGAQw3JX
        4KZq5mo5LWumy/AvK4AMAi6hZNYm
X-Google-Smtp-Source: APXvYqxJKSL6nCY16Zwp7LuD0xhz9GCKum4gu9peCQz5yeEQsxEinaeecgB+v+fu9jep/4+dJ+XC9g==
X-Received: by 2002:a05:600c:2488:: with SMTP id 8mr25806352wms.152.1577014767594;
        Sun, 22 Dec 2019 03:39:27 -0800 (PST)
Received: from localhost (p2E5BEF3F.dip0.t-ipconnect.de. [46.91.239.63])
        by smtp.gmail.com with ESMTPSA id t81sm17079490wmg.6.2019.12.22.03.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2019 03:39:26 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/6] memory: tegra: Refashion EMC debugfs interface on Tegra124
Date:   Sun, 22 Dec 2019 12:39:17 +0100
Message-Id: <20191222113921.1469372-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191222113921.1469372-1-thierry.reding@gmail.com>
References: <20191222113921.1469372-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
Precedence: bulk
List-ID: <devicetree.vger.kernel.org>
X-Mailing-List: devicetree@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The current debugfs interface is only partially useful. While it allows
listing supported frequencies and testing individual clock rates, it is
limited in that it can't be used to restrict the range of frequencies
that the driver is allowed to set. This is something we may want to use
to test adaptive scaling once that's implemented.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/memory/tegra/tegra124-emc.c | 185 +++++++++++++++++++++-------
 1 file changed, 143 insertions(+), 42 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 464f0ceaee63..21f05240682b 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -467,12 +467,20 @@ struct tegra_emc {
 
 	void __iomem *regs;
 
+	struct clk *clk;
+
 	enum emc_dram_type dram_type;
 	unsigned int dram_num;
 
 	struct emc_timing last_timing;
 	struct emc_timing *timings;
 	unsigned int num_timings;
+
+	struct {
+		struct dentry *root;
+		unsigned long min_rate;
+		unsigned long max_rate;
+	} debugfs;
 };
 
 /* Timing change sequence functions */
@@ -998,38 +1006,51 @@ tegra_emc_find_node_by_ram_code(struct device_node *node, u32 ram_code)
 	return NULL;
 }
 
-/* Debugfs entry */
+/*
+ * debugfs interface
+ *
+ * The memory controller driver exposes some files in debugfs that can be used
+ * to control the EMC frequency. The top-level directory can be found here:
+ *
+ *   /sys/kernel/debug/emc
+ *
+ * It contains the following files:
+ *
+ *   - available_rates: This file contains a list of valid, space-separated
+ *     EMC frequencies.
+ *
+ *   - min_rate: Writing a value to this file sets the given frequency as the
+ *       floor of the permitted range. If this is higher than the currently
+ *       configured EMC frequency, this will cause the frequency to be
+ *       increased so that it stays within the valid range.
+ *
+ *   - max_rate: Similarily to the min_rate file, writing a value to this file
+ *       sets the given frequency as the ceiling of the permitted range. If
+ *       the value is lower than the currently configured EMC frequency, this
+ *       will cause the frequency to be decreased so that it stays within the
+ *       valid range.
+ */
 
-static int emc_debug_rate_get(void *data, u64 *rate)
+static bool tegra_emc_validate_rate(struct tegra_emc *emc, unsigned long rate)
 {
-	struct clk *c = data;
-
-	*rate = clk_get_rate(c);
-
-	return 0;
-}
+	unsigned int i;
 
-static int emc_debug_rate_set(void *data, u64 rate)
-{
-	struct clk *c = data;
+	for (i = 0; i < emc->num_timings; i++)
+		if (rate == emc->timings[i].rate)
+			return true;
 
-	return clk_set_rate(c, rate);
+	return false;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(emc_debug_rate_fops, emc_debug_rate_get,
-			emc_debug_rate_set, "%lld\n");
-
-static int emc_debug_supported_rates_show(struct seq_file *s, void *data)
+static int tegra_emc_debug_available_rates_show(struct seq_file *s,
+						void *data)
 {
 	struct tegra_emc *emc = s->private;
 	const char *prefix = "";
 	unsigned int i;
 
 	for (i = 0; i < emc->num_timings; i++) {
-		struct emc_timing *timing = &emc->timings[i];
-
-		seq_printf(s, "%s%lu", prefix, timing->rate);
-
+		seq_printf(s, "%s%lu", prefix, emc->timings[i].rate);
 		prefix = " ";
 	}
 
@@ -1038,46 +1059,126 @@ static int emc_debug_supported_rates_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int emc_debug_supported_rates_open(struct inode *inode,
-					  struct file *file)
+static int tegra_emc_debug_available_rates_open(struct inode *inode,
+						struct file *file)
 {
-	return single_open(file, emc_debug_supported_rates_show,
+	return single_open(file, tegra_emc_debug_available_rates_show,
 			   inode->i_private);
 }
 
-static const struct file_operations emc_debug_supported_rates_fops = {
-	.open = emc_debug_supported_rates_open,
+static const struct file_operations tegra_emc_debug_available_rates_fops = {
+	.open = tegra_emc_debug_available_rates_open,
 	.read = seq_read,
 	.llseek = seq_lseek,
 	.release = single_release,
 };
 
+static int tegra_emc_debug_min_rate_get(void *data, u64 *rate)
+{
+	struct tegra_emc *emc = data;
+
+	*rate = emc->debugfs.min_rate;
+
+	return 0;
+}
+
+static int tegra_emc_debug_min_rate_set(void *data, u64 rate)
+{
+	struct tegra_emc *emc = data;
+	int err;
+
+	if (!tegra_emc_validate_rate(emc, rate))
+		return -EINVAL;
+
+	err = clk_set_min_rate(emc->clk, rate);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.min_rate = rate;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_min_rate_fops,
+			tegra_emc_debug_min_rate_get,
+			tegra_emc_debug_min_rate_set, "%llu\n");
+
+static int tegra_emc_debug_max_rate_get(void *data, u64 *rate)
+{
+	struct tegra_emc *emc = data;
+
+	*rate = emc->debugfs.max_rate;
+
+	return 0;
+}
+
+static int tegra_emc_debug_max_rate_set(void *data, u64 rate)
+{
+	struct tegra_emc *emc = data;
+	int err;
+
+	if (!tegra_emc_validate_rate(emc, rate))
+		return -EINVAL;
+
+	err = clk_set_max_rate(emc->clk, rate);
+	if (err < 0)
+		return err;
+
+	emc->debugfs.max_rate = rate;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(tegra_emc_debug_max_rate_fops,
+			tegra_emc_debug_max_rate_get,
+			tegra_emc_debug_max_rate_set, "%llu\n");
+
 static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 {
-	struct dentry *root, *file;
-	struct clk *clk;
+	unsigned int i;
+	int err;
 
-	root = debugfs_create_dir("emc", NULL);
-	if (!root) {
-		dev_err(dev, "failed to create debugfs directory\n");
-		return;
+	emc->clk = devm_clk_get(dev, "emc");
+	if (IS_ERR(emc->clk)) {
+		if (PTR_ERR(emc->clk) != -ENODEV) {
+			dev_err(dev, "failed to get EMC clock: %ld\n",
+				PTR_ERR(emc->clk));
+			return;
+		}
 	}
 
-	clk = clk_get_sys("tegra-clk-debug", "emc");
-	if (IS_ERR(clk)) {
-		dev_err(dev, "failed to get debug clock: %ld\n", PTR_ERR(clk));
+	emc->debugfs.min_rate = ULONG_MAX;
+	emc->debugfs.max_rate = 0;
+
+	for (i = 0; i < emc->num_timings; i++) {
+		if (emc->timings[i].rate < emc->debugfs.min_rate)
+			emc->debugfs.min_rate = emc->timings[i].rate;
+
+		if (emc->timings[i].rate > emc->debugfs.max_rate)
+			emc->debugfs.max_rate = emc->timings[i].rate;
+	}
+
+	err = clk_set_rate_range(emc->clk, emc->debugfs.min_rate,
+				 emc->debugfs.max_rate);
+	if (err < 0) {
+		dev_err(dev, "failed to set rate range [%lu-%lu] for %pC\n",
+			emc->debugfs.min_rate, emc->debugfs.max_rate,
+			emc->clk);
 		return;
 	}
 
-	file = debugfs_create_file("rate", S_IRUGO | S_IWUSR, root, clk,
-				   &emc_debug_rate_fops);
-	if (!file)
-		dev_err(dev, "failed to create debugfs entry\n");
+	emc->debugfs.root = debugfs_create_dir("emc", NULL);
+	if (!emc->debugfs.root) {
+		dev_err(dev, "failed to create debugfs directory\n");
+		return;
+	}
 
-	file = debugfs_create_file("supported_rates", S_IRUGO, root, emc,
-				   &emc_debug_supported_rates_fops);
-	if (!file)
-		dev_err(dev, "failed to create debugfs entry\n");
+	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, emc,
+			    &tegra_emc_debug_available_rates_fops);
+	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+			    emc, &tegra_emc_debug_min_rate_fops);
+	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
 static int tegra_emc_probe(struct platform_device *pdev)
-- 
2.24.1

