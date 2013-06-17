From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v7 1/3] sh-pfc: Remove support for platform data
Date: Mon, 17 Jun 2013 20:50:01 +0200
Message-ID: <1371495003-11185-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1371495003-11185-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1371495003-11185-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sh@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Magnus Damm <damm@opensource.se>, Simon Horman <horms@verge.net.au>
List-Id: devicetree@vger.kernel.org

Platform data isn't used, support can thus be removed.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sh-pfc/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index b551336..13f40c5 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -354,8 +354,7 @@ static int sh_pfc_probe(struct platform_device *pdev)
 	struct sh_pfc *pfc;
 	int ret;
 
-	info = pdev->id_entry->driver_data
-	      ? (void *)pdev->id_entry->driver_data : pdev->dev.platform_data;
+	info = (void *)pdev->id_entry->driver_data;
 	if (info == NULL)
 		return -ENODEV;
 
-- 
1.8.1.5

