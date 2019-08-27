From: Denis Efremov <efremov@linux.com>
Subject: [PATCH] scripts/dtc: Simplify condition in get_node_by_path
Date: Tue, 27 Aug 2019 17:57:27 +0300
Message-ID: <20190827145727.16791-1-efremov@linux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
Cc: Denis Efremov <efremov@linux.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The strlen && strprefixeq check in get_node_by_path is
excessive, since strlen is checked in strprefixeq macro
internally. Thus, 'strlen(child->name) == p-path'
conjunct duplicates after macro expansion and could
be removed.

Signed-off-by: Denis Efremov <efremov@linux.com>
---
 scripts/dtc/livetree.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/dtc/livetree.c b/scripts/dtc/livetree.c
index 0c039993953a..032df5878ccc 100644
--- a/scripts/dtc/livetree.c
+++ b/scripts/dtc/livetree.c
@@ -526,8 +526,7 @@ struct node *get_node_by_path(struct node *tree, const char *path)
 	p = strchr(path, '/');
 
 	for_each_child(tree, child) {
-		if (p && (strlen(child->name) == p-path) &&
-		    strprefixeq(path, p - path, child->name))
+		if (p && strprefixeq(path, p - path, child->name))
 			return get_node_by_path(child, p+1);
 		else if (!p && streq(path, child->name))
 			return child;
-- 
2.21.0
