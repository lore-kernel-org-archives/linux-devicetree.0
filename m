From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v4 01/21] sh-pfc: Remove support for platform data
Date: Tue, 21 May 2013 14:14:22 +0200
Message-ID: <1369138482-5871-2-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1369138482-5871-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1369138482-5871-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-sh-owner@vger.kernel.org
To: linux-sh@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <damm@opensource.se>, Guennadi Liakhovetski <g.liakhovetski@gmx.de>
List-Id: devicetree@vger.kernel.org

Platform data isn't used, support can thus be removed.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/pinctrl/sh-pfc/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 3b2fd43..ac45084 100644
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

