From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 2/3] of: platform: Handle of_populate drivers in notifier
Date: Tue, 16 Dec 2014 19:45:26 +0200
Message-ID: <1418751927-18088-3-git-send-email-pantelis.antoniou@konsulko.com>
References: <1418751927-18088-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418751927-18088-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

When using overlays with drivers calling of_populate the notifier
will try to create the device twice. Using the populated bit
before proceeding protects against this.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/of/platform.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index cd87a36..0d12451 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -564,6 +564,10 @@ static int of_platform_notify(struct notifier_block *nb,
 		if (!of_node_check_flag(rd->dn->parent, OF_POPULATED_BUS))
 			return NOTIFY_OK;	/* not for us */
 
+		/* already populated? (driver using of_populate manually) */
+		if (of_node_check_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_OK;
+
 		/* pdev_parent may be NULL when no bus platform device */
 		pdev_parent = of_find_device_by_node(rd->dn->parent);
 		pdev = of_platform_device_create(rd->dn, NULL,
@@ -579,6 +583,11 @@ static int of_platform_notify(struct notifier_block *nb,
 		break;
 
 	case OF_RECONFIG_CHANGE_REMOVE:
+
+		/* already depopulated? */
+		if (!of_node_check_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_OK;
+
 		/* find our device by node */
 		pdev = of_find_device_by_node(rd->dn);
 		if (pdev == NULL)
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
