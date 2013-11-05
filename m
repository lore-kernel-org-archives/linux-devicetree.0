From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: [PATCH 1/5] OF: Clear detach flag on attach
Date: Tue,  5 Nov 2013 19:50:12 +0200
Message-ID: <1383673816-29293-2-git-send-email-panto@antoniou-consulting.com>
References: <1383673816-29293-1-git-send-email-panto@antoniou-consulting.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1383673816-29293-1-git-send-email-panto@antoniou-consulting.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: Rob Herring <robherring2@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Matt Porter <matt.porter@linaro.org>, Koen Kooi <koen@dominion.thruhere.net>, Alison Chaiken <Alison_Chaiken@mentor.com>, Dinh Nguyen <dinh.linux@gmail.com>, Jan Lubbe <jluebbe@lasnet.de>, Alexander Sverdlin <alexander.sverdlin@nsn.com>, Michael Stickel <ms@mycable.de>, Guenter Roeck <linux@roeck-us.net>, Dirk Behme <dirk.behme@gmail.com>, Alan Tull <delicious.quinoa@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Michael Bohan <mbohan@codeaurora.org>, Ionut Nicu <ioan.nicu.ext@nsn.com>, Michal Simek <monstr@monstr.eu>, Matt Ranostay <mranostay@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

When attaching a node always clear the detach flag. Without this change
the sequence detach, attach fails.

Signed-off-by: Pantelis Antoniou <panto@antoniou-consulting.com>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 7d4c70f..ca10916 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1641,6 +1641,7 @@ int of_attach_node(struct device_node *np)
 	np->allnext = of_allnodes;
 	np->parent->child = np;
 	of_allnodes = np;
+	of_node_clear_flag(np, OF_DETACHED);
 	raw_spin_unlock_irqrestore(&devtree_lock, flags);
 
 	of_add_proc_dt_entry(np);
-- 
1.7.12
