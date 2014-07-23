From: Grant Likely <grant.likely@linaro.org>
Subject: [PATCH 07/10] of: Make sure attached nodes don't carry along extra children
Date: Wed, 23 Jul 2014 17:44:21 -0600
Message-ID: <1406159064-21366-8-git-send-email-grant.likely@linaro.org>
References: <1406159064-21366-1-git-send-email-grant.likely@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406159064-21366-1-git-send-email-grant.likely@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, Nathan Fontenot <nfont@austin.ibm.com>, Tyrel Datwyler <turtle.in.the.kernel@gmail.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org
Cc: Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

The child pointer does not get cleared when attaching new nodes which
could cause the tree to be inconsistent. Clear the child pointer in
__of_attach_node() to be absolutely sure that the structure remains in a
consistent layout.

Signed-off-by: Grant Likely <grant.likely@linaro.org>
---
 drivers/of/dynamic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index c875787fa394..b96d83100987 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -98,6 +98,7 @@ int of_property_notify(int action, struct device_node *np,
 
 void __of_attach_node(struct device_node *np)
 {
+	np->child = NULL;
 	np->sibling = np->parent->child;
 	np->allnext = np->parent->allnext;
 	np->parent->allnext = np;
-- 
1.9.1
