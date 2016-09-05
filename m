From: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFC] of: platform: Drop OF_POPULATED_BUS check from
 of_platform_notify()
Date: Mon, 5 Sep 2016 16:38:24 +0200
Message-ID: <11c8a7bd-142c-d016-e24b-34d1edbdb8cf@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The comment to OF_POPULATED_BUS says "of_platform_populate recursed to children
of this node". Consider the following structure:

	ocp {
		compatible = "simple-bus";
		ranges;
		...
		l4_wkup: l4_wkup@44c00000 {
			compatible = "ti,am3-l4-wkup", "simple-bus";
			ranges = <0 0x44c00000 0x280000>;
			...
			wkup_m3: wkup_m3@100000 {
				compatible = "ti,am3352-wkup-m3";
				...
			}
		}
	}

If one DT overlay adds "ocp" node without children then of_platform_notify()
creates a platform device, but doesn't set OF_POPULATED_BUS. If second overlay
tries to populate children of "ocp" node, corresponding platform devices are
not instantiated because of check for OF_POPULATED_BUS flag. If the above
example structure is built of several overlays, of_platform_populate() is not
involved here at all, so maybe OF_POPULATED_BUS requirement is wrong.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin-xNZwKgViW5gAvxtiuMwx3w@public.gmane.org>
---
 drivers/of/platform.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index f39ccd5..acebccd 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -578,10 +578,6 @@ static int of_platform_notify(struct notifier_block *nb,
 
 	switch (of_reconfig_get_state_change(action, rd)) {
 	case OF_RECONFIG_CHANGE_ADD:
-		/* verify that the parent is a bus */
-		if (!of_node_check_flag(rd->dn->parent, OF_POPULATED_BUS))
-			return NOTIFY_OK;	/* not for us */
-
 		/* already populated? (driver using of_populate manually) */
 		if (of_node_check_flag(rd->dn, OF_POPULATED))
 			return NOTIFY_OK;
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
