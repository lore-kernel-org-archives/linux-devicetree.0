From: Lixin Wang <alan.1.wang@nokia-sbell.com>
Subject: [PATCH v2] of: dynamic: fix memory leak related to properties of __of_node_dup
Date: Tue, 17 Oct 2017 12:20:19 +0800
Message-ID: <1508214019-61974-1-git-send-email-alan.1.wang@nokia-sbell.com>
References: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1507858967-40416-1-git-send-email-alan.1.wang@nokia-sbell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Lixin Wang <alan.1.wang@nokia-sbell.com>
List-Id: devicetree@vger.kernel.org

If a node with no properties is dynamically added, then a property is
dynamically added to the node, then the property is dynamically removed,
the result will be node->properties == NULL and node->deadprops != NULL.

Signed-off-by: Lixin Wang <alan.1.wang@nokia-sbell.com>
---
v1:
 * Change the description of this patch as suggested by Frank Rowand.

 drivers/of/dynamic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 301b6db..465d43b 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -335,6 +335,10 @@ void of_node_release(struct kobject *kobj)
 	if (!of_node_check_flag(node, OF_DYNAMIC))
 		return;
 
+	if (!prop) {
+		prop = node->deadprops;
+		node->deadprops = NULL;
+	}
 	while (prop) {
 		struct property *next = prop->next;
 		kfree(prop->name);
-- 
2.6.2
