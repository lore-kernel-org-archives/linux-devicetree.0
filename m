From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Subject: [PATCH] of/base: Replace alias if it already exists
Date: Sun,  1 Jun 2014 15:01:23 +0300
Message-ID: <1401624083-30796-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: grant.likely@linaro.org
Cc: robh+dt@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
List-Id: devicetree@vger.kernel.org

The current code unconditionally adds aliases without check if it already
exists, so it is not possible to alter an alias, from board DT file for
example. Fix that by replacing an alias if it already exists

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/of/base.c |   34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 03e7fc6..99215f0 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2036,6 +2036,23 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 		 ap->alias, ap->stem, ap->id, of_node_full_name(np));
 }
 
+static int of_alias_replace(struct device_node *np, int id, const char *stem,
+			    int stem_len)
+{
+	struct alias_prop *ap;
+
+	list_for_each_entry(ap, &aliases_lookup, link) {
+		if (strncmp(ap->stem, stem, stem_len))
+			continue;
+
+		if (np == ap->np) {
+			ap->id = id;
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
 /**
  * of_alias_scan - Scan all properties of 'aliases' node
  *
@@ -2092,13 +2109,16 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 		if (kstrtoint(end, 10, &id) < 0)
 			continue;
 
-		/* Allocate an alias_prop with enough space for the stem */
-		ap = dt_alloc(sizeof(*ap) + len + 1, 4);
-		if (!ap)
-			continue;
-		memset(ap, 0, sizeof(*ap) + len + 1);
-		ap->alias = start;
-		of_alias_add(ap, np, id, start, len);
+		if (of_alias_replace(np, id, start, len)) {
+			/* Allocate an alias_prop with enough space for the stem
+			 */
+			ap = dt_alloc(sizeof(*ap) + len + 1, 4);
+			if (!ap)
+				continue;
+			memset(ap, 0, sizeof(*ap) + len + 1);
+			ap->alias = start;
+			of_alias_add(ap, np, id, start, len);
+		}
 	}
 }
 
-- 
1.7.9.5
