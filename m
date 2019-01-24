From: frowand.list@gmail.com
Subject: [PATCH 1/2] of: unittest: remove report of expected error
Date: Thu, 24 Jan 2019 15:22:13 -0800
Message-ID: <1548372134-15729-2-git-send-email-frowand.list@gmail.com>
References: <1548372134-15729-1-git-send-email-frowand.list@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548372134-15729-1-git-send-email-frowand.list@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand@sony.com>

update_node_properties() reports an error when the test data contains
a node (such as "/aliases") that already exists in the base devicetree.
The error is caused by of_fdt_unflatten_tree() autogenerating the
"name" property, thus both the existing node and the new node will
have a property with the same name.  Suppress reporting the known
error.

Signed-off-by: Frank Rowand <frank.rowand@sony.com>
---
 drivers/of/unittest.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 84427384654d..3249fe259d30 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1116,9 +1116,12 @@ static void update_node_properties(struct device_node *np,
 	for (prop = np->properties; prop != NULL; prop = save_next) {
 		save_next = prop->next;
 		ret = of_add_property(dup, prop);
-		if (ret)
+		if (ret) {
+			if (ret == -EEXIST && !strcmp(prop->name, "name"))
+				continue;
 			pr_err("unittest internal error: unable to add testdata property %pOF/%s",
 			       np, prop->name);
+		}
 	}
 }
 
-- 
Frank Rowand <frank.rowand@sony.com>
