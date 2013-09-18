From: Stephen Warren <swarren@wwwdotorg.org>
Subject: [dtc RFC PATCH] Enforce node name unit-address presence/absence
Date: Wed, 18 Sep 2013 14:23:56 -0600
Message-ID: <1379535836-12726-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Loeliger <jdl@jdl.com>, David Gibson <david@gibson.dropbear.id.au>
Cc: Olof Johansson <olof@lixom.net>, frowand.list@gmail.com, Tomasz Figa <tomasz.figa@gmail.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Stephen Warren <swarren@nvidia.com>
List-Id: devicetree@vger.kernel.org

From: Stephen Warren <swarren@nvidia.com>

ePAPR 1.1 section 2.2.1.1 "Node Name Requirements" specifies that any
node that has a reg property must include a unit address in its name
with value matching the first entry in its reg property. Conversely, if
a node does not have a reg property, the node name must not include a
unit address.

Implement a check for this. The code doesn't validate the format of the
unit address; ePAPR implies this may vary from binding to binding, so
I'm not sure that it's possible to validate the value itself.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
This depends on my previous patch "Ensure all tests have matching reg
and unit address".

Note that this patch should not yet be applied; it will cause many real-
world *.dts files to fail to compile. Those need to be fixed first.
However, if/when that happens, this patch may be useful.
---
 checks.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/checks.c b/checks.c
index ee96a25..c80a055 100644
--- a/checks.c
+++ b/checks.c
@@ -287,9 +287,25 @@ NODE_ERROR(node_name_chars, PROPNODECHARS "@");
 static void check_node_name_format(struct check *c, struct node *dt,
 				   struct node *node)
 {
-	if (strchr(get_unitname(node), '@'))
+	const char *unitname;
+	struct property *prop;
+
+	unitname = get_unitname(node);
+
+	if (strchr(unitname, '@'))
 		FAIL(c, "Node %s has multiple '@' characters in name",
 		     node->fullpath);
+
+	prop = get_property(node, "reg");
+	if (prop) {
+		if (!unitname[0])
+			FAIL(c, "Node %s has a reg property, but no unit name",
+			    node->fullpath);
+	} else {
+		if (unitname[0])
+			FAIL(c, "Node %s has a unit name, but no reg property",
+			    node->fullpath);
+	}
 }
 NODE_ERROR(node_name_format, NULL, &node_name_chars);
 
-- 
1.8.1.5
