Return-Path: <SRS0=/CI9=RE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from imap1.codethink.co.uk ([176.9.8.82]:34228 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387538AbfCAPww (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 1 Mar 2019 10:52:52 -0500
From: Kejia Hu <kejia.hu@codethink.co.uk>
Subject: [PATCH v2 3/6] soc/tegra: fuse: Add is_automotive for tegra20
Date: Fri,  1 Mar 2019 15:35:37 +0000
Message-Id: <20190301153540.14954-4-kejia.hu@codethink.co.uk>
In-Reply-To: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
References: <20190301153540.14954-1-kejia.hu@codethink.co.uk>
Sender: devicetree-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, digetx@gmail.com
Cc: Thomas Preston <thomas.preston@codethink.co.uk>
List-ID: <devicetree@vger.kernel.org>

From: Thomas Preston <thomas.preston@codethink.co.uk>

Add an is_automotive implementation for tegra20.

Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
---
 drivers/soc/tegra/fuse/fuse-tegra20.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra20.c b/drivers/soc/tegra/fuse/fuse-tegra20.c
index 49ff017f3ded..0184c9f62f80 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra20.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra20.c
@@ -167,6 +167,11 @@ static void __init tegra20_fuse_init(struct tegra_fuse *fuse)
 
 	tegra_init_revision();
 	fuse->soc->speedo_init(&tegra_sku_info);
+
+	if (tegra_sku_info.revision == TEGRA_REVISION_A04 &&
+			tegra_sku_info.sku_id == 44)
+		tegra_sku_info.is_automotive = true;
+
 	tegra20_fuse_add_randomness();
 }
 
-- 
2.11.0
