Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34221 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388736AbfCAPww (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 10:52:52 -0500
From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: [PATCH v2 2/6] soc/tegra: fuse: add is_automotive for tegra30
Date: Fri,  1 Mar 2019 15:35:36 +0000
Message-Id: <20190301153540.14954-3-kejia.hu@codethink.co.uk>
In-Reply-To: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
References: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, digetx@gmail.com
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Kejia Hu <kejia.hu@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Ben Dooks <ben.dooks@codethink.co.uk>

Add an is_automotive flag to the tegra-sku info, and
add an implementation for the tegra30 from what we
know from all the autotmotive parts we've seen.

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Kejia Hu <kejia.hu@codethink.co.uk>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 257e254c6137..d92025e486e0 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -106,6 +106,10 @@ static void __init tegra30_fuse_init(struct tegra_fuse *fuse)
 	if (fuse->soc->speedo_init)
 		fuse->soc->speedo_init(&tegra_sku_info);
 
+	if (tegra_sku_info.revision == TEGRA_REVISION_A03 &&
+	    tegra_sku_info.sku_id == 176)
+		tegra_sku_info.is_automotive = true;
+
 	tegra30_fuse_add_randomness();
 }
 #endif
-- 
2.11.0
