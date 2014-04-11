From: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] pinctrl/TB10x: Fix signedness bug
Date: Fri, 11 Apr 2014 16:46:04 +0200
Message-ID: <1397227564-8698-1-git-send-email-christian.ruppert@abilis.com>
References: <20140402111358.GA23000@mwanda>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140402111358.GA23000@mwanda>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In the TB10x pin database, a port index of -1 is used to indicate
unmuxed GPIO pin groups. This bug fixes a 'cast to unsigned' bug of
this value.

Thanks to Dan Carpenter for highlighting this.

CC: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Christian Ruppert <christian.ruppert-ux6zf3SgZrrQT0dZR+AlfA@public.gmane.org>
---
 drivers/pinctrl/pinctrl-tb10x.c |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
index c5e0f69..26ca685 100644
--- a/drivers/pinctrl/pinctrl-tb10x.c
+++ b/drivers/pinctrl/pinctrl-tb10x.c
@@ -629,9 +629,8 @@ static int tb10x_gpio_request_enable(struct pinctrl_dev *pctl,
 	 */
 	for (i = 0; i < state->pinfuncgrpcnt; i++) {
 		const struct tb10x_pinfuncgrp *pfg = &state->pingroups[i];
-		unsigned int port = pfg->port;
 		unsigned int mode = pfg->mode;
-		int j;
+		int j, port = pfg->port;
 
 		/*
 		 * Skip pin groups which are always mapped and don't need
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
