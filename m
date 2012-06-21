From: Michal Simek <monstr@monstr.eu>
Subject: [PATCH] watchdog: xilinx: Read clock frequency directly from DT node
Date: Thu, 21 Jun 2012 08:45:40 +0200
Message-ID: <1340261140-10166-1-git-send-email-monstr@monstr.eu>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-watchdog@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, Wim Van Sebroeck <wim@iguana.be>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, linux-kernel@vger.kernel.org, Michal Simek <monstr@monstr.eu>
List-Id: devicetree@vger.kernel.org

Do not use clock-frequency property from parent node.
Use it from watchdog node.

Signed-off-by: Michal Simek <monstr@monstr.eu>
---
 drivers/watchdog/of_xilinx_wdt.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/watchdog/of_xilinx_wdt.c b/drivers/watchdog/of_xilinx_wdt.c
index 55d2f66..294fb4e 100644
--- a/drivers/watchdog/of_xilinx_wdt.c
+++ b/drivers/watchdog/of_xilinx_wdt.c
@@ -297,7 +297,7 @@ static int __devinit xwdt_probe(struct platform_device *pdev)
 
 	no_timeout = 0;
 
-	pfreq = (u32 *)of_get_property(pdev->dev.of_node->parent,
+	pfreq = (u32 *)of_get_property(pdev->dev.of_node,
 					"clock-frequency", NULL);
 
 	if (pfreq == NULL) {
-- 
1.7.0.4
