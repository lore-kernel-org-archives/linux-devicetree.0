Return-Path: <SRS0=XlNi=FO=gmail.com=digetx@kernel.org>
From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v3 08/15] memory: tegra: Remove unused headers inclusions
Date: Tue, 20 Feb 2018 19:25:21 +0300
Message-Id: <637f4a311b576b9361a580019980bbf0329b9e49.1519141896.git.digetx@gmail.com>
In-Reply-To: <cover.1519141896.git.digetx@gmail.com>
References: <cover.1519141896.git.digetx@gmail.com>
In-Reply-To: <cover.1519141896.git.digetx@gmail.com>
References: <cover.1519141896.git.digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Tegra210 contains some unused leftover headers, remove them for
consistency.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/tegra210.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 3b8d0100088c..b729f49ffc8f 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -6,11 +6,6 @@
  * published by the Free Software Foundation.
  */
 
-#include <linux/of.h>
-#include <linux/mm.h>
-
-#include <asm/cacheflush.h>
-
 #include <dt-bindings/memory/tegra210-mc.h>
 
 #include "mc.h"
-- 
2.16.1
