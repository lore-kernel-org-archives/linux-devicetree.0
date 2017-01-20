From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] of/platform: dynamic: Use of_platform_bus_create() to create devices
Date: Fri, 20 Jan 2017 22:02:33 +0100
Message-ID: <20170120210234.11924-1-alexander.sverdlin@nokia.com>
References: <20170120205745.11851-1-alexander.sverdlin@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170120205745.11851-1-alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

of_platform_notify() requires parents to have OF_POPULATED_BUS to be set
(which is correct way to verify healthy platform bus), but uses
of_platform_device_create() to create devices, which never sets the above
flag. Therefore it's not possible to add platform buses via overlays.

Use of_platform_bus_create(), which is used in non-overlay case to populate
both buses and devices.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/of/platform.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index b8064bc2b6eb..35de1fc59fa6 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -578,6 +578,7 @@ static int of_platform_notify(struct notifier_block *nb,
 	struct of_reconfig_data *rd = arg;
 	struct platform_device *pdev_parent, *pdev;
 	bool children_left;
+	int ret;
 
 	switch (of_reconfig_get_state_change(action, rd)) {
 	case OF_RECONFIG_CHANGE_ADD:
@@ -591,15 +592,15 @@ static int of_platform_notify(struct notifier_block *nb,
 
 		/* pdev_parent may be NULL when no bus platform device */
 		pdev_parent = of_find_device_by_node(rd->dn->parent);
-		pdev = of_platform_device_create(rd->dn, NULL,
-				pdev_parent ? &pdev_parent->dev : NULL);
+		ret = of_platform_bus_create(rd->dn, of_default_bus_match_table,
+					     NULL, pdev_parent ?
+					     &pdev_parent->dev : NULL, true);
 		of_dev_put(pdev_parent);
 
-		if (pdev == NULL) {
+		if (ret) {
 			pr_err("%s: failed to create for '%s'\n",
 					__func__, rd->dn->full_name);
-			/* of_platform_device_create tosses the error code */
-			return notifier_from_errno(-EINVAL);
+			return notifier_from_errno(ret);
 		}
 		break;
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
