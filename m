From: Rob Herring <robh@kernel.org>
Subject: [PATCH 3/4] powerpc: pseries: only store the device node basename in full_name
Date: Tue, 25 Jul 2017 16:44:26 -0500
Message-ID: <20170725214427.25768-4-robh@kernel.org>
References: <20170725214427.25768-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170725214427.25768-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
List-Id: devicetree@vger.kernel.org

With dependencies on full_name containing the entire device node path
removed, stop storing the full_name in nodes created by
dlpar_configure_connector() and pSeries_reconfig_add_node().

Signed-off-by: Rob Herring <robh@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/pseries/dlpar.c    | 20 ++++----------------
 arch/powerpc/platforms/pseries/reconfig.c |  2 +-
 2 files changed, 5 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 783f36364690..8ab0be0706fd 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -75,24 +75,17 @@ static struct property *dlpar_parse_cc_property(struct cc_workarea *ccwa)
 	return prop;
 }
 
-static struct device_node *dlpar_parse_cc_node(struct cc_workarea *ccwa,
-					       const char *path)
+static struct device_node *dlpar_parse_cc_node(struct cc_workarea *ccwa)
 {
 	struct device_node *dn;
 	char *name;
 
-	/* If parent node path is "/" advance path to NULL terminator to
-	 * prevent double leading slashs in full_name.
-	 */
-	if (!path[1])
-		path++;
-
 	dn = kzalloc(sizeof(*dn), GFP_KERNEL);
 	if (!dn)
 		return NULL;
 
 	name = (char *)ccwa + be32_to_cpu(ccwa->name_offset);
-	dn->full_name = kasprintf(GFP_KERNEL, "%s/%s", path, name);
+	dn->full_name = kasprintf(GFP_KERNEL, "%s", name);
 	if (!dn->full_name) {
 		kfree(dn);
 		return NULL;
@@ -148,7 +141,6 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 	struct property *last_property = NULL;
 	struct cc_workarea *ccwa;
 	char *data_buf;
-	const char *parent_path = parent->full_name;
 	int cc_token;
 	int rc = -1;
 
@@ -182,7 +174,7 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 			break;
 
 		case NEXT_SIBLING:
-			dn = dlpar_parse_cc_node(ccwa, parent_path);
+			dn = dlpar_parse_cc_node(ccwa);
 			if (!dn)
 				goto cc_error;
 
@@ -192,10 +184,7 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 			break;
 
 		case NEXT_CHILD:
-			if (first_dn)
-				parent_path = last_dn->full_name;
-
-			dn = dlpar_parse_cc_node(ccwa, parent_path);
+			dn = dlpar_parse_cc_node(ccwa);
 			if (!dn)
 				goto cc_error;
 
@@ -226,7 +215,6 @@ struct device_node *dlpar_configure_connector(__be32 drc_index,
 
 		case PREV_PARENT:
 			last_dn = last_dn->parent;
-			parent_path = last_dn->parent->full_name;
 			break;
 
 		case CALL_AGAIN:
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index e5bf1e84047f..73e4063ad997 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -33,7 +33,7 @@ static int pSeries_reconfig_add_node(const char *path, struct property *proplist
 	if (!np)
 		goto out_err;
 
-	np->full_name = kstrdup(path, GFP_KERNEL);
+	np->full_name = kstrdup(kbasename(path), GFP_KERNEL);
 	if (!np->full_name)
 		goto out_err;
 
-- 
2.11.0
