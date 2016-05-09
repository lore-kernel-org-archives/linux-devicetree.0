From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: [PATCH 1/4] of: dynamic: changeset prop-update revert fix
Date: Mon,  9 May 2016 16:20:42 +0300
Message-ID: <1462800045-10943-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1462800045-10943-1-git-send-email-pantelis.antoniou@konsulko.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, Pantelis Antoniou <panto@antoniou-consulting.com>
List-Id: devicetree@vger.kernel.org

When reverting an update property changeset entry that created a
property the reverse operation is a remove property and not an update.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
---
 drivers/of/dynamic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index c647bd1..4145b44 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -497,6 +497,11 @@ static void __of_changeset_entry_invert(struct of_changeset_entry *ce,
 	case OF_RECONFIG_UPDATE_PROPERTY:
 		rce->old_prop = ce->prop;
 		rce->prop = ce->old_prop;
+		/* update was used but original property did not exist */
+		if (!rce->prop) {
+			rce->action = OF_RECONFIG_REMOVE_PROPERTY;
+			rce->prop = ce->prop;
+		}
 		break;
 	}
 }
-- 
1.7.12
