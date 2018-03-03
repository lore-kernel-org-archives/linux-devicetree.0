Return-Path: <SRS0=F/mV=FZ=linux.vnet.ibm.com=tyreld@kernel.org>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: [PATCH] of: get of_root directly in place of of_find_node_by_path("/")
Date: Fri,  2 Mar 2018 20:46:44 -0500
Message-Id: <1520041604-24482-1-git-send-email-tyreld@linux.vnet.ibm.com>
To: robh+dt@kernel.org
Cc: frowand.list@gmail.com, devicetree@vger.kernel.org, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
List-ID: <devicetree@vger.kernel.org>

There are a couple places in drivers/of where the root node is found
with a of_find_node_by_path("/") call. This call just returns
of_node_get(of_root) when the the path "/" is passed as a parameter.
So, lets fixup these instances to just do that instead.

Signed-off-by: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
---
 drivers/of/base.c     | 2 +-
 drivers/of/platform.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index ad28de9..94c1b4d 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -455,7 +455,7 @@ int of_machine_is_compatible(const char *compat)
 	struct device_node *root;
 	int rc = 0;
 
-	root = of_find_node_by_path("/");
+	root = of_node_get(of_root);
 	if (root) {
 		rc = of_device_is_compatible(root, compat);
 		of_node_put(root);
diff --git a/drivers/of/platform.c b/drivers/of/platform.c
index c00d81d..1642c11 100644
--- a/drivers/of/platform.c
+++ b/drivers/of/platform.c
@@ -409,7 +409,7 @@ int of_platform_bus_probe(struct device_node *root,
 	struct device_node *child;
 	int rc = 0;
 
-	root = root ? of_node_get(root) : of_find_node_by_path("/");
+	root = root ? of_node_get(root) : of_node_get(of_root);
 	if (!root)
 		return -EINVAL;
 
@@ -461,7 +461,7 @@ int of_platform_populate(struct device_node *root,
 	struct device_node *child;
 	int rc = 0;
 
-	root = root ? of_node_get(root) : of_find_node_by_path("/");
+	root = root ? of_node_get(root) : of_node_get(of_root);
 	if (!root)
 		return -EINVAL;
 
-- 
1.8.3.1
