Return-Path: <SRS0=2X+C=OH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34166 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728052AbeK1Uzh (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Wed, 28 Nov 2018 15:55:37 -0500
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v3 05/12] mailbox: tegra-hsp: Add suspend/resume support
Date: Wed, 28 Nov 2018 10:54:14 +0100
Message-Id: <20181128095421.20573-6-thierry.reding@gmail.com>
In-Reply-To: <20181128095421.20573-1-thierry.reding@gmail.com>
References: <20181128095421.20573-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jassi Brar <jassisinghbrar@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>, Mikko Perttunen <mperttunen@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, Pekka Pessi <ppessi@nvidia.com>, Mika Liljeberg <mliljeberg@nvidia.com>, linux-tegra@vger.kernel.org, linux-serial@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Upon resuming from a system sleep state, the interrupts for all active
shared mailboxes need to be reenabled, otherwise they will not work.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/mailbox/tegra-hsp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index a4ec18d76cba..07d1fbff3642 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -18,6 +18,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/pm.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/mailbox/tegra186-hsp.h>
@@ -823,6 +824,23 @@ static int tegra_hsp_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static int tegra_hsp_resume(struct device *dev)
+{
+	struct tegra_hsp *hsp = dev_get_drvdata(dev);
+	unsigned int i;
+
+	for (i = 0; i < hsp->num_sm; i++) {
+		struct tegra_hsp_mailbox *mb = &hsp->mailboxes[i];
+
+		if (mb->channel.chan->cl)
+			tegra_hsp_mailbox_startup(mb->channel.chan);
+	}
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(tegra_hsp_pm_ops, NULL, tegra_hsp_resume);
+
 static const struct tegra_hsp_db_map tegra186_hsp_db_map[] = {
 	{ "ccplex", TEGRA_HSP_DB_MASTER_CCPLEX, HSP_DB_CCPLEX, },
 	{ "bpmp",   TEGRA_HSP_DB_MASTER_BPMP,   HSP_DB_BPMP,   },
@@ -849,6 +867,7 @@ static struct platform_driver tegra_hsp_driver = {
 	.driver = {
 		.name = "tegra-hsp",
 		.of_match_table = tegra_hsp_match,
+		.pm = &tegra_hsp_pm_ops,
 	},
 	.probe = tegra_hsp_probe,
 	.remove = tegra_hsp_remove,
-- 
2.19.1
